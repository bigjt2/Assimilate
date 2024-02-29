;;;;;;;;;;;;;;;;;;;;
general_obj_setup:

.store_type:
  LDY obj_init_offset  ;it should be set to #fireball
  LDA [obj_ptr], y
  STA oam_type, x

.movement_type:
  INY             ;obj_init_offset incrementing in y reg
  LDA [obj_ptr], y
  STA oam_MoveType, x
  CMP #$80
  BCC .test_horiz
  JSR init_trajectory
  BCC .direction
  JMP .rts

.test_horiz:
  CMP #mv_horiz
  BNE .direction
  JSR horiz_setup
  BCC .x_coords   ;if there was no need to destroy, move on.
                  ;direction is stored in horiz_setup
.direction:
  INY
  LDA [obj_ptr], y
  STA oam_dir, x

.x_coords:
  INY
  LDA [obj_ptr], y
  CMP #st_ship_x
  BNE .test_boss
  JSR obj_start_sx
  JMP .rts
.test_boss:
  CMP #st_boss_coords
  BNE .x_norm
  JSR obj_start_boss_coords
  JMP .x_delta
.x_norm:
  JSR obj_setup_x_coord

.y_coord:
  INY
  LDA [obj_ptr], y
  CMP #st_ship_y
  BNE .y_next
  JSR obj_start_sy
  JMP .rts
.y_next:
  STA oam_yMapLO, x

.x_delta:
  INY
  LDA [obj_ptr], y
  CMP #rand
  BNE .store_x_delta
  LDA #rand_xd     ;always store the random type in temp1 before
  STA temp1       ;jumping to a random sub.
  JSR object_random_gen
.store_x_delta
  STA oam_xDelta, x

;.object_destroys:
;  LDA oam_MoveType, x  ;if movement type is horizontal...
;  CMP #mv_horiz
;  BEQ .obj_destroys_next
;  LDA oam_MoveType, x  ;or a trajectory...
;  BPL .y_delta
;.obj_destroys_next:
;  INY                  ;skip past y_deltas so it doesn't overwrite the object destroys.
;  LDA [obj_ptr], y
;  STA hobj_destroy, x
;  INY
;  LDA [obj_ptr], y
;  STA hobj_destroy+1, x
;  JMP .rts

.y_delta:
  INY
  LDA [obj_ptr], y
  CMP #rand
  BNE .store_y_delta
  LDA #rand_yd
  STA temp1
  JSR object_random_gen
.store_y_delta:
  STA oam_yDeltaHI, x
  LDA #$00
  STA oam_yDeltaLO, x

.y_delta_speed:
  INY
  LDA [obj_ptr], y
  CMP #rand
  BNE .store_yd_speed
  LDA #rand_ydspd
  STA temp1
  JSR object_random_gen
.store_yd_speed:
  STA oam_yDeltaSPD, x

.rts:
  RTS


;;;;;;;;;;;;;;
inc_init_offset:
  LDA obj_init_offset
  CLC
  ADC #$09
  STA obj_init_offset

  RTS


;;;;;;;;;;;;;;
horiz_setup:
  INY          ;pull direction and store it
  LDA [obj_ptr], y
  STA oam_dir, x

  LDA boss_active   ;boss battle will be first and final background
  BNE .clear        ;so you must skip these tests

  LDA oam_dir, x
  CMP #right
  BEQ .compare_right

.compare_left:
  LDA ship_screen_x
  CMP finl_Background  ;if on last screen when object is moving
  BNE .clear           ;left, destroy object
  JMP .destroy

.compare_right:
  LDA ship_screen_x
  CMP frst_Background  ;if on first screen when object is moving
  BNE .clear      ;right, destroy object

.destroy:
  LDA oam_type, x
  ORA #$40            ;set the destroy flag
  STA oam_type, x
  SEC
  JMP .rts
.clear:
  CLC
.rts:
  RTS


;;;;;;;;;;;;;;;;;;
init_trajectory:
;  LDA oam_MoveType, x
;  AND #$7F       ;mask out the trajectory flag bit
;  STA traj_type

  LDA boss_active
  BNE .proceed   ;ignore the first/last screen test since boss battle is only one screen

  LDA ship_screen_x    ;I don't have trajectories set up to display which direction
  CMP finl_Background  ;the object is moving, so I simply test first and last
  BNE .traj_next0      ;screen
  JMP .destroy
.traj_next0:
  LDA ship_screen_x
  CMP frst_Background
  BNE .proceed

.destroy:
  LDA oam_type, x
  ORA #$40            ;set the destroy flag, bit 6 for trajectories
  STA oam_type, x
  SEC

  JMP .rts

.proceed:
  CLC  ;set clear so the main init doesn't destroy object

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;;
obj_setup_x_coord:
  CMP #LftCam
  BEQ .left_camera

.right_camera:
  LDA camera_Right_ScreenNum
  STA oam_xMapHI, x
  INY
  LDA [obj_ptr], y
  BMI .right_sbtr
.right_add:
  CLC
  LDA camera_Right_x
  ADC [obj_ptr], y
  STA oam_xMapLO, x
  LDA oam_xMapHI, x
  ADC #$00
  STA oam_xMapHI, x
  JMP .x_done
.right_sbtr
  LDA [obj_ptr], y
  EOR #$FF
  CLC          ;See below.
  ADC #$01
  STA temp1
  SEC
  LDA camera_Right_x
  SBC temp1
  STA oam_xMapLO, x
  LDA oam_xMapHI, x
  SBC #$00
  STA oam_xMapHI, x
  JMP .x_done

