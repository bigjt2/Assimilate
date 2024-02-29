Ossan_Movement_Support_Subs:
  JSR set_ship_sprites_params
  JMP CS_Support_Sub_Return


Ossan_move:
  LDY CS_ptr
  LDA Ossan_x_targ             ;I double-use this variable as an init flag
  CMP #$FF
  BNE .continue_move
.init_move:
  INY
  LDA [ptr1], y
  STA Ossan_x_targ
  INY
  LDA [ptr1], y
  STA Ossan_y_targ
  DEY
  DEY
  STY CS_ptr
.continue_move:
  LDA ship_x
  CMP Ossan_x_targ
  BEQ .x_done
  BCC .ship_left       ;ship is to the left of target
.ship_right:           ;ship is to the right of target
  DEC ship_x
  JMP CS_Ossan_Move_End
.ship_left:
  INC ship_x
  JMP CS_Ossan_Move_End
.x_done:
  LDA ship_y
  CMP Ossan_y_targ
  BEQ .y_done
  BCC .ship_above
.ship_below:
  DEC ship_y
  JMP CS_Ossan_Move_End
.ship_above:
  INC ship_y
  JMP CS_Ossan_Move_End
.y_done:
  INY
  INY
  INY
  STY CS_ptr
  LDA #$FF
  STA Ossan_x_targ
  JMP CS_Ossan_Move_End


Ossan_setup_coords:
  LDY CS_ptr
  INY
  LDA [ptr1], y
  STA ship_x
  INY
  LDA [ptr1], y
  STA ship_y
  INY
  STY CS_ptr
  JMP CS_Ossan_Move_End


Ossan_appear:
  LDY CS_ptr
  LDA #sppal_0
  STA pal_change_lo
  LDX #$00
.appear_loop:
  LDA Ossan_appear_pal, x
  STA pal_RAM, x
  INX
  CPX #$04
  BCC .appear_loop
  LDA needdraw
  ORA #%01000000
  STA needdraw
  INY
  STY CS_ptr
  JMP CS_Ossan_Move_End


Ossan_disappear:
  LDY CS_ptr
  LDA #sppal_0
  STA pal_change_lo
  LDX #$00
.disappear_loop:
  LDA Ossan_disappear_pal, x
  STA pal_RAM, x
  INX
  CPX #$04
  BCC .disappear_loop
  LDA needdraw
  ORA #%01000000
  STA needdraw
  INY
  STY CS_ptr
  JMP CS_Ossan_Move_End

CS_Ossan_Move_End:
  JMP Cutscene_return


;;;;;;;;;;;;;;;;;;;;;;;;;
Ossan_appear_pal:
  .db $1D,$08,$21,$31

Ossan_disappear_pal:
  .db $1D,$1E,$1E,$1E



;;;;;;;;;;;;;;;;;;;;;;;;;
MStalin_eyes_setup:

  LDY #$00
  LDX #$20
.loop:
  LDA MStalin_eyes_dat, y
  STA SpriteMap, x
  INY
  INX
  CPY #$24
  BCC .loop
  RTS


;;;;;;;;;;;;;;;;;;;;;;;
MStalin_eyes_appear:
  INC fade_timer
  LDA fade_timer
  CMP #$00
  BEQ .first
  CMP #$10
  BEQ .second
  CMP #$20
  BEQ .done
  JMP .end  

.first:
  LDY #$00
  JMP .appear_begin
.second:
  LDY #$04
  JMP .appear_begin
.done:
  LDA #$FF
  STA fade_timer
  LDY CS_ptr
  INY
  STY CS_ptr
  LDY #$08

.appear_begin
  LDA #sppal_1
  STA pal_change_lo
  LDX #$00
.appear_loop:
  LDA MSeyes_appear_pal, y
  STA pal_RAM, x
  INX
  INY
  CPX #$04
  BCC .appear_loop
  LDA needdraw
  ORA #%01000000
  STA needdraw

.end:
  JMP Cutscene_return


;;;;;;;;;;;;;;;;;;;;;;;;;
MStalin_eyes_disappear:
  LDX #$20
.loop:
  LDA #$FA
  STA SpriteMap, x
  INX
  INX
  INX
  INX
  CPX #$44
  BCC .loop
  INC CS_ptr
.end:
  JMP Cutscene_return


MSeyes_appear_pal:
  .db $1D,$1E,$1E,$04
  .db $1D,$06,$05,$14
  .db $1D,$16,$15,$24

MStalin_eyes_dat:
  .db $64,$D0,$01,$5A, $64,$D1,$01,$62, $64,$D2,$01,$6A
  .db $6C,$D3,$01,$62, $6C,$D4,$01,$6A

  .db $64,$D5,$01,$90, $64,$D6,$01,$98
  .db $6C,$D7,$01,$90, $6C,$D8,$01,$98