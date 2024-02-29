;;three modes
;;launch - icbm is going from bottom of screen to top
;;explode - screen is flashing
;;rain - fireballs are raining down from above


;;;;;;;;;;;;;;;;;;;;;;;;
init_icbm:
  JSR obj_clear_oam

  LDA #$FE       ;borrowed from obj_clear_sprite
  LDY #$20       ;skip Ossan's sprites 
.spr_clear_loop:
  STA SpriteMap, y  
  INY
  CPY #$B8
  BCC .spr_clear_loop
  LDA #$26
  STA SPR_Free

  LDX #$00           ;since I'm not jumping to the actual mem tests, I need to set this manually here.
  STX obj_run_offset
  LDA OAM_Free
  SEC                ;this number gets adjusted at the end of ilaunch phase, because
  SBC #$24           ;the latter two phases have smaller oam requirements of #$0B
  STA OAM_Free

.test_success:
  LDA #$1A           ;the 24 static tiles and 2 animated tiles
  STA SPR_SpcNeed
  JSR SMap_setup
  LDX obj_run_offset ;reload offset into x because it's destroyed in SMap_setup

.init_icbm:
  JSR general_obj_setup
  JSR icbm_start_x_adjust

.load_tile:
  LDX #$00
  LDY obj_run_offset
  LDA oam_SMap_loc, y
  TAY
.load_tile_loop:
  LDA icbm_static_tiles, x
  STA SpriteMap+1, y         ;TILES
  LDA #$01
  STA SpriteMap+2, y         ;PALETTE
  INX
  INY
  INY
  INY
  INY
  CPX #$18
  BCC .load_tile_loop

.icbm_special_variables:
  LDA #ilaunch
  LDY obj_run_offset
  STA icbm_phase, y
  LDA #$00
  STA icbm_anim, y

.store_offset:
  JSR inc_init_offset

.rts:
  JMP OBJ_init_loop_return


;;;;;;;;;;;;;;;;
run_icbm:
  LDY obj_run_offset    ;offset should reflect where pointer is on $0700 OAM table

  LDA icbm_phase, y
  CMP #ilaunch
  BNE .phase_next1
  JSR icbm_launch
  JMP .rts
.phase_next1:
  CMP #iexplode
  BNE .phase_next2
  JSR icbm_explode
  JMP .rts
.phase_next2:
  JSR icbm_rain          ;#irain or above (because icbm_phase is also used to count fireballs spawned in rain sub)
                         ;can just go ahead and skip to icbm_rain sub.
.rts:
  JMP OBJ_run_loop_return


;;;;;;;;;;;;;;
icbm_launch:
  LDY obj_run_offset

  LDA oam_type, y
  AND #$40         ;check for destroy flag in bit 6
  BEQ .horiz_screen_test
  JMP .destroy_icbm

.horiz_screen_test:
  JSR offscreen_destroy_test   ;kill object if too far left or right
  BCC .top_test
  JMP .destroy_icbm

.top_test:
  LDA oam_yMapLO, y            ;test that triggers the explosion once the
  CMP #$04                     ;ICBM hits the top of the screen.
  BCS .movement
.launch_done:
  LDA #iexplode
  STA icbm_phase, y
  LDA OAM_Free                 ;adjust the free space variable in OAM to
  CLC                          ;reflect the space being freed up by the ilaunch phase
  ADC #$19                     ;ending. ilaunch=#$24, others=#$0B
  STA OAM_Free
  JSR icbm_start_explode
  JMP .rts

.movement:
  JSR obj_movement

.visibility:
  LDA #$00
  STA loop_counter

  LDA oam_xMapLO, y
  STA sprite_x_offset
  STY temp_y        ;temp_y is used to keep track of correct SMap position, incremented at end of offscreen or onscreen branch

  LDA oam_xMapHI, y
  PHA               ;MUST push this to the stack, it's very likely it will be incremented in the following code so I need a backup

