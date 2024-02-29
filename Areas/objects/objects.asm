;;;;;;;;;;;;;;;;;;;;;;;;
Object_Handler:
  CLC
  LDA obj_counter
  ADC obj_speed
  STA obj_counter
  BCS object_inits
  JMP object_runs

object_inits:
  LDA hold_object_init
  BEQ .next
  DEC hold_object_init
  JMP object_runs

.next:
  LDY obj_init_offset
  LDA [obj_ptr], y
  CMP #end
  BEQ no_object_init
  CMP #end_rpt
  BEQ end_RLE
  CMP #next
  BEQ next_object_init
  BPL .enemy_objects_init   ;if under $80, must be an enemy object

.non_enemy_objets_init:
  AND #$7F          ;items, boss sprites, etc.
  ASL A             ;set up address to jump to
  TAY
  LDA NonEn_Init_Jumptable, y
  STA ptr2
  LDA NonEn_Init_Jumptable+1, y
  STA ptr2+1
  JMP [ptr2]

.enemy_objects_init:
  ASL A             ;set up address to jump to
  TAY
  LDA Object_Init_Jumptable, y
  STA ptr2
  LDA Object_Init_Jumptable+1, y
  STA ptr2+1
  JMP [ptr2]

OBJ_init_loop_return:
  JMP object_inits

next_object_init:  ;this will allow another object to init within same frame
  INC obj_init_offset
  JMP object_inits

end_RLE:
  INC obj_init_offset
  INC obj_init_offset
  INY
  LDA [obj_ptr], y
  STA hold_object_init
  JMP object_runs

no_object_init:
  INC obj_init_offset

;;
;;

object_runs:
  LDY #$00
  STY obj_run_offset
OAM_loop:
  LDY obj_run_offset
  LDA OAM, y
  CMP #$FE
  BEQ continue_loop
  CMP #ignore        ;this is done to block out chunks of oam that are used
  BEQ handle_ignore  ;outside of the objects bank, like in boss battles
  BPL .enemy_runs

.non_enemy_runs:
  AND #$3F   ;factor out the non-enemy flag and destroy flag
  ASL A
  TAY
  LDA NonEn_Run_Jumptable, y
  STA ptr2
  LDA NonEn_Run_Jumptable+1, y
  STA ptr2+1
  JMP [ptr2]

.enemy_runs:
  AND #$3F   ;factor out the destroy flag in bit 6
  ASL A    ;turning what's at OAM, y into a pointer
  TAY
  LDA Object_Run_Jumptable, y
  STA ptr2
  LDA Object_Run_Jumptable+1, y
  STA ptr2+1
  JMP [ptr2]

OBJ_run_loop_return:
  JMP OAM_loop

continue_loop:
  INC obj_run_offset
  LDA obj_run_offset
  CMP #$80
  BCC OAM_loop
;  BNE OAM_loop      ;if not zero, haven't tested all mem, continue loop

rts:
  RTS


handle_ignore:
  INY
  LDA OAM, y
  STA temp1     ;transfer number of bytes to skip to temp1 and add
  TYA
  CLC
  ADC temp1
  STA obj_run_offset
  JMP OAM_loop


;;;;;;;;;;;;;;;;;;;;
;;Sprite Map Subs
;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;
SpriteMapTransfer:   ;Sub transfers all data in the $0500 Sprite Map to the $0200
                     ;addresses aligned with the shuffling sprite tiles.
  LDA r_results+7
  CMP #$B8
  BCC .round
  LSR A              ;divide by two if over $98, as that is the number of RAM spots we have 
.round:
  AND #$FC           ;cancel the lowest two bits, keep the rest
  ORA #$03           ;insert ones into both lowest bits
  CLC
  ADC #$01
  TAY
;  LDY SM_pointer
  LDX #$00
  CPY #$B8           ;sometimes SM_pointer will arrive in this sub with value $98.
  BNE .transfer_loop ;must be reset or you'll have an offset between Sprite MAP and $0200 table.
  LDY #$00
.transfer_loop:
  LDA SpriteMap, y
  STA sprite_RAM, x
  INY
  INX
  CPY #$B8
  BCS .resetSM_pointer
.compare_x:
  CPX #$B8
  BCC .transfer_loop
  INY
  INY
  INY
  INY
;  STY SM_pointer
  JMP .rts
.resetSM_pointer:
  LDY #$00
  STY SM_pointer
  JMP .compare_x
.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;;;
SMap_setup:
  LDA #$00
  STA temp_y
  STA loop_counter
