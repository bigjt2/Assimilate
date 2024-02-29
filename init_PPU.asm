init_ppu:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Soft PPU settings for turning off screen/loading new bg's
;;;;;;;;;;;;;;;
  JSR blackout     ;trigger a blackout and wait for NMI to black it out
  LDA #$01
  STA skip_sprite0

  JSR vblankwait
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
Init_Tiles:

  LDA #%10010100   ; keep NMI enabled, sprites from Pattern Table 0, background from Pattern Table 1, inc VRAM writes by 32
  STA soft_2000
  JSR vblankwait
  JSR vblankwait

.tiles_next:
  LDA #$00
  STA xScroll
  STA init_backgrounds

  LDA metatile_indx            ;set correct metatile table
  ASL A
  TAY
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
  LDA background_index, y
  STA backgroundAddr
  LDA background_index+1, y
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
  LDA background_index, y
  STA backgroundAddr
  LDA background_index+1, y
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

.tile_subs:
  JSR fill_offscreen_column
  JSR load_offscreen_tiles

.wait_test:              ;this is meant to give the whole loading routine time to breathe.
  LDA init_backgrounds   ;loading 32 columns between two screens takes up more than one frame,
  CMP #$08               ;so NMI was interrupting and occasionally causing weird stuff to be written
  BEQ .wait              ;on the backgbround.  however, doing a wait every column makes it take too
  CMP #$10               ;long to load for my liking.
  BEQ .wait
  CMP #$18
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
  BCS .comp_20
  JMP .firstScreen
.comp_20:
  LDA init_backgrounds
  CMP #$20
  BCS init_attributes
  JMP .secondScreen


;;;;;;;;;;;;;;;;;;;;;;;;
init_attributes:

  LDA #%10010000   ; keep NMI enabled, sprites from Pattern Table 0, background from Pattern Table 1, restore VRAM increments to 1
  STA soft_2000
  JSR vblankwait
  JSR vblankwait
  JMP .attr_next

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
  LDA attribute_index, y
  STA attrAddr
  LDA attribute_index+1, y
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
  LDA attribute_index, y
  STA attrAddr
  LDA attribute_index+1, y
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
  BCS init_statusbar_2000
  JMP .attr_second_screen


;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;
init_statusbar_2000:
  LDA $2002
  LDA #$20
  STA $2006
  LDA #$00
  STA $2006

  LDY #$00
init_statusbar_loop1:
  LDA #$00
  STA $2007
  INY
  CPY #$40
  BCC init_statusbar_loop1

  LDY #$00
init_statusbar_loop2:
  LDA status_bar_graphics, y
  STA $2007
  INY
  CPY #$80
  BCC init_statusbar_loop2

  LDY #$00
init_statusbar_loop3:
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
  BCC init_statusbar_loop3

  LDY #$00
init_statusbar_loop4:
  LDA #$00
  STA $2007
  INY
  CPY #$20
  BCC init_statusbar_loop4



init_statusbar_2400:
  LDA $2002
  LDA #$24   
  STA $2006
  LDA #$00
  STA $2006
  LDY #$00
init_statusbar_loop5:
  LDA #$00
  STA $2007
  INY
  CPY #$20
  BCC init_statusbar_loop5

  LDY #$00
init_statusbar_loop6:
  LDA pause_bar_graphics, y
  STA $2007
  INY
  CPY #$A0
  BCC init_statusbar_loop6

  LDY #$00
init_statusbar_loop7
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
  BCC init_statusbar_loop7

  LDY #$00
init_statusbar_loop8:
  LDA #$00
  STA $2007
  INY
  CPY #$20
  BCC init_statusbar_loop8


Sprite0:
  LDA #$2F          ;y pos = dec 47
  STA $0200
  LDA #$00          ;tile
  STA $0201
  LDA #$23          ;attr = behind bg, palette 03
  STA $0202
  LDA #$80          ;x pos = dec 128
  STA $0203

.Assm_Speed:
  LDA #$00
  STA assm_speed
  JSR FillAssmSpeed
  JSR LoadAssmSpeed

  LDA #$00
  STA initializeSet

  LDA #%10010000
  STA top_2000

.Campout_bogus_test:
  LDA bonus_active
  CMP #$F0
  BNE .rts
  JSR Load_Special_Campout_Txt

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;;;;
Init_Palettes:
  LDA needdraw
  ORA #%01000000
  STA needdraw

  JSR bank_backup_pal

.background:
  LDA level
  ASL A
  TAY
  LDA bg_palette_index, y
  STA ptr1
  LDA bg_palette_index+1, y
  STA ptr1+1

.LoadPalettes:   
  LDY #$00
.Load_BG_PalettesLoop:
  LDA [ptr1], y
  STA pal_RAM, y             
  INY
  CPY #$10
  BNE .Load_BG_PalettesLoop

.sprite_palette:
  LDA level
  ASL A
  TAY
  LDA sp_palette_index, y
  STA ptr1
  LDA sp_palette_index+1, y
  STA ptr1+1

  LDX #$10
  LDY #$00
.Load_SP_PalettesLoop:
  LDA [ptr1], y
  STA pal_RAM, x
  INX
  INY
  CPY #$20
  BNE .Load_SP_PalettesLoop

  LDA #$FF
  STA pal_RAM, y

  JSR bank_restore_pal   ;restore to level/boss bank if level is starting up

  RTS