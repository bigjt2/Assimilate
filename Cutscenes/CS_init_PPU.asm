CS_init_ppu:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Soft PPU settings for turning off screen/loading new bg's
;;;;;;;;;;;;;;;
  JSR blackout     ;trigger a blackout and wait for NMI to black it out
  LDA #$01
  STA skip_sprite0

  JSR vblankwait   ;SP = FB
  JSR vblankwait
  JSR vblankwait
  JSR vblankwait

  LDA #%10010000   ;enable NMI, sprites from PT0, bg from PT1, inc VRAM addr by 1, nametable $2000
  STA soft_2000
  LDA #%00000110   ;disable sprites & bg, allow clipping
  STA soft_2001

  JSR erase_sprites
  JSR vblankwait

;;;;;;;;;;;;;;;;;;;;;;;;
.Init_Tiles:

  LDA #%10010100   ; keep NMI enabled, sprites from Pattern Table 0, background from Pattern Table 1, inc VRAM writes by 32
  STA soft_2000
  JSR vblankwait
  JSR vblankwait

.tiles_next:
  LDA #$00
  STA xScroll
  STA init_backgrounds

  LDA #$0A     ;in this init, we will ALWAYS use this metatile table.
  ASL A        ;i only need it to draw the blank screen.  it's located in
  TAY          ;CS_background, labeled as metatile_bullshit
  LDA metatile_table_index, y
  STA ptr2
  LDA metatile_table_index+1, y
  STA ptr2+1

  LDA #$01
  STA initializeSet

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


.begin:

  LDY xScroll            ;find low byte for column
  LDA Offscreen_buffer_lo_table, y

  STA bg_RAM, x          ;store low byte for left half of column in buffer
  INX
  CLC
  ADC #$01
  STA bg_RAM, x          ;store low byte for right half of column in buffer

.tile_subs:
  JSR fill_offscreen_column
  JSR load_offscreen_tiles

.wait_test:
  LDA init_backgrounds
  CMP #$08               ;this is essentially the same as in init_PPU, but two less waits are used.
  BEQ .wait
  JMP .comp_10
.wait:
  JSR vblankwait

.comp_10:
  CLC
  LDA xScroll
  ADC #$10
  STA xScroll
  INC init_backgrounds
  LDA init_backgrounds
  CMP #$10
  BCC .firstScreen


;;;;;;;;;;;;;;;;;;;;;;;;
.init_attributes:

  LDA #%10010000   ; keep NMI enabled, sprites from Pattern Table 0, background from Pattern Table 1, restore VRAM increments to 1
  STA soft_2000
  JSR vblankwait
  JSR vblankwait

.attr_next:
  LDA #$00
  STA xScroll
  STA leftright
  STA init_backgrounds

;;;;;;;;;;;;;;;;;;;;;;;;;
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
  BCC .attr_first_screen


.Credits_Test:
  LDA gamestate
  CMP #STATE_CREDITS
  BNE .init_statusbar_2000
  JMP Credits_StatusBar


;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;
.init_statusbar_2000:
  LDA $2002
  LDA #$20
  STA $2006
  LDA #$00
  STA $2006

  LDY #$00
  LDA #$01
.init_statusbar_loop1:
  STA $2007
  INY
  CPY #$40
  BCC .init_statusbar_loop1
  LDA #$00
.init_statusbar_loop2:
  STA $2007
  INY
  CPY #$E0
  BCC .init_statusbar_loop2

.init_statusbar_2400:
  LDA $2002
  LDA #$24   
  STA $2006
  LDA #$00
  STA $2006
  LDY #$00
.init_statusbar_loop5:
  LDA #$01
  STA $2007
  INY
  CPY #$E0
  BCC .init_statusbar_loop5


.Sprite0:
  LDA #$00          ;y pos
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