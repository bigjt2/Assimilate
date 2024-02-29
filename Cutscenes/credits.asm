Credit_Support_Subs:
  JSR set_ship_sprites_params
  JSR Credits_autoscroll
  JMP CS_Support_Sub_Return


;;;;;;;;;;;;;;;
Init_Credits:
  LDA #STATE_CREDITS
  STA gamestate

  LDA #$00
  STA needdraw
  STA event_counter

  LDA #silence_song  
  STA current_song
  JSR sound_load

  LDA #$1B
  STA level

  LDA #credits_city_mt
  STA metatile_indx
  LDA #00
  STA frst_Background

  JSR CS_init_ppu
  JSR CS_clear_sprites

  LDA #%10010000
  STA soft_2000
  LDA #%00011110
  STA soft_2001

  JSR vblankwait
  JSR vblankwait

  LDA #$00
  STA skip_sprite0

  LDA #$00       ;inits for all the important pointers and flags
  STA CS_ptr
  STA CR_autoscroll_flag
  LDA #$01
  STA CS_Sup_flag
  LDA #$FF
  STA fade_timer
  STA CS_pic_ptr
  STA Ossan_x_targ

  LDA #LOW(Credit_Support_Subs)
  STA CS_Sup_Sub_Ptr
  LDA #HIGH(Credit_Support_Subs)
  STA CS_Sup_Sub_Ptr+1

  JMP Cutscene_return


;;;;;;;;;;;;;;;;;;;;;
Credits_StatusBar:
.init_statusbar_2000:
  LDA $2002
  LDA #$20
  STA $2006
  LDA #$00
  STA $2006

  LDY #$00
  LDA #$00
.init_statusbar_loop1:
  STA $2007
  INY
  CPY #$C0
  BCC .init_statusbar_loop1
  LDA #$77
.init_statusbar_loop2:
  STA $2007
  INY
  CPY #$E0
  BCC .init_statusbar_loop2
  LDA #$00                   ;this last part clears out the remnants of the
.init_statusbar_loop3:       ;picture's first row from the ending cutscene
  STA $2007
  INY
  CPY #$FF
  BCC .init_statusbar_loop3

.init_statusbar_2400:
  LDA $2002
  LDA #$24   
  STA $2006
  LDA #$00
  STA $2006
  LDY #$00
  LDA #$77
.init_statusbar_loop5:
  STA $2007
  INY
  CPY #$E0
  BCC .init_statusbar_loop5
  LDA #$00
.init_statusbar_loop6:
  STA $2007
  INY
  CPY #$01
  BNE .init_statusbar_loop6

.top_attributes:
  LDA #$23
  STA $2006
  LDA #$C0
  STA $2006
  LDY #$00
  LDA #$00
.attrib_loop:
  STA $2007
  INY
  CPY #$40
  BCC .attrib_loop

.top_attributes2:
  LDA #$27
  STA $2006
  LDA #$C0
  STA $2006
  LDY #$00
  LDA #$00
.attrib_loop2:
  STA $2007
  INY
  CPY #$40
  BCC .attrib_loop2

.Sprite0:
  LDA #$2F          ;y pos = dec 47
  STA $0200
  LDA #$00          ;tile
  STA $0201
  LDA #$23          ;attr = behind bg, palette 03
  STA $0202
  LDA #$80          ;x pos = dec 128
  STA $0203

  LDA #$00
  STA initializeSet

  LDA #%10010000
  STA top_2000

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;;;;
Credits_LoadNew_BG:
  LDA CS_pic_ptr         ;in this sub, pic_ptr is used to keep track of the column
  BMI .init              ;negative can only mean it's set to $FF
  JMP .tiles

.init:
  LDA #$00
  STA xScroll
  STA CS_pic_ptr

  LDY CS_ptr
  INY
  LDA [ptr1], y
  STA metatile_indx
  INY
  LDA [ptr1], y
  STA frst_Background

