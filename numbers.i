screen_changes:
  .db $00,$FF,$FE

beam_scoring:
  .db $00,$00, $00,$01, $00,$01, $00,$03, $00,$04, $00,$05
  .db $00,$06, $00,$07, $00,$08, $00,$09, $01,$50

previous_shuffle_index:
  .db $03,$00,$01,$02


;;;;;;;;;;;;;;;;;;;;
;;Bank Map
;;;;;;;;;;;;;;;;;;;;

bank_map:     ;.db swapable PRG bank, sprite CHR bank, background CHR bank
  .dw banks_cs_lvl1,banks_lvl1,banks_cs_lvl2,banks_lvl2
  .dw banks_cs_lvl3,banks_lvl3,banks_cs_lvl4,banks_lvl4
  .dw banks_cs_boss1,banks_boss1
  .dw banks_cs_cow,banks_cow

  .dw banks_cs_lvl6,banks_lvl6,banks_cs_lvl7,banks_lvl7
  .dw banks_cs_lvl8,banks_lvl8,banks_cs_lvl9,banks_lvl9
  .dw banks_cs_lvl10,banks_lvl10
  .dw banks_cs_boss2,banks_boss2
  .dw banks_cs_cow,banks_cow

  .dw banks_cs_lvl12,banks_lvl12,banks_cs_lvl13,banks_lvl13
  .dw banks_cs_lvl14,banks_lvl14,banks_cs_lvl15,banks_lvl15
  .dw banks_cs_lvl16,banks_lvl16
  .dw banks_cs_boss3,banks_boss3
  .dw banks_cs_cow,banks_cow

  .dw banks_cs_lvl18,banks_lvl18,banks_cs_lvl19,banks_lvl19
  .dw banks_cs_lvl20,banks_lvl20,banks_cs_lvl21,banks_lvl21
  .dw banks_cs_boss4,banks_boss4
  .dw banks_cs_finalboss,banks_finalboss
  .dw banks_cs_campout,banks_campout
  .dw banks_cs_ending, banks_credits
  .dw banks_reset

banks_cs_lvl1:
  .db $06,$00,$18
banks_lvl1:
  .db $01,$00,$02
banks_cs_lvl2:
  .db $06,$00,$18
banks_lvl2:
  .db $01,$00,$02
banks_cs_lvl3:
  .db $06,$00,$18
banks_lvl3:
  .db $01,$00,$02
banks_cs_lvl4:
  .db $06,$00,$18
banks_lvl4:
  .db $01,$00,$02
banks_cs_boss1:
  .db $06,$00,$19
banks_boss1:
  .db $01,$00,$03

banks_cs_lvl6:
  .db $06,$00,$1A
banks_lvl6:
  .db $02,$01,$04
banks_cs_lvl7:
  .db $06,$00,$18
banks_lvl7:
  .db $02,$01,$04
banks_cs_lvl8:
  .db $06,$00,$18
banks_lvl8:
  .db $02,$01,$05
banks_cs_lvl9:
  .db $06,$00,$18
banks_lvl9:
  .db $02,$01,$05
banks_cs_lvl10:
  .db $06,$00,$18
banks_lvl10:
  .db $02,$01,$05
banks_cs_boss2:
  .db $06,$00,$1B
banks_boss2:
  .db $02,$01,$04

banks_cs_lvl12:
  .db $06,$00,$1A
banks_lvl12:
  .db $03,$10,$08
banks_cs_lvl13:
  .db $06,$00,$18
banks_lvl13:
  .db $03,$10,$08
banks_cs_lvl14:
  .db $06,$00,$18
banks_lvl14:
  .db $03,$10,$08
banks_cs_lvl15:
  .db $06,$00,$18
banks_lvl15:
  .db $03,$10,$09
banks_cs_lvl16:
  .db $06,$00,$18
banks_lvl16:
  .db $03,$10,$09
banks_cs_boss3:
  .db $06,$10,$19
banks_boss3:
  .db $03,$10,$12

banks_cs_lvl18:
  .db $06,$00,$1B
banks_lvl18:
  .db $04,$11,$0A
banks_cs_lvl19:
  .db $06,$00,$18
banks_lvl19:
  .db $04,$11,$0A