.icbm_visibility:
  JSR visibility_check
  BCS .onscreen

.offscreen:
  JSR icbm_offscreen
  JMP .visibility_loop_test

.onscreen:
  JSR icbm_onscreen

.visibility_loop_test:

  INC temp_y
  INC loop_counter
  LDA loop_counter
  CMP #$02
  BCS .visibility_end

  LDA sprite_x_offset
  CLC
  ADC #$08
  STA sprite_x_offset

  LDY obj_run_offset  ;be sure to restore y to the offset since I'm going back to using
                      ;the oam variables here and in the visibility_check sub after
  LDA oam_xMapHI, y
  ADC #$00
  STA oam_xMapHI, y

  JMP .icbm_visibility

.visibility_end:
  LDY obj_run_offset   ;restore y to the obj_run_offset, otherwise all inderects will be using the temp_y
  PLA                  ;here we must restore the original xMapHI in oam, in case it incremented
  STA oam_xMapHI, y

.animation:
  LDA icbm_anim, y
  EOR #$01                   ;only two frames of animation, so simply flip the
  STA icbm_anim, y           ;animation variable back and forth.
  TAX                        ;an even or odd offset will start the sub on the correct
.load_anim_tile_attr:        ;position on the animation tables below.
  LDY obj_run_offset
  LDA oam_SMap_loc+24, y
  TAY
  LDA icbm_anim_tiles, x
  STA SpriteMap+1, y         ;LEFT TILE
  LDA icbm_anim_pal, x
  STA SpriteMap+2, y         ;PALETTE for both tiles
  STA SpriteMap+6, y
  INX                        ;this particular chunk of code probably won't be good
  INX                        ;for any animation besides the ICBM.
  LDA icbm_anim_tiles, x
  STA SpriteMap+5, y         ;RIGHT TILE

.collision_testing:
  LDY obj_run_offset   ;again, destroyed y above, so restore obj offset into it

  LDX oam_SMap_loc, y
  LDA SpriteMap, x     ;test whether first sprite is on-screen.
  CMP #$FA             ;if not, then entire object assumed to be off-screen, so skip collision test
  BEQ .increase_offset

.first_box:    ;long box that runs along icbm's body
  LDA #$58
  STA obj_height
  LDA #$09
  STA obj_width
  LDA #$03
  STA temp1    ;temp1 is the amount to offset x to the right
  LDA #$07
  STA temp2    ;temp2 is the amount to offset y downward

  JSR obj_coords_to_bbox   ;will take x & y coord and create a bbox
  JSR collision_against_ship  ;will take bbox and test collision agains Ossan, set player_dead var if collision
  BCC .increase_offset
;  JMP .increase_offset   ;since there's no vertical clipping to speak of, and since
.death:                  ;the ICBM is so huge, I have decided to make Ossan immune to it for the time being
  JSR ship_dies

.destroy_icbm:
  JSR destroy_icbm

.increase_offset:
  LDA obj_run_offset
  CLC                 ;need to increase this so OAM will load in correct pos
  ADC #$24            ;for next object in $0700 memory
  STA obj_run_offset

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;
destroy_icbm:
  LDY obj_run_offset
  STY temp_y
  LDA #$00
  STA loop_counter

.clear_sprites_loop:
  LDY temp_y            ;temp_y gets constantly inc'd in this loop to create teh correct offset in SMap
  LDX oam_SMap_loc, y
  JSR clear_sprite_tile ;clears the four bytes beginning with oam_SMap_loc, y
  INC temp_y
  INC loop_counter      ;temp_y will start at a different value each time, so loop_counter
  LDA loop_counter      ;is used to keep track of looping instead.
  CMP #$1A              ;CHANGE number depending on object's length
  BCC .clear_sprites_loop

  LDA SPR_Free
  CLC
  ADC #$1A
  STA SPR_Free

  LDY obj_run_offset    ;restore y to actual offset, since it's jacked up by now by the incremented temp_y
  LDA icbm_phase, y
  CMP #ilaunch                 ;the variables will be gone in the latter two oam phases, so jump past this part
  BNE .clear_latter_phases     ;or it will overwrite other variables stored at the same location
  LDA #$FE
