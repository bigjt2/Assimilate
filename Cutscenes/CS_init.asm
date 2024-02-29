;;;;;;;;;;;;;;;
CutSceneInit:
  LDA #STATE_CUTSCENE
  STA gamestate

  LDA #$00
  STA needdraw
  STA CS_Sup_flag   ;make sure you clear this BEFORE jumping to CS_inits, or you'll wipe it out when it's supposed to be set
  STA CS_extend_addr_HI
  STA CS_extend_addr_LO

  LDA #silence_song
  STA current_song
  JSR sound_load

  LDA #00
  STA frst_Background

  JSR CS_init_ppu
  JSR CS_clear_sprites
  JSR CS_init

  LDA #%10010000
  STA soft_2000
  LDA #%00011110
  STA soft_2001

  JSR vblankwait
  JSR vblankwait

  LDA #$00
  STA skip_sprite0       ;inits for all the important pointers and flags
  STA CS_ptr
  STA CS_pic_row_clear
  STA starthold
  LDA #$FF
  STA CS_pic_ptr
  STA fade_timer

.run_cutscene:
  JMP Cutscene_return


;;;;;;;;;;;;;;
CS_init:

  LDA level
  ASL A
  TAY
  LDA CutScene_Init_JumpTable, y
  STA ptr1
  LDA CutScene_Init_JumpTable+1, y
  STA ptr1+1

  JMP [ptr1]


;;;;;;;;;;;;;;;;;;;
CS_clear_sprites:
  LDA #$FE
  LDY #$00
.spr_clear_loop:
  STA SpriteMap, y  
  INY            ;clear out sprite map in $0700 page
  CPY #$B8
  BCC .spr_clear_loop
  LDA #$26       ;and signify available space, this signifires 38 sprite spots are available
  STA SPR_Free   ;it leaves out the eight that will constantly be used by Ossan's graphics

  RTS


;;;;;;;;;;;;;;;;;;;;;;
;;Cut Scene Init Subs
;;;;;;;;;;;;;;;;;;;;;;;
  ;for our basic level cutscenes, this can be used to load the "Level 1... lives"
  ;for the ones we load pictures on, this can be handy way to load a big picture
  ;before the screen is turned back on.
CS_Init0:
  RTS

CS_Init1:
;  LDA #LOW(CS_LV1_txt)  ;set ptr1 to point to beginning of text string
;  STA ptr1
;  LDA #HIGH(CS_LV1_txt)
;  STA ptr1+1
;  JSR Load_Text

;  LDA #txt_blue
;  STA temp1
;  JSR Set_basic_cutscene_pal

  LDA #LOW(Ossan_Movement_Support_Subs)
  STA CS_Sup_Sub_Ptr
  LDA #HIGH(Ossan_Movement_Support_Subs)
  STA CS_Sup_Sub_Ptr+1

  LDA #$FF
  STA Ossan_x_targ
  LDA #$01
  STA CS_Sup_flag

  RTS

CS_Init2:
  LDA #LOW(CS_LV2_txt)  ;set ptr1 to point to beginning of text string
  STA ptr1
  LDA #HIGH(CS_LV2_txt)
  STA ptr1+1
  JSR Load_Text

  LDA #txt_blue
  STA temp1
  JSR Set_basic_cutscene_pal

  RTS

CS_Init3:
  LDA #LOW(CS_LV3_txt)  ;set ptr1 to point to beginning of text string
  STA ptr1
  LDA #HIGH(CS_LV3_txt)
  STA ptr1+1
  JSR Load_Text

  LDA #txt_blue
  STA temp1
  JSR Set_basic_cutscene_pal

  RTS

CS_Init4:
  LDA #LOW(CS_LV4_txt)  ;set ptr1 to point to beginning of text string
  STA ptr1
  LDA #HIGH(CS_LV4_txt)
  STA ptr1+1
  JSR Load_Text

  LDA #txt_green
  STA temp1
  JSR Set_basic_cutscene_pal

  RTS

CS_Init_Boss1:
;  LDA #LOW(CS_Boss1_txt)  ;set ptr1 to point to beginning of text string
;  STA ptr1
;  LDA #HIGH(CS_Boss1_txt)
;  STA ptr1+1
;  JSR Load_Text

;  LDA #txt_green
;  STA temp1
;  JSR Set_basic_cutscene_pal

  RTS

