;;;;;;;;;;;;;;;;;;;;;;;;
init_laser:
;  LDA #$6C
  LDA #$60
  STA lasr_x
  LDA #$84
  STA lasr_y
  LDA #$00
  STA lasr_timer
  LDA #$08
  STA lasr_height
  LDA #$80
  STA lasr_status

  LDA #$01         ;opens the boss's mouth next NMI
  STA boss2_mouth

  RTS


;;;;;;;;;;;;;;;;
run_laser:
  LDA lasr_status
  AND #$80          ;check for offscreen in on/off flag
  BNE .increment
  JMP .rts

.increment:
  INC lasr_x
  INC lasr_x

  LDA lasr_status
  AND #$0F          ;mask out length, store in temp2
  STA temp2

.calc_laser:
  LDY #$00
  LDA #$00
  STA lasr_width
.calc_laser_loop:
  LDX lasr_SMap_pos, y
  LDA lasr_x             ;x coords
  SEC
  SBC lasr_width
  CMP #$FC               ;see if it's left the right edge
  BCS .y_offscreen
  CMP #$48               ;see if it's wrapped around to the right edge
  BCC .y_offscreen

.y_onscreen:
  STA SpriteMap+3, x
  LDA lasr_y
  STA SpriteMap, x
  JMP .width
.y_offscreen:            ;y coords
  STA SpriteMap+3, x
  LDA #$F0
  STA SpriteMap, x

.width:
  LDA lasr_width         ;width for collision/visibility testing
  CLC
  ADC #$08
  STA lasr_width
  INY
  CPY temp2
  BCC .calc_laser_loop

.collision:
  LDY #$00
.coll_loop:
  LDX lasr_SMap_pos, y
  LDA SpriteMap, x
  CMP #$F0
  BEQ .cloop_end

  JSR laser_coords_to_bbox
  JSR laser_collision_against_ship
  BCC .cloop_end
.kill_ship:
  JSR ship_dies
  JMP .rts

.cloop_end:
  INY
  CPY #$08
  BCC .coll_loop

.victim_collision
  LDA victim_stat
  CMP #$02
  BNE .test_destroy

.v_collision_next:
  LDY #$00
.v_coll_loop:
  LDX lasr_SMap_pos, y
  LDA SpriteMap, x
  CMP #$F0
  BEQ .vcloop_end

  JSR laser_coords_to_bbox
  JSR laser_collision_against_victim
  BCC .vcloop_end
  JSR laser_kill_victim
  JMP .test_destroy

.vcloop_end:
  INY
  CPY #$08
  BCC .v_coll_loop

.test_destroy:
  LDA lasr_x
  CMP #$36
  BCC .rts
  CMP #$39
  BCS .rts
  LDA #$00              ;destroy laser at this point
  STA lasr_status
  JMP .rts

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;
laser_kill_victim:
  LDA #$00         ;again, originally JSRd to victim_splat
  STA arrow_timer
  LDA #$07
  STA victim_stat
  JSR victim_dissappear
  JSR kill_beam    ;kill beam graphics and sound
.sub_score:
  LDA #$05
  STA num_change+4
  LDA #$02
  STA num_change+3
  JSR SubtractScore
  RTS


;;;;;;;;;;;;;;;;;;;;;
laser_coords_to_bbox:
  LDA SpriteMap+3, x
  STA obj_left
  CLC
  ADC #$08
  STA obj_right

  LDA SpriteMap, x
  STA obj_top
  CLC
  ADC #$08
  STA obj_bottom

  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
laser_collision_against_ship:

.left_test:
  LDA ship_right
  CMP obj_left
  BCC .no_collision
  
.right_test:
  LDA obj_right
  CMP ship_left
  BCC .no_collision

.top_bottom_test:
  LDA obj_bottom
  CMP ship_top
  BCC .no_collision

.next:
  LDA ship_bottom
  CMP obj_top
  JMP .rts

.no_collision:
  CLC

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
laser_collision_against_victim:

.left_test:
  LDA victim_x
  CLC                 ;victim right
  ADC #$08
  CMP obj_left
  BCC .no_collision

.right_test:
  LDA obj_right
  CMP victim_x        ;victim left
  BCC .no_collision

.top_bottom_test:
  LDA obj_bottom
  CMP victim_y        ;victim top
  BCC .no_collision

.next:
  LDA victim_y
  CLC                 ;victim bottom
  ADC #$08
  CMP obj_top
  JMP .rts

.no_collision:
  CLC

.rts:
  RTS