.sprite_loop:
  JSR assign_SpriteMap_pos
  LDA obj_run_offset
  CLC
  ADC loop_counter     ;adjust the offset by the amount we've looped, so it saves at the correct spot in $0700.
  TAX
  LDA temp_y           ;temp_y is the position in $0500 returned from assign_SpriteMap_pos where we'll store thi tile.
  STA oam_SMap_loc, x
  INC loop_counter
  LDA loop_counter     ;this should be the number of tiles needed for this object, and hencen the number of times we need to loop.
  CMP SPR_SpcNeed
  BCC .sprite_loop

  RTS


;;;;;;;;;;;;;;;;;;;;;;;
Item_SMap_setup:
  LDA #$00
  STA temp_y
  STA loop_counter
.sprite_loop:
  JSR assign_SpriteMap_pos
  LDA obj_run_offset
  CLC
  ADC loop_counter     ;adjust the offset by the amount we've looped, so it saves at the correct spot in $0700.
  TAX
  LDA temp_y           ;temp_y is the position in $0500 returned from assign_SpriteMap_pos where we'll store thi tile.
  STA item_SMap_loc, x ;<-the whole reason this sub exists. the location of Smap position is entirely differen from items than it is for enemies.
  INC loop_counter
  LDA loop_counter     ;this should be the number of tiles needed for this object, and hencen the number of times we need to loop.
  CMP SPR_SpcNeed
  BCC .sprite_loop

  RTS


;;;;;;;;;;;;;;;;;;;;;;;
assign_SpriteMap_pos:
  ;returns temp_y - location in sprite map to store sprite, will be transferred to accum and stored in outer loop
  LDY temp_y
.ASMP_loop:
  LDA SpriteMap, y
  CMP #$FE
  BEQ .assign
  INY             ;simply increment y and jump back. (hopefully) there's no
  INY             ;need to compare so long as memory tests are working correctly.  
  INY                   
  INY              
  JMP .ASMP_loop
.assign:
  LDA #$00         ;this is meant to hold the SpriteMap position in case another
  STA SpriteMap, y ;object is spawning withing this frame.
  STY temp_y

  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;;
inner_sprite_shuffling:  ;special sub written to re-shuffle the sprites
  LDX #$00               ;within any extra-long objects, ex: Asian Dragon.
.iss_push_loop:
  LDA oam_SMap_loc, y
  PHA       ;push loop goes slot by slot in the obj's sprite map positions
  INY       ;and pushes them to the stack.
  INX
  CPX temp1
  BCC .iss_push_loop
  LDX #$00               ;reset x reg and the y to obj_run_offset
  LDY obj_run_offset
.iss_pull_loop:
  PLA
  STA oam_SMap_loc, y
  INY       ;the pull loop will pull everything off the stack until temp1 tells
  INX       ;it to stop, thus the sprite map positions are flipped horizontally.
  CPX temp1
  BCC .iss_pull_loop
  LDY obj_run_offset     ;depending on the object, I'm not sure what will run after this,
  RTS                    ;so I'm restoring y to the obj offset just to be safe.


;;;;;;;;;;;;;;;;;;
clear_SpriteMap:
  ;input: y - the starting position for the loop. use the EXPTship constant if 
  ;           you want the ship's sprites to remain. see variables_constants.asm for reference.
  LDA #$FE
.loop:
  STA SpriteMap, y
  INY
  CPY #$B7
  BCC .loop
  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;
;;Memory Tests & Clears
;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;
;CPU_test:

;.pull_type:
;  LDY obj_init_offset  ;it should be set to #fireball
;  LDA [obj_ptr], y
;  TAY

;.compare:
;  LDA object_CPU_usage, y
;  CMP CPU_curr_usage
;  BCC .success

;.kill_the_hoggy_bitch:
;  SEC
;  JMP .rts

;.success:
;  STA temp1
;  LDA CPU_curr_usage
;  SEC
;  SBC temp1
;  STA CPU_curr_usage
;  CLC

;.rts:
;  RTS

;object_CPU_usage:
;  .db $00,$00    ;nothing here
;  .db $00,$0C

;;;;;;;;;;;;;;
OAM_memtest:
  LDY #$00
.start:
  LDA OAM, y
  CMP #$FE    ;at least one byte of free space detected here, so test.
  BEQ .test
  INY
  CPY #$80
  BNE .start
  SEC         ;there is not enough space for this object.
  JMP .rts    ;set carry so sub knows not to init.

.test:
  LDX #$00
