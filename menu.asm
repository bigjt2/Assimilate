;;;;;;;;;;;;;;;
;;Menu Handler
;;;;;;;;;;;;;;;
EngineMenu:
  LDA menu_cursor

  LDA needdraw
  AND #%00010000    ;if bit 4 is set, menu's bottom hasn't finished drawing
  BNE .rts

  LDA EMP_trigger   ;if EMP trigger is set, continue to flash background
  BEQ .next         ;so it doesn't get stuck on a different palette
  LDA event_counter
  CMP #$03          ;don't forget to check event counter as well.
  BCS .next
  JSR background_flash

.next:
  JSR Counter_Manager   ;need to still jump here so cursor blinks
  JSR Set_MenCurs_Sprite
  JSR ReadController
  JSR MenuButtonHandler

.rts
  RTS


;;;;;;;;;;;;;;;;;;;;
MenuButtonHandler:

.Start_test:
  LDA buttons_new
  AND #%00010000
  BEQ .Up
.Start:
  LDA buttons
  AND #%00010000
  BEQ .Up
  JSR M_Start
  JMP .rts
.Up:
  LDA buttons_new
  AND #%00001000
  BEQ .Down
  JSR M_Up
  JMP .rts
.Down:
  LDA buttons_new
  AND #%00000100
  BEQ .Left
  JSR M_Down
  JMP .rts
.Left:
  LDA buttons_new
  AND #%00000010
  BEQ .Right
  JSR M_Left
  JMP .rts
.Right:
  LDA buttons_new
  AND #%00000001
  BEQ .A_Button
  JSR M_Right
  JMP .rts
.A_Button:
  LDA buttons_new
  AND #%10000000
  BEQ .rts
  JMP M_A_button

.rts:
  RTS


;;;;;;;;;
M_Start:
  LDA #STATEPLAYING
  STA gamestate

  LDA needdraw
  ORA #%00100000      ;set bit 5 so NMI draws, and EnginePlaying sub stalls until drawn
  STA needdraw

  LDA #$FE
  STA sprite_RAM_MS+1  ;clear cursor's tile

  RTS


;;;;;;;;;
M_Up:
  LDA menu_cursor
  CMP #$00
  BEQ .tool_cycle_up
  CMP #$01    ;if cursor is in upper-right, don't move it up
  BEQ .rts
  DEC menu_cursor
  JMP .rts

.tool_cycle_up:
  LDA victim_stat   ;only allow cycling if victim is not onboard/pb not filling
  CMP #$00
  BEQ .cycle
  CMP #$07
  BEQ .cycle
  JMP .rts

.cycle:
  LDA tool
  CMP #$03
  BEQ .reset
  INC tool
  JMP .prep_graphics

.reset:
  LDA #$00
  STA tool

.prep_graphics
  JSR Fill_Tool_Graphics
  LDA needdraw
  ORA #%00010000
  STA needdraw

.rts:
  RTS


;;;;;;;;;
M_Down:
  LDA menu_cursor
  CMP #$00
  BEQ .tool_cycle_down
  CMP #$02    ;if cursor is in lower-right, don't move it down
  BEQ .rts
  INC menu_cursor
  JMP .rts

.tool_cycle_down:
  LDA victim_stat   ;only allow cycling if victim is not onboard/pb not filling
  CMP #$00
  BEQ .cycle
  CMP #$07
  BEQ .cycle
  JMP .rts

.cycle:
  LDA tool
  CMP #$00
  BEQ .reset
  DEC tool
  JMP .prep_graphics

.reset:
  LDA #$03
  STA tool

.prep_graphics
  JSR Fill_Tool_Graphics
  LDA needdraw
  ORA #%00010000
  STA needdraw

.rts:
  RTS


;;;;;;;;;
M_Left:
  LDA menu_cursor
  CMP #$00
  BEQ .rts

  LDA #$00
  STA menu_cursor
.rts:
  RTS


;;;;;;;;
M_Right:
  LDA menu_cursor
  CMP #$00
  BNE .rts

  INC menu_cursor  
.rts:
  RTS


;;;;;;;;;;;
M_A_button:

  LDA menu_cursor
  CMP #$02
  BEQ .reset
  CMP #$01
  BEQ .restart_level
  JMP .rts

