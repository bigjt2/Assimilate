;metatiles layout:
;;;;;;;;;;;
; 00 ; 01 ;
;;;;;;;;;;;
; 02 ; 03 ;
;;;;;;;;;;;

metatiles1:
  .dw sky_______00
  .dw bld1_l_1__01,bld1_l_2__02,bld1_l_3__03
  .dw bld1_r_1__04,bld1_r_2__05,bld1_r_3__06

  .dw bld2_l_1__07,bld2_l_2__08,bld2_m1_1_09,bld2_m1_2_0A
  .dw bld2_m2_1_0B,bld2_m2_2_0C,bld2_r_1__0D,bld2_r_2__0E

  .dw bld3_l_1__0F,bld3_l_2__10,bld3_l_3__11
  .dw bld3_r_1__12,bld3_r_2__13,bld3_r_3__14

  .dw bkg1_l_1__15,bkg1_l_2__16,bkg1_m1_1_17,bkg1_m1_2_18
  .dw bkg1_FILL_19,bkg1_sded_1A,bkg1_side_1B,bkg1_crnr_1C

  .dw bld4_l_1__1D,bld4_l_2__1E,bld4_l_3__1F,bld4_l_4__20,bld4_norf_21
  .dw bld4_r_1__22,bld4_r_2__23,bld4_r_3__24,bld4_r_4__25,bld4_norf_26

  .dw moon_l_1__27,moon_l_2__28,moon_r_1__29,moon_r_2__2A

  .dw boss1_1___2B,boss1_2___2C,boss1_3___2D,boss1_4___2E,boss1_5___2F
  .dw boss1_6___30,boss1_7___31,boss1_8___32,boss1_9___33,boss1_10__34
  .dw boss1_11__35,boss1_12__36,boss1_13__37,boss1_14__38,boss1_15__39
  .dw boss1_16__3A,boss1_17__3B,boss1_18__3C,boss1_19__3D,boss1_20__3E
  .dw boss1_21__3F,boss1_22__40,boss1_23__41

  .dw name_42,name_43,name_44,name_45,name_46,name_47,name_48
  .dw name_49,name_4A,name_4B,name_4C,name_4D,name_4E,name_4F,name_50

  .dw name_51,name_52,name_53,name_54,name_55,name_56,name_57,name_58
  .dw name_59,name_5A,name_5B,name_5C,name_5D,name_5E,name_5F,name_60

  .dw name_61,name_62,name_63,name_64,name_65,name_66,name_67,name_68
  .dw name_69,name_6A,name_6B,name_6C,name_6D,name_6E,name_6F,name_70

  .dw name_71,name_72,name_73,name_74

  .dw lvl_clear_75,lvl_clear_76,lvl_clear_77,lvl_clear_78,lvl_clear_79
  .dw lvl_clear_7A,lvl_clear_7B,lvl_clear_7C,lvl_clear_7D,lvl_clear_7E,lvl_clear_7F

sky_______00:
  .db $00,$00,$00,$00
bld1_l_1__01:
  .db $02,$03,$06,$07
bld1_l_2__02:
  .db $0A,$0B,$0E,$0F
bld1_l_3__03:
  .db $12,$0B,$14,$0F
bld1_r_1__04:
  .db $04,$05,$08,$09
bld1_r_2__05:
  .db $0C,$0D,$10,$11
bld1_r_3__06:
  .db $13,$0D,$15,$11

bld2_l_1__07:
  .db $16,$17,$1E,$1F
bld2_l_2__08:
  .db $26,$27,$26,$27
bld2_m1_1_09:
  .db $18,$19,$20,$21
bld2_m1_2_0A:
  .db $28,$29,$28,$29
bld2_m2_1_0B:
  .db $1A,$1B,$22,$23
bld2_m2_2_0C:
  .db $33,$34,$33,$34
bld2_r_1__0D:
  .db $1C,$1D,$24,$25
bld2_r_2__0E:
  .db $35,$36,$35,$36

bld3_l_1__0F:
  .db $3F,$40,$42,$83
bld3_l_2__10:
  .db $86,$87,$8A,$8B
bld3_l_3__11:
  .db $8A,$8B,$8A,$8B
bld3_r_1__12:
  .db $41,$00,$84,$85
bld3_r_2__13:
  .db $88,$89,$8C,$8D
bld3_r_3__14:
  .db $8C,$8D,$8C,$8D

bkg1_l_1__15:
  .db $00,$00,$37,$38
bkg1_l_2__16:
  .db $3B,$39,$3A,$3A
bkg1_m1_1_17:
  .db $3B,$3D,$3B,$3C
