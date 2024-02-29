;;;;;;;;;;;;;;;;;;;;;;;;
init_van:
  LDA #$12
  STA OAM_SpcNeed
  JSR OAM_memtest
  BCS .store_offset

  LDA #$08
  STA SPR_SpcNeed
  JSR SPR_memtest
  BCS .store_offset

.test_success:
  JSR mem_tests_successful

  JSR SMap_setup
  LDX obj_run_offset

  LDA #$00
  STA van_anim, x

.init_van:
  JSR general_obj_setup

.store_offset:
  JSR inc_init_offset

.rts:
  JMP OBJ_init_loop_return


;;;;;;;;;;;;;;;;
run_van:
  LDY obj_run_offset    ;offset should reflect where pointer is on $0700 OAM table

  LDA oam_type, y
  AND #$40         ;check for destroy flag in bit 6
  BEQ .movement
  JSR destroy_van
  JMP .increase_offset

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

.van_visibility:
  JSR visibility_check
  BCS .onscreen
  
.offscreen:
  LDY temp_y
  LDA #$FA             ;Y COORDS
  LDX oam_SMap_loc, y
  STA SpriteMap, x
  STA SpriteMap+16, x
  JMP .visibility_loop_test

.onscreen:
  LDY temp_y
  LDX oam_SMap_loc, y

  LDY obj_run_offset    ;Y COORDS
  LDA oam_yMapLO, y
  STA SpriteMap, x
  CLC
  ADC #$08
  STA SpriteMap+16, x

  LDA sprite_x_offset    ;X COORDS
  SEC
  SBC camera_Left_x
  STA SpriteMap+3, x
  STA SpriteMap+19, x

.visibility_loop_test:

  INC temp_y
  INC loop_counter
  LDA loop_counter
  CMP #$04
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

  JMP .van_visibility

.visibility_end:
  LDY obj_run_offset   ;restore y to the obj_run_offset, otherwise all inderects will be using the temp_y
  PLA   ;here we must restore the original xMapHI in oam, in case it incremented
  STA oam_xMapHI, y

.tiles_pal:
  LDA van_anim, y
  CLC
  ADC #$01
  STA van_anim, y

  LDA van_anim, y
  CMP #$1E
  BCS .next0
  JMP .first_frame
.next0:
  CMP #$3C
  BCS .next1
  JMP .second_frame
.next1:
  LDA #$00
  STA van_anim, y

.first_frame:
  LDA #$00
  STA temp1
  JMP .animation

.second_frame:
  LDA #$08
  STA temp1
  JMP .animation

.animation:
  LDA oam_SMap_loc, y   ;pull sprite map location, put in x reg
  JSR van_anim_load
  LDA oam_SMap_loc+1, y   ;pull sprite map location, put in x reg
  JSR van_anim_load
  LDA oam_SMap_loc+2, y   ;pull sprite map location, put in x reg
  JSR van_anim_load
  LDA oam_SMap_loc+3, y   ;pull sprite map location, put in x reg
  JSR van_anim_load
  LDA oam_SMap_loc+4, y   ;pull sprite map location, put in x reg
  JSR van_anim_load
  LDA oam_SMap_loc+5, y   ;pull sprite map location, put in x reg
  JSR van_anim_load
  LDA oam_SMap_loc+6, y   ;pull sprite map location, put in x reg
  JSR van_anim_load
  LDA oam_SMap_loc+7, y   ;pull sprite map location, put in x reg
  JSR van_anim_load

.increase_offset:
  LDA obj_run_offset
  CLC                 ;need to increase this so OAM will load in correct pos
  ADC #$12            ;for next object in $0700 memory
  STA obj_run_offset

.rts:
  JMP OBJ_run_loop_return


;;;;;;;;;;;;;;;;;;;
destroy_van:
  LDY obj_run_offset

  LDX oam_SMap_loc, y
  JSR clear_sprite_tile
  LDX oam_SMap_loc+1, y
  JSR clear_sprite_tile
  LDX oam_SMap_loc+2, y
  JSR clear_sprite_tile
  LDX oam_SMap_loc+3, y
  JSR clear_sprite_tile
  LDX oam_SMap_loc+4, y
  JSR clear_sprite_tile
  LDX oam_SMap_loc+5, y
  JSR clear_sprite_tile
  LDX oam_SMap_loc+6, y
  JSR clear_sprite_tile
  LDX oam_SMap_loc+7, y
  JSR clear_sprite_tile

  LDA SPR_Free
  CLC
  ADC #$08
  STA SPR_Free

  JSR clear_oam_chunk   ;since dragon uses additional sprites, must
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
van_anim_load:
  TAX
  TYA   ;push object offset to stack
  PHA
  LDY temp1        ;pull animation table location from temp1  
  LDA van_animation_tiles, y   ;TILE
  STA SpriteMap+1, x
  LDA #$02   ;ATTR
  STA SpriteMap+2, x
  INY
  STY temp1
  PLA
  TAY  ;transfer offset back to y so it's ready for next sub
  
  RTS


van_animation_tiles:          
  .db $7B,$7C, $7D,$7E, $7F,$80, $81,$82
  .db $83,$84, $85,$86, $87,$88, $89,$8A