;;;;;;;
.tiles:
  LDA metatile_indx            ;set correct metatile table
  ASL A
  TAY
  LDA metatile_table_index, y
  STA ptr2
  LDA metatile_table_index+1, y
  STA ptr2+1

  LDA #$01
  STA initializeSet

  LDA CS_pic_ptr
  CMP #$10
  BCC .firstScreen
  JMP .secondScreen

.firstScreen:
  LDA frst_Background
  ASL A
  TAY
  LDX #$00
  LDA CS_CR_Backgrounds, y
  STA backgroundAddr
  LDA CS_CR_Backgrounds+1, y
  STA backgroundAddr+1   ;set to correct background
  LDA #$21               ;load high byte for first nametable
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
  LDA CS_CR_Backgrounds, y
  STA backgroundAddr
  LDA CS_CR_Backgrounds+1, y
  STA backgroundAddr+1   ;set to correct background
  LDA #$25               ;load high byte for second nametable
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
.fill_tile_buffer:
  JSR fill_offscreen_column

;;;;;;;;;;;;
.attributes:
  LDA #$00
  STA leftright

  LDA CS_pic_ptr
  CMP #$10
  BCC .attr_first_screen
  JMP .attr_second_screen

.attr_first_screen:
  LDA frst_Background
  ASL A
  TAY
  LDA CS_CR_Attributes, y
  STA attrAddr
  LDA CS_CR_Attributes+1, y
  STA attrAddr+1

  LDY #$00       ;the y variable becomes the high byte of attr address in the offscreen attribute sub
  LDA xScroll
  STA leftBufferLine
  JMP .attr_subs

.attr_second_screen:
  LDA frst_Background
  CLC
  ADC #$01
  ASL A
  TAY
  LDA CS_CR_Attributes, y
  STA attrAddr
  LDA CS_CR_Attributes+1, y
  STA attrAddr+1

  LDY #$01
  LDA xScroll
  STA leftBufferLine

.attr_subs:
  JSR fill_offscreen_attributes

.end_test:
  INC CS_pic_ptr
  LDA CS_pic_ptr
  CMP #$20
  BCC .continue_loading  
  JMP .done

.continue_loading:
  LDA xScroll
  CLC
  ADC #$10
  STA xScroll

  LDA #$00               ;set this back to 0 or load_offscreen_tiles won't
  STA initializeSet      ;inc the vram writes by 32

  LDA needdraw
  ORA #$01
  STA needdraw

  JMP .return_to_engine

.done:
  LDA #$FF
  STA CS_pic_ptr
  LDY CS_ptr
  INY
  INY
  INY
  STY CS_ptr

  LDA #$00               ;set this back to 0 or load_offscreen_tiles won't
  STA initializeSet      ;inc the vram writes by 32

  LDA needdraw
  ORA #$01
  STA needdraw

.return_to_engine:
  JMP Cutscene_return


;;;;;;;;;;;;;;;;;;;;;
CR_autoscroll_ON:
  INC CS_ptr
  LDA #$01
  STA CR_autoscroll_flag
.return_to_engine:
  JMP Cutscene_return


;;;;;;;;;;;;;;;;;;;;;
CR_autoscroll_OFF:
  INC CS_ptr
  LDA #$00
  STA CR_autoscroll_flag

  LDA #$00
  STA xScroll
  LDA soft_2000
  AND #$FE
  STA soft_2000

.return_to_engine:
  JMP Cutscene_return


;;;;;;;;;;;;;;;;;;;;
Credits_autoscroll:
  LDA CR_autoscroll_flag
  BEQ .rts
  LDA xScroll
  CLC
  ADC #$02
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


;;;;;;;;;;;;;;;;;;;;;;
CR_set_event_counter:

  LDY CS_ptr
  INY
  LDA [ptr1], y
  STA event_counter
  DEY
  DEY
  STY CS_ptr

