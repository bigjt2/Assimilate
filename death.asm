;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;
Death:
  LDA death_init_flag
  BNE .run

.init_death:
  LDA #silence_song
  STA current_song
  JSR sound_load
  JSR sound_play_frame
  LDA #die_sfx
  STA current_song
  JSR sound_load

  JSR victim_dissappear
  JSR set_victim_sprites_params

  JSR bank_backup_OBJ
  LDY #SMap_clearEXPTship   ;clear all the enemy/object sprites
  JSR clear_SpriteMap
  JSR SpriteMapTransfer
  JSR bank_restore_OBJ
  LDA #$01
  STA death_init_flag

.run:
  JSR Counter_Manager
  JSR ReadController

  JSR set_ship_sprites_params

  JSR bank_backup_OBJ    ;need to swicht banks, since SpriteMapTransfer 
  JSR SpriteMapTransfer  ;is in the object bank
  JSR bank_restore_OBJ

  JSR death_animation  ;note, this also leads to the Await_A sub for the player to reset

.rts:
  RTS

death_animation:

.flash:
  LDA counter
  AND #%00000001
  BNE .rts
  LDA ship_pal
  CMP #$03
  BEQ .flash_reset
  INC ship_pal
  JMP .animate
.flash_reset:
  LDA #$00
  STA ship_pal

.animate:
  LDA event_counter
  CMP #$02
  BCC .rts
  CMP #$03
  BCC .first_frame
  CMP #$04
  BCC .second_frame
  CMP #$07
  BCC .third_frame
  JMP .message

.first_frame:
  LDY #$00
.first_loop:
  LDA ship_expl_1, y
  STA ship_tiles, y
  INY
  CPY #$08
  BCC .first_loop

  JMP .rts

.second_frame:
  LDY #$00
.second_loop:
  LDA ship_expl_2, y
  STA ship_tiles, y
  INY
  CPY #$08
  BCC .second_loop

  JMP .rts

.third_frame:
  LDY #$00
.third_loop:
  LDA ship_expl_3, y
  STA ship_tiles, y
  INY
  CPY #$08
  BCC .third_loop

  JMP .rts

.message:
  LDA #$08
  STA event_counter

.await_a:
  JSR Await_A

.rts:
  RTS


Await_A:
  LDA buttons
  AND #%10000000
  BEQ .rts  

.A_Pressed:
  LDA #$00
  STA death_init_flag

  JSR blackout      ;black out palettes to hide graphical glitches
  LDA #$00
  STA loop_counter
.loop:
  JSR vblankwait    ;this blackout seems to require a few extra waits because
  INC loop_counter  ;there are more things NMI has to branch to first.
  LDA loop_counter
  CMP #$20
  BCC .loop

  LDA lives
  CMP #$00
  BEQ .game_over

.lose_life:
  DEC lives
  JSR ConvertLives
  LDA #$00
  STA event_counter

  LDA #STATE_LVL_CHG   ;dO not increment level_index, of course
  STA gamestate
  JMP .rts

.game_over:
  LDA #$00
  STA event_counter
  LDA #STATE_GAMEOVER
  STA gamestate

.rts
  RTS


;;;;;;;;;;;;;;;
death_draw:

  LDA event_counter
  CMP #$06
  BNE .next
  JSR load_death_message
.next:
  CMP #$02
  BEQ .load_expl_pal
  JMP .rts

.load_expl_pal:
  LDA event_counter
  CMP #$02
  BNE .rts

  LDA $2002
  LDA #$3F
  STA $2006
  LDA #$00
  STA $2006
  LDY #$00
.expl_pal_loop:
  LDA explosion_palette, y
  STA $2007
  INY
  CPY #$20
  BCC .expl_pal_loop

.rts
  RTS

load_death_message:

  LDA xScroll
  LSR A
  LSR A
  LSR A
  LSR A    ;break it down to be values 0-15
  ASL A    ;then shift left to multiply by two before pulling from Onscreen_lo_table
  PHA      ;push to stack since we need to load accumulator with nametableNum to compare
  LDA nametableNum
  CMP #$01
  BCS .high_26

.high_22:
  PLA      ;pull altered xScroll from stack
  TAY
  LDX #$00
  JMP .first_line_loop
.high_26:
  PLA      ;pull altered xScroll from stack
  CLC
  ADC #$20    ;add 32 so it starts pulling from 4th row of Onscreen_addr_table
  TAY
  LDX #$00  
  
.first_line_loop:
  LDA Onscreen_addr_table, y    ;high byte
  STA $2006
  LDA Onscreen_addr_table+1, y  ;low byte
  STA $2006
  LDA message, x                ;first character of message
  STA $2007
  INX                           ;INX for next character
  LDA Onscreen_addr_table, y    ;keep y the same for same high byte
  STA $2006
  LDA Onscreen_addr_table+1, y
  CLC           ;add one to seconf value at current y to get the next right low byte
  ADC #$01
  STA $2006
  LDA message, x   ;next character in message
  STA $2007
  INY
  INY    ;INY twice, past current high byte low byte
  INX    ;INX for next character
  CPX #$14   ;20 characters on first line
  BCC .first_line_loop

  TYA
  SEC
  SBC #$12       ;subtract from y so we move back to the left for second line
  TAY

.second_line_loop:
  LDA Onscreen_addr_table, y
  STA $2006
  LDA Onscreen_addr_table+1, y
  CLC
  ADC #$20       ;add 32 on each low byte so character appears on second line
  STA $2006
  LDA message, x
  STA $2007
  INX
  LDA Onscreen_addr_table, y
  STA $2006
  LDA Onscreen_addr_table+1, y
  CLC
  ADC #$21
  STA $2006
  LDA message, x
  STA $2007
  INY
  INY
  INX
  CPX #$22
  BCC .second_line_loop
  
  LDA #$07
  STA event_counter
  
  RTS