.test_next:
  LDA OAM, y
  CMP #$FE
  BEQ .keep_counting
  INY
  JMP .start  ;found a byte that's taken, return to beginning
.keep_counting:
  INY         ;byte tested is free
  INX
  CPX OAM_SpcNeed
  BCC .test_next
  TYA
  SEC         
  SBC OAM_SpcNeed        ;this will be the location for free space's start.
  STA obj_run_offset
  CLC         ;success! there is enough space for this object. clear carry.

.rts:
  RTS


;;;;;;;;;;;;;;
SPR_memtest:
  LDA SPR_SpcNeed  ;if space needed is less than free space, carry will be
  CMP SPR_Free     ;clear, which means success.

  RTS


;;;;;;;;;;;;;;;;;;;;;;
mem_tests_successful:
  SEC
  LDA OAM_Free
  SBC OAM_SpcNeed
  STA OAM_Free
  SEC
  LDA SPR_Free
  SBC SPR_SpcNeed
  STA SPR_Free

  RTS


;;;;;;;;;;;;;;;;;;;;;
clear_sprite_tile:
  LDA #$FE             ;clear sprite map
  STA SpriteMap, x
  STA SpriteMap+1, x
  STA SpriteMap+2, x
  STA SpriteMap+3, x

  RTS


;;;;;;;;;;;;;;;;;;;;
clear_oam_chunk:
  LDA #$FE
  STA oam_type, y
  STA oam_MoveType, y
  STA oam_dir, y
  STA oam_xMapHI, y
  STA oam_xMapLO, y
  STA oam_yMapLO, y
  STA oam_xDelta, y
  STA oam_yDeltaHI, y
  STA oam_yDeltaLO, y
  STA oam_yDeltaSPD, y
  STA oam_SMap_loc, y

  RTS


;;;;;;;;;;;;;;;;;;;;
;;Object Movements
;;;;;;;;;;;;;;;;;;

obj_movement:
  LDA oam_MoveType, y          ;load type of movement and convert to pointer
  BMI .trajectory       ;check for trajectory flag, branch if set
  ASL A
  TAY
  JMP .basic_movement
.trajectory:
  LDY #$08              ;the trajectory sub is #$04 on the movement_types index
.basic_movement:
  LDA movement_types, y
  STA ptr1
  LDA movement_types+1, y
  STA ptr1+1

  JMP [ptr1]


;;;;;;;;;;;;;;
parabola:
  LDY obj_run_offset    ;pull current offset
  LDA oam_yDeltaSPD, y  ;to start, apply to the speed at which y delta changes
  ADC oam_yDeltaLO, y   ;to y delta itself
  STA oam_yDeltaLO, y
  BCC .apply_delta        ;if delta's low byte doesn't produce a carry,
  LDA oam_yDeltaHI, y
  ADC #$00
  STA oam_yDeltaHI, y

.apply_delta:
  CLC
  LDA oam_yMapLO, y
  ADC oam_yDeltaHI, y       ;whether 8-bit num is positive or neg, this should
  STA oam_yMapLO, y         ;get intended result

.move_x:
  LDA oam_dir, y        ;pull direction
  CMP #right
  BEQ .right
.left:
  SEC
  LDA oam_xMapLO, y  ;screen coords
  SBC oam_xDelta, y
  STA oam_xMapLO, y
  LDA oam_xMapHI, y     ;screen number
  SBC #$00
  STA oam_xMapHI, y
  JMP .rts
.right:
  CLC
  LDA oam_xMapLO, y  ;screen coords
  ADC oam_xDelta, y
  STA oam_xMapLO, y
  LDA oam_xMapHI, y     ;screen number
  ADC #$00
  STA oam_xMapHI, y

.rts:
  RTS


;;;;;;;;;;;;;;
angle:
  LDY obj_run_offset    ;pull current offset

.apply_delta:
  CLC
  LDA oam_yMapLO, y
  ADC oam_yDeltaHI, y       ;whether 8-bit num is positive or neg, this should
  STA oam_yMapLO, y         ;get intended result

.move_x:
  LDA oam_dir, y        ;pull direction
  CMP #right
  BEQ .right
.left:
  SEC
  LDA oam_xMapLO, y  ;screen coords
  SBC oam_xDelta, y
  STA oam_xMapLO, y
  LDA oam_xMapHI, y     ;screen number
  SBC #$00
  STA oam_xMapHI, y
  JMP .rts
.right:
  CLC
  LDA oam_xMapLO, y  ;screen coords
  ADC oam_xDelta, y
  STA oam_xMapLO, y
  LDA oam_xMapHI, y     ;screen number
  ADC #$00
  STA oam_xMapHI, y

