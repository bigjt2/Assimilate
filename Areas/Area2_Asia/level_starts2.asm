;;;;;;;;;;;;;;;;;;;;;;;;;;
;;LEVEL 6 Startup
;;;;;;;;;;;;;;;;;;;;;;;;;;
Level_6_Begin:
  LDA #$06
  STA level

  LDA #$00
  STA victim_num
  STA needdraw
  STA zombie
  STA boss_active
  STA death_init_flag
  STA dragon_present  ;ALWAYS do this in startup if dragon is in level, otherwise it won't respawn on restarting the level

  LDA #$02
  STA beam_pal
  STA metatile_indx

  LDA #$03
  STA victim_max

  LDA #20
  STA frst_Background
  STA curr_Background
  STA curr_playfield

  LDA #23
  STA finl_Background

  LDA #$00
  STA zombie_pal_bank
  LDA #$01
  STA victim_pal_bank+2
  STA victim_pal_bank+3
  STA zombie_pal_bank+2
  LDA #$02
  STA victim_pal_bank
  STA zombie_pal_bank+3
  LDA #$03
  STA victim_pal_bank+1
  STA zombie_pal_bank+1

  LDA #$17       ;bits 7-4: interval between arrows = 10 -> 3LSR = abt 2 sec (lowest)
  STA arrow_freq ;bits 3-0: duration arrow onscreen = 07 -> 1ASL = abt 14 sec

  LDA #$D8
  STA bottom_border

  LDA #$18
  STA temp1
  LDA #$40
  STA temp2
  JSR init_ship

  LDA #hentai_song
  STA current_song
  JSR sound_load

;  LDA #$09
;  STA a_tens
;  LDA #$05
;  STA a_ones

  JMP First_Subs


;;;;;;;;;;;;;;;;;;;;;;;;;;
;;LEVEL 7 Startup
;;;;;;;;;;;;;;;;;;;;;;;;;;
Level_7_Begin:
  LDA #$07
  STA level

  LDA #$00
  STA victim_num
  STA needdraw
  STA zombie
  STA boss_active
  STA death_init_flag

  LDA #$02
  STA beam_pal
  STA metatile_indx

  LDA #$03
  STA victim_max

  LDA #24
  STA frst_Background
  STA curr_Background
  STA curr_playfield

  LDA #27
  STA finl_Background

  LDA #$00
  STA zombie_pal_bank
  LDA #$01
  STA victim_pal_bank+2
  STA victim_pal_bank+3
  STA zombie_pal_bank+2
  LDA #$02
  STA victim_pal_bank
  STA zombie_pal_bank+3
  LDA #$03
  STA victim_pal_bank+1
  STA zombie_pal_bank+1

  LDA #$17       ;bits 7-4: interval between arrows = 10 -> 3LSR = abt 2 sec (lowest)
  STA arrow_freq ;bits 3-0: duration arrow onscreen = 07 -> 1ASL = abt 14 sec

  LDA #$D8
  STA bottom_border

  LDA #$18
  STA temp1
  LDA #$40
  STA temp2
  JSR init_ship

  LDA #hentai_song
  STA current_song
  JSR sound_load

;  LDA #$09
;  STA a_tens
;  LDA #$05
;  STA a_ones

  JMP First_Subs


;;;;;;;;;;;;;;;;;;;;;;;;;;
;;LEVEL 8 Startup
;;;;;;;;;;;;;;;;;;;;;;;;;;
Level_8_Begin:
  LDA #$08
  STA level

  LDA #$00
  STA victim_num
  STA needdraw
  STA zombie
  STA boss_active
  STA death_init_flag

  LDA #$02
  STA beam_pal
  STA metatile_indx

  LDA #$03
  STA victim_max

  LDA #28
  STA frst_Background
  STA curr_Background
  STA curr_playfield

  LDA #32
  STA finl_Background

  LDA #$00
  STA zombie_pal_bank
  LDA #$01
  STA victim_pal_bank+2
  STA victim_pal_bank+3
  STA zombie_pal_bank+2
  LDA #$02
  STA victim_pal_bank
  STA zombie_pal_bank+3
  LDA #$03
  STA victim_pal_bank+1
  STA zombie_pal_bank+1

  LDA #$17       ;bits 7-4: interval between arrows = 10 -> 3LSR = abt 2 sec (lowest)
  STA arrow_freq ;bits 3-0: duration arrow onscreen = 07 -> 1ASL = abt 14 sec

  LDA #$D8
  STA bottom_border

  LDA #$18
  STA temp1
  LDA #$40
  STA temp2
  JSR init_ship

  LDA #hentai_song
  STA current_song
  JSR sound_load

;  LDA #$09
;  STA a_tens
;  LDA #$05
;  STA a_ones

  JMP First_Subs


