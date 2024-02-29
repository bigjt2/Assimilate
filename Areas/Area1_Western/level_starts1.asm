;;;;;;;;;;;;;;;;;;;;;;;;;;
;;LEVEL 1 Startup
;;;;;;;;;;;;;;;;;;;;;;;;;;
Level_1_Begin:
  LDA #$01
  STA level

  LDA #$00
  STA victim_num
  STA needdraw
  STA zombie
  STA boss_active
  STA death_init_flag

  LDA #$01
  STA victim_max
  STA metatile_indx

  LDA #$02
  STA beam_pal

  LDA #10
  STA frst_Background
  STA curr_Background
  STA curr_playfield

  LDA #12
  STA finl_Background

  LDA #$01
  STA victim_pal_bank
  STA victim_pal_bank+1
  LDA #$02
  STA zombie_pal_bank
  LDA #$03
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

  LDA #awesome_song
  STA current_song
  JSR sound_load

;  LDA #$09
;  STA a_tens
;  LDA #$05
;  STA a_ones

  JMP First_Subs


;;;;;;;;;;;;;;;;;;;;;;;;;;
;;LEVEL 2 Startup
;;;;;;;;;;;;;;;;;;;;;;;;;;
Level_2_Begin:
  LDA #$02
  STA level

  LDA #$00
  STA victim_num
  STA needdraw
  STA zombie
  STA boss_active
  STA death_init_flag

  LDA #$01
  STA victim_max
  STA metatile_indx

  LDA #$02
  STA beam_pal

  LDA #$06
  STA frst_Background
  STA curr_Background
  STA curr_playfield

  LDA #$09
  STA finl_Background

  LDA #$01
  STA victim_pal_bank
  STA victim_pal_bank+1
  LDA #$02
  STA zombie_pal_bank
  LDA #$03
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

  LDA #awesome_song
  STA current_song
  JSR sound_load

;  LDA #$09
;  STA a_tens
;  LDA #$05
;  STA a_ones

  JMP First_Subs


;;;;;;;;;;;;;;;;;;;;;;;;;;
;;LEVEL 3 Startup
;;;;;;;;;;;;;;;;;;;;;;;;;;
Level_3_Begin:
  LDA #$03
  STA level

  LDA #$00
  STA victim_num
  STA needdraw
  STA zombie
  STA boss_active
  STA death_init_flag

  LDA #$01
  STA victim_max
  STA metatile_indx

  LDA #$02
  STA frst_Background
  STA curr_Background
  STA curr_playfield
  STA beam_pal

  LDA #$05
  STA finl_Background

  LDA #$01
  STA victim_pal_bank
  STA victim_pal_bank+1
  LDA #$02
  STA zombie_pal_bank
  LDA #$03
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

  LDA #awesome_song
  STA current_song
  JSR sound_load

;  LDA #$09
;  STA a_tens
;  LDA #$05
;  STA a_ones

  JMP First_Subs


;;;;;;;;;;;;;;;;;;;;;;;;;;
;;LEVEL 4 Startup
;;;;;;;;;;;;;;;;;;;;;;;;;;
Level_4_Begin:
  LDA #$04
  STA level

  LDA #$00
  STA victim_num
  STA needdraw
  STA zombie
  STA boss_active
  STA death_init_flag

  LDA #$01
  STA victim_max
  STA metatile_indx

  LDA #$02
  STA beam_pal

  LDA #13
  STA frst_Background
  STA curr_Background
  STA curr_playfield

  LDA #16
  STA finl_Background

  LDA #$01
  STA victim_pal_bank
  STA victim_pal_bank+1
  LDA #$02
  STA zombie_pal_bank
  LDA #$03
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

  LDA #awesome_song
  STA current_song
  JSR sound_load

;  LDA #$09
;  STA a_tens
;  LDA #$05
;  STA a_ones

  JMP First_Subs


;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Boss 1 Startup
;;;;;;;;;;;;;;;;;;;;;;;;;;
Boss_1_Begin:
  LDA #$05
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
  STA victim_max
  STA metatile_indx

  LDA #$02
  STA beam_pal

  LDA #17
  STA frst_Background
  STA curr_Background
  STA curr_playfield

  LDA #17
  STA finl_Background

  LDA #$01
  STA victim_pal_bank
  STA victim_pal_bank+1
  LDA #$02
  STA zombie_pal_bank
  LDA #$03
  STA zombie_pal_bank+1

  LDA #$18
  STA temp1
  LDA #$40
  STA temp2
  JSR init_ship

  LDA #$D8
  STA bottom_border

  LDA #boss_song
  STA current_song
  JSR sound_load

  LDA #boss1
  STA boss_num

  LDA boss_num   ;#boss1 is zero, so no need to ASL
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
;;Temporary reset at end
;;;;;;;;;;;;;;;;;;;;;;;;;;
End_Reset:

  LDA #$00
  STA event_counter
  LDA #STATE_RESET
  STA gamestate

  JMP GameEngine