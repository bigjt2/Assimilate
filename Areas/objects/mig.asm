;;;;;;;;;;;;;;;;;;;;;;;;
init_mig:
  LDA #$17
  STA OAM_SpcNeed
  JSR OAM_memtest
  BCS .store_offset

  LDA #$0C
  STA SPR_SpcNeed
  JSR SPR_memtest
  BCS .store_offset

.test_success:
  JSR mem_tests_successful

  JSR SMap_setup
  LDX obj_run_offset

.init_mig:
  JSR general_obj_setup
  LDA #$00
  STA mig_fire, x         ;counter controls how often the mig shoots a fireball

.store_offset:
  JSR inc_init_offset

.rts:
  JMP OBJ_init_loop_return


;;;;;;;;;;;;;;;;
run_mig:
  LDY obj_run_offset    ;offset should reflect where pointer is on $0700 OAM table

  LDA oam_type, y
  AND #$40         ;check for destroy flag in bit 6
  BEQ .horiz_screen_test
  JMP .destroy_mig

.horiz_screen_test:
  JSR offscreen_destroy_test   ;kill object if too far left or right
  BCC .movement
  JMP .destroy_mig

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

.mig_visibility:
  JSR visibility_check
  BCS .onscreen

.offscreen:
  LDY temp_y
  LDA #$FA               ;Y COORDS only for offscreen
  LDX oam_SMap_loc, y
  STA SpriteMap, x
  LDX oam_SMap_loc+6, y  ;CHANGE this +number if length of object changes
  STA SpriteMap, x

  JMP .visibility_loop_test

.onscreen:
  LDY temp_y
  LDX oam_SMap_loc, y

  LDY obj_run_offset     ;Y COORDS
  LDA oam_yMapLO, y
  STA SpriteMap, x
  CLC
  ADC #$08               ;add 8 to get lower sprite's y coord
  LDY temp_y
  LDX oam_SMap_loc+6, y  ;CHANGE this +number if length of object changes
  STA SpriteMap, x
                          
  LDA sprite_x_offset    ;X COORDS
  SEC
  SBC camera_Left_x      ;subtract camera to get the correct screen x position of the sprite.
  STA SpriteMap+3, x     ;remember, x reg is still set to the +6 SMap position from above, so we can keep it to store in lower sprite
  LDX oam_SMap_loc, y
  STA SpriteMap+3, x     ;restore original SMap position to store in higher sprite

.visibility_loop_test:

  INC temp_y
  INC loop_counter
  LDA loop_counter
  CMP #$06
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

  JMP .mig_visibility

.visibility_end:
  LDY obj_run_offset   ;restore y to the obj_run_offset, otherwise all inderects will be using the temp_y
  PLA                  ;here we must restore the original xMapHI in oam, in case it incremented
  STA oam_xMapHI, y

.fire_test:
  LDX oam_SMap_loc, y  ;must restore because x reg has changed
  LDA SpriteMap, x
  CMP #$FA
  BEQ .load_tile
  LDX obj_run_offset   ;inc (next command) can only use x reg. x reg is reset below where needed.
  INC mig_fire, x      ;not sure where to place this, but I only want mig to fire
  LDA mig_fire, y      ;if visible.  tried looking for a place down below and haven't
  CMP #$20             ;decided yet.
  BCC .load_tile
.FIRE:                 ;launch a fireball every so often
  LDA #$00
  STA mig_fire, y

  LDA #$10
  STA weapon_xoffset
  LDA #$08
  STA weapon_yoffset
  JSR init_weapon_fireball

.load_tile:
  LDY obj_run_offset   ;offset needed to start out temp_y on next line
  STY temp_y
  LDA #$18             ;num of tiles to test if going left (add 0)  ;CHANGE depending on object's width/num of tiles
  CLC                  ;otherwise add 1 (going right) and compare to that
  ADC oam_dir, y
  STA temp1            ;will be used to test the loop
  LDX oam_dir, y       ;oam_dir is also the starting number to pull from the graphics_tiles table
