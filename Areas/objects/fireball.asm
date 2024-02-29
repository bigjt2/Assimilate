;;;;;;;;;;;;;;;;;;;;;;;;
init_fireball:
  LDA EMP_trigger    ;skip spawn if EMP trigger's set
  BNE .store_offset

  LDA #$0C
  STA OAM_SpcNeed
  JSR OAM_memtest
  BCS .store_offset

  LDA #$01
  STA SPR_SpcNeed
  JSR SPR_memtest
  BCS .store_offset  ;if test fails, skip to storing offset

.test_success:
  JSR mem_tests_successful

  JSR SMap_setup
  LDX obj_run_offset

.init_fireball:
  JSR general_obj_setup

  LDA #$00
  STA fireb_anim, x

.store_offset:
  JSR inc_init_offset

.rts:
  JMP OBJ_init_loop_return


;;;;;;;;;;;;;;;;
run_fireball:
  LDY obj_run_offset    ;offset should reflect where pointer is on $0700 OAM table

  LDA oam_type, y
  AND #$40         ;check for destroy flag in bit 6
  BEQ .horiz_screen_test
  JMP .destroy_fireball

.horiz_screen_test:
  JSR offscreen_destroy_test   ;kill object if too far left or right
  BCC .y_screen_test
  JMP .destroy_fireball

.y_screen_test:
  LDA oam_type, y      ;I need the falling fireballs to start above status bar
  CMP #fall_fb         ;so skip the next test so they don't auto-destroy for being above #$30
  BEQ .y_next

  LDA oam_yMapLO, y
  CMP #$30
  BCS .y_next
  JMP .destroy_fireball
.y_next:
  LDA oam_yMapLO, y
  CMP #$E0
  BCC .tile_palette
  JMP .destroy_fireball

.tile_palette:
  LDX oam_SMap_loc, y   ;pull sprite map location, put in x reg  

  LDA #$0F              ;TILE
  STA SpriteMap+1, x

.animation:
  LDA fireb_anim, y
  EOR #$01
  STA fireb_anim, y
  BEQ .even_frame
.odd_frame:
  LDA #$41              ;ATTR - palette 01, flipped horiz
  STA SpriteMap+2, x
  JMP .movement
.even_frame
  LDA #$02
  STA SpriteMap+2, x    ;ATTR - palette 02, no flip

.movement:
  JSR obj_movement

.visibility:
  LDA oam_xMapLO, y    ;fireballs are only one sprite, so
  STA sprite_x_offset  ;this is all that needs done pre-visibility check.

  JSR visibility_check
  BCS .onscreen

.offscreen:
  LDY obj_run_offset
  LDX oam_SMap_loc, y

  LDA #$FA
  STA SpriteMap, x

  JMP .increase_offset

.onscreen:
  LDY obj_run_offset
  LDX oam_SMap_loc, y
  LDA oam_yMapLO, y
  STA SpriteMap, x

  SEC
  LDA oam_xMapLO, y
  SBC camera_Left_x
  STA SpriteMap+3, x
;  SEC ;carry will probably be set from above, but I added this just to be sure

.collision:
  LDX oam_SMap_loc, y
  LDA SpriteMap, x     ;test whether first sprite is on-screen.
  CMP #$FA             ;if not, then entire object assumed to be off-screen, so skip collision test
  BEQ .increase_offset

  LDA #$06
  STA obj_height
  STA obj_width
  LDA #$01
  STA temp1    ;temp1 is the amount to offset x to the right
  LDA #$01
  STA temp2    ;temp2 is the amount to offset y downward

  JSR obj_coords_to_bbox   ;will take x & y coord and create a bbox
  JSR collision_against_ship  ;will take bbox and test collision agains Ossan, set player_dead var if collision
  BCC .increase_offset

.death:
  JSR ship_dies
  JMP .increase_offset

.destroy_fireball:
  JSR destroy_fireball

.increase_offset:
  LDA obj_run_offset
  CLC                 ;need to increase this so OAM will load in correct pos
  ADC #$0C            ;for next object in $0700 memory
  STA obj_run_offset

.rts:
  JMP OBJ_run_loop_return


;;;;;;;;;;;;;;;;;;;
destroy_fireball:
  LDY obj_run_offset

  LDX oam_SMap_loc, y
  JSR clear_sprite_tile

  INC SPR_Free         ;since only one tile is needed, I just incremented

  JSR clear_oam_chunk
  LDA #$FE
  STA fireb_anim, y

  LDA OAM_Free
  CLC
  ADC #$0C
  STA OAM_Free

  RTS


