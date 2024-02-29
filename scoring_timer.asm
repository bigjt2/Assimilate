;;;;;;;;;;;;;
ConvertLives:    ;since lives are only two digits displayed, I used a more compact way of displaying them
                 ;lives are written to appropriate part of the screen in Load_Timer_Lives sub
  LDA lives
  PHA
  LDA #$00
  STA l_tens
  STA l_ones
.Tens:
  LDA lives
  CMP #$0A
  BCC .Ones
  SEC
  SBC #$0A
  STA lives
  INC l_tens
  JMP .Tens

.Ones:
  LDA lives
  STA l_ones

  PLA
  STA lives

  RTS


;;;;;;;;;;;;;
anal_test:      ;unlock the campout level after 25 consecutive anal probes
  LDA tool      ;have been used
  CMP #$03
  BNE .reset    ;must be CONSECUTIVE, so reset the count if any other tool has been used
  INC anal_tally
  LDA anal_tally
  CMP #$14      ;;#$14
  BCC .rts
  INC campout_unlock
  JMP .rts
.reset:
  LDA #$00
  STA anal_tally
.rts:
  RTS


;;;;;;;;;;;;;
Assimilation:

.bonus_test:
  LDA bonus_active   ;if on bonus level, we don't increase assimilation%
  BEQ .Ones          ;bonus levels have a time limit to gauge completion.

.bonus_score_noise:
  LDA t_tens       ;I don't want the bonus sfx interferring with the end of level
  CMP #$06         ;sfx, so I put this test here to skip if time is at 60.
  BCC .play_noise
  JMP .rts
.play_noise:
  LDA #score_sfx   ;play the scoring "Assimilate" sound to let the player know they got it.
  STA current_song ;this of course neeeds to be skipped if assimilation is at 100%
  JSR sound_load   ;since it gets skipped at the bottom due to the nature of bonus levels, I added it here, as well.
  JMP .rts

.Ones:
  LDA a_ones
  CLC
  ADC num_change+4
  CMP #$0A
  BCC .store_ones
  SEC
  SBC #$0A
  STA a_ones
  INC a_tens
  JMP .Tens
.store_ones:
  STA a_ones

.Tens:
  LDA a_tens
  CLC
  ADC num_change+3
  CMP #$0A
  BCC .store_tens
  SEC
  SBC #$0A
  STA a_tens
  INC a_hundr
  JMP .Hundreds
.store_tens:
  STA a_tens

.Hundreds:
  LDA a_hundr
  CLC
  ADC num_change+2
  CMP #$01
  BCC .store_hundreds
  JMP .assimilation_complete
.store_hundreds:
  STA a_hundr

  LDA #score_sfx   ;play the scoring "Assimilate" sound to let the player know they got it.
  STA current_song ;this of course neeeds to be skipped if assimilation is at 100%
  JSR sound_load
  JMP .AddDone

.assimilation_complete:
  LDA #$00
  STA a_ones
  STA a_tens
  LDA #$01
  STA a_hundr

  LDA #silence_song    ;silence channels before loading new song mid-stage
  STA current_song
  JSR sound_load
  LDA #sfx_efanfare
  STA current_song
  JSR sound_load

  JSR victim_dissappear
  JSR set_victim_sprites_params

  LDA #$00               ;get ready to switch game state to level complete screen
  STA event_counter
  LDA #STATE_LVL_CLR
  STA gamestate


.AddDone:     ;clear num_change slate so it can 
  LDX #$02    ;start at two since you will never need first two bytes of num_change for this
.loop:
  LDA #$00
  STA num_change, x
  INX
  CPX #$05
  BCC .loop

  LDA needdraw
  ORA #%00001000
  STA needdraw

.rts:
  RTS


;;;;;;;;;;;;;
AddTimer:

.Ones:
  LDA t_ones
  CMP #$0A
  BCC .store_ones
  LDA #$00
  STA t_ones
  INC t_tens
  JMP .Tens
.store_ones:
  STA t_ones

.Tens:
  LDA t_tens
  CMP #$0A
  BCC .store_tens
  LDA #$00
  STA t_tens
  INC t_hundr
  JMP .Hundreds
.store_tens:
  STA t_tens

.Hundreds:
  LDA t_hundr
  CMP #$0A
  BCC .store_hundreds
  LDA #$00
  STA t_hundr
  INC t_thous
  JMP .Thousands
.store_hundreds:
  STA t_hundr

.Thousands:
  LDA t_thous
  CMP #$0A
  BCS .MAX
  STA t_thous
  JMP .AddDone
.MAX:
  LDA #$09
  STA t_thous
  STA t_hundr
  STA t_tens
  STA t_ones

.AddDone:
  LDA needdraw
  ORA #%00000100
  STA needdraw

  RTS

