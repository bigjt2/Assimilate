;;;;;;;;;;;;;;;;;;;;;;;;;;
;;LEVEL 12 Startup
;;;;;;;;;;;;;;;;;;;;;;;;;;
Level_12_Begin:
  LDA #$0C
  STA level

  LDA #$00
  STA victim_num
  STA needdraw
  STA zombie
  STA boss_active
  STA death_init_flag

  LDA #$00
  STA beam_pal

  LDA #$03
  STA victim_max

  LDA #$04
  STA metatile_indx

  LDA #53
  STA frst_Background
  STA curr_Background
  STA curr_playfield

  LDA #57
  STA finl_Background

  LDA #$00
  STA zombie_pal_bank+2
  LDA #$01
  STA victim_pal_bank+1
  STA victim_pal_bank+3
  STA zombie_pal_bank
  LDA #$02
  STA victim_pal_bank
  STA victim_pal_bank+2
  STA zombie_pal_bank+1
  LDA #$03
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

  LDA #commie_song
  STA current_song
  JSR sound_load

;  LDA #$09
;  STA a_tens
;  LDA #$05
;  STA a_ones

  JMP First_Subs


;;;;;;;;;;;;;;;;;;;;;;;;;;
;;LEVEL 13 Startup
;;;;;;;;;;;;;;;;;;;;;;;;;;
Level_13_Begin:
  LDA #$0D
  STA level

  LDA #$00
  STA victim_num
  STA needdraw
  STA zombie
  STA boss_active
  STA death_init_flag

  LDA #$00
  STA beam_pal

  LDA #$03
  STA victim_max

  LDA #$04
  STA metatile_indx

  LDA #58
  STA frst_Background
  STA curr_Background
  STA curr_playfield

  LDA #62
  STA finl_Background

  LDA #$00
  STA zombie_pal_bank+2
  LDA #$01
  STA victim_pal_bank+1
  STA victim_pal_bank+3
  STA zombie_pal_bank
  LDA #$02
  STA victim_pal_bank
  STA victim_pal_bank+2
  STA zombie_pal_bank+1
  LDA #$03
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

  LDA #commie_song
  STA current_song
  JSR sound_load

;  LDA #$09
;  STA a_tens
;  LDA #$05
;  STA a_ones

  JMP First_Subs


;;;;;;;;;;;;;;;;;;;;;;;;;;
;;LEVEL 14 Startup
;;;;;;;;;;;;;;;;;;;;;;;;;;
Level_14_Begin:
  LDA #$0E
  STA level

  LDA #$00
  STA victim_num
  STA needdraw
  STA zombie
  STA boss_active
  STA death_init_flag

  LDA #$00
  STA beam_pal

  LDA #$03
  STA victim_max

  LDA #$04
  STA metatile_indx

  LDA #47
  STA frst_Background
  STA curr_Background
  STA curr_playfield

  LDA #52
  STA finl_Background

  LDA #$00
  STA zombie_pal_bank+2
  LDA #$01
  STA victim_pal_bank+1
  STA victim_pal_bank+3
  STA zombie_pal_bank
  LDA #$02
  STA victim_pal_bank
  STA victim_pal_bank+2
  STA zombie_pal_bank+1
  LDA #$03
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

  LDA #commie_song
  STA current_song
  JSR sound_load

;  LDA #$09
;  STA a_tens
;  LDA #$05
;  STA a_ones

  JMP First_Subs


;;;;;;;;;;;;;;;;;;;;;;;;;;
;;LEVEL 15 Startup
;;;;;;;;;;;;;;;;;;;;;;;;;;
Level_15_Begin:
  LDA #$0F
  STA level

  LDA #$00
  STA victim_num
  STA needdraw
  STA zombie
  STA boss_active
  STA death_init_flag

  LDA #$00
  STA beam_pal

  LDA #$03
  STA victim_max

  LDA #$04
  STA metatile_indx

  LDA #63
  STA frst_Background
  STA curr_Background
  STA curr_playfield

  LDA #68
  STA finl_Background

  LDA #$00
  STA zombie_pal_bank+2
  LDA #$01
  STA victim_pal_bank+1
  STA victim_pal_bank+3
  STA zombie_pal_bank
  LDA #$02
  STA victim_pal_bank
  STA victim_pal_bank+2
  STA zombie_pal_bank+1
  LDA #$03
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

  LDA #commie_song
  STA current_song
  JSR sound_load

;  LDA #$09
;  STA a_tens
;  LDA #$05
;  STA a_ones

  JMP First_Subs


;;;;;;;;;;;;;;;;;;;;;;;;;;
;;LEVEL 16 Startup
;;;;;;;;;;;;;;;;;;;;;;;;;;
Level_16_Begin:
  LDA #$10
  STA level

  LDA #$00
  STA victim_num
  STA needdraw
  STA zombie
  STA boss_active
  STA death_init_flag

  LDA #$00
  STA beam_pal

  LDA #$03
  STA victim_max

  LDA #$04
  STA metatile_indx

  LDA #69
  STA frst_Background
  STA curr_Background
  STA curr_playfield

  LDA #74
  STA finl_Background

  LDA #$00
  STA zombie_pal_bank+2
  LDA #$01
  STA victim_pal_bank+1
  STA victim_pal_bank+3
  STA zombie_pal_bank
  LDA #$02
  STA victim_pal_bank
  STA victim_pal_bank+2
  STA zombie_pal_bank+1
  LDA #$03
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

  LDA #commie_song
  STA current_song
  JSR sound_load

;  LDA #$09
;  STA a_tens
;  LDA #$05
;  STA a_ones

  JMP First_Subs


;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Boss 3 Startup
;;;;;;;;;;;;;;;;;;;;;;;;;;
Boss_3_Begin:
  LDA #$11
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

  LDA #$00
  STA beam_pal

  LDA #$03
  STA victim_max

  LDA #$08
  STA metatile_indx

  LDA #114
  STA frst_Background
  STA curr_Background
  STA curr_playfield

  LDA #114
  STA finl_Background

  LDA #$00
  STA zombie_pal_bank+2
  LDA #$01
  STA victim_pal_bank+1
  STA victim_pal_bank+3
  STA zombie_pal_bank
  LDA #$02
  STA victim_pal_bank
  STA victim_pal_bank+2
  STA zombie_pal_bank+1
  LDA #$03
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

  LDA #boss_song
  STA current_song
  JSR sound_load

  LDA #boss3
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