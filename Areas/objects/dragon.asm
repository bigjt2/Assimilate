;;;;;;;;;;;;;;;;;;;;;;;;
init_dragon:
  LDA dragon_present   ;skip spawn if dragon is already on screen
  BNE .store_offset

  LDA #$11
  STA OAM_SpcNeed
  JSR OAM_memtest
  BCS .store_offset

  LDA #$07
  STA SPR_SpcNeed
  JSR SPR_memtest
  BCS .store_offset

.test_success:
  JSR mem_tests_successful

  JSR SMap_setup
  LDX obj_run_offset

  LDA #$00
  STA dragon_anim, x

.init_dragon:

.store_type:
  LDY obj_init_offset
  LDA [obj_ptr], y
  STA oam_type, x

.x_coords:
  INY
  LDA [obj_ptr], y
  STA oam_xMapLO, x

  LDA ship_screen_x
  STA oam_xMapHI, x

.y_coord:
  INY
  LDA [obj_ptr], y
  STA oam_yMapLO, x

  LDA #$00
  STA drgn_pause_timer
  LDA #$01
  STA dragon_present
  LDA #dragon_seek    ;load this state so dragon immediately chases
  STA dragon_state, x

.store_offset:
  LDA obj_init_offset
  CLC
  ADC #$03  ;amount of spots to jump is much less than typical object
  STA obj_init_offset

.rts:
  JMP OBJ_init_loop_return


;;;;;;;;;;;;;;;;
run_dragon:
  LDY obj_run_offset    ;offset should reflect where pointer is on $0700 OAM table

  LDA oam_type, y
  AND #$40         ;check for destroy flag in bit 6
  BEQ .check_status
  JMP .destroy_dragon

.check_status:
  LDA dragon_state, y
  CMP #dragon_hold
  BEQ .holding
  CMP #dragon_seek
  BEQ .seeking
  JMP .moving

.holding:
  LDA drgn_pause_timer
  CMP #$03
  BCS .hold_done
  JMP .skip            ;will need to test collision regardless of movement
.hold_done:            ;and collision test is under movement label
  LDA #$00
  STA drgn_pause_timer
  LDA #dragon_seek
  STA dragon_state, y
  JMP .skip            ;for the sake of saving cycles, wait until next frame to seek

.seeking:
  JSR dragon_set_target
  LDA #dragon_chase
  STA dragon_state, y
  JMP .skip

.moving:
  JSR dragon_movement

.skip:
  LDA #$07
  STA temp1
  JSR inner_sprite_shuffling

  LDA #$00   ;in this sub, loop_counter variable is used to track the number
  STA loop_counter   ;of sprites in the object that need tested

  LDA oam_xMapLO, y    ;start by transferring the current x coord of the object
  STA sprite_x_offset  ;to this variable, which will be used in the visibility testing.
  STY temp_y           ;temp_y is used to increment the offset for the SpriteMap RAM variables

  LDA oam_xMapHI, y
  PHA      ;MUST push this to the stack, it's very likely it will be incremented in the following code so I need a backup

.dragon_visibility
  JSR visibility_check
  BCS .onscreen

.offscreen:
  LDY temp_y
  LDA #$FA               ;Y COORDS
  LDX oam_SMap_loc, y
  STA SpriteMap, x
  JMP .visibility_loop_test

.onscreen:
  LDY temp_y
  LDX oam_SMap_loc, y

  LDY obj_run_offset
  LDA oam_yMapLO, y      ;Y COORDS
  STA SpriteMap, x

  LDA sprite_x_offset    ;X COORDS
  SEC              
  SBC camera_Left_x
  STA SpriteMap+3, x

.visibility_loop_test:

  INC temp_y
  INC loop_counter
  LDA loop_counter
  CMP #$07            ;<--CHANGE for each new object use the number of sprites comprising
  BCS .tiles_pal      ;the object, do not subtract one for counting from zero

  LDA sprite_x_offset
  CLC                 ;increase sprite offset so next run through visibility_check will
  ADC #$08            ;calculate the next sprite to the right
  STA sprite_x_offset

  LDY obj_run_offset  ;be sure to restore y to the offset since I'm going back to using
                      ;the oam variables here and in the visibility_check sub after
  LDA oam_xMapHI, y
  ADC #$00            ;increment oam's screen number, if neccessary, otherwise real funky stuff will
  STA oam_xMapHI, y   ;happen with the visibility calculations, like objs appearing on screens where they shouldn't.
  JMP .dragon_visibility