banks_cs_lvl20:
  .db $06,$00,$18
banks_lvl20:
  .db $04,$11,$0A
banks_cs_lvl21:
  .db $06,$00,$18
banks_lvl21:
  .db $04,$11,$0A
banks_cs_boss4:
  .db $06,$00,$1B
banks_boss4:
  .db $04,$11,$0A
banks_cs_finalboss:
  .db $06,$00,$1C
banks_finalboss:
  .db $04,$11,$14

banks_cs_cow:
  .db $06,$00,$18
banks_cow:
  .db $01,$0F,$0C
banks_cs_campout:
  .db $06,$00,$18
banks_campout:
  .db $01,$0F,$0D

banks_cs_ending:
  .db $06,$00,$1C
banks_credits:
  .db $06,$00,$13

banks_reset:
  .db $01,$10,$12


;;;;;;;;;;;;;;;;;;;;
;;Background Indexes
;;;;;;;;;;;;;;;;;;;;

;these must be kept here, not on background.i, since there will be several background dat files
;and having the same indexes with the same labels will cause a label multiply error.
;in the end, this will limit us to 256 backgrounds, with fewer used for actual play areas due to the buffer backgrounds

background_index:
  .dw background_LC,background_BS
  .dw background_02,background_03,background_04,background_05,background_06
  .dw background_07,background_08,background_09,background_10,background_11
  .dw background_12,background_13,background_14,background_15,background_16
  .dw background_17,background_18,background_19,background_20,background_21
  .dw background_22,background_23,background_24,background_25,background_26
  .dw background_27,background_28,background_29,background_30,background_31
  .dw background_32,background_33,background_34,background_35,background_36
  .dw background_37,background_38,background_39,background_40,background_41
  .dw background_42,background_43,background_44,background_45,background_46
  .dw background_47,background_48,background_49,background_50,background_51
  .dw background_52,background_53,background_54,background_55,background_56
  .dw background_57,background_58,background_59,background_60,background_61
  .dw background_62,background_63,background_64,background_65,background_66
  .dw background_67,background_68,background_69,background_70,background_71
  .dw background_72,background_73,background_74,background_75,background_76
  .dw background_77,background_78,background_79,background_80,background_81
  .dw background_82,background_83,background_84,background_85,background_86
  .dw background_87,background_88,background_89,background_90,background_91
  .dw background_92,background_93,background_94,background_95,background_96
  .dw background_97,background_98,background_99,background_100,background_101
  .dw background_102,background_103,background_104,background_105,background_106
  .dw background_107,background_108,background_109,background_110,background_111
  .dw background_112,background_113,background_114,background_115,background_116
  .dw background_117,background_118,background_119,background_120,background_121

attribute_index:
  .dw attrib_LC,attrib_BS
  .dw attrib_02,attrib_03,attrib_04,attrib_05,attrib_06
  .dw attrib_07,attrib_08,attrib_09,attrib_10,attrib_11
  .dw attrib_12,attrib_13,attrib_14,attrib_15,attrib_16
  .dw attrib_17,attrib_18,attrib_19,attrib_20,attrib_21
  .dw attrib_22,attrib_23,attrib_24,attrib_25,attrib_26
  .dw attrib_27,attrib_28,attrib_29,attrib_30,attrib_31
  .dw attrib_32,attrib_33,attrib_34,attrib_35,attrib_36
  .dw attrib_37,attrib_38,attrib_39,attrib_40,attrib_41
  .dw attrib_42,attrib_43,attrib_44,attrib_45,attrib_46
  .dw attrib_47,attrib_48,attrib_49,attrib_50,attrib_51
  .dw attrib_52,attrib_53,attrib_54,attrib_55,attrib_56
  .dw attrib_57,attrib_58,attrib_59,attrib_60,attrib_61
  .dw attrib_62,attrib_63,attrib_64,attrib_65,attrib_66
  .dw attrib_67,attrib_68,attrib_69,attrib_70,attrib_71
  .dw attrib_72,attrib_73,attrib_74,attrib_75,attrib_76
  .dw attrib_77,attrib_78,attrib_79,attrib_80,attrib_81
  .dw attrib_82,attrib_83,attrib_84,attrib_85,attrib_86
  .dw attrib_87,attrib_88,attrib_89,attrib_90,attrib_91
  .dw attrib_92,attrib_93,attrib_94,attrib_95,attrib_96
  .dw attrib_97,attrib_98,attrib_99,attrib_100,attrib_101
  .dw attrib_102,attrib_103,attrib_104,attrib_105,attrib_106
  .dw attrib_107,attrib_108,attrib_109,attrib_110,attrib_111
  .dw attrib_112,attrib_113,attrib_114,attrib_115,attrib_116
  .dw attrib_117,attrib_118,attrib_119,attrib_120,attrib_121


