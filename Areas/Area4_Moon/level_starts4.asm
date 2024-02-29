;;;;;;;;;;;;;;;;;;;;;;;;;;
;;LEVEL 18 Startup
;;;;;;;;;;;;;;;;;;;;;;;;;;
Level_18_Begin:
  LDA #$12
  STA level

  LDA #$00
  STA victim_num
  STA needdraw
  STA zombie
  STA boss_active
  STA death_init_flag

  LDA #$02
  STA beam_pal

  LDA #$03
  STA victim_max

  LDA #$05
  STA metatile_indx

  LDA #77
  STA frst_Background
  STA curr_Background
  STA curr_playfield

  LDA #82
  STA finl_Background

  LDA #$00
  STA zombie_pal_bank
  STA zombie_pal_bank+2
  LDA #$01
  STA victim_pal_bank+1
  STA zombie_pal_bank+1
  LDA #$02
  STA victim_pal_bank+2
  LDA #$03
  STA victim_pal_bank
  STA victim_pal_bank+3
  STA zombie_pal_bank+3

  LDA #$17       ;bits 7-4: interval between arrows = 10 -> 3LSR = abt 2 sec (lowest)
  STA arrow_freq ;bits 3-0: duration arrow onscreen = 07 -> 1ASL = abt 14 sec

  LDA #$D0
  STA bottom_border

  LDA #$18
  STA temp1
  LDA #$40
  STA temp2
  JSR init_ship

  LDA #moon_song
  STA current_song
  JSR sound_load

;  LDA #$09
;  STA a_tens
;  LDA #$05
;  STA a_ones

  JMP First_Subs


;;;;;;;;;;;;;;;;;;;;;;;;;;
;;LEVEL 19 Startup
;;;;;;;;;;;;;;;;;;;;;;;;;;
Level_19_Begin:
  LDA #$13
  STA level

  LDA #$00
  STA victim_num
  STA needdraw
  STA zombie
  STA boss_active
  STA death_init_flag
  STA dragon_present  ;ALWAYS do this in startup if kogyaru is in level, otherwise it won't respawn on restarting the level

  LDA #$02
  STA beam_pal

  LDA #$03
  STA victim_max

  LDA #$05
  STA metatile_indx

  LDA #83
  STA frst_Background
  STA curr_Background
  STA curr_playfield

  LDA #88
  STA finl_Background

  LDA #$00
  STA zombie_pal_bank
  STA zombie_pal_bank+2
  LDA #$01
  STA victim_pal_bank+1
  STA zombie_pal_bank+1
  LDA #$02
  STA victim_pal_bank+2
  LDA #$03
  STA victim_pal_bank
  STA victim_pal_bank+3
  STA zombie_pal_bank+3

  LDA #$17       ;bits 7-4: interval between arrows = 10 -> 3LSR = abt 2 sec (lowest)
  STA arrow_freq ;bits 3-0: duration arrow onscreen = 07 -> 1ASL = abt 14 sec

  LDA #$D0
  STA bottom_border

  LDA #$18
  STA temp1
  LDA #$40
  STA temp2
  JSR init_ship

  LDA #moon_song
  STA current_song
  JSR sound_load

;  LDA #$09
;  STA a_tens
;  LDA #$05
;  STA a_ones

  JMP First_Subs


;;;;;;;;;;;;;;;;;;;;;;;;;;
;;LEVEL 20 Startup
;;;;;;;;;;;;;;;;;;;;;;;;;;
Level_20_Begin:
  LDA #$14
  STA level

  LDA #$00
  STA victim_num
  STA needdraw
  STA zombie
  STA boss_active
  STA death_init_flag
  STA dragon_present  ;ALWAYS do this in startup if kogyaru is in level, otherwise it won't respawn on restarting the level

  LDA #$02
  STA beam_pal

  LDA #$03
  STA victim_max

  LDA #$05
  STA metatile_indx

  LDA #89
  STA frst_Background
  STA curr_Background
  STA curr_playfield

  LDA #94
  STA finl_Background

  LDA #$00
  STA zombie_pal_bank
  STA zombie_pal_bank+2
  LDA #$01
  STA victim_pal_bank+1
  STA zombie_pal_bank+1
  LDA #$02
  STA victim_pal_bank+2
  LDA #$03
  STA victim_pal_bank
  STA victim_pal_bank+3
  STA zombie_pal_bank+3

  LDA #$17       ;bits 7-4: interval between arrows = 10 -> 3LSR = abt 2 sec (lowest)
  STA arrow_freq ;bits 3-0: duration arrow onscreen = 07 -> 1ASL = abt 14 sec

  LDA #$D0
  STA bottom_border

  LDA #$18
  STA temp1
  LDA #$40
  STA temp2
  JSR init_ship

  LDA #moon_song
  STA current_song
  JSR sound_load

