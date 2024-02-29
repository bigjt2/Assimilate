;;Cutscene starts are what the level handler has to jump to once a level index
;;is changed.  It basically is meant to serve the same function as the level starts
;;only for cutscenes instead of levels.


;;;;;;;;;;;;;;;;;;;;;;;;;;
;;LEVEL 1 Announce
;;;;;;;;;;;;;;;;;;;;;;;;;;
CS_Level1:
  LDA #$01
  STA level
  LDA #$00
  STA event_counter

  JMP CutSceneInit


;;;;;;;;;;;;;;;;;;;;;;;;;;
;;LEVEL 2 Announce
;;;;;;;;;;;;;;;;;;;;;;;;;;
CS_Level2:
  LDA #$02
  STA level
  LDA #$00
  STA event_counter

  JMP CutSceneInit


;;;;;;;;;;;;;;;;;;;;;;;;;;
;;LEVEL 3 Announce
;;;;;;;;;;;;;;;;;;;;;;;;;;
CS_Level3:
  LDA #$03
  STA level
  LDA #$00
  STA event_counter

  JMP CutSceneInit


;;;;;;;;;;;;;;;;;;;;;;;;;;
;;LEVEL 4 Announce
;;;;;;;;;;;;;;;;;;;;;;;;;;
CS_Level4:
  LDA #$04
  STA level
  LDA #$00
  STA event_counter

  JMP CutSceneInit


;;;;;;;;;;;;;;;;;;;;;;;;;;
;;BOSS 1 Announce
;;;;;;;;;;;;;;;;;;;;;;;;;;
CS_Boss1:
  LDA #$05
  STA level
  LDA #$00
  STA event_counter

  JMP CutSceneInit


;;;;;;;;;;;;;;;;;;;;;;;;;;
;;LEVEL 6 Announce
;;;;;;;;;;;;;;;;;;;;;;;;;;
CS_Level6:
  LDA #$06
  STA level
  LDA #$00
  STA event_counter

  JMP CutSceneInit

;;;;;;;;;;;;;;;;;;;;;;;;;;
;;LEVEL 7 Announce
;;;;;;;;;;;;;;;;;;;;;;;;;;
CS_Level7:
  LDA #$07
  STA level
  LDA #$00
  STA event_counter

  JMP CutSceneInit

;;;;;;;;;;;;;;;;;;;;;;;;;;
;;LEVEL 8 Announce
;;;;;;;;;;;;;;;;;;;;;;;;;;
CS_Level8:
  LDA #$08
  STA level
  LDA #$00
  STA event_counter

  JMP CutSceneInit

;;;;;;;;;;;;;;;;;;;;;;;;;;
;;LEVEL 9 Announce
;;;;;;;;;;;;;;;;;;;;;;;;;;
CS_Level9:
  LDA #$09
  STA level
  LDA #$00
  STA event_counter

  JMP CutSceneInit


;;;;;;;;;;;;;;;;;;;;;;;;;;
;;LEVEL 10 Announce
;;;;;;;;;;;;;;;;;;;;;;;;;;
CS_Level10:
  LDA #$0A
  STA level
  LDA #$00
  STA event_counter

  JMP CutSceneInit


;;;;;;;;;;;;;;;;;;;;;;;;;;
;;BOSS 2 Announce
;;;;;;;;;;;;;;;;;;;;;;;;;;
CS_Boss2:
  LDA #$0B
  STA level
  LDA #$00
  STA event_counter

  JMP CutSceneInit


;;;;;;;;;;;;;;;;;;;;;;;;;;
;;LEVEL 12 Announce
;;;;;;;;;;;;;;;;;;;;;;;;;;
CS_Level12:
  LDA #$0C
  STA level
  LDA #$00
  STA event_counter

  JMP CutSceneInit


;;;;;;;;;;;;;;;;;;;;;;;;;;
;;LEVEL 13 Announce
;;;;;;;;;;;;;;;;;;;;;;;;;;
CS_Level13:
  LDA #$0D
  STA level
  LDA #$00
  STA event_counter

  JMP CutSceneInit