.tiles_pal:
  LDY obj_run_offset   ;restore y to the obj_run_offset, otherwise all inderects will be using the temp_y
  PLA   ;here we must restore the original xMapHI in oam, in case it incremented
  STA oam_xMapHI, y

  LDA dragon_anim, y
  CLC
  ADC #$01
  STA dragon_anim, y

  CMP #$1E
  BCS .next0
  JMP .first_frame
.next0:
  CMP #$3C
  BCS .next1
  JMP .second_frame
.next1:
  LDA #$00
  STA dragon_anim, y

.first_frame:
  LDA #$00
  JMP .animation

.second_frame:
  LDA #$1C

.animation:
  CLC             ;if heading right, oam_dir, y will be $01, which will offset the
  ADC oam_dir, y  ;temp1 variable correctly
  STA temp1

  LDA oam_SMap_loc, y   ;pull sprite map location, put in x reg
  JSR dragon_anim_load
  LDA oam_SMap_loc+1, y   ;pull sprite map location, put in x reg
  JSR dragon_anim_load
  LDA oam_SMap_loc+2, y   ;pull sprite map location, put in x reg
  JSR dragon_anim_load
  LDA oam_SMap_loc+3, y   ;pull sprite map location, put in x reg
  JSR dragon_anim_load
  LDA oam_SMap_loc+4, y   ;pull sprite map location, put in x reg
  JSR dragon_anim_load
  LDA oam_SMap_loc+5, y   ;pull sprite map location, put in x reg
  JSR dragon_anim_load
  LDA oam_SMap_loc+6, y   ;pull sprite map location, put in x reg
  JSR dragon_anim_load

.collision_testing:
  LDX oam_SMap_loc, y
  LDA SpriteMap, x     ;test whether first sprite is on-screen.
  CMP #$FA             ;if not, then entire object assumed to be off-screen, so skip collision test
  BEQ .increase_offset

  LDA #$04
  STA obj_height
  LDA #$36
  STA obj_width
  LDA #$02
  STA temp1    ;temp1 is the amount to offset x to the right
  LDA #$03
  STA temp2    ;temp2 is the amount to offset y downward

  JSR obj_coords_to_bbox   ;will take x & y coord and create a bbox
  JSR collision_against_ship  ;will take bbox and test collision agains Ossan, set player_dead var if collision
  BCC .increase_offset

.death:
  JSR ship_dies

.destroy_dragon:
  JSR destroy_dragon

.increase_offset:
  LDA obj_run_offset
  CLC                 ;need to increase this so OAM will load in correct pos
  ADC #$11            ;for next object in $0700 memory
  STA obj_run_offset

.rts:
  JMP OBJ_run_loop_return


;;;;;;;;;;;;;;;;;;;
destroy_dragon:
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
  CMP #$07              ;CHANGE number depending on object's length
  BCC .clear_sprites_loop

  LDA SPR_Free
  CLC
  ADC #$07
  STA SPR_Free

  LDY obj_run_offset
  JSR clear_oam_chunk   ;since dragon uses additional sprites, must
  STA oam_SMap_loc+1, y ;clear out the extra locations
  STA oam_SMap_loc+2, y
  STA oam_SMap_loc+3, y
  STA oam_SMap_loc+4, y
  STA oam_SMap_loc+5, y
  STA oam_SMap_loc+6, y

  LDA OAM_Free
  CLC
  ADC #$11
  STA OAM_Free

  LDA #$00
  STA dragon_present    ;clear dragon_present so another dragon can spawn. 

  RTS


;;;;;;;;;;;;;;;;;;;
dragon_movement:

  TXA      ;will be using x to test if both cases are cleared
  PHA      ;so back it up
  LDX #$00

.x_movement:
  LDA oam_xMapHI, y
  CMP drgn_xTarget, y
  BCC .add_x
  BNE .sub_x
  LDA oam_xMapLO, y
  CMP drgn_xTarget+1, y
  BCC .add_x
  BNE .sub_x
  INX        ;x is level with target, so increment
  JMP .y_movement

.add_x:
  LDA oam_xMapLO, y
  CLC
  ADC #$02
  STA oam_xMapLO, y
  LDA oam_xMapHI, y
  ADC #$00
  STA oam_xMapHI, y
  JMP .y_movement

