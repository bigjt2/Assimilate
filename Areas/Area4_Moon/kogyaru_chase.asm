;;;;;;;;;;;;;;;;
kogy_chase_NMI:
  JMP NMI_recover


;;;;;;;;;;;;;;;;;;;;;;;
kogy_chase_autoscroll:

  LDA xScroll
  CLC
  ADC #$06
  STA xScroll
  BCC .rts

.change_nametable:
  LDA soft_2000
  AND #$01
  EOR #$01
  STA temp1
  LDA soft_2000
  AND #$FE
  ORA temp1
  STA soft_2000

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;;;
kogy_chase_ossan_pos:
  LDA ossan_chase
  CMP #$40
  BCC .set_min
  CMP #$F1
  BCS .set_max

.normal:
  STA ship_x
  JMP .rts
.set_min:
  LDA #$40
  STA ship_x
  STA ossan_chase
  JMP .rts
.set_max:
  LDA #$F0
  STA ship_x
  STA ossan_chase

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
kogy_chase_init_special_obj:

  LDA #ignore      ;block out this chunk oam since it will be permanently
  STA OAM          ;used while boss2 battle is going on.
  LDA #$03         ;?????????????? this allows object handler to ignore this chunk of oam.
  STA OAM+1

  LDA OAM_Free     ;subtract oam space and sprite space at end
  SEC
  SBC #$02         ;???????????
  STA OAM_Free

  LDA #$00
  STA ossan_chase+1
  LDA #$40
  STA ossan_chase

  RTS


;;;;;;;;;;;;;;;;;;;;;
chase_ButtonHandler:

.Start_test:
  LDA buttons_new
  AND #%00010000
  BEQ .Up
.Start:
  LDA buttons
  AND #%00010000
  BEQ .Up
  JSR chase_Start
  JMP .rts
.Up:
  LDA buttons     ; player 1 - Up
  AND #%00001000  ; only look at bit 3
  BEQ .Down   ; branch to .Down if button is NOT pressed (0)
  JSR chase_Up
  JMP .rts    ;the JMP .rts opcodes are to restrict diagonal movement
.Down:
  LDA buttons       ; player 1 - Down
  AND #%00000100  ; only look at bit 2
  BEQ .Left   ; branch to .rts if button is NOT pressed (0)
  JSR chase_Down
.Left:
  LDA buttons       ; player 1 - Left
  AND #%00000010  ; only look at bit 1
  BEQ .Right   ; branch to .Right if button is NOT pressed (0)
  JSR chase_Left
  JMP .rts
.Right:
  LDA buttons       ; player 1 - Right
  AND #%00000001  ; only look at bit 0
  BEQ .rts
  JSR chase_Right

.rts:
  RTS


;;;;;;;;;;;;;;
chase_Start:
  LDA #STATEMENU
  STA gamestate
  JSR Hide_Sprites

  LDA #$00
  STA menu_cursor

  LDA needdraw
  ORA #%00010000      ;set bit 4 so NMI draws, and EngineMenu sub stalls until drawn
  STA needdraw

  JMP GameEngine      ;don't RTS or PC will keep going and won't erase sprites


;;;;;;;;;;;;;;
chase_Up:
  
  LDA ship_y
  CMP #$40     ;dec 64, 8 pixels below bottom of status bar
  BCC .ReadUpDone

  JSR DownCollisionTest  ;this should clear stop_direction for when ship moves up.

  SEC
  LDA ship_y
  SBC ship_speed
  STA ship_y

  LDA #$10
  STA temp1
  LDA #$00
  STA temp2
  JSR chase_dec

.ReadUpDone:
  RTS


;;;;;;;;;;;;;;
chase_Down:

  LDA ship_y
  CMP bottom_border
  BCS .ReadDownDone

  JSR DownCollisionTest
  LDA stop_movement
  CMP #$01
  BEQ .ReadDownDone

.next:
  CLC
  LDA ship_y
  ADC ship_speed
  STA ship_y

  LDA #$10
  STA temp1
  LDA #$00
  STA temp2
  JSR chase_dec

.ReadDownDone:
  RTS


;;;;;;;;;;;;;;
chase_Left:
  LDA #$80
  STA temp1
  LDA #$01
  STA temp2
  JSR chase_dec
  RTS


;;;;;;;;;;;;;;
chase_Right:
  LDA #$10
  STA temp1
  JSR chase_inc
  RTS


;;;;;;;;;;;;;;
chase_dec:
  LDA ossan_chase+1
  SEC
  SBC temp1
  STA ossan_chase+1
  LDA ossan_chase
  SBC temp2
  STA ossan_chase
  RTS


;;;;;;;;;;;;;;
chase_inc:
  LDA ossan_chase+1
  CLC
  ADC temp1
  STA ossan_chase+1
  LDA ossan_chase
  ADC #$00
  STA ossan_chase
  RTS