;  LDA #$09
;  STA a_tens
;  LDA #$05
;  STA a_ones

  JMP First_Subs


;;;;;;;;;;;;;;;;;;;;;;;;;;
;;LEVEL 21 Startup
;;;;;;;;;;;;;;;;;;;;;;;;;;
Level_21_Begin:
  LDA #$15
  STA level

  LDA #$00
  STA victim_num
  STA needdraw
  STA zombie
  STA boss_active
  STA death_init_flag
  STA dragon_present  ;ALWAYS do this in startup if kogyaru is in level, otherwise it won't respawn on restarting the level

  LDA #$02
  STA beam_pal

  LDA #$03
  STA victim_max

  LDA #$05
  STA metatile_indx

  LDA #95
  STA frst_Background
  STA curr_Background
  STA curr_playfield

  LDA #102
  STA finl_Background

  LDA #$00
  STA zombie_pal_bank
  STA zombie_pal_bank+2
  LDA #$01
  STA victim_pal_bank+1
  STA zombie_pal_bank+1
  LDA #$02
  STA victim_pal_bank+2
  LDA #$03
  STA victim_pal_bank
  STA victim_pal_bank+3
  STA zombie_pal_bank+3

  LDA #$18       ;bits 7-4: interval between arrows = 10 -> 3LSR = abt 2 sec (lowest)
  STA arrow_freq ;bits 3-0: duration arrow onscreen = 07 -> 1ASL = abt 14 sec

  LDA #$D0
  STA bottom_border

  LDA #$18
  STA temp1
  LDA #$40
  STA temp2
  JSR init_ship

  LDA #moon_song
  STA current_song
  JSR sound_load

;  LDA #$09
;  STA a_tens
;  LDA #$05
;  STA a_ones

  JMP First_Subs


;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Boss 4 Startup
;;;;;;;;;;;;;;;;;;;;;;;;;;
Boss_4_Begin:
  LDA #$16
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
  STA dragon_present  ;ALWAYS do this in startup if kogyaru is in level, otherwise it won't respawn on restarting the level

  LDA #$01
  STA boss_active

  LDA #$02
  STA beam_pal
  LDA #$03
  STA victim_max

  LDA #$05          ;;;<----change
  STA metatile_indx

  LDA #119
  STA frst_Background
  STA curr_Background
  STA curr_playfield

  LDA #119
  STA finl_Background

  LDA #$00
  STA zombie_pal_bank
  STA zombie_pal_bank+2
  LDA #$01
  STA victim_pal_bank+1
  STA zombie_pal_bank+1
  LDA #$02
  STA victim_pal_bank+2
  LDA #$03
  STA victim_pal_bank
  STA victim_pal_bank+3
  STA zombie_pal_bank+3

  LDA #$17       ;bits 7-4: interval between arrows = 10 -> 3LSR = abt 2 sec (lowest)
  STA arrow_freq ;bits 3-0: duration arrow onscreen = 07 -> 1ASL = abt 14 sec

  LDA #$D0
  STA bottom_border

  LDA #$40
  STA temp1
  LDA #$80
  STA temp2
  JSR init_ship

  LDA #boss_song
  STA current_song
  JSR sound_load

  LDA #kogy_chase
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

;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Final Boss Startup
;;;;;;;;;;;;;;;;;;;;;;;;;;
Boss_Final_Begin:
  LDA #$17
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
  STA victim_max

  LDA #$09          ;;;<----change
  STA metatile_indx

  LDA #116
  STA frst_Background
  STA curr_Background
  STA curr_playfield

  LDA #116
  STA finl_Background

  LDA #$00
  STA zombie_pal_bank
  STA zombie_pal_bank+2
  LDA #$01
  STA victim_pal_bank+1
  STA zombie_pal_bank+1
  LDA #$02
  STA victim_pal_bank+2
  LDA #$03
  STA victim_pal_bank
  STA victim_pal_bank+3
  STA zombie_pal_bank+3

  LDA #$17       ;bits 7-4: interval between arrows = 10 -> 3LSR = abt 2 sec (lowest)
  STA arrow_freq ;bits 3-0: duration arrow onscreen = 07 -> 1ASL = abt 14 sec

  LDA #$D8
  STA bottom_border

  LDA #$20
  STA temp1
  LDA #$40
  STA temp2
  JSR init_ship

  LDA #final_song
  STA current_song
  JSR sound_load

  LDA #boss4
  STA boss_num

  LDA boss_num
  ASL A
  TAY
  LDA boss_subs, y
  STA boss_ptr
  LDA boss_subs+1, y
  STA boss_ptr+1

;  LDA #$09
;  STA a_tens
;  STA s_thous
;  LDA #$05
;  STA a_ones




  JMP First_Subs