CS_Init6:
;  LDA #LOW(CS_LV6_txt)  ;set ptr1 to point to beginning of text string
;  STA ptr1
;  LDA #HIGH(CS_LV6_txt)
;  STA ptr1+1
;  JSR Load_Text

;  LDA #txt_brown
;  STA temp1
;  JSR Set_basic_cutscene_pal

  RTS

CS_Init7:
  LDA #LOW(CS_LV7_txt)  ;set ptr1 to point to beginning of text string
  STA ptr1
  LDA #HIGH(CS_LV7_txt)
  STA ptr1+1
  JSR Load_Text

  LDA #txt_brown
  STA temp1
  JSR Set_basic_cutscene_pal

  RTS

CS_Init8:
  LDA #LOW(CS_LV8_txt)  ;set ptr1 to point to beginning of text string
  STA ptr1
  LDA #HIGH(CS_LV8_txt)
  STA ptr1+1
  JSR Load_Text

  LDA #txt_brown
  STA temp1
  JSR Set_basic_cutscene_pal

  RTS

CS_Init9:
  LDA #LOW(CS_LV9_txt)  ;set ptr1 to point to beginning of text string
  STA ptr1
  LDA #HIGH(CS_LV9_txt)
  STA ptr1+1
  JSR Load_Text

  LDA #$01
  STA temp1
  JSR Set_basic_cutscene_pal

  RTS

CS_Init10:
  LDA #LOW(CS_LV10_txt)  ;set ptr1 to point to beginning of text string
  STA ptr1
  LDA #HIGH(CS_LV10_txt)
  STA ptr1+1
  JSR Load_Text

  LDA #txt_green
  STA temp1
  JSR Set_basic_cutscene_pal

  RTS

CS_Init_Boss2:
;  LDA #LOW(CS_Boss2_txt)  ;set ptr1 to point to beginning of text string
;  STA ptr1
;  LDA #HIGH(CS_Boss2_txt)
;  STA ptr1+1
;  JSR Load_Text

;  LDA #txt_brown
;  STA temp1
;  JSR Set_basic_cutscene_pal

  RTS

CS_Init12:
;  LDA #LOW(CS_LV12_txt)  ;set ptr1 to point to beginning of text string
;  STA ptr1
;  LDA #HIGH(CS_LV12_txt)
;  STA ptr1+1
;  JSR Load_Text

;  LDA #txt_red
;  STA temp1
;  JSR Set_basic_cutscene_pal

  RTS

CS_Init13:
  LDA #LOW(CS_LV13_txt)  ;set ptr1 to point to beginning of text string
  STA ptr1
  LDA #HIGH(CS_LV13_txt)
  STA ptr1+1
  JSR Load_Text

  LDA #txt_red
  STA temp1
  JSR Set_basic_cutscene_pal

  RTS

CS_Init14:
  LDA #LOW(CS_LV14_txt)  ;set ptr1 to point to beginning of text string
  STA ptr1
  LDA #HIGH(CS_LV14_txt)
  STA ptr1+1
  JSR Load_Text

  LDA #txt_red
  STA temp1
  JSR Set_basic_cutscene_pal

  RTS

CS_Init15:
  LDA #LOW(CS_LV15_txt)  ;set ptr1 to point to beginning of text string
  STA ptr1
  LDA #HIGH(CS_LV15_txt)
  STA ptr1+1
  JSR Load_Text

  LDA #txt_red
  STA temp1
  JSR Set_basic_cutscene_pal

  RTS

CS_Init16:
  LDA #LOW(CS_LV16_txt)  ;set ptr1 to point to beginning of text string
  STA ptr1
  LDA #HIGH(CS_LV16_txt)
  STA ptr1+1
  JSR Load_Text

  LDA #txt_green
  STA temp1
  JSR Set_basic_cutscene_pal

  RTS

CS_Init_Boss3:
;  LDA #LOW(CS_Boss3_txt)  ;set ptr1 to point to beginning of text string
;  STA ptr1
;  LDA #HIGH(CS_Boss3_txt)
;  STA ptr1+1
;  JSR Load_Text

;  LDA #txt_green
;  STA temp1
;  JSR Set_basic_cutscene_pal

  JSR MStalin_eyes_setup

  RTS

CS_Init18:
;  LDA #LOW(CS_LV18_txt)  ;set ptr1 to point to beginning of text string
;  STA ptr1
;  LDA #HIGH(CS_LV18_txt)
;  STA ptr1+1
;  JSR Load_Text