.rts:
  RTS


;;;;;;;;;;;;;;
horizontal_mv:
  LDY obj_run_offset    ;pull current offset

.move_x:
  LDA oam_dir, y        ;pull direction
  CMP #right
  BEQ .right
.left:
  SEC
  LDA oam_xMapLO, y  ;screen coords
  SBC oam_xDelta, y
  STA oam_xMapLO, y
  LDA oam_xMapHI, y     ;screen number
  SBC #$00
  STA oam_xMapHI, y
  JMP .rts
.right:
  CLC
  LDA oam_xMapLO, y  ;screen coords
  ADC oam_xDelta, y
  STA oam_xMapLO, y
  LDA oam_xMapHI, y     ;screen number
  ADC #$00
  STA oam_xMapHI, y

.rts:
  RTS


;;;;;;;;;;;;;;
vertical_mv:
  LDY obj_run_offset    ;pull current offset

  CLC
  LDA oam_yMapLO, y
  ADC oam_yDeltaHI, y       ;whether 8-bit num is positive or neg, this should
  STA oam_yMapLO, y         ;get intended result

.rts:
  RTS


;;;;;;;;;;;;;;
trajectory:
  LDY obj_run_offset    ;pull current offset
;  LDA hobj_destroy+1, y
;  BNE .decrement
;  LDA hobj_destroy, y
;  BNE .decrement
;.destroy:
;  ORA #$40
;  STA oam_type, y
;  JMP .rts

;.decrement:
;  LDA hobj_destroy+1, y
;  SEC           ;decrement one from hobj_destroy if not yet zero.
;  SBC #$01        
;  STA hobj_destroy+1, y
;  LDA hobj_destroy, y
;  SBC #$00
;  STA hobj_destroy, y

.move:
  TXA ;save x reg because I'm about to destroy it.
  PHA

  TYA
  TAX   ;transfer offset to x for use with these subs

  JSR calc_trajectory_y
  JSR calc_trajectory_x

  TXA
  TAY  ;transfer offset back to y
  PLA
  TAX  ;restore original x

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;
calc_trajectory_y:
  LDA oam_MoveType, x
  AND #$7F       ;mask out the trajectory flag bit
  ASL A
  TAY
  LDA traj_tables_y, y
  STA ptr1
  LDA traj_tables_y+1, y
  STA ptr1+1

.y_trajectory:
  LDY traj_index_y, x
  LDA [ptr1], y   ;use index to pull appropriate value from traj_tables
  CMP #$80        ;$80 is activator for restarting current string
  BEQ .reset_y
  CMP #$81
  BEQ .repeat_last_y
  STA traj_y
  INY
  JMP .apply

.reset_y:
  LDY #$00
  LDA [ptr1], y
  STA traj_y
  JMP .apply

.repeat_last_y:
  DEY
  LDA [ptr1], y
  STA traj_y

.apply:
  TYA   ;it won't let me store the y reg to a variable using x, so xfer to accum
  STA traj_index_y, x
  LDA oam_yMapLO, x
  CLC
  ADC traj_y
  STA oam_yMapLO, x         ;store new y value of sprite

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;
calc_trajectory_x:
  LDA oam_MoveType, x
  AND #$7F       ;mask out the trajectory flag bit
  ASL A
  TAY
  LDA traj_tables_x, y
  STA ptr1
  LDA traj_tables_x+1, y
  STA ptr1+1

.x_trajectory:
  LDY traj_index_x, x
  LDA [ptr1], y   ;use index to pull appropriate value from traj_tables
  CMP #$80        ;$80 is activator for restarting current string
  BEQ .reset_x
  CMP #$81
  BEQ .repeat_last_x
  STA traj_x
  INY
  JMP .apply

.reset_x:
  LDY #$00
  LDA [ptr1], y
  STA traj_x
  JMP .apply

.repeat_last_x:
  DEY
  LDA [ptr1], y
  STA traj_x

.apply:
  TYA    ;it won't let me store the y reg to a variable using x, so xfer to accum
  STA traj_index_x, x
  LDA oam_xMapLO, x
  CLC
  ADC traj_x
  STA oam_xMapLO, x
  LDA traj_x
  BMI .subtract
.add:
  LDA oam_xMapHI, x
  ADC #$00
  STA oam_xMapHI, x
  JMP .rts
