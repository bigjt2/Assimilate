set_curr_next_prev_bg:
;set_curr_next_prev_bg will increment/decrement/maintain previous and 
;next background or previous background to be rendered depending on xScroll 
;in comparison to the buffer lines.

  LDA xScroll
  CMP rightBufferLine
  BCC .right_render_next
.right_render_after_next:
  CLC
  LDA curr_Background
  ADC #$02
  STA next_Background
  JMP .next
.right_render_next:
  CLC
  LDA curr_Background
  ADC #$01
  STA next_Background

.next:
  LDA xScroll
  CMP leftBufferLine
  BCC .left_render_previous
.left_render_current:
  LDA curr_Background
  STA prev_Background
  JMP .rts
.left_render_previous:
  SEC
  LDA curr_Background
  SBC #$01
  STA prev_Background

.rts:
  RTS

;;;;;;;;;;;;;;;;;;;;;;;;;;;
set_background_addresses:

;set_background_addresses sets two pointers to be used later, backgroundAddr and attrAddr.
;These pointers will be used to determine which background/attribute table in background.i
;the buffer is loading from.

  LDA leftright
  CMP #$01
  BCC .load_previous
.load_next:
  LDA next_Background
  ASL A
  TAY
  JMP .next
.load_previous:
  LDA prev_Background
  ASL A
  TAY
.next:
  LDA background_index, y
  STA backgroundAddr
  LDA background_index+1, y
  STA backgroundAddr+1

  LDA attribute_index, y
  STA attrAddr
  LDA attribute_index+1, y
  STA attrAddr+1

  LDA metatile_indx
  ASL A
  TAY
  LDA metatile_table_index, y
  STA ptr2
  LDA metatile_table_index+1, y
  STA ptr2+1

  RTS

;;;;;;;;;;;;;;;;;;;;;;;;;;;
column_test:
  JSR find_offscreen_column

  CMP last_col
  BEQ .no_column

  STA last_col  ;if current column is different, update the last_col variable
  LDA needdraw  ;and set the column flag in needdraw to 1
  ORA #%00000001
  STA needdraw
  JMP .rts

.no_column:
  LDA needdraw    ;if current cap is the same, keep last_col unchanged
  AND #%11111110  ;and set column flag in needdraw to 0
  STA needdraw
.rts
  RTS

;;;;;;;;;;;;;;;;;;;;;;;;;;;
fill_offscreen_column:

;Top six rows of screen are status bar, so this starts writing at $C0

;[byte 0 = high byte][bytes 1,2 = low byte for left and right half of column]
;[bytes 3-25 = 22 bg tiles, making left half of the column]
;[bytes 25-47 = 22 more bg tiles, making up the right half of column]

.bg_highbyte:

  LDA initializeSet  ;if initialization is running, skip this first section
  CMP #$01           ;as high byte and low byte must be set differently
  BEQ .bg_tiles      ;while the first two screens are loading in init

  LDA leftright      ;the next fourteen lines caluclate which nametable to draw to
  CMP #$01
  BCC .left
.right:
  LDX xScroll
  CPX #$D0    ;compare to decimal 208
  BCS .this_nametable
  JMP .pull_nametableNum
.left:
  LDX xScroll
  CPX #$30    ;compare to decimal 48
  BCS .this_nametable

.pull_nametableNum:
  LDA nametableNum    ;0=$2000, 1=$2400
  EOR #%00000001      ;flip value in nametableNum, so it draws on opposite nametable
  JMP .next

.this_nametable:
  LDA nametableNum    ;0=$2000, 1=$2400

.next:                ;pull the address high byte
  CMP #$01
  BCC .store20
.store24:             ;need to start drawomg at $2500, so high byte will be #$24 for entire column
  LDA #$25
  STA bg_RAM
  JMP .bg_lowbyte
.store20:
  LDA #$21            ;need to start drawomg at $2100, so high byte will be #$25 for entire column
  STA bg_RAM