.load_tile_loop:
  LDY temp_y           ;temp_y is incremented constantly to give correct position in SMap
  LDA oam_SMap_loc, y
  TAY
  LDA mig_graphics_tiles, x
  STA SpriteMap+1, y
  INX
  INX                  ;skip two places on the table below, to account for left and right tiles
  INC temp_y
  CPX temp1
  BCC .load_tile_loop

.load_attr:
  LDY obj_run_offset   ;I destroyed y in .load_tile, so restore offset into y
  STY temp_y
  LDX oam_dir, y       ;used below to pull correct one of two bytes from attr table

  LDA oam_type, y
  CMP #spc_ship        ;test for mig or space ship, branch accordingly to set
  BNE .mig_attr_load   ;proper table below.

.sship_attr_load:
  LDA sship_attr, x 
  LDX #$00
  JMP .load_attr_loop
.mig_attr_load:
  LDA mig_attr, x      ;use oam_dir in x reg from above to pull correct byte off table
  LDX #$00             ;now wipe out x, i'm going to use it as a loop counter this time
.load_attr_loop:
  PHA                  ;I keep destroying a to get the correct value into y reg, so it needs pushed at beginning of loop
  LDY temp_y           ;same as above, use temp_y to position correctly on SMap
  LDA oam_SMap_loc, y
  TAY
  PLA                  ;Accum needs pulled here to load into the pal position of current sprite tile
  STA SpriteMap+2, y
  INX
  INC temp_y
  CPX #$0C             ;CHANGE this number depending on object's length/num of tiles
  BCC .load_attr_loop

.collision_testing:
  LDY obj_run_offset   ;again, destroyed y above, so restore obj offset into it

  LDX oam_SMap_loc, y
  LDA SpriteMap, x     ;test whether first sprite is on-screen.
  CMP #$FA             ;if not, then entire object assumed to be off-screen, so skip collision test
  BEQ .increase_offset

.first_box:    ;long box that runs along mig's body
  LDA #$08
  STA obj_height
  LDA #$2A
  STA obj_width
  LDA #$02
  STA temp1    ;temp1 is the amount to offset x to the right
  LDA #$07
  STA temp2    ;temp2 is the amount to offset y downward

  JSR obj_coords_to_bbox   ;will take x & y coord and create a bbox
  JSR collision_against_ship  ;will take bbox and test collision agains Ossan, set player_dead var if collision
  BCC .increase_offset
               ;;second box? for the cockpit section?
.death:
  JSR ship_dies

.destroy_mig:
  JSR destroy_mig

.increase_offset:
  LDA obj_run_offset
  CLC                 ;need to increase this so OAM will load in correct pos
  ADC #$17            ;for next object in $0700 memory
  STA obj_run_offset

.rts:
  JMP OBJ_run_loop_return


;;;;;;;;;;;;;;;;;;;
destroy_mig:
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
  CMP #$0C              ;CHANGE number depending on object's length
  BCC .clear_sprites_loop

  LDA SPR_Free
  CLC
  ADC #$0C
  STA SPR_Free

  LDY obj_run_offset    ;restore y to actual offset, since it's jacked up by now by the incremented temp_y

  JSR clear_oam_chunk   ;since mig uses additional sprites, must
  STA oam_SMap_loc+1, y ;clear out the extra locations
  STA oam_SMap_loc+2, y
  STA oam_SMap_loc+3, y
  STA oam_SMap_loc+4, y
  STA oam_SMap_loc+5, y
  STA oam_SMap_loc+6, y
  STA oam_SMap_loc+7, y
  STA oam_SMap_loc+8, y
  STA oam_SMap_loc+9, y
  STA oam_SMap_loc+10, y
  STA oam_SMap_loc+11, y
  STA mig_fire, y

  LDA OAM_Free
  CLC
  ADC #$17
  STA OAM_Free

  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;
mig_graphics_tiles:
  .db $70,$75, $71,$74, $72,$73, $73,$72, $74,$71, $75,$70
  .db $76,$7B, $77,$7A, $78,$79, $79,$78, $7A,$77, $7B,$76

mig_attr:
  .db $02, $42

sship_attr:
  .db $01, $41