;;;;;;;;;;;;;;;;;;;;;;;;;;
;;LEVEL 9 Startup
;;;;;;;;;;;;;;;;;;;;;;;;;;
Level_9_Begin:
  LDA #$09
  STA level

  LDA #$00
  STA victim_num
  STA needdraw
  STA zombie
  STA boss_active
  STA death_init_flag
  STA dragon_present  ;ALWAYS do this in startup if dragon is in level, otherwise it won't respawn on restarting the level

  LDA #$02
  STA beam_pal
  STA metatile_indx

  LDA #$03
  STA victim_max

  LDA #33
  STA frst_Background
  STA curr_Background
  STA curr_playfield

  LDA #37
  STA finl_Background

  LDA #$00
  STA zombie_pal_bank
  LDA #$01
  STA victim_pal_bank+2
  STA victim_pal_bank+3
  STA zombie_pal_bank+2
  LDA #$02
  STA victim_pal_bank
  STA zombie_pal_bank+3
  LDA #$03
  STA victim_pal_bank+1
  STA zombie_pal_bank+1

  LDA #$17       ;bits 7-4: interval between arrows = 10 -> 3LSR = abt 2 sec (lowest)
  STA arrow_freq ;bits 3-0: duration arrow onscreen = 07 -> 1ASL = abt 14 sec

  LDA #$D8
  STA bottom_border

  LDA #$18
  STA temp1
  LDA #$40
  STA temp2
  JSR init_ship

  LDA #anight_song
  STA current_song
  JSR sound_load

;  LDA #$09
;  STA a_tens
;  LDA #$05
;  STA a_ones

  JMP First_Subs


;;;;;;;;;;;;;;;;;;;;;;;;;;
;;LEVEL 10 Startup
;;;;;;;;;;;;;;;;;;;;;;;;;;
Level_10_Begin:
  LDA #$0A
  STA level

  LDA #$00
  STA victim_num
  STA needdraw
  STA zombie
  STA boss_active
  STA death_init_flag

  LDA #$02
  STA beam_pal
  STA metatile_indx

  LDA #$03
  STA victim_max

  LDA #38
  STA frst_Background
  STA curr_Background
  STA curr_playfield

  LDA #42
  STA finl_Background

  LDA #$00
  STA zombie_pal_bank
  LDA #$01
  STA victim_pal_bank+2
  STA victim_pal_bank+3
  STA zombie_pal_bank+2
  LDA #$02
  STA victim_pal_bank
  STA zombie_pal_bank+3
  LDA #$03
  STA victim_pal_bank+1
  STA zombie_pal_bank+1

  LDA #$17       ;bits 7-4: interval between arrows = 10 -> 3LSR = abt 2 sec (lowest)
  STA arrow_freq ;bits 3-0: duration arrow onscreen = 07 -> 1ASL = abt 14 sec

  LDA #$D8
  STA bottom_border

  LDA #$18
  STA temp1
  LDA #$40
  STA temp2
  JSR init_ship

  LDA #hentai_song
  STA current_song
  JSR sound_load

;  LDA #$09
;  STA a_tens
;  LDA #$05
;  STA a_ones

  JMP First_Subs


;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Boss 2 Startup
;;;;;;;;;;;;;;;;;;;;;;;;;;
Boss_2_Begin:
  LDA #$0B
  STA level

  LDA #$00
  STA victim_num
  STA needdraw
  STA zombie
  STA bs_mv_index
  STA boss_paces
  STA boss_bldg_num
  STA boss_bldg_timer
  STA boss_bldg_stat
  STA death_init_flag

  STA target_stat      ;MUST be done every boss fight
  STA boss_end_done
  STA boss_expl_timer
  STA boss_expl_ptr
  STA boss_fade_timer

  LDA #$01
  STA boss_active

  LDA #$02
  STA beam_pal

  LDA #$03
  STA metatile_indx
  STA victim_max

  LDA #43
  STA frst_Background
  STA curr_Background
  STA curr_playfield

  LDA #43   ;;?
  STA finl_Background

  LDA #$00
  STA zombie_pal_bank
  LDA #$01
  STA victim_pal_bank+2
  STA victim_pal_bank+3
  STA zombie_pal_bank+2
  LDA #$02
  STA victim_pal_bank
  STA zombie_pal_bank+3
  LDA #$03
  STA victim_pal_bank+1
  STA zombie_pal_bank+1

  LDA #$17       ;bits 7-4: interval between arrows = 10 -> 3LSR = abt 2 sec (lowest)
  STA arrow_freq ;bits 3-0: duration arrow onscreen = 07 -> 1ASL = abt 14 sec

  LDA #$D8
  STA bottom_border

  LDA #$A0
  STA temp1
  LDA #$40
  STA temp2
  JSR init_ship

  LDA #boss_song
  STA current_song
  JSR sound_load

  LDA #boss2
  STA boss_num

  LDA boss_num   ;#boss1 is zero, so no need to ASL
  ASL A
  TAY
  LDA boss_subs, y
  STA boss_ptr
  LDA boss_subs+1, y
  STA boss_ptr+1

;  LDA #$09
;  STA a_tens
;  LDA #$05
;  STA a_ones

  JMP First_Subs