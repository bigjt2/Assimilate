;;;;;;;;;;;;;;;;;;;;;;;;
init_meteor:
  LDA EMP_trigger   ;skip spawn if EMP trigger set
  BNE .store_offset

.screen_test:            ;kill it if on first or last screen
  LDA boss_active        ;but don't kill it on boss fights
  BNE .mem_tests
  LDY obj_init_offset
  INY                    ;iny twice so we move to the position on object table
  INY                    ;that stores the direction
  LDA [obj_ptr], y
  BEQ .left
.right:
  LDA ship_screen_x
  CMP frst_Background
  BEQ .store_offset
  JMP .mem_tests
.left:
  LDA ship_screen_x
  CMP finl_Background
  BEQ .store_offset

.mem_tests:
  LDA #$13
  STA OAM_SpcNeed
  JSR OAM_memtest
  BCS .store_offset

  LDA #$08
  STA SPR_SpcNeed
  JSR SPR_memtest
  BCS .store_offset   ;if either test fails, skip to storing offset

.test_success:
  JSR mem_tests_successful

  JSR SMap_setup
  LDX obj_run_offset

  LDA #$00
  STA meteor_anim, x

.init_meteor:
  JSR general_obj_setup

.store_offset:
  JSR inc_init_offset

.rts:
  JMP OBJ_init_loop_return


;;;;;;;;;;;;;;;;
run_meteor:
  LDY obj_run_offset    ;offset should reflect where pointer is on $0700 OAM table

  LDA oam_type, y
  AND #$40         ;check for destroy flag in bit 6
  BEQ .horiz_screen_test
  JMP .destroy_meteor

.horiz_screen_test:
  JSR offscreen_destroy_test   ;kill object if too far left or right
  BCC .y_screen_test
  JMP .destroy_meteor

.y_screen_test:
  LDA oam_yMapLO, y
  CMP #$E0
  BCC .tile_palette
  JMP .destroy_meteor

.tile_palette:
  LDA meteor_anim, y
  CLC
  ADC #$01
  STA meteor_anim, y

  CMP #$01
  BEQ .first_frame
  CMP #$09
  BEQ .second_frame
  CMP #$12
  BEQ .reset
  JMP .movement
.reset:
  LDA #$00
  STA meteor_anim, y
  JMP .movement

.first_frame:
  LDA #$00
  JMP .animation

.second_frame:
  LDA #$20
  JMP .animation

.animation:
  CLC             ;if heading right, oam_dir, y will be $01, which will offset the
  ADC oam_dir, y  ;temp1 variable correctly
  STA temp1

  LDA oam_SMap_loc, y   ;pull sprite map location, put in x reg
  JSR meteor_anim_load
  LDA oam_SMap_loc+1, y   ;pull sprite map location, put in x reg
  JSR meteor_anim_load
  LDA oam_SMap_loc+2, y   ;pull sprite map location, put in x reg
  JSR meteor_anim_load
  LDA oam_SMap_loc+3, y   ;pull sprite map location, put in x reg
  JSR meteor_anim_load
  LDA oam_SMap_loc+4, y   ;pull sprite map location, put in x reg
  JSR meteor_anim_load
  LDA oam_SMap_loc+5, y   ;pull sprite map location, put in x reg
  JSR meteor_anim_load
  LDA oam_SMap_loc+6, y   ;pull sprite map location, put in x reg
  JSR meteor_anim_load
  LDA oam_SMap_loc+7, y   ;pull sprite map location, put in x reg
  JSR meteor_anim_load

.movement:
  JSR obj_movement

.visibility:
  LDA oam_yMapLO, y
  CMP #$08
  BCS .normal
  JSR sputnik_orbit     ;sputnik and the meteor both have the same tile dimensions, move the same, and are both located here
  LDY obj_run_offset    ;in the object bank. so I might as well use the same sub.
  JMP .increase_offset

.normal:
  LDA #$00
  STA loop_counter

  LDA oam_xMapLO, y
  STA sprite_x_offset
  STY temp_y

  LDA oam_xMapHI, y
  PHA      ;MUST push this to the stack, it's very likely it will be incremented in the following code so I need a backup

.meteor_visibility:
  JSR visibility_check
  BCS .onscreen
  
.offscreen:
  LDY temp_y
  LDA #$FA             ;Y COORDS
  LDX oam_SMap_loc, y
  STA SpriteMap, x
  LDX oam_SMap_loc+4, y
  STA SpriteMap, x
  JMP .visibility_loop_test

