;;;;;;;;;;;;;;;;;;;;;;;;
init_weapon_victim:      ;this is the init for a victim shot out of an enemy
  LDA EMP_trigger        ;skip spawn if EMP trigger's set
  BNE .store_offset

  LDA boss_num           ;it's a much simpler object for the final boss
  CMP #boss4
  BNE .normal
  JMP final_battle_victim_init

.normal:
  STY temp_x             ;I need the mig's y offset to load the starting coords below
  LDA #$0D               ;I was using temp_y for that purpose but that gets destroyed in SMap_setup
  STA OAM_SpcNeed
  JSR OAM_memtest
  BCS .store_offset      ;if test fails, restore offset so it's correct for the spawning object's code

  LDA #$02
  STA SPR_SpcNeed
  JSR SPR_memtest
  BCS .store_offset      ;same as above, skip to store_offset

.test_success:
  JSR mem_tests_successful

  JSR SMap_setup
  LDX obj_run_offset

.init_w_victim:
  LDA #$10
  STA weapon_xoffset
  LDA #$08
  STA weapon_yoffset
  JSR weapon_setup

  LDA kogy_vicnum, y
  STA wvictim_num, x
  LDA #w_victim
  STA oam_type, x
  LDA #$00
  STA wvictim_anim, x
;  LDA oam_yMapLO, x
;  CLC                    ;because of kogyaru's position near the top, need to add some pixels to the
;  ADC #$0C               ;y coord. otherwise the victim will destroy.
;  sta oam_yMapLO, x

.store_offset:
;  JSR inc_init_offset   ;;don't increment the init_offset here they way you do in a typical init. remember, init reads out of
                         ;;rom. since there is effectively nothing in rom fro these victims, you'll really screw up the pointer
  LDA temp_x             ;;HOWEVER, you DO need to pull the backup y offset just in case either the oam or sprite memory tests failed.
  STA obj_run_offset     ;;if you don't, it could be set to the spawned objects y offset still, and that will probably make the game crash once it returns to the spawning object's code.
.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;
run_weapon_victim:
  LDY obj_run_offset    ;offset should reflect where pointer is on $0700 OAM table

  LDA oam_type, y
  AND #$40         ;check for destroy flag in bit 6
  BEQ .horiz_screen_test
  JMP .destroy_victim

.horiz_screen_test:
  JSR offscreen_destroy_test   ;kill object if too far left or right
  BCC .y_screen_test
  JMP .destroy_victim

.y_screen_test:
  LDA oam_yMapLO, y
  CMP #$30
  BCS .y_next
  JMP .destroy_victim
.y_next:
  LDA oam_yMapLO, y
  CMP #$E0
  BCC .animation
  JMP .destroy_victim

.animation:
  JSR weapon_victim_animation

.movement:
  JSR obj_movement

.visibility:
  LDA oam_xMapLO, y       ;victims are only two sprites with one set of x coords, so
  STA sprite_x_offset     ;this is all that needs done pre-visibility check.

  JSR visibility_check
  BCS .onscreen

.offscreen:               ;offscreen and onscreen are borrowed from sputnik
  LDA #$FA                ;Y COORDS
  LDX oam_SMap_loc, y
  STA SpriteMap, x
  LDX oam_SMap_loc+1, y   ;victim is only one column of two sprites,
  STA SpriteMap, x        ;not several columns of two sprites
  JMP .collision

.onscreen:
  LDX oam_SMap_loc, y
  LDA oam_yMapLO, y       ;Y COORDS
  STA SpriteMap, x
  CLC                     ;seriously, this is still really fucking ugly.
  ADC #$08
  LDX oam_SMap_loc+1, y
  STA SpriteMap, x

  LDA sprite_x_offset     ;X COORDS
  SEC              
  SBC camera_Left_x
  LDX oam_SMap_loc, y     ;temp_y is still in y reg, so no need to do all that fancy
  STA SpriteMap+3, x      ;switch-er-roo like in the y coords.
  LDX oam_SMap_loc+1, y
  STA SpriteMap+3, x