.bg_lowbyte:          ;two low bytes need stored, one for the topmost tile on left half of column, the other for topmost tile on right half of column

  JSR find_offscreen_column    ;pull first low address depending on xScroll
;  CLC
;  ADC #$E0                    ;add decimal 224 so buffer starts drawing four rows from top of screen
  STA bg_RAM+1                 ;as to allow room for the status bar which is drawn in Init_PPU.asm
  CLC
  ADC #$01                     ;add 1 to first PPU low byte value, for the address of the right half of 2x28 tile column
  STA bg_RAM+2                 ;store it in bg_RAM

.bg_tiles:

  LDA initializeSet
  CMP #$01
  BCC .not_init         ;skip to regular pointer set up if initialization isn't running

  LDY xScroll
  LDA Offscreen_buffer_lo_table, y
  LSR A     ;first divide by two, because Offscreen_buffer_LO table holds values 0-31 (32 columns) but background.i tables are only columns 0-15 (16 columns)
  ASL A     ;multiply that number times two, so we load correctly from backgroundAddr pointer when storing current column into ptr1
  TAY
  JMP .next1

.not_init
  JSR find_offscreen_column   ;setting pointer to background file
  LSR A     ;just as above, divide by two then multiply by two, to make up for the column difference
  ASL A     
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
  CMP #$0B          ;compare to decimal 11 to test that we've looped 12 times
  BCS .rts

  LDA [ptr1], y
  AND #%10000000    ;look at bit 7 for RLE test bit
  BEQ .column_next  ;if 0, don't go to RLE, if 1, jump to RLE
  JSR RLE
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
  STA bg_RAM+25, x       ;upper right of metatile
  INY
  INX
  LDA [metatile_ptr], y
  STA bg_RAM+3, x        ;lower left of metatile
  INY
  LDA [metatile_ptr], y
  STA bg_RAM+25, x       ;lower right of metatile
  INX

  INC loop_counter

  PLA
  TAY
  INY

  JMP .column_loop

.rts:
  RTS

;;;;;;;;;;;;;;;;;;;;;;;;;;;
find_offscreen_column:
;setting the out of view column to render from xscroll on current screen
  LDA leftright
  CMP #$01
  BCC .left
.right:
  LDA rightBufferLine
  TAY
  JMP .rts
.left:
  LDA leftBufferLine
  TAY
.rts:
  LDA Offscreen_buffer_lo_table, y
  RTS

;;;;;;;;;;;;;;;;;;;;;;;;;;;
RLE:
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
  STA bg_RAM+25, x       ;upper right of metatile
  INY
  INX
  LDA [metatile_ptr], y
  STA bg_RAM+3, x        ;lower left of metatile
  INY
  LDA [metatile_ptr], y
  STA bg_RAM+25, x       ;lower right of metatile
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;
fill_offscreen_attributes:

;fill_offscreen_attributes and find_offscreen_attr work similar to the background tile
;portion of the buffer.  However, since the first fifty-five bytes of bg_RAM have been used by
;background bytes, these two subs write to the 91st byte through 114th byte.

  LDA initializeSet    ;skip to .next if init is running
  BNE .next

;filling the high address of attributes for column
  LDA leftright
  CMP #$01
  BCC .left
.right:
  LDX xScroll
  CPX #$D0    ;compare to decimal 208
  BCS .this_nametable
  JMP .pull_nametableNum
.left:
  LDX xScroll
  CPX #$30    ;compare to decimal 32
  BCS .this_nametable

.pull_nametableNum:
  LDA nametableNum    ;0=$2000, 1=$2400
  EOR #%00000001      ;flip value in nametableNum, so it draws on opposite nametable
  TAY
  JMP .next

.this_nametable:
  LDA nametableNum    ;0=$2000, 1=$2400
  TAY

.next:
  LDX #$00
