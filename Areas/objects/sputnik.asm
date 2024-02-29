;;;;;;;;;;;;;;;;;;;;;;;;
init_sputnik:
  LDA EMP_trigger   ;skip spawn if EMP trigger set
  BNE .store_offset

.screen_test:            ;kill it if on first or last screen
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
  LDA #$12
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

.init_sputnik:
  JSR general_obj_setup

.tiles_palettes:
  JSR sputnik_tile_setup

.store_offset:
  JSR inc_init_offset

.rts:
  JMP OBJ_init_loop_return


;;;;;;;;;;;;;;;;
run_sputnik:
  LDY obj_run_offset    ;offset should reflect where pointer is on $0700 OAM table

  LDA oam_type, y
  AND #$40         ;check for destroy flag in bit 6
  BEQ .horiz_screen_test
  JMP .destroy_sputnik

.horiz_screen_test:
  JSR offscreen_destroy_test   ;kill object if too far left or right
  BCC .y_screen_test
  JMP .destroy_sputnik

.y_screen_test:
  LDA oam_yMapLO, y
  CMP #$E0
  BCC .movement
  JMP .destroy_sputnik

.movement:
  JSR obj_movement

.visibility:
  LDA oam_yMapLO, y
  CMP #$08
  BCS .normal
  JSR sputnik_orbit     ;this means sputnik is above status bar and shouldn't be seen.
  LDY obj_run_offset
  JMP .increase_offset

.normal:
  LDA #$00
  STA loop_counter

  LDA oam_xMapLO, y
  STA sprite_x_offset
  STY temp_y

  LDA oam_xMapHI, y
  PHA      ;MUST push this to the stack, it's very likely it will be incremented in the following code so I need a backup

.sputnik_visibility:
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
  JMP .sputnik_visibility

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

.destroy_sputnik:
  JSR destroy_sputnik

.increase_offset:
  LDA obj_run_offset
  CLC                 ;need to increase this so OAM will load in correct pos
  ADC #$12            ;for next object in $0700 memory
  STA obj_run_offset

.rts:
  JMP OBJ_run_loop_return


;;;;;;;;;;;;;;;;;;;
destroy_sputnik:
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

  JSR clear_oam_chunk   ;since sputnik uses additional sprites, must
  STA oam_SMap_loc+1, y ;clear out the extra locations
  STA oam_SMap_loc+2, y
  STA oam_SMap_loc+3, y
  STA oam_SMap_loc+4, y
  STA oam_SMap_loc+5, y
  STA oam_SMap_loc+6, y
  STA oam_SMap_loc+7, y

  LDA OAM_Free
  CLC
  ADC #$12
  STA OAM_Free

  RTS


;;;;;;;;;;;;;;;;;;;;;
sputnik_tile_setup:

.load_tile:
  LDY obj_run_offset
  STY temp_y
  LDA oam_dir, y             ;will be zero or one, left or right.
  TAX
  BEQ .right
.left:
  LDA #$42
  STA temp1
  JMP .tile_start
.right:
  LDA #$02
  STA temp1
.tile_start:
.load_tile_loop:
  LDY temp_y
  LDA oam_SMap_loc, y
  TAY
  LDA sputnik_tiles, x
  STA SpriteMap+1, y         ;TILES
  LDA temp1
  STA SpriteMap+2, y         ;PALETTE
  INX
  INX
  INC temp_y
  CPX #$10
  BCC .load_tile_loop

  RTS


;;;;;;;;;;;;;;;
sputnik_orbit:
  LDA #$00
  STA loop_counter
.loop:
  LDA #$FA
  LDX oam_SMap_loc, y        ;Y COORDS
  STA SpriteMap, x
  LDX oam_SMap_loc+4, y
  STA SpriteMap, x
  INY
  INC loop_counter
  LDA loop_counter
  CMP #$04
  BCC .loop

  RTS


sputnik_tiles:
  .db $7C,$7F, $7D,$7E, $7E,$7D, $7F,$7C, $FE,$FE, $80,$81, $81,$80, $FE,$FE
      