.collision:
  LDY obj_run_offset
  LDX oam_SMap_loc, y
  LDA SpriteMap, x        ;test whether first sprite is on-screen.
  CMP #$FA                ;if not, then entire object assumed to be off-screen, so skip collision test
  BEQ .increase_offset

  LDA #$06
  STA obj_width
  LDA #$0E
  STA obj_height
  LDA #$01
  STA temp1    ;temp1 is the amount to offset x to the right
  LDA #$01
  STA temp2    ;temp2 is the amount to offset y downward

  JSR obj_coords_to_bbox   ;will take x & y coord and create a bbox
  JSR collision_against_ship  ;will take bbox and test collision agains Ossan, set player_dead var if collision
  BCC .increase_offset

.death:
  JSR ship_dies

.destroy_victim:
  JSR destroy_victim

.increase_offset:
  LDA obj_run_offset
  CLC                 ;need to increase this so OAM will load in correct pos
  ADC #$0E            ;for next object in $0700 memory
  STA obj_run_offset

.rts:
  JMP OBJ_run_loop_return


;;;;;;;;;;;;;;;;;;;
destroy_victim:
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
  CMP #$02              ;CHANGE number depending on object's length
  BCC .clear_sprites_loop

  LDA SPR_Free
  CLC
  ADC #$02
  STA SPR_Free

  LDY obj_run_offset
  JSR clear_oam_chunk   ;since mig uses additional sprites, must
  STA oam_SMap_loc+1, y ;clear out the extra locations
  STA wvictim_num, y
  STA wvictim_anim, y

  LDA OAM_Free
  CLC
  ADC #$0E
  STA OAM_Free

  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;
weapon_victim_animation:

  LDX obj_run_offset   ;fucking addressing mode problems
  INC wvictim_anim, x

  LDX wvictim_num, y
  LDA zombie_pal_bank, x
  STA temp1

  LDA wvictim_num, y
  ASL A
  TAY
  LDA zomb_tile_index, y
  STA ptr1
  LDA zomb_tile_index+1, y
  STA ptr1+1

.anim_timing:
  LDY obj_run_offset
  LDA wvictim_anim, y
  CMP #$01
  BEQ .first_frame
  CMP #$0F
  BEQ .second_frame
  CMP #$1E
  BCS .reset
  JMP .rts
.first_frame:
  LDY #$00
  JMP .store
.second_frame:
  LDY #$02
  JMP .store
.reset:
  LDA #$00
  STA wvictim_anim, y
  JMP .rts

.store:
  LDA [ptr1], y
  PHA           ;top tile
  INY
  LDA [ptr1], y
  PHA           ;bottom tile

  LDY obj_run_offset
  LDX oam_SMap_loc+1, y    ;pulls the bottom tile off stack first, so use the second sprite map position
  PLA
  STA SpriteMap+1, x
  PLA                      ;REMEMBER TO LOAD THE NEW SPRITE MAP POSITION FOR GOD'S SAKE!!!  DON'T JUST ADD TO THE OLD SPRITE MAP INDEX!!!!
  LDX oam_SMap_loc, y      ;now pull the first sprite map position, since the top tile is now pulled off the stack
  STA SpriteMap+1, x

  LDA temp1        
  STA SpriteMap+2, x       ;keep the first sprite map position in x reg
  LDX oam_SMap_loc+1, y    ;now restore the second sMap position for the bottom tile's palette
  STA SpriteMap+2, x

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;;;;
final_battle_victim_init:
  LDA EMP_trigger    ;skip spawn if EMP trigger's set
  BNE .store_offset

  LDA #$0D
  STA OAM_SpcNeed
  JSR OAM_memtest
  BCS .store_offset

  LDA #$02
  STA SPR_SpcNeed
  JSR SPR_memtest
  BCS .store_offset  ;if test fails, skip to storing offset

.test_success:
  JSR mem_tests_successful

  JSR SMap_setup
  LDX obj_run_offset

.init_fbattle_victim:
  JSR general_obj_setup

  LDA #$00
  STA wvictim_anim, x

.victim_rotate:
  INC fb_kogy_vicnum
  LDA fb_kogy_vicnum
  CMP victim_max
  BCC .store
  LDA #$00
  STA fb_kogy_vicnum
.store:
  STA wvictim_num, x


.store_offset:
  JSR inc_init_offset

.rts:                ;unlike the regular weapon victim, this didn't spawn from another object, so we need to return to the object init loop.
  JMP OBJ_init_loop_return