.onscreen:
  LDY temp_y           ;think of temp_y as the current "column" of sprites
  LDX oam_SMap_loc, y  ;need to use it to pull the correct addy of "top" part of column
  LDY obj_run_offset   ;need to destroy y and get obj_offset so we can pull the y coord
  LDA oam_yMapLO, y    ;Y COORDS
  STA SpriteMap, x
  CLC                    ;seriously, this is all really fucking ugly.
  ADC #$08
  LDY temp_y             ;return temp_y to y reg to get the "bottom" part of column
  LDX oam_SMap_loc+4, y  ;offset by four to pull the correct SpriteMap location out of the $0700 string
  STA SpriteMap, x

  LDA sprite_x_offset    ;X COORDS
  SEC              
  SBC camera_Left_x
  LDX oam_SMap_loc, y    ;temp_y is still in y reg, so no need to do all that fancy
  STA SpriteMap+3, x     ;switch-er-roo like in the y coords.
  LDX oam_SMap_loc+4, y
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
  JMP .meteor_visibility

.collision_check:
  LDY obj_run_offset   ;restore y to the obj_run_offset, otherwise all inderects will be using the temp_y
  PLA   ;here we must restore the original xMapHI in oam, in case it incremented
  STA oam_xMapHI, y

  LDX oam_SMap_loc, y
  LDA SpriteMap, x     ;test whether first sprite is on-screen.
  CMP #$FA             ;if not, then entire object assumed to be off-screen, so skip collision test
  BEQ .increase_offset

  LDA #$0A
  STA obj_height
  LDA #$1E
  STA obj_width
  LDA #$01
  STA temp1    ;temp1 is the amount to offset x to the right
  LDA #$02
  STA temp2    ;temp2 is the amount to offset y downward

  JSR obj_coords_to_bbox   ;will take x & y coord and create a bbox
  JSR collision_against_ship  ;will take bbox and test collision agains Ossan, set player_dead var if collision
  BCC .increase_offset

.death:
  JSR ship_dies
  JMP .increase_offset

.destroy_meteor:
  JSR destroy_meteor

.increase_offset:
  LDA obj_run_offset
  CLC                 ;need to increase this so OAM will load in correct pos
  ADC #$13            ;for next object in $0700 memory
  STA obj_run_offset

.rts:
  JMP OBJ_run_loop_return


;;;;;;;;;;;;;;;;;;;
destroy_meteor:
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
  CMP #$08              ;CHANGE number depending on object's length
  BCC .clear_sprites_loop

  LDA SPR_Free
  CLC
  ADC #$08
  STA SPR_Free

  LDY obj_run_offset

  JSR clear_oam_chunk   ;since meteor uses additional sprites, must
  STA oam_SMap_loc+1, y ;clear out the extra locations
  STA oam_SMap_loc+2, y
  STA oam_SMap_loc+3, y
  STA oam_SMap_loc+4, y
  STA oam_SMap_loc+5, y
  STA oam_SMap_loc+6, y
  STA oam_SMap_loc+7, y
  STA meteor_anim, y

  LDA OAM_Free
  CLC
  ADC #$13
  STA OAM_Free

  RTS


;;;;;;;;;;;;;;;;;;;;;
meteor_anim_load:
  TAX
  TYA   ;push object offset to stack
  PHA
  LDY temp1        ;pull animation table location from temp1  
  LDA meteor_animation_tiles, y   ;TILE
  STA SpriteMap+1, x
  INY
  INY
  LDA meteor_animation_tiles, y   ;ATTR
  STA SpriteMap+2, x
  INY
  INY
  STY temp1
  PLA
  TAY  ;transfer offset back to y so it's ready for next sub
  
  RTS


meteor_animation_tiles:
  .db $7F,$7C, $41,$01, $7E,$7D, $41,$01, $7D,$7E, $41,$01, $7C,$7F, $41,$01
  .db $83,$80, $41,$01, $82,$81, $41,$01, $81,$82, $41,$01, $80,$83, $41,$01

  .db $87,$84, $42,$02, $86,$85, $42,$02, $85,$86, $42,$02, $84,$87, $42,$02
  .db $8B,$88, $42,$02, $8A,$89, $42,$02, $89,$8A, $42,$02, $88,$8B, $42,$02