;;;;;;;;;;;;;
AddScore:

.Ones:
  LDA s_ones
  CLC
  ADC num_change+4
  CMP #$0A
  BCC .store_ones
  SEC
  SBC #$0A
  STA s_ones
  INC s_tens
  JMP .Tens
.store_ones:
  STA s_ones

.Tens:
  LDA s_tens
  CLC
  ADC num_change+3
  CMP #$0A
  BCC .store_tens
  SEC
  SBC #$0A
  STA s_tens
  INC s_hundr
  JMP .Hundreds
.store_tens:
  STA s_tens

.Hundreds:
  LDA s_hundr
  CLC
  ADC num_change+2
  CMP #$0A
  BCC .store_hundreds
  SEC
  SBC #$0A
  STA s_hundr
  INC s_thous
  JMP .Thousands
.store_hundreds:
  STA s_hundr

.Thousands:
  LDA s_thous
  CLC
  ADC num_change+1
  CMP #$0A
  BCC .store_thousands
  SEC
  SBC #$0A
  STA s_thous
  INC s_tthou
  JMP .TenThousands
.store_thousands:
  STA s_thous

.TenThousands:
  LDA s_tthou
  CLC
  ADC num_change
  CMP #$0A
  BCS .MAX
  STA s_tthou
  JMP .AddDone
.MAX:
  LDA #$09
  STA s_tthou
  STA s_thous
  STA s_hundr
  STA s_tens
  STA s_ones

.AddDone:
  LDA bonus_active   ;if it's a bonus level, I want the score rea-added to double
  BEQ .not_bonus     ;or triple, so skip the clearing part and I do that in the bonus_scoring sub 
  JMP .set_needdraw

.not_bonus:
  LDX #$00
.loop:     ;clear num_change slate so it can
  LDA #$00
  STA num_change, x
  INX
  CPX #$05
  BCC .loop

.set_needdraw
  LDA needdraw
  ORA #%00000010
  STA needdraw

  RTS


;;;;;;;;;;;;;
SubtractScore:

.Ones:
  LDA s_ones
  SEC
  SBC num_change+4
  CMP #$0A
  BCS .dec_tens         ;if result is #$0A-#$FF, it's negative
  STA s_ones
  JMP .Tens
.dec_tens:
  CLC
  ADC #$0A
  STA s_ones
  DEC s_tens

.Tens:
  LDA s_tens
  SEC
  SBC num_change+3
  CMP #$0A
  BCS .dec_hundreds
  STA s_tens
  JMP .Hundreds
.dec_hundreds:
  CLC
  ADC #$0A
  STA s_tens
  DEC s_hundr

.Hundreds:
  LDA s_hundr
  SEC
  SBC num_change+2
  CMP #$0A
  BCS .dec_thousands
  STA s_hundr
  JMP .Thousands
.dec_thousands:
  CLC
  ADC #$0A
  STA s_hundr
  DEC s_thous

.Thousands:
  LDA s_thous
  SEC
  SBC num_change+1
  CMP #$0A
  BCS .dec_tenthousands
  STA s_thous
  JMP .TenThousands
.dec_tenthousands:
  CLC
  ADC #$0A
  STA s_thous
  DEC s_tthou

.TenThousands:
  LDA s_tthou
  SEC
  SBC num_change
  CMP #$0A
  BCS .ZIP
  STA s_tthou
  JMP .SubtractDone
.ZIP:
  LDA #$00
  STA s_tthou
  STA s_thous
  STA s_hundr
  STA s_tens
  STA s_ones

.SubtractDone:     ;clear num_change slate so it can 
  LDX #$00
.loop:
  LDA #$00
  STA num_change, x
  INX
  CPX #$05
  BCC .loop

  LDA needdraw
  ORA #%00000010
  STA needdraw

  RTS


;;;;;;;;;;;;;;;;;;;
SaveScore:
  LDY #$00           ;backup player's score in case of restart
  LDA s_ones
  STA s_bkup, y
  INY
  LDA s_tens
  STA s_bkup, y
  INY
  LDA s_hundr
  STA s_bkup, y
  INY
  LDA s_thous
  STA s_bkup, y
  INY
  LDA s_tthou
  STA s_bkup, y

  RTS


;;;;;;;;;;;;;;;;;;;
RestoreScore:
  LDY #$00           ;backup player's score in case of restart
  LDA s_bkup, y
  STA s_ones
  INY
  LDA s_bkup, y
  STA s_tens
  INY
  LDA s_bkup, y
  STA s_hundr
  INY
  LDA s_bkup, y
  STA s_thous
  INY
  LDA s_bkup, y
  STA s_tthou

  RTS