bg_palette_index:
  .dw bg_palette00  ;end of level screen
  .dw bg_palette01,bg_palette02,bg_palette01,bg_palette03,bg_palette04  ;western
  .dw bg_palette05,bg_palette06,bg_palette07,bg_palette08,bg_palette03,bg_palette09  ;asia
  .dw bg_palette10,bg_palette11,bg_palette12,bg_palette12,bg_palette13,bg_palette18  ;soviet
  .dw bg_palette14,bg_palette14,bg_palette15,bg_palette16, bg_palette14,bg_palette19  ;moon
  .dw bg_palette_bonus,bg_palette_campout_DL  ;bonus levels
  .dw bg_palette01
sp_palette_index:
  .dw sp_palette00  ;end of level screen
  .dw sp_palette00,sp_palette00,sp_palette00,sp_palette01,sp_palette01  ;western
  .dw sp_palette02,sp_palette02,sp_palette02,sp_palette02,sp_palette02,sp_palette02  ;asia
  .dw sp_palette03,sp_palette03,sp_palette03,sp_palette03,sp_palette03,sp_palette05  ;soviet
  .dw sp_palette04,sp_palette04,sp_palette04,sp_palette04, sp_palette04,sp_palette04  ;moon
  .dw sp_cow_level,sp_campout    ;bonus levels
  .dw sp_palette00
init_pb_attrib:
  .dw init_pb_attr00  ;end of level screen
  .dw init_pb_attr01,init_pb_attr02,init_pb_attr03,init_pb_attr04  ;western
  .dw init_pb_attr05,init_pb_attr06,init_pb_attr07,init_pb_attr08,init_pb_attr09,init_pb_attr10,init_pb_attr11  ;asia
  .dw init_pb_attr12,init_pb_attr13,init_pb_attr14,init_pb_attr15,init_pb_attr16,init_pb_attr17  ;soviet
  .dw init_pb_attr18,init_pb_attr19,init_pb_attr20,init_pb_attr21, init_pb_attr22,init_pb_attr23  ;moon
  .dw init_pb_attr24,init_pb_attr25   ;bonus levels
  .dw init_pb_attr01    ;credits

metatile_table_index:
  .dw metatiles_SplTit
  .dw metatiles1, metatiles2, metatiles3, metatiles4, metatiles5
  .dw metatiles_cow, metatiles_campout, metatiles8, metatiles9
  .dw metatiles_bullshit

  .dw metatilesCR1


;;;;;;;;;;;;;;;;;;;;;
;;Collision Indexes
;;;;;;;;;;;;;;;;;;;;;

;these must now stay here as well, for same reason as background indexes

collision_object_index:
  .dw playfield0,playfield1,playfield2,playfield3,playfield4
  .dw playfield5,playfield6,playfield7,playfield8,playfield9
  .dw playfield10,playfield11,playfield12,playfield13
  .dw playfield14,playfield15,playfield16,playfield17
  .dw playfield18,playfield19,playfield20,playfield21
  .dw playfield22,playfield23,playfield24,playfield25
  .dw playfield26,playfield27,playfield28,playfield29
  .dw playfield30,playfield31,playfield32,playfield33
  .dw playfield34,playfield35,playfield36,playfield37
  .dw playfield38,playfield39,playfield40,playfield41
  .dw playfield42,playfield43,playfield44,playfield45
  .dw playfield46,playfield47,playfield48,playfield49
  .dw playfield50,playfield51,playfield52,playfield53
  .dw playfield54,playfield55,playfield56,playfield57
  .dw playfield58,playfield59,playfield60,playfield61
  .dw playfield62,playfield63,playfield64,playfield65
  .dw playfield66,playfield67,playfield68,playfield69
  .dw playfield70,playfield71,playfield72,playfield73
  .dw playfield74,playfield75,playfield76,playfield77
  .dw playfield78,playfield79,playfield80,playfield81
  .dw playfield82,playfield83,playfield84,playfield85
  .dw playfield86,playfield87,playfield88,playfield89
  .dw playfield90,playfield91,playfield92,playfield93
  .dw playfield94,playfield95,playfield96,playfield97
  .dw playfield98,playfield99,playfield100,playfield101
  .dw playfield102,playfield103,playfield104,playfield105
  .dw playfield106,playfield107,playfield108,playfield109
  .dw playfield110,playfield111,playfield112,playfield113
  .dw playfield114,playfield115,playfield116,playfield117
  .dw playfield118,playfield119,playfield120,playfield121