.return_to_engine:
  JMP Cutscene_return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;CREDITS TEXT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Credits_Texts:
  .dw credits_eraseA,credits_eraseB,credits_eraseC,credits_eraseD
  .dw credits_text_00,credits_text_01,credits_text_02,credits_text_03
  .dw credits_text_04,credits_text_05,credits_text_06,credits_text_07
  .dw credits_text_08,credits_text_09,credits_text_10,credits_text_11
  .dw credits_text_12,credits_text_13,credits_text_14,credits_text_15
  .dw credits_text_16,credits_text_17,credits_text_18,credits_text_19
  .dw credits_text_20,credits_text_21,credits_text_22,credits_text_23


CR_eraseA = $00
CR_eraseB = $01
CR_eraseC = $02
CR_eraseD = $03

CR_text00 = $04
CR_text01 = $05
CR_text02 = $06
CR_text03 = $07
CR_text04 = $08
CR_text05 = $09
CR_text06 = $0A
CR_text07 = $0B
CR_text08 = $0C
CR_text09 = $0D
CR_text10 = $0E
CR_text11 = $0F
CR_text12 = $10
CR_text13 = $11
CR_text14 = $12
CR_text15 = $13
CR_text16 = $14
CR_text17 = $15
CR_text18 = $16
CR_text19 = $17
CR_text20 = $18
CR_text21 = $19
CR_text22 = $1A
CR_text23 = $1B


credits_eraseA:
  .db $01,$20,$40
  .db __,__,__,__,__,__,__,__,__,__,__,__,__,__,__,__
  .db __,__,__,__,__,__,__,__,__,__,__,__,__,__,__,__
  .db $02
credits_eraseB:
  .db $01,$20,$60
  .db __,__,__,__,__,__,__,__,__,__,__,__,__,__,__,__
  .db __,__,__,__,__,__,__,__,__,__,__,__,__,__,__,__
  .db $02
credits_eraseC:
  .db $01,$20,$80
  .db __,__,__,__,__,__,__,__,__,__,__,__,__,__,__,__
  .db __,__,__,__,__,__,__,__,__,__,__,__,__,__,__,__
  .db $02
credits_eraseD:
  .db $01,$20,$A0
  .db __,__,__,__,__,__,__,__,__,__,__,__,__,__,__,__
  .db __,__,__,__,__,__,__,__,__,__,__,__,__,__,__,__
  .db $02


credits_text_00:
  .db $01,$20,$86
  .db _A,__,_S,__,_S,__,_I,__,_M,__,_I,__,_L,__,_A,__,_T,__,_E
  .db $02

credits_text_01:
  .db $01,$20,$68
  .db _A,__,_N,_E,_S,_S,_Y,_L,_U,_M,__,_G,_A,_M,_E,_S
  .db $01,$20,$8B
  .db _P,_R,_O,_D,_U,_C,_T,_I,_O,_N
  .db $02

credits_text_02:
  .db $01,$20,$48
  .db _G,_A,_M,_E,__,_C,_O,_N,_C,_E,_P,_T,__,_A,_N,_D
  .db $01,$20,$68
  .db _M,_A,_I,_N,__,_P,_R,_O,_G,_R,_A,_M,_M,_I,_N,_G
  .db $02

credits_text_03:
  .db $01,$20,$8F
  .db _B,_Y
  .db $01,$20,$AB
  .db _J,_O,_H,_N,__,_W,_H,_I,_T,_E
  .db $02

credits_text_04:
  .db $01,$20,$69
  .db _M,_U,_S,_I,_C,__,_C,_O,_M,_P,_O,_S,_E,_D
  .db $01,$20,$8F
  .db _B,_Y
  .db $02

credits_text_05:
  .db $01,$20,$A8
  .db _C,_O,_M,_P,_U,_T,_E,_R,_I,_Z,_A,_T,_I,_O,_N
  .db $02

credits_text_06:
  .db $01,$20,$4B
  .db _S,_O,_U,_N,_D,__,_E,_N,_G,_I,_N,_E
  .db $01,$20,$6E
  .db _W,_R,_I,_T,_T,_E,_N
  .db $02

credits_text_07:
  .db $01,$20,$8F
  .db _B,_Y
  .db $01,$20,$AB
  .db _T,_H,_O,_M,_A,_S,__,_H,_J,_E,_L,_M
  .db $02