.sub_x:
  LDA oam_xMapLO, y
  SEC
  SBC #$02
  STA oam_xMapLO, y
  LDA oam_xMapHI, y
  SBC #$00
  STA oam_xMapHI, y
  JMP .y_movement

.y_movement:
  LDA oam_yMapLO, y
  CMP drgn_yTarget, y
  BCC .add_y
  BNE .sub_y
  INX     ;y is level with target, so increment
  CPX #$02  ;if y and x are both level with target, x=2, set hold
  BNE .rts
  JMP .set_hold

.add_y:
  LDA oam_yMapLO, y
  CLC
  ADC #$02
  STA oam_yMapLO, y
  JMP .rts

.sub_y:
  LDA oam_yMapLO, y
  SEC
  SBC #$02
  STA oam_yMapLO, y
  JMP .rts

.set_hold:
  LDA #dragon_hold
  STA dragon_state, y
  LDA #$00
  STA drgn_pause_timer

.rts:
  PLA  ;restore x reg
  TAX
 
  RTS


;;;;;;;;;;;;;;;;;;;;
dragon_set_target:

.x_target:
  LDA oam_xMapHI, y      ;dragon's screen < ship's screen
  CMP ship_screen_x
  BCC .target_to_right
  LDA ship_screen_x   ;ship's screen < dragon's screen
  CMP oam_xMapHI, y
  BCC .target_to_left

  LDA oam_xMapLO, y      ;test for dragon's screen = ship's screen
  CMP ship_map_x
  BCC .target_to_right

.target_to_left:
  LDA ship_map_x
  SEC
  SBC #$08
  STA drgn_xTarget+1, y
  LDA ship_screen_x
  SBC #$00
  STA drgn_xTarget, y

  LDA #left
  STA oam_dir, y

  JMP .y_target

.target_to_right:
  LDA ship_map_x
  CLC
  ADC #$08
  STA drgn_xTarget+1, y
  LDA ship_screen_x
  ADC #$00
  STA drgn_xTarget, y

  LDA #right
  STA oam_dir, y

.y_target:
  LDA oam_yMapLO, y
  CMP ship_y
  BCC .target_below

.target_above:
  LDA ship_y
  SEC
  SBC #$08
  STA drgn_yTarget, y
  JMP .x_rounding

.target_below:
  LDA ship_y
  CLC
  ADC #$08
  STA drgn_yTarget, y

.x_rounding:   ;round the numbers to even
  LDA drgn_xTarget+1, y
  AND #$01
  CMP #$01
  BEQ .x_odd
  JMP .y_rounding
.x_odd:
  LDA drgn_xTarget+1, y
  CLC
  ADC #$01
  STA drgn_xTarget+1, y

.y_rounding:
  LDA drgn_yTarget, y
  AND #$01
  CMP #$01
  BEQ .y_odd
  JMP .rts
.y_odd:
  LDA drgn_yTarget, y
  CLC
  ADC #$01
  STA drgn_yTarget, y

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;
dragon_anim_load:
  TAX
  TYA   ;push object offset to stack
  PHA
  LDY temp1        ;pull animation table location from temp1  
  LDA dragon_animation_tiles, y   ;TILE
  STA SpriteMap+1, x
  INY
  INY
  LDA dragon_animation_tiles, y   ;ATTR
  STA SpriteMap+2, x
  INY
  INY
  STY temp1
  PLA
  TAY  ;transfer offset back to y so it's ready for next sub
  
  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;
dragon_animation_tiles:

  .db $B1,$B7, $01,$41, $B2,$B6, $01,$41, $B3,$B5, $01,$41, $B4,$B4  ;first frame
  .db $01,$41, $B5,$B3, $01,$41, $B6,$B2, $01,$41, $B7,$B1, $01,$41

  .db $B8,$BE, $01,$41, $B9,$BD, $01,$41, $BA,$BC, $01,$41, $BB,$BB  ;second frame
  .db $01,$41, $BC,$BA, $01,$41, $BD,$B9, $01,$41, $BE,$B8, $01,$41


;;;;;;;;;;;;
dragon_hold       = $01  ;pausing in mid-flight
dragon_seek       = $02  ;calculationg target
dragon_chase      = $03  ;moving to current target