.high_attr_loop:
  LDA attr_high, y      ;keep y the same, as we are simply storing the same
  STA bg_RAM+47, x      ;value ($23 or $27) eight times

  INX
  INX
  INX

  CPX #$18      ;compare to decimal 24, >8< high address bytes loaded, 1 every >3< bytes in buffer
  BCC .high_attr_loop

;fillng the low address of attributes for column
  JSR find_offscreen_attr

  TAY
  LDA Offscreen_attr_lo_table_2006addr, y
  STA bg_RAM+48

  LDX #$03      ;start x at 3 since we already saved the first byte
.lo_attr_loop:
  CLC
  ADC #$08
  STA bg_RAM+48, x

  INX
  INX
  INX

  CPX #$18     ;compare to decimal 24, >8< low address bytes loaded, 7 here and 1 above,
               ;1 every >3< bytes in buffer

  BCC .lo_attr_loop


;filling the attribute byte of attributes for column
  JSR find_offscreen_attr
  ASL A
  TAY

  LDA [attrAddr], y
  STA ptr1
  INY
  LDA [attrAddr], y
  STA ptr1+1            ;set to correct attribute column

  LDX #$00
  LDY #$00
.attr_byte_loop:
  LDA [ptr1], y
  STA bg_RAM+49, x
  INY

  INX
  INX
  INX
  CPX #$18     ;compare to decimal 24, >8< attribute bytes loaded, 1 every >3< bytes in buffer
  BCC .attr_byte_loop


  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;;;
find_offscreen_attr:
  LDA leftright
  CMP #$01
  BCC .left

.right:
  LDA rightBufferLine
  JMP .shift_right
.left:
  LDA leftBufferLine
.shift_right:
  LSR A
  LSR A
  LSR A
  LSR A
  LSR A

  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;;;
fill_glowstat:
  LDA level
  ASL A
  TAY
  LDA init_pb_attrib, y
  STA ptr1
  LDA init_pb_attrib+1, y
  STA ptr1+1

  LDA counter
  CMP #$0F
  BCC .first
  CMP #$1E
  BCC .second
  CMP #$2D
  BCC .third
  JMP .fourth

.first:
  LDY #$00
  LDX #$00
.firstloop:
  LDA [ptr1], y
  AND #%11110000
  STA pb_glow_atr, x
  INY
  INX
  CPX #$05
  BCC .firstloop
  JMP .rts

.second:
  LDY #$00
  LDX #$00
.secondloop:
  LDA [ptr1], y
  AND #%11110000
  ORA #%00000101
  STA pb_glow_atr, x
  INY
  INX
  CPX #$05
  BCC .secondloop
  JMP .rts

.third:
  LDY #$00
  LDX #$00
.thirdloop:
  LDA [ptr1], y
  AND #%11110000
  ORA #%00001010
  STA pb_glow_atr, x
  INY
  INX
  CPX #$05
  BCC .thirdloop
  JMP .rts

.fourth:
  LDY #$00
  LDX #$00
.fourthloop:
  LDA [ptr1], y
  ORA #%00001111
  STA pb_glow_atr, x
  INY
  INX
  CPX #$05
  BCC .fourthloop

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;;;
fill_progress_RAM:
  LDA progress_bar
  CMP progress_bar+1
  BEQ .rts

  LDA #$20
  STA progress_RAM
  STA progress_RAM+2

  LDA progress_bar
  ASL A
  TAY
  LDA progress_bar_lo_addr, y
  STA progress_RAM+1
  LDA progress_bar_lo_addr+1, y
  STA progress_RAM+3

.rts:
  RTS


;;;;;;;;;;;;;;;;;
background_flash:
  JSR bank_backup_pal

  LDA #bgpal_0
  STA pal_change_lo

  LDA level
  ASL A
  TAY
  LDA bg_palette_index, y
  STA ptr1
  LDA bg_palette_index+1, y
  STA ptr1+1

  LDY #$00
  LDA event_counter
  CMP #$02
  BEQ .ended
  CMP #$03
  BCS .rts

  LDA counter
  CMP #$0E
  BEQ .first
  CMP #$1E
  BEQ .second
  CMP #$2C
  BEQ .third
  CMP #$3C
  BEQ .fourth
  JMP .rts