.left_camera:
  LDA camera_Left_ScreenNum
  STA oam_xMapHI, x
  INY
  LDA [obj_ptr], y
  BMI .left_sbtr
.left_add:
  CLC
  LDA camera_Left_x
  ADC [obj_ptr], y
  STA oam_xMapLO, x
  LDA oam_xMapHI, x
  ADC #$00
  STA oam_xMapHI, x
  JMP .x_done
.left_sbtr:
  LDA [obj_ptr], y
  EOR #$FF     ;I have to subtract, not add, or screen num in xMapHi won't come
  CLC          ;out right.  So it's neccessary to do two's comp here and store
  ADC #$01     ;in temp1 variable, then use that variable for subtraction.
  STA temp1
  SEC
  LDA camera_Left_x
  SBC temp1
  STA oam_xMapLO, x
  LDA oam_xMapHI, x
  SBC #$00
  STA oam_xMapHI, x
.x_done:
  RTS


;;;;;;;;;;;;;;
obj_start_sx:
  LDA ship_map_x
  STA oam_xMapLO, x
  LDA ship_screen_x
  STA oam_xMapHI, x
  INY  ;skip direction
  INY  ;skip camera

.y_coord:
  LDA [obj_ptr], y
  STA oam_yMapLO, x
  INY  ;skip x delta
  INY

.y_delta:
  LDA [obj_ptr], y
  CMP #rand
  BNE .store_y_delta
  LDA #rand_yd
  STA temp1
  JSR object_random_gen
.store_y_delta:
  STA oam_yDeltaHI, x
  LDA #$00
  STA oam_yDeltaLO, x
  STA oam_yDeltaSPD, x  ;no longer need to do this, but oh well.

  RTS


;;;;;;;;;;;;;;;
obj_start_sy:

  LDA ship_y
  STA oam_yMapLO, x

.x_delta:
  INY
  LDA [obj_ptr], y
  CMP #rand
  BNE .store_x_delta
  LDA #rand_xd     ;always store the random type in temp1 before
  STA temp1       ;jumping to a random sub.
  JSR object_random_gen
.store_x_delta
  STA oam_xDelta, x

.object_destroys:
  INY
;  LDA [obj_ptr], y
;  STA hobj_destroy, x
  INY
;  LDA [obj_ptr], y
;  sta hobj_destroy+1, x

  RTS


;;;;;;;;;;;;;;;;;;;;;;;
obj_start_boss_coords:
  LDA boss_num
  CMP #boss4
  BEQ .kogy_objstart_test
  JMP .continue

.kogy_objstart_test:
  TYA    ;backup offset in original y
  PHA
  INY
  LDA [obj_ptr], y   ;pull the boss coord set to use
  TAY
  LDA boss_SCRcoords, y
  CMP ship_screen_x
  BNE .destroy

.kogy_bosscoords:
  PLA
  TAY    ;pull orginal y and increment it to get the boss coord again
  INY
  TYA
  PHA    ;push back to compensate for pulling at the end of .y_coord label
  LDA [obj_ptr], y   ;pull the boss coord set to use
  ASL A
  TAY
  LDA boss_coords, y
  STA oam_xMapLO, x  ;no need to subtract xScroll in final bossfight
  LDA ship_screen_x  ;because that happens during the movement sub
  STA oam_xMapHI, x
  JMP .y_coord

.destroy:
  LDY obj_init_offset
  LDA [obj_ptr], y
  ORA #$40
  STA oam_type, x
  PLA     ;restore offset to y
  TAY
  INY     ;skip starting y
  INY
  JMP .rts

.continue:
  INY
  TYA     ;backup offset in original y
  PHA
  LDA [obj_ptr], y   ;pull the boss coord set to use
  ASL A
  TAY
  LDA boss_coords, y
  SEC
  SBC xScroll
  STA oam_xMapLO, x
  LDA ship_screen_x
  STA oam_xMapHI, x

.y_coord:
  INY
  LDA boss_coords, y
  STA oam_yMapLO, x
  PLA     ;restore offset to y
  TAY
  INY     ;skip starting y

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;;;;
init_objects:
  LDA level        ;run this on every level init
  TAY
  LDA level_object_speeds, y
  STA obj_speed
  LDA level
  ASL A
  TAY
  LDA level_object_index, y
  STA obj_ptr
  LDA level_object_index+1, y
  STA obj_ptr+1

  LDA #$00
  STA obj_init_offset
  STA obj_run_offset
  STA obj_counter

  JSR obj_clear_oam
  JSR obj_clear_sprites

  RTS


;;;;;;;;;;;;;;;;
obj_clear_oam:
  LDY #$00
  LDA #$FE
.oam_clear_loop:
  STA OAM, y     ;clear out OAM in $0800 page
  INY
  CPY #$00
  BNE .oam_clear_loop
  LDA #$FF
  STA OAM_Free   ;and signif available space

  RTS


;;;;;;;;;;;;;;;;;;;;
obj_clear_sprites:
  LDA #$FE
.spr_clear_loop:
  STA SpriteMap, y  
  INY            ;clear out sprite map in $0700 page
  CPY #$B8
  BCC .spr_clear_loop
  LDA #$26       ;and signify available space, this signifires 38 sprite spots are available
  STA SPR_Free   ;it leaves out the eight that will constantly be used by Ossan's graphics

  RTS


;;;;;;;;;;;;;;;;;;;;;;;;
init_EOD:
  LDA #$00         ;end oflevel map has been reached, return to beginning.
  STA obj_init_offset

  JMP OBJ_init_loop_return