arrow_locations:
  .dw arrow00,arrow01,arrow02,arrow03,arrow04
  .dw arrow05,arrow06,arrow07,arrow08,arrow09
  .dw arrow10,arrow11,arrow12,arrow13
  .dw arrow14,arrow15,arrow16,arrow17
  .dw arrow18,arrow19,arrow20,arrow21
  .dw arrow22,arrow23,arrow24,arrow25
  .dw arrow26,arrow27,arrow28,arrow29
  .dw arrow30,arrow31,arrow32,arrow33
  .dw arrow34,arrow35,arrow36,arrow37
  .dw arrow38,arrow39,arrow40,arrow41
  .dw arrow42,arrow43,arrow44,arrow45
  .dw arrow46,arrow47,arrow48,arrow49
  .dw arrow50,arrow51,arrow52,arrow53
  .dw arrow54,arrow54,arrow56,arrow57
  .dw arrow58,arrow59,arrow60,arrow61
  .dw arrow62,arrow63,arrow64,arrow65
  .dw arrow66,arrow67,arrow68,arrow69
  .dw arrow70,arrow71,arrow72,arrow73
  .dw arrow74,arrow75,arrow76,arrow77
  .dw arrow78,arrow79,arrow80,arrow81
  .dw arrow82,arrow83,arrow84,arrow85
  .dw arrow86,arrow87,arrow88,arrow89
  .dw arrow90,arrow91,arrow92,arrow93
  .dw arrow94,arrow95,arrow96,arrow97
  .dw arrow98,arrow99,arrow100,arrow101
  .dw arrow102,arrow103,arrow104,arrow105
  .dw arrow106,arrow107,arrow108,arrow109
  .dw arrow110,arrow111,arrow112,arrow113
  .dw arrow114,arrow115,arrow116,arrow117
  .dw arrow118,arrow119,arrow120,arrow121

;;;;;;;;;;;;;;;
;;Ship Tiles
;;;;;;;;;;;;;;;

ship_tileset1:
  .db $01,$02,$03,$04,$05,$06,$07,$08
ship_tileset2:
  .db $14,$15,$16,$17,$18,$19,$1A,$1B

;;;;;;;;;;;;;;;;;;;;;;;;;
;;Menu Numbers
;;;;;;;;;;;;;;;;;;;;;;;;;
;;;<>
menu_cursor_pos:
  .db $1A,$08,$16,$B0,$1E,$A8

;;;<>
no_change_text:
  .db $E8,$E6,$F3,$F9,$77,$E8,$ED,$E6,$F3,$EC,$EA

;;;<>
assm_spd_index:    ;these are the arrow tiles below "progress" that represent how fast player can assimilate
  .dw as_one_x, as_two_x, as_three_x
as_one_x:
  .db $51,$52,$53,$54
as_two_x:
  .db $51,$82,$81,$54
as_three_x:
  .db $51,$82,$51,$82


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Tool Attributes and Graphics Tables
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;<>
tool_power:   ;use a number that progress_time must suprass to increment one unit on the progress bar
  .dw one_x_pow,two_x_pow,three_x_pow

one_x_pow:
  .db $04,$07,$0F,$18
two_x_pow:           
  .db $03,$05,$09,$0C
three_x_pow:         
  .db $02,$03,$05,$07

;;;;;;<>
tool_assm:    ;the amount using given tool contributes to assimilation percentage
  .db $01,$00, $01,$05, $02,$01, $02,$08