.clear_extra_loop:
  INY                   ;since icbm uses additional sprites, must
  STA oam_SMap_loc, y   ;clear out the extra locations
  CPY #$19
  BCC .clear_extra_loop

.clear_latter_phases:
  LDY obj_run_offset    ;restore y to actual offset, since it's jacked up by now by the incremented temp_y
  JSR clear_oam_chunk

.add_oam:
  LDA OAM_Free
  CLC
  ADC #$24
  STA OAM_Free

  RTS


;;;;;;;;;;;;;;;;
icbm_onscreen:
  LDY temp_y             ;Y COORDS
  LDX oam_SMap_loc, y

  LDA #$01               ;loop_counter is being used, so use temp1 to test loop
  STA temp1              ;also needs to be set to one, not zero, because of y loop gets a head start on x loop

  LDY obj_run_offset
  LDA oam_yMapLO, y
  STA SpriteMap, x

  LDY temp_y
  JMP .yloop2            ;dont' need to pull a first time, so jump to inner loop
.yloop1:
  PLA                    ;outer loop used to pull a
.yloop2:
  INY                    ;jump two spots to go to next tile down
  INY
  CLC
  ADC #$08               ;add 8 to get lower sprite's y coord
  LDX oam_SMap_loc, y    
  STA SpriteMap, x
  INC temp1
  PHA                    ;push the current y screen position to stack, because we need to use a for temp1 comparison
  LDA temp1
  CMP #$0D
  BCC .yloop1
  PLA                    ;pull a so stack doesn't get corrupted, will be destroyed

;  LDY temp_y             ;X COORDS
  LDA sprite_x_offset    ;load current x offset from visibility test
  SEC
  SBC camera_Left_x      ;subtract camera to get the correct screen x position of the sprite.
  JMP .xloop2            

.xloop1:
  PLA                    ;inner loop to pull current x screen value
.xloop2:
  LDX oam_SMap_loc, y
  STA SpriteMap+3, x
  DEY                    ;in this one, we'll work backwards instead of starting over again
  DEY
  PHA                    ;push current x screen coord to stack, a about to be used for temp1 comparison
  DEC temp1
  LDA temp1
  BNE .xloop1
  PLA                    ;again, pull a so stack doesn't corrupt

  RTS


;;;;;;;;;;;;;;;;
icbm_offscreen:
  LDY temp_y
  LDA #$00
  STA temp1

.loop:
  LDA #$FA               ;Y COORDS only for offscreen
  LDX oam_SMap_loc, y
  STA SpriteMap, x
  INY
  INY
  INC temp1
  LDA temp1
  CMP #$0D
  BCC .loop

  RTS

;;;;;;;;;;;;;;;;;;;;;
icbm_start_explode:
  LDY obj_run_offset
  STY temp_y
  LDA #$00
  STA loop_counter
  LDA #$FE

.clear_sprites_loop:
  LDY temp_y            ;temp_y gets constantly inc'd in this loop to create teh correct offset in SMap
  LDX oam_SMap_loc, y
  JSR clear_sprite_tile ;clears the four bytes beginning with oam_SMap_loc, y
  INC temp_y
  INC loop_counter      ;temp_y will start at a different value each time, so loop_counter
  LDA loop_counter      ;is used to keep track of looping instead.
  CMP #$1A              ;CHANGE number depending on object's length
  BCC .clear_sprites_loop

  LDA SPR_Free
  CLC
  ADC #$1A
  STA SPR_Free

  LDY obj_run_offset
  LDA #$FE
