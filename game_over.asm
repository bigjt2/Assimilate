;;;;;;;;;;;;;
Game_Over:

  JSR reset_block

  JSR ReadController
  JSR GmOv_set_cursor
  JSR set_ship_boundingbox
  JSR set_ship_sprites_params

  JSR bank_backup_OBJ    ;need to swicht banks, since SpriteMapTransfer 
  JSR SpriteMapTransfer  ;is in the object bank
  JSR bank_restore_OBJ

.Up:
  LDA buttons_new
  AND #%00001000
  BEQ .Down
  LDA menu_cursor
  CMP #$00
  BEQ .Down
  DEC menu_cursor
  JMP .rts
.Down:
  LDA buttons_new
  AND #%00000100
  BEQ .A_Button
  LDA menu_cursor
  CMP #$01
  BEQ .A_Button
  INC menu_cursor
  JMP .rts
.A_Button:
  LDA buttons_new
  AND #%10000000
  BEQ .rts
  JMP GmOv_A_Button

.rts
  RTS


;;;;;;;;;;;;;;;;;
GmOv_A_Button:

  JSR blackout      ;black out palettes to hide graphical glitches
  JSR vblankwait
  JSR vblankwait

  LDA menu_cursor
  CMP #$00
  BEQ .continue

.reset:
  LDA #$00
  STA event_counter

  LDA #STATE_RESET
  STA gamestate
  JMP GameEngine

.continue:
  LDA #$00
  STA tool
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

  LDY #$00
.erase_score_bu:
  STA s_bkup, y
  INY
  CPY #$05
  BCC .erase_score_bu 

  LDA #$03
  STA lives
  JSR ConvertLives

  LDA #STATE_LVL_CHG   ;dO not increment level_index, of course
  STA gamestate
  JMP GameEngine


;;;;;;;;;;;;;;;;;
GmOv_set_cursor:

  LDA menu_cursor
  ASL A
  TAY

  LDA GmOv_ship_pos, y
  STA ship_y
  INY
  LDA GmOv_ship_pos, y
  STA ship_x

  RTS

;;;;;;;;;;;;;;;
pre_Game_Over:
  JSR Counter_Manager

  LDA event_counter
  CMP #$02
  BCS .run_gameover

  JSR blackout            ;black out palettes to hide graphical glitches
  JSR vblankwait
  JSR vblankwait

  LDA #$00
  STA current_song
  JSR sound_load

  JSR bank_backup_OBJ      ;need to clear out the sprite map and then jump to
  LDY #SMap_clearEXPTship  ;spritemap transfer, just to make sure there are no
  JSR clear_SpriteMap      ;visual artifacts remaining.  init_PPU also jumps to
  JSR SpriteMapTransfer    ;erase_sprites which clears all SpriteRAM excetp Sprite 0.
  JSR bank_restore_OBJ

  LDA #$00
  STA level
  STA metatile_indx
  STA needdraw
  STA boss_active

  LDA #$01
  STA frst_Background

  LDA #$01               ;switch banks to where level endscreen data is located
  STA prg_bank
  LDA #$00
  STA schr_bank
  LDA #$02
  STA bchr_bank
  JSR swap_PRG_bank
  JSR swap_CHR_bank0000
  JSR swap_CHR_bank1000

  JSR init_ppu
  JSR draw_game_over_msg

  LDA #%10010000
  STA soft_2000
  LDA #%00011110
  STA soft_2001
  JSR vblankwait
  JSR vblankwait

  JSR Init_Palettes     ;restore palettes now that screen is loaded

  LDA #$00
  STA menu_cursor
  STA ship_pal
  STA sleeping
  STA skip_sprite0

  LDA #$02
  STA event_counter

.run_gameover:
  JSR Game_Over

.rts:
  RTS


;;;;;;;;;;;;;;;;;;
draw_game_over_msg:

  LDA #LOW(GameOverMsg)  ;set ptr1 to point to beginning of text string
  STA ptr1
  LDA #HIGH(GameOverMsg)
  STA ptr1+1
  JSR Load_Text

.SCORE:
  LDA #$22
  STA $2006
  LDA #$B1
  STA $2006

  LDA s_tthou
  CLC
  ADC #$DC
  STA $2007
  LDA s_thous
  CLC
  ADC #$DC
  STA $2007
  LDA s_hundr
  CLC
  ADC #$DC
  STA $2007
  LDA s_tens
  CLC
  ADC #$DC
  STA $2007
  LDA s_ones
  CLC
  ADC #$DC
  STA $2007

  RTS


GameOverMsg:
  .db $01,$21,$6B
  .db $EC,$E6,$F2,$EA,$00,$F4,$FB,$EA,$F7   ;;GAME OVER
  .db $01,$21,$8B
  .db $E8,$F4,$F3,$F9,$EE,$F3,$FA,$EA,$D6   ;;CONTINUE?
  .db $01,$21,$EB
  .db $FE,$EA,$F8                           ;;YES
  .db $01,$22,$2B
  .db $F3,$F4                               ;;NO
  .db $01,$22,$AB
  .db $F8,$E8,$F4,$F7,$EA                   ;;SCORE
  .db $02


GmOv_ship_pos:  ;y coord, x coord
  .db $7A,$40
  .db $8A,$40