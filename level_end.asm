Level_Victory:
  JSR Counter_Manager
  JSR LE_NMI_update_manager

  LDA boss_active      ;if it's the end of the boss fight, skip the flash
  BEQ .start_flash     ;so the endstage fanfare doesn't start playing early.
  LDA boss_num
  CMP #kogy_chase      ;handle the kogyaru chase like a normal level
  BEQ .start_flash
  JMP .init_endscreen

.start_flash:
  LDA event_counter
  CMP #$04
  BCC .flash
  JMP .init_endscreen

.flash:
  LDA fnfr_advance
  BEQ .flash_next0

  LDA #silence_song    ;silence channels before loading new song mid-stage
  STA current_song
  JSR sound_load
  LDA #song_efanfare
  STA current_song
  JSR sound_load

  JSR bank_backup_OBJ    ;need to switch banks, since SpriteMapTransfer 
  JSR SpriteMapTransfer  ;is in the object bank
  JSR bank_restore_OBJ

.flash_next0:
  LDA counter
  AND #%00000001
  BEQ .flash_next1
  JMP .rts
.flash_next1:
  LDA ship_pal
  CMP #$03
  BEQ .flash_reset
  INC ship_pal
  JSR set_ship_sprites_params
  JMP .rts
.flash_reset:
  LDA #$00
  STA ship_pal
  JSR set_ship_sprites_params
  JMP .rts

.init_endscreen:
  LDA boss_active
  BEQ .non_boss
  LDA boss_num           ;again, handle the end of the kogyaru chase like
  CMP #kogy_chase        ;a normal level
  BEQ .non_boss
.boss_endscreen:
  JSR boss_end_sequence

  JSR bank_backup_OBJ    ;need to swicht banks, since SpriteMapTransfer 
  JSR SpriteMapTransfer  ;is in the object bank
  JSR bank_restore_OBJ

  LDA boss_end_done
  BNE .init            ;event_counter will def be > 3, so skip next test
  JMP .rts

.non_boss:
  LDA event_counter
  CMP #$04
  BEQ .init
  JMP .skip_init
.init:
  JSR blackout         ;black out the palette so you don't see graphical glitches.
  JSR vblankwait       ;it will do this again in init_PPU but that's okay.
  JSR vblankwait

  JSR bank_backup_OBJ      ;need to clear out the sprite map and then jump to
  LDY #SMap_clearEXPTship  ;spritemap transfer, just to make sure there are no
  JSR clear_SpriteMap      ;visual artifacts remaining.  init_PPU also jumps to
  JSR SpriteMapTransfer    ;erase_sprites which clears all SpriteRAM excetp Sprite 0.
  JSR bank_restore_OBJ

  LDA #$01             ;then prepare nmi settings and turn screen off
  STA skip_sprite0
  LDA #%00000110       ;disable sprites & bg, allow clipping
  STA soft_2001

  LDA #$01               ;switch banks to where level endscreen data is located
  STA prg_bank
  LDA #$00
  STA schr_bank
  LDA #$0B
  STA bchr_bank
  JSR swap_PRG_bank
  JSR swap_CHR_bank0000
  JSR swap_CHR_bank1000

  LDA #$00
  STA level
  STA frst_Background
  STA needdraw
  STA boss_active        ;do this or the boss NMI sub will cause problems with bank switching

  LDA #$01               ;reset metatile index
  STA metatile_indx

  JSR init_ppu

  LDA #$05
  STA event_counter
  JSR vblankwait

  LDA #%10010000
  STA soft_2000
  LDA #%00011110
  STA soft_2001
  JSR vblankwait
  JSR vblankwait

.end_of_game_test:    ;after the final kogyaru battle, I want it to skip
  LDA boss_num        ;the traditional level_end screen and go right to
  CMP #boss4          ;the ending sequence.  the game will then restart on lvl 1
  BNE .not_the_end    ;with time and assm% cleared.
  JSR level_end_clear_assm_time
  LDA #$00
  STA boss_num
  STA anal_tally
  STA campout_unlock
  JMP .inc_level

.not_the_end:
  JSR Init_Palettes
  JSR vblankwait

  LDA #$00
  STA sleeping
  STA skip_sprite0

  JMP .rts


.skip_init:
  LDA event_counter
  CMP #$0E
  BCC .rts

  JSR reset_block

.controller:
  JSR ReadController

.A_button_test:
  LDA buttons_new
  AND #%10000000
  BEQ .rts

.A_button_pressed:
  JSR blackout

  JSR level_end_clear_assm_time
  JSR SaveScore

  LDA #le_nothing
  STA endscreen_load

.campout_test:             ;first test to see if player has unlocked campout level.
  LDA campout_unlock
  BEQ .inc_level           ;if zero, then no, so handle level change normally.
  CMP #$FF                 ;if #$FF, then the just finished playing campout, and level before campout needs restored.
  BEQ .return_to_normal

.prep_campout:             ;if anything else, then player just unlocked campout
  LDA level_index          ;and this will back up the last level played for later.
  STA level_index_bak
  LDA #$34                 ;and then hard-code the campout level number to prepare
  STA level_index          ;for the jump.
  JMP .change_state

.return_to_normal:
  LDA #$00
  STA anal_tally           ;definitely reset these so player doesn't immediately play another campout level.
  STA campout_unlock
  LDA level_index_bak
  STA level_index