.restart_level:       ;reset assimilation% & timer, but revert score back to where it
                      ;was at level start and don't adjust lives
  LDA bonus_active
  BNE .rts            ;first test if it's a bonus level.  player IS NOT allowed to reset on bonus levels.

  LDA #$00
  STA event_counter
  STA a_ones
  STA a_tens
  STA a_hundr
  STA t_ones
  STA t_tens
  STA t_hundr
  STA t_thous
  STA anal_tally
  STA campout_unlock

  JSR RestoreScore

  LDA #$01         ;this also happens soon in init_PPU, but I also do it now to
  STA skip_sprite0 ;HOPEFULLY hide upper status bar shifting due to skip_sprite0 being active
  LDA #%00000110   ;disable sprites & bg, allow clipping
  STA soft_2001
  JSR vblankwait
  JSR vblankwait

  LDA #STATE_LVL_CHG   ;do not increment level_index, of course
  STA gamestate
  JMP .rts

.reset:
  LDA #$00
  STA event_counter
  LDA #STATE_RESET
  STA gamestate

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;;
Hide_Sprites:
  LDY #$00
.loop:
  LDA #$FE
  STA sprite_RAM+1, y
  INY
  INY
  INY
  INY
  CPY #$FC
  BNE .loop

  RTS


;;;;;;;;;;;;;;;;;;;;;;;;
LoadMenu:
  LDA needdraw
  AND #%00010000
  BEQ .RestoreStatusBar

  JSR Load_Tool_Graphics

  LDA #$24
  STA $2006
  LDA #$66
  STA $2006

  LDA victim_stat  ;determine whether to write "can't change" text or not
  CMP #$00
  BEQ .regular
  CMP #$07
  BEQ .regular

  LDY #$00
.cant_loop:
  LDA no_change_text, y
  STA $2007
  INY
  CPY #$0B
  BCC .cant_loop
  JMP .lower_menu

.regular:
  LDY #$00
.reg_loop:
  LDA #$77
  STA $2007
  INY
  CPY #$0B
  BCC .reg_loop

.lower_menu:       ;this is the lower part of the menu
  LDA #$24
  STA $2006
  LDA #$C0
  STA $2006
  LDY #$00
.tile_loop:
  LDA pause_bar_bottom, y
  STA $2007
  INY
  CPY #$20
  BCC .tile_loop

  LDA #$27
  STA $2006
  LDA #$C0
  STA $2006
  LDY #$00
.attr_loop:
  LDA #$FF
  STA $2007
  INY
  CPY #$10
  BCC .attr_loop

  LDA needdraw
  AND #%11101111
  STA needdraw

  LDA #%10010001
  STA top_2000
  SEC             ;this sub ran, set carry so we skip everything else
  JMP .rts

.RestoreStatusBar:
  CLC             ;needdraw bit wasn't set, function didn't run, clear carry to move to next
.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;;;;
Fill_Tool_Graphics:
  LDA tool
  ASL A
  TAY
  LDA tool_topscreen_grpx, y
  STA ptr1
  LDA tool_topscreen_grpx+1, y
  STA ptr1+1

  LDY #$00
.loop:
  LDA [ptr1], y
  STA tool_grpx_RAM, y
  INY
  CPY #$12
  BCC .loop

  RTS


;;;;;;;;;;;;;;;;;;;;;;;;
Load_Tool_Graphics:
  LDY #$00
  LDX #$00
.first_loop:              ;loads the icon at top of $2000
  LDA #$20
  STA $2006
  LDA tool_grpx_lo_addr, y
  STA $2006
  LDA tool_grpx_RAM, x
  STA $2007
  INY
  INX
  CPY #$06
  BCC .first_loop

  LDX #$00
.second_loop:             ;loads the icon at top of $2400
  LDA #$24
  STA $2006
  LDA tool_grpx_lo_addr, y
  STA $2006
  LDA tool_grpx_RAM, x
  STA $2007
  INY
  INX
  CPY #$0C
  BCC .second_loop
  
  LDA #$24                ;only need to write address at beginnin of text string
  STA $2006
  LDA tool_grpx_lo_addr, y
  STA $2006               ;don't reset x here