.subtract:
  LDA oam_xMapHI, x
  SBC #$00
  STA oam_xMapHI, x

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;
;;Bounding Box/Collision
;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;
obj_coords_to_bbox:
  LDY obj_run_offset

  LDA oam_xMapLO, y
  SEC
  SBC camera_Left_x
  CLC
  ADC temp1
  STA obj_left

  LDA obj_left
  CLC
  ADC obj_width
  STA obj_right

  LDA oam_yMapLO, y
  CLC
  ADC temp2
  STA obj_top

  CLC
  ADC obj_height
  STA obj_bottom

  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;
collision_against_ship:

.left_test_1:         ;tests against ships bbox that runs along the x axis
  LDA ship_right
  CMP obj_left
  BCC .no_collision_1

.right_test_1:
  LDA obj_right
  CMP ship_left
  BCC .no_collision_1

.top_bottom_test_1:
  LDA obj_bottom
  CMP ship_top
  BCC .no_collision_1

.next_1:
  LDA ship_bottom
  CMP obj_top
  JMP .rts

.no_collision_1:      ;CLEAR, no test against second bbox

.left_test_2:         ;tests against ships bbox that runs along the y axis
  LDA ship_right+1
  CMP obj_left
  BCC .no_collision_2

.right_test_2:
  LDA obj_right
  CMP ship_left+1
  BCC .no_collision_2

.top_bottom_test_2:
  LDA obj_bottom
  CMP ship_top+1
  BCC .no_collision_2

.next_2:
  LDA ship_bottom+1
  CMP obj_top
  JMP .rts

.no_collision_2:
  CLC

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;
visibility_check:

  LDA sprite_x_offset
  CLC
  ADC #$08
  STA temp1  ;object's right
  LDA oam_xMapHI, y
  ADC #$00
  STA temp2  ;object's right screen

  LDA oam_xMapHI, y
  CMP camera_Left_ScreenNum
  BEQ .left_test

  LDA temp2
  CMP camera_Right_ScreenNum
  BEQ .right_test
  JMP .offscreen

.left_test:
  LDA sprite_x_offset
  CMP camera_Left_x
  BCC .offscreen
  JMP .onscreen

.right_test:
  LDA sprite_x_offset  ;this is corrective code to help alleviate the bug where
  CMP #$F8             ;sprites would briefly show up on the right edge
  BCS .offscreen       ;of the screen despite exiting the left.

  LDA camera_Right_x
  CMP sprite_x_offset
  BCC .offscreen

.onscreen:
  SEC
  JMP .rts
.offscreen:
  CLC
.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;;;;
;;Random Number Handler
;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;
object_random_gen:
  TXA
  PHA   ;backup registers
  TYA
  PHA

  INC r_marker       ;for this sub, I inc r_marker and do the reset test at the
  JSR r_marker_test  ;beginning, so it doesn't mess with the registers being restored later

  LDX r_marker
  LDA r_results, x
  LSR A
  LSR A   ;to speed this sub up, make the rotating index smaller
  LSR A
  TAX     ;this is the random number to compare

.start:
  LDA temp1  ;this is the type of random table to load, stored from the general
  ASL A      ;object setup sub
  TAY
  LDA obj_rand_tables, y
  STA ptr1
  LDA obj_rand_tables+1, y
  STA ptr1+1

  LDY #$00
.obj_rvalue_loop:
  LDA [ptr1], y
  CMP #$FF
  BEQ .restart

  DEX
  CPX #$00
  BEQ .store

  INY          ;next entry in level_item_map
  JMP .obj_rvalue_loop

.restart:
  LDY #$00
  JMP .obj_rvalue_loop

.store:
  LDA [ptr1], y
  STA temp1

  PLA
  TAY
  PLA   ;restore registers
  TAX

  LDA temp1

  RTS


;;;;;;;;;;;;;;;;;;;;;;;;
offscreen_destroy_test:

  LDA ship_screen_x
  SEC
  SBC #$03           ;left boundary of test, two screens behind ship
  STA temp1
  CLC
  ADC #$06           ;right boundary of test, actually two scrrens (not three)
  STA temp2          ;in front of ship since I have to compare using a BCS

  LDA oam_xMapHI, y
  SEC                ;subtract two scrrens from object to and destroy if 
  SBC #$02           ;more than two scrrens behind ship
  CMP temp1
  BCC .destroy

  LDA oam_xMapHI, y
  CMP temp2          ;no alteration neccesary.  if object's screen equals temp2
  BCS .destroy       ;then it is greater than two screens in front of ship and needs destroyed
  JMP .no_destroy

.destroy:
  SEC
  JMP .rts
.no_destroy
  CLC
.rts:
  RTS