.first:
  LDA bg_flashing_palette, y
  STA pal_RAM, y
  INY
  CPY #$10
  BCC .first
  JMP .store_terminator
.second:
  LDA [ptr1], y
  STA pal_RAM, y
  INY
  CPY #$10
  BCC .second
  JMP .store_terminator
.third:
  LDA bg_flashing_palette, y
  STA pal_RAM, y
  INY
  CPY #$10
  BCC .third
  JMP .store_terminator
.fourth:
  LDA [ptr1], y
  STA pal_RAM, y
  INY
  CPY #$10
  BCC .fourth
  JMP .store_terminator
.ended:
  LDA [ptr1], y
  STA pal_RAM, y
  INY
  CPY #$10
  BCC .ended
  LDA #$03
  STA event_counter

.store_terminator:
  LDA #$FF
  STA pal_RAM, y
  LDA needdraw
  ORA #%01000000
  STA needdraw

.rts:
  JSR bank_restore_pal
  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;;;;
blackout:
  LDA needdraw
  ORA #%01000000
  STA needdraw

  LDA #bgpal_0
  STA pal_change_lo

  LDY #$00
.loop
  LDA #$1D
  STA pal_RAM, y
  INY
  LDA #$1E
  STA pal_RAM, y
  INY
  STA pal_RAM, y
  INY
  STA pal_RAM, y
  INY

  CPY #$20
  BCC .loop

  LDA #$FF
  STA pal_RAM, y
  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;;;;
FillAssmSpeed:
  LDA assm_speed
  ASL A
  TAY
  LDA assm_spd_index, y
  STA ptr1
  LDA assm_spd_index+1, y
  STA ptr1+1

  LDY #$00
.loop:
  LDA [ptr1], y
  STA assm_x_RAM, y
  INY
  CPY #$04
  BCC .loop

  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;;;
load_offscreen_tiles:
  LDY #$00
.left:
  LDA bg_RAM, y
  STA $2006  ;write the high byte
  INY

  LDA bg_RAM, y
  STA $2006  ;write the low byte
  INY
  INY        ;increment y twice, skipping low byte for right half of 2x26 tile column

  LDA initializeSet   ;if initialization is running, the soft_2000 variable there
  CMP #$01            ;will cause havoc because it has the NMI turned off.
  BEQ .left_loop      ;must skip to loop if init is running.

  LDA soft_2000
  ORA #%00000100
  STA $2000

.left_loop
  LDA bg_RAM, y
  STA $2007  ;load the tile
  INY
  
  CPY #$19  ;compare to decimal 25, high byte, low byte, skipped low byte, followed by twenty-two bytes for the tile numbers
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

  LDA initializeSet   ;if initialization is running, the soft_2000 variable there
  CMP #$01            ;will cause havoc because it has the NMI turned off.
  BEQ .pre_right_loop ;must skip to loop if init is running.

  LDA soft_2000
  ORA #%00000100
  STA $2000

.pre_right_loop:
  LDY #$19   ; set y to decimal 25, so it loads from correct position of bg_RAM
.right_loop
  LDA bg_RAM, y
  STA $2007  ;load the tile
  INY
  
  CPY #$2F  ;compare to decimal 47, high byte, skipped low byte, low byte, skipped twenty-four low bytes, followed by twenty-four bytes for the tile numbers
  BCC .right_loop

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;;;
load_offscreen_attributes:
  LDA initializeSet
  BEQ .normal
.init:
  LDY #$2F  ;begin at decimal 47, as bytes 00-46 were filled by load_offscreen_tiles
  JMP .loop