;;;<>
tool_points:  ;the amount of points a player gets when successfully planting a victim without dropping
  .db $02,$05,$05,$00,$06,$05,$07,$05     ;25,50,65,75

;;;<>
tool_topscreen_grpx:   ;first the six tiles repeated in $2000, and $2400, then the letters
  .dw brainwash,zombie_virus,plan_9,anal_probe
brainwash:
  .db $6B,$6C,$6D,$6E,$6F,$70, $E7,$F7,$E6,$EE,$F3,$FC,$E6,$F8,$ED,$77,$77,$77
zombie_virus:
  .db $5F,$60,$61,$62,$63,$64, $FF,$F4,$F2,$E7,$EE,$EA,$77,$FB,$EE,$F7,$FA,$F8
plan_9:        
  .db $65,$66,$67,$68,$69,$6A, $F5,$F1,$E6,$F3,$77,$E5,$77,$77,$77,$77,$77,$77
anal_probe:  
  .db $59,$5A,$5B,$5C,$5D,$5E, $E6,$F3,$E6,$F1,$77,$F5,$F7,$F4,$E7,$EA,$77,$77


;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Victim/Zombie Tiles/Pals
;;;;;;;;;;;;;;;;;;;;;;;;;;


victim_tile_index:
  .dw victim1,victim2,victim3,victim4

victim1:
  .db $09,$0A,$45,$46
victim2:
  .db $24,$25,$49,$4A
victim3:
  .db $53,$54,$55,$56
victim4:
  .db $57,$58,$59,$5A



zomb_tile_index:
  .dw zombie1,zombie2,zombie3,zombie4

zombie1:
  .db $0D,$0E,$47,$48
zombie2:
  .db $26,$27,$4B,$4C
zombie3:
  .db $5B,$5C,$5D,$5E
zombie4:
  .db $5F,$60,$61,$62


;;;;;;;;;;;;;;;;;;;;
;;STATEDEAD Graphics
;;;;;;;;;;;;;;;;;;;;

message:
  .db $E9,$EA,$E6,$E9,$DA,$00,$FE,$F4,$FA,$00
  .db $E6,$F7,$EA,$00,$EA,$F7,$F7,$F4,$F7,$DA  ;DEAD. YOU ARE ERROR.
  .db $F7,$EA,$F9,$F7,$FE,$00,$F5,$F7,$EA,$F8,$F8,$00,$E6,$00  ;RETRY PRESS A -- any message you enter for this must be an even number of characters

ship_expl_1:
  .db $FE,$28,$29,$FE
  .db $FE,$2A,$2B,$FE
ship_expl_2:
  .db $FE,$2C,$2D,$FE
  .db $FE,$2E,$2F,$30
ship_expl_3:
  .db $31,$32,$33,$34
  .db $35,$36,$37,$38

explosion_palette:
  .db $1D,$20,$10,$00
  .db $1D,$20,$10,$00
  .db $1D,$20,$10,$00
  .db $1D,$20,$10,$00

  .db $1D,$05,$17,$28
  .db $1D,$06,$17,$38
  .db $1D,$07,$38,$30
  .db $1D,$06,$26,$37

bg_flashing_palette:
  .db $1D,$38,$36,$30
  .db $1D,$36,$3C,$30
  .db $1D,$38,$36,$30
  .db $1D,$36,$3C,$30


;;;;;;;;;;;;;;;;;;;;;;;;
;;STATE_LVL_CLR Graphics
;;;;;;;;;;;;;;;;;;;;;;;;

level_clear_messages:
  .db $77,$E8,$F4,$F3,$EC,$F7,$E6,$F9,$F8,$D8,$D8,$77  ;congrats!!
  .db $F1,$EA,$FB,$EA,$F1,$77,$E8,$F1,$EA,$E6,$F7,$D8  ;level clear!
  .db $F8,$E8,$F4,$F7,$EA,$D7                          ;score: #####
  .db $77,$F9,$EE,$F2,$EA,$D7,$77,$D9                  ; time: -####
  .db $F9,$F4,$F9,$E6,$F1,$D7                          ;total: #####
  .db $F5,$F7,$EA,$F8,$F8,$77,$E6                      ;press a