.clear_extra_loop:
  INY                   ;since icbm uses additional sprites, must
  STA oam_SMap_loc, y   ;clear out the extra locations
  CPY #$19
  BCC .clear_extra_loop

  LDA OAM_Free
  CLC
  ADC #$19
  STA OAM_Free

.increase_offset:
  LDA obj_run_offset
  CLC                 ;need to increase this so OAM will load in correct pos
  ADC #$0B            ;for next object in $0700 memory
  STA obj_run_offset

  LDA #$00            ;need to initialize this for background_flash sub,
  STA event_counter   ;which runs in icbm_explode

  RTS


;;;;;;;;;;;;;;
icbm_explode:
  LDX obj_run_offset
  INC icbm_timer, x  ;INC can't work with y reg, so I'm using x here.
  LDA icbm_timer, x
  CMP #$40
  BCS .explode_done

.explode_effect:
  JSR background_flash
  JMP .increase_offset

.explode_done:
  LDA #irain
  STA icbm_phase, x
  LDA #$00
  STA icbm_timer, x

.increase_offset:
  LDA obj_run_offset
  CLC                 ;need to increase this so OAM will load in correct pos
  ADC #$0B            ;for next object in $0700 memory
  STA obj_run_offset

.rts:
  RTS


;;;;;;;;;;;;
icbm_rain:
  LDX obj_run_offset

.test_phase:
  LDA icbm_phase, x    ;once phase reaches a certain number, stop spawning fireballs.
  CMP #$14
  BCC .test_timer
  JMP .clear_icbm

.test_timer:
  INC icbm_timer, x     ;I have to use the damn x register in this sub for the oam variables
  LDA icbm_timer, x     ;because I can't use the damn y reg on a variable with INC.
  CMP #$18
  BEQ .spawn_fireball_1
  CMP #$30
  BEQ .spawn_fireball_2
  CMP #$3C
  BCS .spawn_fireball_3
  JMP .increase_offset

.spawn_fireball_1:
  INC icbm_phase, x
  JSR init_falling_fireball
  JMP .increase_offset

.spawn_fireball_2:
  INC icbm_phase, x
  JSR init_falling_fireball
  JMP .increase_offset

.spawn_fireball_3:
  INC icbm_phase, x     ;this is the last spawn in the pattern, so reset the timer
  LDA #$00
  STA icbm_timer, x
  JSR init_falling_fireball
  JMP .increase_offset

.clear_icbm:
  LDY obj_run_offset    ;restore y to actual offset, since it's jacked up by now by the incremented temp_y
  JSR clear_oam_chunk

.increase_offset:
  LDA obj_run_offset
  CLC                 ;need to increase this so OAM will load in correct pos
  ADC #$0B            ;for next object in $0700 memory
  STA obj_run_offset

.rts:
  RTS

;;;;;;;;;;;;;;;;;;;;;;
icbm_start_x_adjust:
  LDA ship_map_x
  CMP #$81
  BCS .icbm_left

.icbm_right:
  LDA oam_xMapLO, x
  CLC
  ADC #$60
  STA oam_xMapLO, x
  LDA oam_xMapHI, x
  ADC #$00
  STA oam_xMapHI, x
  JMP .rts

.icbm_left:
  LDA oam_xMapLO, x
  SEC
  SBC #$60
  STA oam_xMapLO, x
  LDA oam_xMapHI, x
  SBC #$00
  STA oam_xMapHI, x

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;
icbm_static_tiles:
  .db $82,$83, $84,$85, $86,$87, $88,$89, $8A,$8B, $8C,$8B
  .db $8C,$8B, $8C,$8B, $8D,$8B, $8A,$8B, $8A,$8B, $8E,$8F

icbm_anim_tiles:
  .db $90,$92, $91,$93

icbm_anim_pal:
  .db $02, $03


ilaunch   = $03      ;this will match the mv_horizontal constant, which should be the only way an icbm will move
iexplode  = $04
irain     = $05