.normal:
  LDY #$35  ;skip first two attributes, so that wierd glowing progress bar glowing bug doesn't happen.
.loop:
  LDA bg_RAM, y
  STA $2006  ;write the high byte
  INY

  LDA bg_RAM, y
  STA $2006  ;write the low byte
  INY

  LDA bg_RAM, y
  STA $2007  ;load the attribute
  INY

  CPY #$47   ;compare to decimal 71, first we offset from decimal 47, then add decimal 24
             ;8 spots in buffer x 3 bytes(high, low, attribute byte)
  BCC .loop

  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;;;
NMI_ProgBar:
  LDA gamestate         ;the NMI handler jumps to this even when cutscenes are
  CMP #STATE_CUTSCENE   ;loading, so this branch avoids it overwriting the palette
  BEQ .rts              ;for the top part of the picture's border.

  LDA progress_bar+1
  CMP #$FF
  BEQ .rts
  LDA progress_bar
  CMP #$14
  BEQ .glowing_bar
.erease_PB_test:
  LDA progress_bar+1
  CMP #$FD
  BNE .PB_change
  JSR erase_progress_bar
  JMP .rts
.PB_change:
  JSR load_progress_RAM
  JMP .rts
.glowing_bar:
  JSR load_glowstat
.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;;;
load_glowstat:
  LDA #$23
  STA $2006
  LDA #$CA
  STA $2006
  LDY #$00
.loop:
  LDA pb_glow_atr, y
  STA $2007
  INY
  CPY #$05
  BCC .loop

  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;;;
load_progress_RAM:
  LDA progress_RAM
  STA $2006
  LDA progress_RAM+1
  STA $2006
  LDA #$55
  STA $2007

  LDA progress_RAM+2
  STA $2006
  LDA progress_RAM+3
  STA $2006
  LDA #$56
  STA $2007

  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;;;
erase_progress_bar:
  LDA level             ;;restoring the original attributes for progress bar
  ASL A
  TAY
  LDA init_pb_attrib, y
  STA ptr1
  LDA init_pb_attrib+1, y
  STA ptr1+1

  LDA #$23
  STA $2006
  LDA #$CA
  STA $2006

  LDY #$00
.attrib_loop:
  LDA [ptr1], y
  STA $2007
  INY
  CPY #$05
  BCC .attrib_loop       ;;restoring attributes finished

.grapics:                ;;replacing pb's graphics with the empty pb tiles
  LDA #$20
  STA $2006
  LDA #$88
  STA $2006
  LDY #$00
.g_loop1:
  LDA #$57
  STA $2007
  INY
  CPY #$14
  BCC .g_loop1
  
  LDA #$20
  STA $2006
  LDA #$A8
  STA $2006

.g_loop2:
  LDA #$58
  STA $2007
  INY
  CPY #$28
  BCC .g_loop2

  LDA #$FF
  STA progress_bar
  LDA #$FF
  STA progress_bar+1

  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LoadAssmSpeed:
  LDA gamestate         ;I don't want this overwriting the four tiles it usually
  CMP #STATE_CUTSCENE   ;does while the cutscenes or credits are running.
  BEQ .rts
  CMP #STATE_CREDITS
  BEQ .rts

  LDA #$20
  STA $2006
  LDA #$A4
  STA $2006
  LDY #$00
.loop:
  LDA assm_x_RAM, y
  STA $2007
  INY
  CPY #$04
  BCC .loop

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
pal_change:
  LDA needdraw
  AND #%01000000
  BEQ .clear

  LDA #$3F
  STA $2006
  LDA pal_change_lo
  STA $2006
  LDY #$00
.loop:
  LDA pal_RAM, y
  CMP #$FF
  BEQ .done
  STA $2007
  INY
  JMP .loop

.done:
  LDA needdraw
  AND #%10111111
  STA needdraw
  SEC
  JMP .rts
.clear:
  CLC
.rts:
  RTS