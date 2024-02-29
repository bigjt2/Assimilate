;;;;;;;;;;;;;;;;;;;;;;;;
init_ring:
  LDA EMP_trigger   ;skip spawn if EMP trigger set
  BNE .store_offset

  LDA #$10
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
  STA ring_anim, x
  STA ring_counter, x

.init_ring:
  JSR general_obj_setup

.store_offset:
  JSR inc_init_offset

.rts:
  JMP OBJ_init_loop_return


;;;;;;;;;;;;;;;;
run_ring:
  LDY obj_run_offset    ;offset should reflect where pointer is on $0700 OAM table

  LDA oam_type, y
  AND #$40         ;check for destroy flag in bit 6
  BEQ .timer
  JMP .destroy_ring

.timer:
  TYA
  TAX
  INC ring_counter, x
  LDA ring_counter, x
  CMP #$FF
  BNE .horiz_screen_test
  JMP .destroy_ring

.horiz_screen_test:
  JSR offscreen_destroy_test   ;kill object if too far left or right
  BCC .y_screen_test
  JMP .destroy_ring

.y_screen_test:
  LDA oam_yMapLO, y
  CMP #$38
  BCS .y_next
  JMP .destroy_ring
.y_next:
  LDA oam_yMapLO, y
  CMP #$E0
  BCC .animation
  JMP .destroy_ring

.animation:
  LDA ring_anim, y
  CLC
  ADC #$01
  STA ring_anim, y

  CMP #$01
  BEQ .first_frame
  LDA ring_anim, y
  CMP #$1E
  BEQ .second_frame
  CMP #$3C
  BEQ .third_frame
  CMP #$5A
  BCS .reset
  JMP .movement
.reset:
  LDA #$00
  STA ring_anim, y
  JMP .movement

.first_frame:
  LDX #$00
  JMP .load_anim_tile_attr

.second_frame:
  LDX #$04
  JMP .load_anim_tile_attr

.third_frame:
  LDX #$08

.load_anim_tile_attr:        ;position on the animation tables below.
  LDA #$00
  STA loop_counter
.tile_loop:
  LDA obj_run_offset
  CLC
  ADC loop_counter
  TAY
  LDA oam_SMap_loc, y
  TAY
  LDA ring_frames, x
  STA SpriteMap+1, y
  LDA #$01
  STA SpriteMap+2, y
  INX
  INC loop_counter
  LDA loop_counter
  CMP #$04
  BCC .tile_loop
  LDY obj_run_offset

.movement:
  JSR obj_movement

.coordinates:
  LDA oam_xMapLO, y
  CMP #$08
  BCC .destroy_ring
  CMP #$F8
  BCS .destroy_ring

.y_coords:
  LDX oam_SMap_loc, y
  LDA oam_yMapLO, y
  STA SpriteMap, x
  LDX oam_SMap_loc+1, y
  STA SpriteMap, x
  CLC
  ADC #$08
  LDX oam_SMap_loc+2, y
  STA SpriteMap, x
  LDX oam_SMap_loc+3, y
  STA SpriteMap, x

.x_coords:
  LDX oam_SMap_loc, y
  LDA oam_xMapLO, y
  STA SpriteMap+3, x
  LDX oam_SMap_loc+2, y
  STA SpriteMap+3, x
  CLC
  ADC #$08
  LDX oam_SMap_loc+1, y
  STA SpriteMap+3, x
  LDX oam_SMap_loc+3, y
  STA SpriteMap+3, x

.collision_check:
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

.destroy_ring:
  JSR destroy_ring

.increase_offset:
  LDA obj_run_offset
  CLC                 ;need to increase this so OAM will load in correct pos
  ADC #$10            ;for next object in $0700 memory
  STA obj_run_offset

.rts:
  JMP OBJ_run_loop_return


;;;;;;;;;;;;;;;;;;;
destroy_ring:
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

  JSR clear_oam_chunk   ;since ring uses additional sprites, must
  STA oam_SMap_loc+1, y ;clear out the extra locations
  STA oam_SMap_loc+2, y
  STA oam_SMap_loc+3, y
  STA ring_anim, y
  STA ring_counter, y

  LDA OAM_Free
  CLC
  ADC #$10
  STA OAM_Free

  RTS


;;;;;;;;;;;;;;;;;;
ring_frames:
  .db $9E,$9F,$A5,$A6, $A7,$A8,$A9,$AA, $AB,$AC,$AD,$AE