credits_text_08:
  .db $01,$20,$4A
  .db _A,_R,_T,_W,_O,_R,_K,COMA,__,_S,_F,_X,COMA
  .db $01,$20,$6A
  .db _W,_I,_T,_T,_Y,__,_W,_R,_I,_T,_I,_N,_G
  .db $02

credits_text_09:
  .db $01,$20,$8F
  .db _B,_Y
  .db $01,$20,$AB
  .db _J,_O,_H,_N,__,_W,_H,_I,_T,_E
  .db $02

credits_text_10:
  .db $01,$20,$4A
  .db _B,_E,_T,_A,__,_T,_E,_S,_T,_E,_R,_S,COLN
  .db $01,$20,$6A
  .db _B,_R,_A,_D,__,_B,_A,_T,_E,_M,_A,_N
  .db $02

credits_text_11:
  .db $01,$20,$8A
  .db _D,_E,_R,_E,_K,__,_A,_N,_D,_R,_E,_W,_S
  .db $01,$20,$AA
  .db _R,_O,_S,_S,__,_B,_U,_R,_D,_G,_E
  .db $02

credits_text_12:
  .db $01,$20,$4A
  .db _B,_E,_T,_A,__,_T,_E,_S,_T,_E,_R,_S,COLN
  .db $01,$20,$6A
  .db _P,_A,_U,_L,__,_S,_E,_R,_G,_E,_A,_N,_T
  .db $02

credits_text_13:
  .db $01,$20,$8A
  .db _R,_A,_N,_D,_Y,__,_K,_O,_R,_U,_S,_C,_H,_A,_K
  .db $01,$20,$AA
  .db _J,_C,_F,__,_H,_E,_R,_B,_A,_L,_I,_S,_T
  .db $02

credits_text_14:
  .db $01,$20,$48
  .db _S,_P,_E,_C,_I,_A,_L,__,_T,_H,_A,_N,_K,_S,COLN
  .db $02

credits_text_15:
  .db $01,$20,$62
  .db _D,_E,_R,_E,_K,__,_A,_N,_D,_R,_E,_W,_S,__,__,_J,_O,_E,_Y,__,_P,_A,_R,_S,_E,_L,_L
  .db $02

credits_text_16:
  .db $01,$20,$82
  .db _T,_H,_O,_M,_A,_S,__,_H,_J,_E,_L,_M,__,__,__,_B,_R,_I,_A,_N,__,_P,_A,_R,_K,_E,_R
  .db $02

credits_text_23:
  .db $01,$20,$A8
  .db _M,_I,_C,_H,_A,_E,_L,__,_S,_W,_A,_N,_S,_O,_N
  .db $02

credits_text_17:
  .db $01,$20,$6A
  .db _A,_N,_D,__,_T,_H,_A,_N,_K,__,_Y,_O,_U
  .db $01,$20,$8B
  .db _F,_O,_R,__,_P,_L,_A,_Y,_I,_N,_G,EXCL
  .db $02

credits_text_18:
  .db $01,$20,$AB
  .db __
  .db $02

credits_text_19:
  .db $01,$20,$6A
  .db _A,_S,_S,_I,_M,_I,_L,_A,_T,_E
  .db $01,$20,$88
  .db _C,_O,_P,_Y,_R,_I,_G,_H,_T, __, _2,_0,_1,_2
  .db $02

credits_text_20:
  .db $01,$20,$A8
  .db _N,_E,_S,_S,_Y,_L,_U,_M,__,_G,_A,_M,_E,_S
  .db $02

credits_text_21:
  .db $01,$20,$88
  .db _P,_R,_E,_S,_S,__,_S,_T,_A,_R,_T,__,_T,_O
  .db $02

credits_text_22:
  .db $01,$20,$A7
  .db _C,_O,_N,_T,_I,_N,_U,_E,__,_P,_L,_A,_Y,_I,_N,_G,DOT
  .db $02