;  LDA #txt_purple
;  STA temp1
;  JSR Set_basic_cutscene_pal

  RTS

CS_Init19:
  LDA #LOW(CS_LV19_txt)  ;set ptr1 to point to beginning of text string
  STA ptr1
  LDA #HIGH(CS_LV19_txt)
  STA ptr1+1
  JSR Load_Text

  LDA #txt_purple
  STA temp1
  JSR Set_basic_cutscene_pal

  RTS

CS_Init20:
  LDA #LOW(CS_LV20_txt)  ;set ptr1 to point to beginning of text string
  STA ptr1
  LDA #HIGH(CS_LV20_txt)
  STA ptr1+1
  JSR Load_Text

  LDA #txt_purple
  STA temp1
  JSR Set_basic_cutscene_pal

  RTS

CS_Init21:
  LDA #LOW(CS_LV21_txt)  ;set ptr1 to point to beginning of text string
  STA ptr1
  LDA #HIGH(CS_LV21_txt)
  STA ptr1+1
  JSR Load_Text

  LDA #txt_purple
  STA temp1
  JSR Set_basic_cutscene_pal

  RTS

CS_Init_Boss4:
;  LDA #LOW(CS_Boss4_txt)  ;set ptr1 to point to beginning of text string
;  STA ptr1
;  LDA #HIGH(CS_Boss4_txt)
;  STA ptr1+1
;  JSR Load_Text

;  LDA #txt_purple
;  STA temp1
;  JSR Set_basic_cutscene_pal

  RTS

CS_Init_FinalBoss:
;  LDA #LOW(CS_FinalBoss_txt)  ;set ptr1 to point to beginning of text string
;  STA ptr1
;  LDA #HIGH(CS_FinalBoss_txt)
;  STA ptr1+1
;  JSR Load_Text

;  LDA #txt_purple
;  STA temp1
;  JSR Set_basic_cutscene_pal

  LDA #LOW(Ossan_Movement_Support_Subs)
  STA CS_Sup_Sub_Ptr
  LDA #HIGH(Ossan_Movement_Support_Subs)
  STA CS_Sup_Sub_Ptr+1

  LDA #$FF
  STA Ossan_x_targ
  LDA #$01
  STA CS_Sup_flag
  LDA #$00          ;in case the ship flashing at end of previous level
  STA ship_pal      ;set the pal to a different entry

  RTS

CS_Init_Cow:
  LDA #LOW(CS_Cow_txt)  ;set ptr1 to point to beginning of text string
  STA ptr1
  LDA #HIGH(CS_Cow_txt)
  STA ptr1+1
  JSR Load_Text

  LDA #LOW(CS_Bonus_txt)
  STA ptr1
  LDA #HIGH(CS_Bonus_txt)
  STA ptr1+1
  JSR Load_Text

  LDA #txt_white
  STA temp1
  JSR Set_basic_cutscene_pal

  RTS

CS_Init_Campout:
  LDA #LOW(CS_Campout_txt)  ;set ptr1 to point to beginning of text string
  STA ptr1
  LDA #HIGH(CS_Campout_txt)
  STA ptr1+1
  JSR Load_Text

  LDA #LOW(CS_Bonus_txt)
  STA ptr1
  LDA #HIGH(CS_Bonus_txt)
  STA ptr1+1
  JSR Load_Text

  LDA #$11
  STA temp1
  JSR Set_basic_cutscene_pal

  RTS

CS_Init_EndingCS:

  RTS

  ;; here would be a good place to load a large picture, if you decide to do it

;;;;;;;;;;;;;;;;;;;;;;;;
CutScene_Init_JumpTable:
  .dw CS_Init0, CS_Init1, CS_Init2, CS_Init3, CS_Init4, CS_Init_Boss1
  .dw CS_Init6, CS_Init7, CS_Init8, CS_Init9, CS_Init10, CS_Init_Boss2
  .dw CS_Init12, CS_Init13, CS_Init14, CS_Init15, CS_Init16, CS_Init_Boss3
  .dw CS_Init18, CS_Init19, CS_Init20, CS_Init21, CS_Init_Boss4, CS_Init_FinalBoss
  .dw CS_Init_Cow, CS_Init_Campout, CS_Init_EndingCS