.third_loop:
  LDA tool_grpx_RAM, x
  STA $2007
  INX
  CPX #$12
  BCC .third_loop

  RTS


;;;;;;;;;;;;;;
UndoMenu:
  LDA needdraw
  AND #%00100000
  BEQ .Assm_Perc_Drawing

  LDA #$24
  STA $2006
  LDA #$C0
  STA $2006
  LDY #$00
.tile_loop:
  LDA #$43
  STA $2007
  LDA #$44
  STA $2007
  LDA #$01
  STA $2007
  LDA #$32
  STA $2007
  INY
  CPY #$08
  BCC .tile_loop

  LDA needdraw
  AND #%11011111
  STA needdraw

  LDA #%10010000
  STA top_2000
  SEC
  JMP .rts  

.Assm_Perc_Drawing:
  CLC
.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
status_bar_graphics:
  .db $00,$00,$00,$F8,$E8,$F4,$F7,$EA,$00,$00,$F9,$6B,$6C,$6D,$00,$00
  .db $E6,$F8,$F8,$F2,$00,$00,$F9,$EE,$F2,$EA,$00,$D4,$D5,$00,$00,$00

  .db $00,$00,$00,$DC,$DC,$DC,$DC,$DC,$00,$00,$F1,$6E,$6F,$70,$00,$00
  .db $DC,$DC,$DC,$DB,$00,$00,$DC,$DC,$DC,$DC,$00,$DC,$DC,$00,$00,$00

  .db $00,$00,$45,$46,$4D,$4E,$4F,$50,$57,$57,$57,$57,$57,$57,$57,$57
  .db $57,$57,$57,$57,$57,$57,$57,$57,$57,$57,$57,$57,$49,$4A,$00,$00

  .db $00,$00,$47,$48,$51,$52,$53,$54,$58,$58,$58,$58,$58,$58,$58,$58
  .db $58,$58,$58,$58,$58,$58,$58,$58,$58,$58,$58,$58,$4B,$4C,$00,$00

pause_bar_graphics:
  .db $71,$72,$72,$72,$72,$72,$72,$72,$72,$72,$73,$73,$73,$73,$73,$73
  .db $73,$73,$73,$74,$71,$72,$72,$72,$72,$72,$73,$73,$73,$73,$73,$74
  .db $75,$76,$F9,$F4,$F4,$F1,$77,$F8,$EA,$F1,$EA,$E8,$F9,$77,$77,$77
  .db $77,$77,$78,$79,$75,$76,$77,$77,$77,$77,$77,$77,$77,$77,$78,$79
  .db $75,$80,$59,$5A,$5B,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77
  .db $77,$77,$77,$79,$75,$80,$77,$F7,$EA,$F8,$F9,$E6,$F7,$F9,$77,$79
  .db $75,$80,$5C,$5D,$5E,$77,$E6,$F3,$E6,$F1,$77,$F5,$F7,$F4,$E7,$EA
  .db $77,$77,$77,$79,$75,$80,$EA,$F3,$E9,$77,$EC,$E6,$F2,$EA,$77,$79
  .db $75,$7A,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77,$77
  .db $77,$77,$7B,$79,$75,$7A,$77,$77,$77,$77,$77,$77,$77,$77,$7B,$79

pause_bar_bottom:
  .db $7C,$7D,$7D,$7D,$7D,$7D,$7D,$7D,$7D,$7D,$7E,$7E,$7E,$7E,$7E,$7E
  .db $7E,$7E,$7E,$7F,$7C,$7D,$7D,$7D,$7D,$7D,$7E,$7E,$7E,$7E,$7E,$7F


radar_graphics_index:
  .dw left_arrow_on,right_arrow_on

left_arrow_on:
  .db $1F,$20,$02,$10, $1F,$21,$02,$18, $27,$22,$02,$10, $27,$23,$02,$18
right_arrow_on:
  .db $1F,$21,$42,$E0, $1F,$20,$42,$E8, $27,$23,$42,$E0, $27,$22,$42,$E8


glow_palette1:
  .db $1D,$39,$1A,$00
glow_palette2:
  .db $29,$1A,$39,$00
