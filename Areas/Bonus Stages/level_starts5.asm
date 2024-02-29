;;;;;;;;;;;;;;;;;;;;;;;;;;
;;COW LEVEL Startup
;;;;;;;;;;;;;;;;;;;;;;;;;;
Cow_Level_Begin:
  LDA #$18
  STA level

  LDA bonus_active
  ORA #$0F
  STA bonus_active

  LDA #$00
  STA beam_pal
  STA victim_num
  STA needdraw
  STA zombie
  STA boss_active
  STA death_init_flag

  LDA #$02
  STA victim_max

  LDA #$06
  STA metatile_indx

  LDA #105
  STA frst_Background
  STA curr_Background
  STA curr_playfield

  LDA #108
  STA finl_Background

  LDA #$01
  STA victim_pal_bank
  STA victim_pal_bank+1
  LDA #$02
  STA victim_pal_bank+2
  LDA #$03
  STA zombie_pal_bank
  STA zombie_pal_bank+1
  STA zombie_pal_bank+2

  LDA #$14       ;bits 7-4: interval between arrows = 10 -> 3LSR = abt 2 sec (lowest)
  STA arrow_freq ;bits 3-0: duration arrow onscreen = 04 -> 1ASL = abt 9 sec

  LDA #$D8
  STA bottom_border

  LDA #$18
  STA temp1
  LDA #$40
  STA temp2
  JSR init_ship

  LDA #cows_song
  STA current_song
  JSR sound_load

;  LDA #$09
;  STA a_tens
;  LDA #$05
;  STA a_ones

  JMP First_Subs


;;;;;;;;;;;;;;;;;;;;;;;;;;
;;CAMPOUT LEVEL Startup
;;;;;;;;;;;;;;;;;;;;;;;;;;
Campout_Level_Begin:
  LDA #$19
  STA level

  LDA bonus_active
  ORA #$F0
  STA bonus_active

  LDA #$00
  STA victim_num
  STA needdraw
  STA zombie
  STA boss_active
  STA death_init_flag
  STA beam_pal
  STA anal_tally         ;this is also reset in level_end, but do it here just to be safe.

  LDA #$FF               ;this is the signal at the end of the stage
  STA campout_unlock     ;to restore the last stage player was on.

  LDA #$03
  STA victim_max

  LDA #$07
  STA metatile_indx

  LDA #109
  STA frst_Background
  STA curr_Background
  STA curr_playfield
  STA finl_Background

  LDA #$00
  STA zombie_pal_bank+1
  STA zombie_pal_bank+3
  LDA #$01
  STA victim_pal_bank
  STA victim_pal_bank+2
  STA victim_pal_bank+3
  LDA #$03
  STA victim_pal_bank+1
  STA zombie_pal_bank+2
  STA zombie_pal_bank

  LDA #$13       ;bits 7-4: interval between arrows = 10 -> 3LSR = abt 2 sec (lowest)
  STA arrow_freq ;bits 3-0: duration arrow onscreen = 03 -> 1ASL = abt 7 sec

  LDA #$D8
  STA bottom_border

  LDA #$18
  STA temp1
  LDA #$40
  STA temp2
  JSR init_ship

  LDA #silence_song
  STA current_song
  JSR sound_load

;  LDA #$09
;  STA a_tens
;  LDA #$05
;  STA a_ones

  JMP First_Subs

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Load_Special_Campout_Txt:
  LDA #LOW(CAMPOUT_FOOL1)
  STA ptr1
  LDA #HIGH(CAMPOUT_FOOL1)
  STA ptr1+1
  JSR Load_Text

  LDA #LOW(CAMPOUT_FOOL2)
  STA ptr1
  LDA #HIGH(CAMPOUT_FOOL2)
  STA ptr1+1
  JSR Load_Text

  RTS


  .dw CAMPOUT_FOOL1,CAMPOUT_FOOL2

CAMPOUT_FOOL1:
  .db $01,$21,$68 ;C8
  .db _J,_U,_S,_T, __, _K,_I,_D,_D,_I,_N,_G,EXCL,EXCL
  .db $01,$21,$86  ;E6
  .db _H,_A,_H,_A,_H,_A,_H,_A,_H,_A,_H,_A,_H,_A,_A,_A,EXCL,EXCL,EXCL
  .db $02
CAMPOUT_FOOL2:
  .db $01,$21,$E4  ;2244
  .db  _W,_H,_A,_T, __, _H,_A,_P,_P,_E,_N,_S, __, _A,_T, __, _C,_A,_M,_P,_O,_U,_T,DOT,DOT,DOT
  .db $01,$22,$28  ;2288
  .db _S,_T,_A,_Y,_S, __, _A,_T, __, _C,_A,_M,_P,_O,_U,_T,DOT
  .db $02