;;;;;;;;;;;;;;;;;;;;;;;;
init_weapon_fireball:      ;this is the init for a fireball shot out of an enemy
  LDA EMP_trigger    ;skip spawn if EMP trigger's set
  BNE .store_offset

  STY temp_x             ;I need the mig's y offset to load the starting coords below
  LDA #$0C               ;I was using temp_y for that purpose but that gets destroyed in SMap_setup
  STA OAM_SpcNeed
  JSR OAM_memtest
  BCS .store_offset      ;if test fails, restore offset so it's correct for the spawning object's code

  LDA #$01
  STA SPR_SpcNeed
  JSR SPR_memtest
  BCS .store_offset      ;same as above, skip to store_offset

.test_success:
  JSR mem_tests_successful

  JSR SMap_setup

  LDX obj_run_offset

.init_fireball:
  JSR weapon_setup

  LDA #fireball
  STA oam_type, x
  LDA #$00
  STA fireb_anim, x

.store_offset:
;  JSR inc_init_offset   ;;don't increment the init_offset here they way you do in a typical init. remember, init reads out of
                         ;;rom. since there is effectively nothing in rom fro these fireballs, you'll really screw up the pointer
  LDA temp_x             ;;HOWEVER, you DO need to pull the backup y offset just in case either the oam or sprite memory tests failed.
  STA obj_run_offset     ;;if you don't, it could be set to the spawned objects y offset still, and that will probably make the game crash once it returns to the spawning object's code.
.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;;;;
init_falling_fireball:   ;this is the init for a fireball that falls from the sky in a random position
  LDA EMP_trigger        ;skip spawn if EMP trigger's set
  BEQ .begin
  JMP .store_offset

.begin:
  STX temp_x             ;back up current obj_offset in case mem tests fail
.oam_test:
  LDA #$0B               ;I was using temp_y for that purpose but that gets destroyed in SMap_setup
  STA OAM_SpcNeed
  JSR OAM_memtest
  BCC .sprite_test
  JMP .store_offset      ;if test fails, restore offset so it's correct for the spawning object's code

.sprite_test:
  LDA #$01
  STA SPR_SpcNeed
  JSR SPR_memtest
  BCC .test_success
  JMP .store_offset      ;same as above, skip to store_offset

.test_success:
  JSR mem_tests_successful

  JSR SMap_setup
  LDX obj_run_offset

.init_fireball:
  LDA #fall_fb           ;type, see y starting pos notes below
  STA oam_type, x

  LDA #mv_angle          ;movement type, always angle, don't get fancy
  STA oam_MoveType, x

  LDA #$20               ;starting y at top of screen, I created a different type constant for these so that it can still
  STA oam_yMapLO, x      ;use the rest of the fireball code, but doesn't auto-destroy for being above #$30

  LDA #$01
  STA oam_xDelta, x
                         ;movement, just keep it constant.  using random numbers
  LDA #$02               ;gave me a bunch of wacky, stupid-looking angles
  STA oam_yDeltaHI, x

  LDA #$00
  STA fireb_anim, x
  STA oam_yDeltaLO, x    ;these two aren't really used, since it will always be mv_angle
  STA oam_yDeltaSPD, x

.pull_random:
  INC r_marker
  JSR r_marker_test
  LDY r_marker
  LDA r_results, y
  LSR A                  ;the first random number will be used below to add or
  LSR A                  ;subract from Ossan's x position, hence becomming the
  STA temp1              ;fireball's starting position

.get_start_half:
  INC r_marker
  JSR r_marker_test
  LDY r_marker           ;the second random number is basically used to decide
  LDA r_results, y       ;if the fireball will be on Ossan's right or left
  BMI .right_half

.left_half:
  LDA ship_map_x
  SEC
  SBC temp1
  STA oam_xMapLO, x
  LDA ship_screen_x
  SBC #$00
  STA oam_xMapHI, x
  LDA #right
  STA oam_dir, x
  JMP .store_offset

.right_half:
  LDA ship_map_x
  CLC
  ADC temp1
  STA oam_xMapLO, x
  LDA ship_screen_x
  ADC #$00
  STA oam_xMapHI, x
  LDA #left
  STA oam_dir, x

.store_offset:
;  JSR inc_init_offset   ;;don't increment the init_offset here they way you do in a typical init. remember, init reads out of
                         ;;rom. since there is effectively nothing in rom for these fireballs, you'll really screw up the pointer
  LDA temp_x             ;;HOWEVER, you DO need to pull the backup y offset just in case either the oam or sprite memory tests failed.
  STA obj_run_offset     ;;if you don't, it could be set to the spawned objects y offset still, and that will probably make the game crash once it returns to the spawning object's code.
.rts:
  RTS