bkg1_m1_2_18:
  .db $3B,$3B,$3A,$3A
bkg1_FILL_19:
  .db $3B,$3B,$3B,$3B
bkg1_sded_1A:
  .db $3B,$3C,$3A,$3E
bkg1_side_1B:
  .db $3B,$3C,$3B,$3C
bkg1_crnr_1C:
  .db $3B,$39,$3B,$3B

bld4_l_1__1D:
  .db $90,$91,$94,$95
bld4_l_2__1E:
  .db $98,$99,$9C,$9D
bld4_l_3__1F:
  .db $A0,$A1,$A4,$A5
bld4_l_4__20:
  .db $A8,$A9,$AC,$AD
bld4_norf_21:
  .db $8E,$8F,$9c,$9D
bld4_r_1__22:
  .db $92,$93,$96,$97
bld4_r_2__23:
  .db $9A,$9B,$9E,$9F
bld4_r_3__24:
  .db $A2,$A3,$A6,$A7
bld4_r_4__25:
  .db $AA,$AB,$AE,$AF
bld4_norf_26:
  .db $D2,$D3,$9E,$9F

moon_l_1__27:
  .db $B0,$B1,$B4,$B5
moon_l_2__28:
  .db $B8,$B9,$BC,$BD
moon_r_1__29:
  .db $B2,$B3,$B6,$B7
moon_r_2__2A:
  .db $BA,$BB,$BE,$BF

boss1_1___2B:
  .db $00,$13,$1F,$20
boss1_2___2C:
  .db $2B,$2C,$00,$37
boss1_3___2D:
  .db $00,$3F,$00,$00
boss1_4___2E:
  .db $00,$00,$00,$09
boss1_5___2F:
  .db $14,$15,$21,$22
boss1_6___30:
  .db $2D,$2E,$38,$39
boss1_7___31:
  .db $40,$41,$85,$86
boss1_8___32:
  .db $02,$03,$0A,$0B
boss1_9___33:
  .db $16,$17,$23,$24
boss1_10__34:
  .db $2F,$30,$3A,$3B
boss1_11__35:
  .db $42,$83,$00,$00
boss1_12__36:
  .db $04,$05,$0C,$0D
boss1_13__37:
  .db $18,$19,$25,$26
boss1_14__38:
  .db $31,$33,$3C,$3D
boss1_15__39:
  .db $84,$00,$00,$00
boss1_16__3A:
  .db $00,$06,$0E,$0F
boss1_17__3B:
  .db $1A,$1B,$27,$28
boss1_18__3C:
  .db $34,$35,$3E,$00
boss1_19__3D:
  .db $07,$08,$10,$11
boss1_20__3E:
  .db $1C,$1D,$29,$2A
boss1_21__3F:
  .db $36,$00,$00,$00
boss1_22__40:
  .db $00,$00,$12,$00
boss1_23__41:
  .db $1E,$00,$00,$00


;level clear metatiles. always the last
lvl_clear_75:           ;upper left corner
  .db $71,$72,$75,$76
lvl_clear_76:           ;top left segment
  .db $72,$72,$77,$77
lvl_clear_77:           ;top right segment
  .db $73,$73,$77,$77
lvl_clear_78:           ;upper right corner
  .db $73,$74,$78,$79
lvl_clear_79:           ;left side
  .db $75,$80,$75,$80
lvl_clear_7A:           ;middle
  .db $77,$77,$77,$77
lvl_clear_7B:           ;right side
  .db $77,$79,$77,$79
lvl_clear_7C:           ;lower left corner
  .db $79,$7A,$7C,$7D
lvl_clear_7D:           ;bottom left segment
  .db $77,$77,$7D,$7D
lvl_clear_7E:           ;bottom right segment
  .db $77,$77,$7E,$7E
lvl_clear_7F:           ;lower right corner
  .db $7B,$79,$7E,$7F


;unused

name_42:
name_43:
name_44:
name_45:
name_46:
name_47:
name_48:
name_49:
name_4A:
name_4B:
name_4C:
name_4D:
name_4E:
name_4F:
name_50:

name_51:
name_52:
name_53:
name_54:
name_55:
name_56:
name_57:
name_58:
name_59:
name_5A:
name_5B:
name_5C:
name_5D:
name_5E:
name_5F:
name_60:

name_61:
name_62:
name_63:
name_64:
name_65:
name_66:
name_67:
name_68:
name_69:
name_6A:
name_6B:
name_6C:
name_6D:
name_6E:
name_6F:
name_70:

name_71:
name_72:
name_73:
name_74:
