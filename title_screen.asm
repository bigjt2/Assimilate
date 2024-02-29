;;;;;;;;;;;;;
Title_Screen:

.splash_screen:
  JSR Counter_Manager
  LDA event_counter
  CMP #$03
  BCC .rts
  LDA #$FF
  STA xScroll

.title_screen:
  JSR ReadController
  LDA select_level
  AND #$80
  BEQ .button_combo

  JSR Stage_Select
  JMP .rts

.button_combo:
  JSR Title_buttoncombo

.Start_Button:
  LDA buttons_new
  AND #%00010000
  BEQ .rts
  JMP StartGame

.rts
  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;;
Title_onscreen_drawing:
  LDA onscreen_flag
  CMP #onscreen_text
  BNE .reset_needdraw

  JSR Load_Text

.reset_needdraw:
  LDA needdraw
  AND #$7F
  STA needdraw
  LDA #onscreen_nothing
  STA onscreen_flag

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;
Title_buttoncombo:

  LDY combo_ptr
  LDA button_combo_sequence, y
  CMP #$FF
  BEQ .success

  LDA buttons_new
  CMP #$00
  BEQ .rts
  CMP button_combo_sequence, y
  BNE .reset
  INY
  STY combo_ptr
  JMP .rts

.reset:
  LDY #$00
  STY combo_ptr
  JMP .rts

.success:
  LDA #$80
  STA select_level

  LDX #$00
  LDA #LOW(StageSelectText)
  STA onscreen_buffer, x
  LDA #HIGH(StageSelectText)
  STA onscreen_buffer+1, x

  LDA #onscreen_text
  STA onscreen_flag

  LDA #score_sfx
  STA current_song
  JSR sound_load

.rts:
  RTS


button_combo_sequence:
;  .db SS_A, SS_B, SS_A, SS_B, SS_UP, SS_DN, SS_SUCCESS  ;orignal code
  .db SS_DN, SS_DN, SS_UP, SS_UP, SS_RT, SS_LT           ;new code = reverse Konami code
  .db SS_RT, SS_LT, SS_A, SS_B, SS_SUCCESS

SS_A=$80
SS_B=$40
SS_SEL=$20
SS_STR=$10
SS_UP=$08
SS_DN=$04
SS_LT=$02
SS_RT=$01
SS_SUCCESS=$FF


;;;;;;;;;;;;;;;;;
Stage_Select:

  LDA select_level
  AND #$7F
  STA temp1

.Up:
  LDA buttons_new
  AND #%00001000
  BEQ .Down
  LDA temp1
  CMP #$17        ;;CURRENT MAX
  BEQ .set_00
  INC temp1
  JMP .draw_new_level
.set_00:
  LDA #$00
  STA temp1
  JMP .draw_new_level

.Down:
  LDA buttons_new
  AND #%00000100
  BEQ .Start_Button
  LDA temp1
  CMP #$00
  BEQ .set_max
  DEC temp1
  JMP .draw_new_level
.set_max:
  LDA #$17        ;;CURRENT MAX
  STA temp1
  JMP .draw_new_level

.Start_Button:
  LDA buttons_new
  AND #%00010000
  BEQ .rts

.Start:
  LDY temp1
  LDA Title_level_index, y
  STA level_index
  JMP StartGame

.draw_new_level:
  LDA select_level
  AND #$80
  ORA temp1
  STA select_level

  LDA temp1
  ASL A
  TAY
  LDX #$00
  LDA LevelsText, y
  STA onscreen_buffer, x
  LDA LevelsText+1, y
  STA onscreen_buffer+1, x

  LDA #onscreen_text
  STA onscreen_flag

.rts:
  RTS


;;;;;;;;;;;;;;;;;
StartGame:

  LDA #$00
  STA event_counter
  STA s_ones
  STA s_tens
  STA s_hundr
  STA s_thous
  STA s_tthou
  STA a_ones
  STA a_tens
  STA a_hundr
  STA t_ones
  STA t_tens
  STA t_hundr
  STA t_thous

  LDA #$03
  STA lives
  JSR ConvertLives

  LDA counter
  STA rand_h

  LDA #$01             ;then prepare nmi settings and turn screen off
  STA skip_sprite0
  LDA #%00000110       ;disable sprites & bg, allow clipping
  STA soft_2001
  JSR vblankwait       ;wait for NMI to clean things up
  JSR vblankwait       ;might still have an $2002 overflow flag miss every once in awile

  LDA #STATE_LVL_CHG
  STA gamestate
  JMP GameEngine


;;;;;;;;;;;;;;;;;;;;;;
LevelsText:
  .dw ss_lvl1,ss_lvl2,ss_lvl3,ss_lvl4,ss_boss1
  .dw ss_lvl6,ss_lvl7,ss_lvl8,ss_lvl9,ss_lvl10,ss_boss2
  .dw ss_lvl12,ss_lvl13,ss_lvl14,ss_lvl15,ss_lvl16,ss_boss3
  .dw ss_lvl18,ss_lvl19,ss_lvl20,ss_lvl21,ss_boss4,ss_boss_final
  .dw ss_credits

ss_lvl1:
  .db $01,$26,$CC
  .db __,_L,_E,_V,_E,_L,__,_0,_1,__, $02
ss_lvl2:
  .db $01,$26,$CC
  .db __,_L,_E,_V,_E,_L,__,_0,_2,__, $02
ss_lvl3:
  .db $01,$26,$CC
  .db __,_L,_E,_V,_E,_L,__,_0,_3,__, $02
ss_lvl4:
  .db $01,$26,$CC
  .db __,_L,_E,_V,_E,_L,__,_0,_4,__, $02
ss_boss1:
  .db $01,$26,$CC
  .db __,__,_B,_O,_S,_S,__,_1,__,__, $02
ss_lvl6:
  .db $01,$26,$CC
  .db __,_L,_E,_V,_E,_L,__,_0,_6,__, $02
ss_lvl7:
  .db $01,$26,$CC
  .db __,_L,_E,_V,_E,_L,__,_0,_7,__, $02
ss_lvl8:
  .db $01,$26,$CC
  .db __,_L,_E,_V,_E,_L,__,_0,_8,__, $02
ss_lvl9:
  .db $01,$26,$CC
  .db __,_L,_E,_V,_E,_L,__,_0,_9,__, $02
ss_lvl10:
  .db $01,$26,$CC
  .db __,_L,_E,_V,_E,_L,__,_1,_0,__, $02
ss_boss2:
  .db $01,$26,$CC
  .db __,__,_B,_O,_S,_S,__,_2,__,__, $02
ss_lvl12:
  .db $01,$26,$CC
  .db __,_L,_E,_V,_E,_L,__,_1,_2,__, $02
ss_lvl13:
  .db $01,$26,$CC
  .db __,_L,_E,_V,_E,_L,__,_1,_3,__, $02
ss_lvl14:
  .db $01,$26,$CC
  .db __,_L,_E,_V,_E,_L,__,_1,_4,__, $02
ss_lvl15:
  .db $01,$26,$CC
  .db __,_L,_E,_V,_E,_L,__,_1,_5,__, $02
ss_lvl16:
  .db $01,$26,$CC
  .db __,_L,_E,_V,_E,_L,__,_1,_6,__, $02
ss_boss3:
  .db $01,$26,$CC
  .db __,__,_B,_O,_S,_S,__,_3,__,__, $02
ss_lvl18:
  .db $01,$26,$CC
  .db __,_L,_E,_V,_E,_L,__,_1,_8,__, $02
ss_lvl19:
  .db $01,$26,$CC
  .db __,_L,_E,_V,_E,_L,__,_1,_9,__, $02
ss_lvl20:
  .db $01,$26,$CC
  .db __,_L,_E,_V,_E,_L,__,_2,_0,__, $02
ss_lvl21:
  .db $01,$26,$CC
  .db __,_L,_E,_V,_E,_L,__,_2,_1,__, $02
ss_boss4:
  .db $01,$26,$CC
  .db __,__,_B,_O,_S,_S,__,_4,__,__, $02
ss_boss_final:
  .db $01,$26,$CC
  .db _F,_I,_N,_A,_L,__,_B,_O,_S,_S, $02
ss_credits:
  .db $01,$26,$CC
  .db __,__,_C,_R,_E,_D,_I,_T,_S,__,__, $02


TitleText:
  .db $01,$26,$6C
  .db _P,_R,_E,_S,_S, __, _S,_T,_A,_R,_T
  .db $01,$27,$29
  .db $C7,__,_2,_0,_1,_2,__,_N,_E,_S,_S,_Y,_L,_U,_M
  .db $02


StageSelectText:
  .db $01,$26,$AB
  .db _S,_T,_A,_G,_E, __, _S,_E,_L,_E,_C,_T
  .db $01,$26,$CD
  .db _L,_E,_V,_E,_L,__,_0,_1
  .db $02


Title_level_index:    ;reference level_startups for appropriate numbers
  .db $00, $02, $04, $06, $08             ;;level 1-4, 1st boss
  .db $0C, $0E, $10, $12, $14, $16        ;;level 6-10, 2nd boss
  .db $1A, $1C, $1E, $20, $22, $24        ;;level 12-16, 3rd boss
  .db $28, $2A, $2C, $2E, $30, $32        ;;level 18-21, final boss, final-final boss
  .db $36                                 ;;credits


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

title_draw:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Soft PPU settings for turning off screen/loading new bg's
;;;;;;;;;;;;;;;
  LDA #$01
  STA skip_sprite0
  LDA #$00
  STA select_level
  STA combo_ptr

;;;;;;;;;;;;;;;;;;;;;;;;
.palettes:

;  JSR bank_backup_pal

.background:
  LDA #LOW(bg_palette_spltit)
  STA ptr1
  LDA #HIGH(bg_palette_spltit)
  STA ptr1+1

.LoadPalettes:
  LDA $2002
  LDA #$3F
  STA $2006     
  LDA #$00
  STA $2006      
  LDY #$00
.Load_BG_PalettesLoop:
  LDA [ptr1], y
  STA $2007             
  INY                   
  CPY #$10
  BNE .Load_BG_PalettesLoop

.sprite_palette:
  LDA #LOW(sp_palette00)
  STA ptr1
  LDA #HIGH(sp_palette00)
  STA ptr1+1

  LDY #$00
.Load_SP_PalettesLoop:
  LDA [ptr1], y
  STA $2007             
  INY                   
  CPY #$10
  BNE .Load_SP_PalettesLoop

;  JSR bank_restore_pal   ;restore to level/boss bank if level is starting up

;;;;;;;;;;;;;;;;;;;;;;;;
.tiles:

.tiles_boot:
  LDA #%00010100   ; keep NMI disabled, sprites from Pattern Table 0, background from Pattern Table 1, inc VRAM writes by 32
  STA $2000

.tiles_next:
  LDA #$00
  STA xScroll
  STA init_backgrounds

  LDA #LOW(metatiles_SplTit)
  STA ptr2
  LDA #HIGH(metatiles_SplTit)
  STA ptr2+1

.firstScreen:
  LDX #$00
  LDA #LOW(background_spl)
  STA backgroundAddr
  LDA #HIGH(background_spl)
  STA backgroundAddr+1   ;set to correct background

  LDA #$20               ;load high byte for first nametable
  STA bg_RAM, x          ;store that data in the first byte of buffer
  INX

  JMP .begin

.secondScreen:
  CLC
  LDA frst_Background
  ADC #$01
  ASL A
  TAY

  LDX #$00
  LDA #LOW(background_tit)
  STA backgroundAddr
  LDA #HIGH(background_tit)
  STA backgroundAddr+1   ;set to correct background

  LDA #$24               ;load high byte for second nametable
  STA bg_RAM, x          ;store that data in the first byte of buffer
  INX


.begin:
  LDY xScroll            ;find low byte for column
  LDA Offscreen_buffer_lo_table, y
  STA bg_RAM, x          ;store low byte for left half of column in buffer
  INX
  CLC
  ADC #$01
  STA bg_RAM, x          ;store low byte for right half of column in buffer

  JSR fill_offscreen_column_title
  JSR load_offscreen_tiles_title

.comp_10:   ;c0bb
  CLC
  LDA xScroll
  ADC #$10
  STA xScroll
  INC init_backgrounds
  LDA init_backgrounds
  CMP #$10
  BCS .comp_20
  JMP .firstScreen
.comp_20:
  LDA init_backgrounds
  CMP #$20
  BCS .attributes
  JMP .secondScreen


;;;;;;;;;;;;;;;;;;;;;;;;
.attributes:

.attr_boot:        ; GET IT?!!?
  LDA #%00010000   ; keep NMI disabled, sprites from Pattern Table 0, background from Pattern Table 1
  STA $2000
  LDA #$00
  STA xScroll
  STA init_backgrounds

;;;;;;;;;;;;;;;;;;;;;;;;;
.attr_first_screen:

  LDA #LOW(attrib_spl)
  STA attrAddr
  LDA #HIGH(attrib_spl)
  STA attrAddr+1

  LDY #$00       ;the y variable becomes the high byte of attr address in the offscreen attribute sub
  LDA xScroll
  STA leftBufferLine
  JMP .attr_subs

.attr_second_screen:

  LDA #LOW(attrib_tit)
  STA attrAddr
  LDA #HIGH(attrib_tit)
  STA attrAddr+1

  LDY #$01
  LDA xScroll
  STA leftBufferLine
  JMP .attr_subs

.attr_subs:
  JSR fill_offscreen_attributes
  JSR load_offscreen_attributes

.first_attr:
  CLC
  LDA xScroll
  ADC #$20
  STA xScroll
  INC init_backgrounds
  LDA init_backgrounds
  CMP #$08
  BCS .second_attr
  JMP .attr_first_screen
.second_attr:
  LDA init_backgrounds
  CMP #$10
  BCS .rts
  JMP .attr_second_screen

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;;;
fill_offscreen_column_title:

;Top six rows of screen are status bar, so this starts writing at $C0

;[byte 0 = high byte][bytes 1,2 = low byte for left and right half of column]
;[bytes 3-33 = 30 bg tiles, making left half of the column]
;[bytes 33-63 = 30 more bg tiles, making up the right half of column]

.bg_tiles:
  LDY xScroll
  LDA Offscreen_buffer_lo_table, y  
  TAY

.next1:
  LDA [backgroundAddr], y
  STA ptr1
  INY
  LDA [backgroundAddr], y
  STA ptr1+1            ;set to correct column

.column:
  LDY #$00      ;pointer is set, reset y
  LDX #$00
  STX loop_counter  ;reset loop_counter variable

.column_loop:
  LDA loop_counter
  CMP #$0F          ;test that we've looped 15 times
  BCS .rts

  LDA [ptr1], y
  AND #%10000000    ;look at bit 7 for RLE test bit
  BEQ .column_next  ;if 0, don't go to RLE, if 1, jump to RLE
  JSR RLE_title
  JMP .column_loop

.column_next:
  TYA
  PHA
  LDA [ptr1], y
  ASL A
  TAY

  LDA [ptr2], y          ;from set_background_addresses sub, ptr2 is the metatile table to load from
  STA metatile_ptr
  INY
  LDA [ptr2], y
  STA metatile_ptr+1     ;set to correct metatile

  LDY #$00
  LDA [metatile_ptr], y
  STA bg_RAM+3, x        ;upper left of metatile
  INY
  LDA [metatile_ptr], y
  STA bg_RAM+33, x       ;upper right of metatile
  INY
  INX
  LDA [metatile_ptr], y
  STA bg_RAM+3, x        ;lower left of metatile
  INY
  LDA [metatile_ptr], y
  STA bg_RAM+33, x       ;lower right of metatile
  INX

  INC loop_counter

  PLA
  TAY
  INY

  JMP .column_loop

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;;;
load_offscreen_tiles_title:
  LDY #$00
.left:
  LDA bg_RAM, y
  STA $2006  ;write the high byte
  INY

  LDA bg_RAM, y
  STA $2006  ;write the low byte
  INY
  INY        ;increment y twice, skipping low byte for right half of 2x26 tile column

.left_loop
  LDA bg_RAM, y
  STA $2007  ;load the tile
  INY
  
  CPY #$21  ;compare to decimal 33, high byte, low byte, skipped low byte, followed by 33 bytes for the tile numbers
  BCC .left_loop

  LDY #$00
.right:
  LDA bg_RAM, y
  STA $2006  ;write the high byte
  INY
  INY        ;increment y twice, skipping low byte for left half of 2x26 tile column

  LDA bg_RAM, y
  STA $2006  ;write the low byte
  INY

.pre_right_loop:
  LDY #$21   ; set y to decimal 33, so it loads from correct position of bg_RAM
.right_loop
  LDA bg_RAM, y
  STA $2007  ;load the tile
  INY
  
  CPY #$3F  ;compare to decimal 63, high byte, skipped low byte, low byte, skipped 33 tiles, followed by 33 bytes for the tile numbers
  BCC .right_loop

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;;;
RLE_title:
  TYA
  PHA                    ;push current y to stack, so we hold position on background.i when returning to main loop
  LDA [ptr1], y          
  AND #%01111111         ;AND to extract the number of times to load metatile
  PHA                    ;transfer the value to stack for later
  INY
  LDA [ptr1], y          ;load the metatile number
  ASL A                  ;multiply by two
  TAY                    ;transfer to use for metatile pointer

  LDA [ptr2], y
  STA metatile_ptr
  INY
  LDA [ptr2], y
  STA metatile_ptr+1     ;set to correct metatile

.RLE_loop:

  LDY #$00
  LDA [metatile_ptr], y
  STA bg_RAM+3, x        ;upper left of metatile
  INY
  LDA [metatile_ptr], y
  STA bg_RAM+33, x       ;upper right of metatile
  INY
  INX
  LDA [metatile_ptr], y
  STA bg_RAM+3, x        ;lower left of metatile
  INY
  LDA [metatile_ptr], y
  STA bg_RAM+33, x       ;lower right of metatile
  INX

  INC loop_counter

  PLA      ;pull number of times to load from stack
  SEC
  SBC #$01 ;decrement that value by one
  CMP #$00
  BEQ .rts
  PHA      ;push number of times to load back to stack
  JMP .RLE_loop

.rts:
  PLA      ;pull original y value from stack
  TAY
  INY
  INY      ;increment y twice, so it skips to correct byte on background.i when returning to main loop

  RTS