.inc_level:
  INC level_index

.change_state:
  LDA #STATE_LVL_CHG
  STA gamestate

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;
LE_NMI_update_manager:
  LDA boss_active
  BNE .rts         ;branch so it doesn't start spewing numbers onto the play screen

  LDX #$01
.loop:
  LDA event_counter
  CMP level_end_update_timings, x
  BNE .next

.advance:
  STX endscreen_load
  INC event_counter    ;inc so it doesn't immediately repeat the same event
  JMP .rts

.next:
  INX
  CPX #$07
  BCC .loop
  LDA #$00
  STA endscreen_load

.rts:
  RTS
  
level_end_update_timings:
  .db $00,$00,$06,$08,$0A,$0C,$0E


;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;
level_end_draw:
  LDY #$00      ;00-02 are the three spots for Blackout sub running in endlevel
  JSR LC_LastUpdate
  JSR LC_Congrats
  JSR LC_Score
  JSR LC_SubTime
  JSR LC_Total
  JSR LC_PressA
  RTS


LC_LastUpdate:   ;this handles the last update ofthe score and assimilation% in a level.
  LDA endscreen_load
  CMP #le_lastscore
  BNE .rts
  LDA #%00001110     ;store appropriate bits in needdraw variable so subs' internal tests know to run
  STA needdraw
  JSR LoadAssmPerc   ;jump here so it updates the assm % one last time as ship flashes
  JSR LoadScoreUpdate   ;same for this sub, update score graphics
.rts:
  RTS

LC_PressA:
  LDA endscreen_load
  CMP #le_press_a
  BNE .rts

  LDA #$00
  STA endscreen_load

;  LDA event_counter
;  CMP #$0D
;  BNE .rts

  LDX #$2C
  LDA #$22
  STA $2006
  LDA #$2D
  STA $2006
.loop0:
  LDA level_clear_messages, x
  STA $2007
  INX
  CPX #$33
  BCC .loop0

;  LDA #$0E
;  STA event_counter

.rts:
  RTS

LC_Total:
  LDA endscreen_load
  CMP #le_score_total
  BNE .rts

  LDA #$00
  STA endscreen_load

;  LDA event_counter
;  CMP #$0B          ;IF you change these times, change them in LoadScoreUpdate as well
;  BNE .rts

  LDA t_thous
  STA num_change+1
  LDA t_hundr
  sta num_change+2
  LDA t_tens
  STA num_change+3
  LDA t_ones
  STA num_change+4

  JSR SubtractScore

  LDX #$26
  LDA #$21
  STA $2006
  LDA #$EA
  STA $2006
.loop0:
  LDA level_clear_messages, x
  STA $2007
  INX
  CPX #$2C
  BCC .loop0

  JSR LoadScoreUpdate

;  LDA #$0C
;  STA event_counter


.rts:
  RTS


LC_SubTime:
  LDA endscreen_load
  CMP #le_sub_time
  BNE .rts

  LDA #$00
  STA endscreen_load

;  LDA event_counter
;  CMP #$09
;  BNE .rts

  LDX #$1E
  LDA #$21
  STA $2006
  LDA #$CA
  STA $2006
.loop0:
  LDA level_clear_messages, x
  STA $2007
  INX
  CPX #$26
  BCC .loop0

  LDA #$04
  STA needdraw
  JSR Load_Timer_Lives

;  LDA #$0A
;  STA event_counter

.rts:
  RTS


LC_Score:
  LDA endscreen_load
  CMP #le_final_score
  BNE .rts

  LDA #$00
  STA endscreen_load

;  LDA event_counter
;  CMP #$07          ;IF you ever change these times, be mindful that they
;  BNE .rts          ;also need changed in LoadScoreUpdate sub

  LDX #$18
  LDA #$21
  STA $2006
  LDA #$AA
  STA $2006
.loop0:
  LDA level_clear_messages, x
  STA $2007
  INX
  CPX #$1E
  BCC .loop0

  LDA #$02
  STA needdraw
  JSR LoadScoreUpdate

;  LDA #$08
;  STA event_counter

.rts:
  RTS


LC_Congrats:
  LDA endscreen_load
  CMP #le_congrats
  BNE .rts

  LDA #$00
  STA endscreen_load

;  LDA event_counter
;  CMP #$05
;  BNE .rts

  LDX #$00
  LDA #$21
  STA $2006
  LDA #$4A
  STA $2006
.loop0:
  LDA level_clear_messages, x
  STA $2007
  INX
  CPX #$0C
  BCC .loop0

  LDA #$21
  STA $2006
  LDA #$6A
  STA $2006
.loop1:
  LDA level_clear_messages, x
  STA $2007
  INX
  CPX #$18
  BCC .loop1

;  LDA #$06
;  STA event_counter

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;;;
level_end_clear_assm_time:
  LDA #$00
  STA event_counter
  STA tool
  STA a_ones         ;reset assimilation percentage & timer
  STA a_tens
  STA a_hundr
  STA t_thous
  STA t_hundr
  STA t_tens
  STA t_ones
  RTS


le_nothing      = $00  ;no message or score to load for now
le_press_a      = $06
le_score_total  = $05
le_sub_time     = $04
le_final_score  = $03
le_congrats     = $02
le_lastscore    = $01