;;;;;;;;;;;;;;;;;;;
LoadScoreUpdate:
  LDA needdraw
  AND #%00000010
  BNE .next 
  JMP .ProgressBarTest        ;damn branch error here originally, had to do this

.next:
  LDA gamestate
  CMP #STATE_LVL_CLR
  BNE .normal
  LDA event_counter
  CMP #$07           ;be sure to compare to event counter or it will
  BCC .normal        ;draw score in middle of the play area screen at end of stage

.level_end:
  LDA event_counter
  CMP #$0B
  BCC .orig_score
.subtracted_score:
  LDX #$06
  LDY #$0C
  JMP .start
.orig_score:
  LDX #$06  ;x=high byte
  LDY #$07  ;y=low buyte
  JMP .start
.normal
  LDX #$00
  LDY #$01

.start:
  LDA score_update_addresses, x
  STA $2006
  LDA score_update_addresses, y
  STA $2006
  CLC
  LDA s_tthou
  ADC #$DC
  STA $2007
  INY

  LDA score_update_addresses, x
  STA $2006
  LDA score_update_addresses, y
  STA $2006
  CLC
  LDA s_thous
  ADC #$DC
  STA $2007
  INY

  LDA score_update_addresses, x
  STA $2006
  LDA score_update_addresses, y
  STA $2006
  CLC
  LDA s_hundr
  ADC #$DC
  STA $2007
  INY

  LDA score_update_addresses, x
  STA $2006
  LDA score_update_addresses, y
  STA $2006
  CLC
  LDA s_tens
  ADC #$DC
  STA $2007
  INY

  LDA score_update_addresses, x
  STA $2006
  LDA score_update_addresses, y
  STA $2006
  CLC
  LDA s_ones
  ADC #$DC
  STA $2007

  LDA needdraw
  AND #%11111101
  STA needdraw
  SEC
  JMP .rts

.ProgressBarTest:
  CLC
.rts:

  RTS


;;;;;;;;;;;;;;;;;;;
Load_Timer_Lives:
  LDA needdraw
  AND #%00000100
  BNE .run            ;had to do this because of a G-D RANGE ERROR!!!
  JMP .Score_Drawing

.run:
  LDA gamestate
  CMP #STATE_LVL_CLR
  BNE .normal

.level_end:
  LDX #$05  ;x=high byte
  LDY #$06  ;y=low buyte
  JMP .start
.normal
  LDX #$00
  LDY #$01

.start:
  LDA timer_update_addresses, X
  STA $2006
  LDA timer_update_addresses, y
  STA $2006
  CLC
  LDA t_thous
  ADC #$DC
  STA $2007
  INY

  LDA timer_update_addresses, X
  STA $2006
  LDA timer_update_addresses, y
  STA $2006
  CLC
  LDA t_hundr
  ADC #$DC
  STA $2007
  INY

  LDA timer_update_addresses, X
  STA $2006
  LDA timer_update_addresses, y
  STA $2006
  CLC
  LDA t_tens
  ADC #$DC
  STA $2007
  INY

  LDA timer_update_addresses, X
  STA $2006
  LDA timer_update_addresses, y
  STA $2006
  CLC
  LDA t_ones
  ADC #$DC
  STA $2007

.lives:
  LDA #$20
  STA $2006
  LDA #$7B
  STA $2006
  CLC
  LDA l_tens
  ADC #$DC
  STA $2007
  CLC
  LDA l_ones
  ADC #$DC
  STA $2007

  LDA needdraw
  AND #%11111011
  STA needdraw
  SEC
  JMP .rts

.Score_Drawing:
  CLC
.rts:

  RTS

;;;;;;;;;;;;;;;;;;;
LoadAssmPerc:
  LDA needdraw
  AND #%00001000
  BEQ .Timer_Drawing

  LDA #$20
  STA $2006
  LDA #$70
  STA $2006
  CLC
  LDA a_hundr
  ADC #$DC
  STA $2007

  LDA #$20
  STA $2006
  LDA #$71
  STA $2006
  CLC
  LDA a_tens
  ADC #$DC
  STA $2007

  LDA #$20
  STA $2006
  LDA #$72
  STA $2006
  CLC
  LDA a_ones
  ADC #$DC
  STA $2007

  LDA needdraw
  AND #%11110111
  STA needdraw
  SEC
  JMP .rts

.Timer_Drawing:
  CLC
.rts:

  RTS


;;;;;;;;;;;;;;;;;;;
timer_update_addresses:
  .db $20,$76,$77,$78,$79,$21,$D2,$D3,$D4,$D5
score_update_addresses:
  .db $20,$63,$64,$65,$66,$67,$21,$B1,$B2,$B3,$B4,$B5
  .db $F1,$F2,$F3,$F4,$F5