;;;;;;;;;;;;;;;;;;;;;;;;;;
;;LEVEL 14 Announce
;;;;;;;;;;;;;;;;;;;;;;;;;;
CS_Level14:
  LDA #$0E
  STA level
  LDA #$00
  STA event_counter

  JMP CutSceneInit


;;;;;;;;;;;;;;;;;;;;;;;;;;
;;LEVEL 15 Announce
;;;;;;;;;;;;;;;;;;;;;;;;;;
CS_Level15:
  LDA #$0F
  STA level
  LDA #$00
  STA event_counter

  JMP CutSceneInit


;;;;;;;;;;;;;;;;;;;;;;;;;;
;;LEVEL 16 Announce
;;;;;;;;;;;;;;;;;;;;;;;;;;
CS_Level16:
  LDA #$10
  STA level
  LDA #$00
  STA event_counter

  JMP CutSceneInit


;;;;;;;;;;;;;;;;;;;;;;;;;;
;;BOSS 3 Announce
;;;;;;;;;;;;;;;;;;;;;;;;;;
CS_Boss3:
  LDA #$11
  STA level
  LDA #$00
  STA event_counter

  JMP CutSceneInit


;;;;;;;;;;;;;;;;;;;;;;;;;;
;;LEVEL 18 Announce
;;;;;;;;;;;;;;;;;;;;;;;;;;
CS_Level18:
  LDA #$12
  STA level
  LDA #$00
  STA event_counter

  JMP CutSceneInit


;;;;;;;;;;;;;;;;;;;;;;;;;;
;;LEVEL 19 Announce
;;;;;;;;;;;;;;;;;;;;;;;;;;
CS_Level19:
  LDA #$13
  STA level
  LDA #$00
  STA event_counter

  JMP CutSceneInit


;;;;;;;;;;;;;;;;;;;;;;;;;;
;;LEVEL 20 Announce
;;;;;;;;;;;;;;;;;;;;;;;;;;
CS_Level20:
  LDA #$14
  STA level
  LDA #$00
  STA event_counter

  JMP CutSceneInit


;;;;;;;;;;;;;;;;;;;;;;;;;;
;;LEVEL 21 Announce
;;;;;;;;;;;;;;;;;;;;;;;;;;
CS_Level21:
  LDA #$15
  STA level
  LDA #$00
  STA event_counter

  JMP CutSceneInit


;;;;;;;;;;;;;;;;;;;;;;;;;;
;;BOSS 4 Announce
;;;;;;;;;;;;;;;;;;;;;;;;;;
CS_Boss4:
  LDA #$16
  STA level
  LDA #$00
  STA event_counter

  JMP CutSceneInit


;;;;;;;;;;;;;;;;;;;;;;;;;;
;;FINAL BOSS Announce
;;;;;;;;;;;;;;;;;;;;;;;;;;
CS_BossFinal:
  LDA #$17
  STA level
  LDA #$00
  STA event_counter

  JMP CutSceneInit


;;;;;;;;;;;;;;;;;;;;;;;;;;
;;COW LEVEL Announce
;;;;;;;;;;;;;;;;;;;;;;;;;;
CS_Cow_Level:
  LDA #$18
  STA level
  LDA #$00
  STA event_counter

  JMP CutSceneInit


;;;;;;;;;;;;;;;;;;;;;;;;;;
;;CAMPOUT LEVEL Announce
;;;;;;;;;;;;;;;;;;;;;;;;;;
CS_Campout_Level:
  LDA #$19
  STA level
  LDA #$00
  STA event_counter

  JMP CutSceneInit


;;;;;;;;;;;;
;;Ending
;;;;;;;;;;;;
CS_Ending:
  LDA #$1A
  STA level
  LDA #$00
  STA event_counter

  JMP CutSceneInit