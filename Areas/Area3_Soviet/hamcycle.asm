;;;;;;;;;;;;;;;;;;
hamcycle_handler:
  INC hamcycle_timer
  LDA hamcycle_timer
  CMP #$20
  BEQ .open
  CMP #$2A
  BEQ .init
  BCC .rts
  CMP #$34
  BEQ .close
  CMP #$C0
  BEQ .reset
  JMP .run

.open:
  LDA #open_star
  STA temp1
  JSR star_sprites_load
  JMP .rts

.init:
  JSR init_hamcycle
  JMP .rts

.close
  LDA #close_star
  STA temp1
  JSR star_sprites_load
  JMP .run

.reset:
  LDA #$00
  STA hamcycle_timer

.run:
  JSR run_hamcycle

.rts:
  RTS


;;;;;;;;;;;;;;;;
init_hamcycle:

  LDA #$AC
  STA hamcycle_y
  LDA #$D8
  SEC
  SBC xScroll
  STA hamcycle_x
  LDA #$00
  STA hamcycle_anim

  LDA #$01
  STA SpriteMap+86
  STA SpriteMap+90
  STA SpriteMap+94
  STA SpriteMap+98

  JSR hamcycle_set_target

  RTS


;;;;;;;;;;;;;;;;
run_hamcycle:

.screen_test:
  LDA hamcycle_x
  CMP #$08
  BCS .y_test
.offscreen:
  JMP .destroy
.y_test:
  LDA hamcycle_y
  CMP #$30
  BCC .offscreen
  CMP #$F8
  BCS .offscreen

.x_movement:
  LDA hamcycle_x
  SEC
  SBC hamdelta_x
  STA hamcycle_x
.x_coords:
  LDA hamcycle_x
  STA SpriteMap+91
  STA SpriteMap+99
  SEC
  SBC #$08
  STA SpriteMap+87
  STA SpriteMap+95

.y_movement:
  LDA hamvert
  CMP #up
  BEQ .y_up
.y_down:
  LDA hamcycle_y
  CLC
  ADC hamdelta_y
  STA hamcycle_y
  JMP .y_coords
.y_up:
  LDA hamcycle_y
  SEC
  SBC hamdelta_y
  STA hamcycle_y
.y_coords
  STA SpriteMap+92
  STA SpriteMap+96
  SEC
  SBC #$08
  STA SpriteMap+84
  STA SpriteMap+88

.animation:
  INC hamcycle_anim
  LDA hamcycle_anim
  CMP #$01
  BEQ .frame1
  CMP #$0E
  BEQ .frame2
  CMP #$1B
  BEQ .frame3
  CMP #$28
  BEQ .frame4
  CMP #$35
  BEQ .reset
  JMP .collision

.reset:
  LDA #$FF
  STA hamcycle_anim
  JMP .collision

.frame1:
  LDY #$00
  JMP .load_frames
.frame2:
  LDY #$04
  JMP .load_frames
.frame3:
  LDY #$08
  JMP .load_frames
.frame4:
  LDY #$0C

.load_frames:
  LDX #$54
.frames_loop:
  LDA hamcycle_frames, y
  STA SpriteMap+1, x
  INY
  INX
  INX
  INX
  INX
  CPX #$64
  BCC .frames_loop

.collision:
  LDA #$01
  STA temp1
  STA temp2
  LDA #$0D
  STA obj_width
  STA obj_height
  JSR hc_coords_to_bbox
  JSR hc_collision_against_ship
  BCC .rts

.death:
  JSR ship_dies
.destroy:
  LDA #$FE
  STA hamcycle_x
  STA hamcycle_y
  LDA #$FA
  STA SpriteMap+92
  STA SpriteMap+96
  STA SpriteMap+84
  STA SpriteMap+88
  LDA #$00
  STA hamcycle_anim

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;
hamcycle_set_target:
  LDA ship_y
  CMP hamcycle_y
  BCC .ship_above

.ship_below:
  SEC
  SBC hamcycle_y
  LDX #down
  STX hamvert
  JMP .y_divide

.ship_above:
  LDA hamcycle_y
  SEC
  SBC ship_y
  LDX #up
  STX hamvert

.y_divide:
  LSR A
  LSR A
  LSR A
  LSR A
  LSR A
  BEQ .y_min
  STA hamdelta_y
  JMP .x_target
.y_min:
  LDA #$01
  STA hamdelta_y

.x_target:
  LDA hamcycle_x
  SEC
  SBC ship_x
  LSR A
  LSR A
  LSR A
  LSR A
  LSR A
  BEQ .x_min
  STA hamdelta_x
  JMP .rts
.x_min:
  LDA #$01
  STA hamdelta_x

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;
hc_coords_to_bbox:
  LDY obj_run_offset

  LDA hamcycle_x
  ADC temp1
  STA obj_left

  LDA obj_left
  CLC
  ADC obj_width
  STA obj_right

  LDA hamcycle_y
  CLC
  ADC temp2
  STA obj_top

  CLC
  ADC obj_height
  STA obj_bottom

  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;;;
hc_collision_against_ship:

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


;;;;;;;;;;;;;;;;;;
hamcycle_frames:
  .db $B0,$B1,$B2,$B3, $B4,$B5,$B6,$B7, $B8,$B9,$BA,$BB, $BC,$BD,$BE,$BF