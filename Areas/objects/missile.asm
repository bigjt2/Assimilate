;;;;;;;;;;;;;;;;;;;;;;;;
init_missile:
  LDA EMP_trigger   ;skip spawn if EMP trigger set
  BNE .store_offset

  LDA #$0F
  STA OAM_SpcNeed
  JSR OAM_memtest
  BCS .store_offset

  LDA #$04
  STA SPR_SpcNeed
  JSR SPR_memtest
  BCS .store_offset   ;if either test fails, skip to storing offset

.test_success:
  JSR mem_tests_successful

  JSR SMap_setup
  LDX obj_run_offset

  LDA #$00
  STA missile_anim, x

.init_missile:
  JSR general_obj_setup

.stalin_test:         ;MechaStalin's mouth needs a flag set to animate if a missile launches
  LDA boss_active
  BEQ .store_offset
  LDA boss_num
  CMP #boss3
  BNE .store_offset
  LDA #$00
  STA stalin_mouth_cntr

.store_offset:
  JSR inc_init_offset

.rts:
  JMP OBJ_init_loop_return


;;;;;;;;;;;;;;;;
run_missile:
  LDY obj_run_offset    ;offset should reflect where pointer is on $0700 OAM table

  LDA oam_type, y
  AND #$40         ;check for destroy flag in bit 6
  BEQ .horiz_screen_test
  JMP .destroy_missile

.horiz_screen_test:
  JSR offscreen_destroy_test   ;kill object if too far left or right
  BCC .y_screen_test
  JMP .destroy_missile

.y_screen_test:
  LDA oam_yMapLO, y
  CMP #$38
  BCS .y_next
  JMP .destroy_missile
.y_next:
  LDA oam_yMapLO, y
  CMP #$E0
  BCC .tile_palette
  JMP .destroy_missile

.tile_palette:
  LDA missile_anim, y
  CLC
  ADC #$01
  STA missile_anim, y

  CMP #$01
  BEQ .first_frame
  LDA missile_anim, y
  CMP #$1E
  BEQ .second_frame
  CMP #$3C
  BEQ .third_frame
  CMP #$5A
  BCS .reset
  JMP .movement
.reset:
  LDA #$00
  STA missile_anim, y
  JMP .movement

.first_frame:
  LDA #$00
  JMP .animation

.second_frame:
  LDA #$10
  JMP .animation

.third_frame:
  LDA #$20

.animation:
  CLC             ;if heading right, oam_dir, y will be $01, which will offset the
  ADC oam_dir, y  ;temp1 variable correctly
  STA temp1

  LDA oam_SMap_loc, y   ;pull sprite map location, put in x reg
  JSR missile_anim_load

  LDA oam_SMap_loc+1, y   ;pull sprite map location, put in x reg
  JSR missile_anim_load

  LDA oam_SMap_loc+2, y   ;pull sprite map location, put in x reg
  JSR missile_anim_load

  LDA oam_SMap_loc+3, y   ;pull sprite map location, put in x reg
  JSR missile_anim_load

.movement:
  JSR obj_movement

.visibility:
  LDA #$00
  STA loop_counter

  LDA oam_xMapLO, y
  STA sprite_x_offset
  STY temp_y

  LDA oam_xMapHI, y
  PHA      ;MUST push this to the stack, it's very likely it will be incremented in the following code so I need a backup

.missile_visibility:
  JSR visibility_check
  BCS .onscreen
  
.offscreen:
  LDY temp_y
  LDA #$FA             ;Y COORDS
  LDX oam_SMap_loc, y
  STA SpriteMap, x
  JMP .visibility_loop_test

.onscreen:
  LDY temp_y
  LDX oam_SMap_loc, y

  LDY obj_run_offset
  LDA oam_yMapLO, y    ;Y COORDS
  STA SpriteMap, x

  LDA sprite_x_offset    ;X COORDS
  SEC              
  SBC camera_Left_x
  STA SpriteMap+3, x

.visibility_loop_test:

  INC temp_y
  INC loop_counter
  LDA loop_counter
  CMP #$04
  BCS .collision_check

  LDA sprite_x_offset
  CLC
  ADC #$08
  STA sprite_x_offset

  LDY obj_run_offset  ;be sure to restore y to the offset since I'm going back to using
                      ;the oam variables here and in the visibility_check sub after
  LDA oam_xMapHI, y
  ADC #$00
  STA oam_xMapHI, y
  JMP .missile_visibility

.collision_check:
  LDY obj_run_offset   ;restore y to the obj_run_offset, otherwise all inderects will be using the temp_y
  PLA   ;here we must restore the original xMapHI in oam, in case it incremented
  STA oam_xMapHI, y

  LDX oam_SMap_loc, y
  LDA SpriteMap, x     ;test whether first sprite is on-screen.
  CMP #$FA             ;if not, then entire object assumed to be off-screen, so skip collision test
  BEQ .increase_offset

  LDA #$06
  STA obj_height
  LDA #$1E
  STA obj_width
  LDA #$01
  STA temp1    ;temp1 is the amount to offset x to the right
  STA temp2    ;temp2 is the amount to offset y downward

  JSR obj_coords_to_bbox   ;will take x & y coord and create a bbox
  JSR collision_against_ship  ;will take bbox and test collision agains Ossan, set player_dead var if collision
  BCC .increase_offset

.death:
  JSR ship_dies
  JMP .increase_offset

.destroy_missile:
  JSR destroy_missile

.increase_offset:
  LDA obj_run_offset
  CLC                 ;need to increase this so OAM will load in correct pos
  ADC #$0F            ;for next object in $0700 memory
  STA obj_run_offset

.rts:
  JMP OBJ_run_loop_return


;;;;;;;;;;;;;;;;;;;
destroy_missile:
  LDY obj_run_offset

  LDX oam_SMap_loc, y
  JSR clear_sprite_tile
  LDX oam_SMap_loc+1, y
  JSR clear_sprite_tile
  LDX oam_SMap_loc+2, y
  JSR clear_sprite_tile
  LDX oam_SMap_loc+3, y
  JSR clear_sprite_tile

  LDA SPR_Free
  CLC
  ADC #$04
  STA SPR_Free

  LDY obj_run_offset

  JSR clear_oam_chunk   ;since missile uses additional sprites, must
  STA oam_SMap_loc+1, y ;clear out the extra locations
  STA oam_SMap_loc+2, y
  STA oam_SMap_loc+3, y
  STA missile_anim, y

  LDA OAM_Free
  CLC
  ADC #$0F
  STA OAM_Free

  RTS


;;;;;;;;;;;;;;;;;;;;;
missile_anim_load:
  TAX
  TYA   ;push object offset to stack
  PHA
  LDY temp1        ;pull animation table location from temp1  
  LDA missile_animation_tiles, y   ;TILE
  STA SpriteMap+1, x
  INY
  INY
  LDA missile_animation_tiles, y   ;ATTR
  STA SpriteMap+2, x
  INY
  INY
  STY temp1
  PLA
  TAY  ;transfer offset back to y so it's ready for next sub
  
  RTS


missile_animation_tiles:
          
  .db $10,$13, $03,$41, $11,$12, $03,$43, $12,$11, $03,$43, $13,$10, $01,$43
  .db $4D,$13, $03,$41, $4E,$4F, $03,$43, $4F,$4E, $03,$43, $13,$4D, $01,$43
  .db $50,$13, $03,$42, $51,$52, $03,$43, $52,$51, $03,$43, $13,$50, $02,$43