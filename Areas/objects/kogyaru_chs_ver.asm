;;;;;;;;;;;;;;;;;;;;;;;;
init_c_kogyaru:
  LDA dragon_present   ;skip spawn if kogyaru is already on screen
  BNE .store_offset

  LDA #$16
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

.init_kogyaru:
  JSR general_obj_setup

  LDA #$00
  STA kogy_vicnum, x
  STA c_kogy_timer, x
  STA c_kogy_timer+1, x
  LDA #$0F
  STA c_kogy_anim, x
  LDA #$01             ;from the dragon to
  STA dragon_present   ;not waste space

.store_offset:
  JSR inc_init_offset

.rts:
  JMP OBJ_init_loop_return


;;;;;;;;;;;;;;;;
run_c_kogyaru:
  LDY obj_run_offset    ;offset should reflect where pointer is on $0700 OAM table

  LDA oam_type, y
  AND #$40         ;check for destroy flag in bit 6
  BEQ .moving
  JMP .destroy_kogyaru

.moving:
  JSR obj_movement

.shooting:
  LDA c_kogy_timer+1, y
  CLC
  ADC #$10
  STA c_kogy_timer+1, y
  LDA c_kogy_timer, y
  ADC #$00
  STA c_kogy_timer, y

.shoot_next0:
  LDX obj_run_offset
  LDY c_kogy_timer, x
  LDA chase_shoot_shedule, y
  CMP #chase_shoot  
  BNE .shoot_next1
.fire:
  INC c_kogy_timer, x       ;inc timer so it doesn't fire THOUSANDS of victims
  INC kogy_vicnum, x        ;move to next victim
  LDA kogy_vicnum, x
  CMP victim_max
  BCC .fire_next
  LDA #$00                  ;reset victim if neccessary
  STA kogy_vicnum, x
.fire_next:
  LDY obj_run_offset        ;need to restore this now or it will be set to kogy_timer when you enter the weapon_victim sub
  JSR koyaru_shooting
  JMP .animation
.shoot_next1:
  CMP #chase_sh_reset
  BNE .animation
.reset:
  LDA #$00
  LDY obj_run_offset
  STA c_kogy_timer, y

.animation:
  LDY obj_run_offset
  LDA #$00
  STA loop_counter

  LDX obj_run_offset
  INC c_kogy_anim, x         ;fucking INC can't work with y reg!!!
  LDA c_kogy_anim, x
  CMP #$08                   ;i don't want it wasting CPU cycles by loading all
  BEQ .second_frame          ;tiles every frame, so we only should branch on
  CMP #$10                   ;exact values.
  BEQ .first_frame
  JMP .coordinates

.first_frame:
  LDA #$00
  STA c_kogy_anim, y
  TAX
  JMP .load_anim_tile_attr
.second_frame:
  LDX #$08

.load_anim_tile_attr:        ;position on the animation tables below.
  LDA oam_SMap_loc, y
  TAY
.tile_loop:
  LDA kogyaru_anim_tiles, x
  STA SpriteMap+1, y
  LDA #$01
  STA SpriteMap+2, y
  INY
  INY
  INY
  INY
  INX
  INC loop_counter
  LDA loop_counter
  CMP #$08
  BCC .tile_loop

.coordinates:
  LDY obj_run_offset
  LDA #$00
  STA loop_counter

  LDA oam_xMapLO, y
  STA sprite_x_offset
  STY temp_y

.coord_loop:
  LDY temp_y
  LDX oam_SMap_loc, y

  LDY obj_run_offset
  LDA oam_yMapLO, y      ;Y COORDS
  STA SpriteMap, x
  CLC
  ADC #$08
  STA SpriteMap+16, x

  LDA sprite_x_offset    ;X COORDS
  STA SpriteMap+3, x
  STA SpriteMap+19, x

  INC temp_y
  INC loop_counter
  LDA loop_counter
  CMP #$04
  BCS .collision_testing

  LDA sprite_x_offset
  CLC
  ADC #$08
  STA sprite_x_offset

  LDY obj_run_offset
  JMP .coord_loop


.collision_testing:
  LDY obj_run_offset
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

.CAUGHT_ER:
  LDA #silence_song    ;silence channels before loading new song mid-stage
  STA current_song
  JSR sound_load
  LDA #sfx_efanfare
  STA current_song
  JSR sound_load

  JSR victim_dissappear
  JSR set_victim_sprites_params

  LDA #$00               ;get ready to switch game state to level complete screen
  STA event_counter
  LDA #STATE_LVL_CLR
  STA gamestate
  JMP .rts

.death:
;  JSR ship_dies

.destroy_kogyaru:
;  JSR destroy_kogyaru

.increase_offset:
  LDA obj_run_offset
  CLC                 ;need to increase this so OAM will load in correct pos
  ADC #$16            ;for next object in $0700 memory
  STA obj_run_offset

.rts:
  JMP OBJ_run_loop_return


;;;;;;;;;;;;;;;;;;;
destroy_c_kogyaru:
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
  CMP #$08              ;CHANGE number depending on object's length
  BCC .clear_sprites_loop

  LDA SPR_Free
  CLC
  ADC #$08
  STA SPR_Free

  LDY obj_run_offset
  JSR clear_oam_chunk   ;since kogyaru uses additional sprites, must
  STA oam_SMap_loc+1, y ;clear out the extra locations
  STA oam_SMap_loc+2, y
  STA oam_SMap_loc+3, y
  STA oam_SMap_loc+4, y
  STA oam_SMap_loc+5, y
  STA oam_SMap_loc+6, y
  STA oam_SMap_loc+7, y
  STA kogy_vicnum, y

  LDA OAM_Free
  CLC
  ADC #$16
  STA OAM_Free

  LDA #$00
  STA dragon_present    ;clear kogyaru_present so another kogyaru can spawn. 

  RTS


;;;;;;;;;;;;;;;;;;;;;;
chase_shoot_shedule:
  .db $00,$00,$00,chase_shoot
  .db $00,$00,$00,chase_sh_reset

chase_shoot     = $01
chase_sh_reset  = $02