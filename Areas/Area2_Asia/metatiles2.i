;metatiles layout:
;;;;;;;;;;;
; 00 ; 01 ;
;;;;;;;;;;;
; 02 ; 03 ;
;;;;;;;;;;;

metatiles2:
  .dw a_sky_______00

  .dw bld5_l_1__01,bld5_l_2__02,bld5_l_3__03,bld5_l_4__04
  .dw bld5_r_1__05,bld5_r_2__06,bld5_r_3__07,bld5_r_4__08

  .dw bld6_l_1__09,bld6_l_2__0A
  .dw bld6_r_1__0B,bld6_r_2__0C

  .dw bld7_l_1__0D,bld7_l_2__0E,bld7_l_3__0F
  .dw bld7_r_1__10,bld7_r_2__11,bld7_r_3__12

  .dw torii_l_1__13,torii_l_2__14
  .dw torii_r_1__15,torii_r_2__16

  .dw pgda_l_1__17,pgda_l_2__18
  .dw pgda_r_1__19,pgda_r_2__1A

  .dw mini_mtn__1B

  .dw med_mtn_1_1C,med_mtn_2_1D,med_mtn_3_1E,med_mtn_4_1F

  .dw big_mtn_1_20,big_mtn_2_21,big_mtn_3_22
  .dw big_mtn4A_23,big_mtn4B_24,big_mtn_5_25

  .dw fuji___01_26,fuji___02_27,fuji___03_28,fuji___04_29,fuji___05_2A,fuji___06_2B
  .dw fuji_REPT_2C,fuji___08_2D,fuji___09_2E,fuji___10_2F,fuji___11_30,fuji___12_31

  .dw tmpl_l_1__32,tmpl_l_2__33,tmpl_l_3__34
  .dw tmpl_r_1__35,tmpl_r_2__36,tmpl_r_3__37

  .dw chrytre1__38,chrytre2__39
  .dw chrytre3__3A,chrytre4__3B
  .dw chrytre5__3C,chrytre6__3D

  .dw torii_l_3_3E, torii_r_3_3F

  .dw chrytreNw_40

  .dw bld7_l_NW_41

  .dw tkyo_twrL_42
  .dw tkyo_twrR_43,tkyo_twrR_44,tkyo_twrR_45,tkyo_twrR_46
  .dw tkyo_twrR_47

  .dw fuji_06NW_48


;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;
a_sky_______00:
  .db $00,$00,$00,$00

bld5_l_1__01:
  .db $02,$03,$06,$07
bld5_l_2__02:
  .db $0A,$0B,$0E,$0F
bld5_l_3__03:
  .db $11,$12,$15,$16
bld5_l_4__04:
  .db $19,$1A,$15,$16
bld5_r_1__05:
  .db $04,$05,$08,$09
bld5_r_2__06:
  .db $0C,$0D,$00,$10
bld5_r_3__07:
  .db $13,$14,$17,$18
bld5_r_4__08:
  .db $1B,$1C,$17,$18

bld6_l_1__09:
  .db $1D,$1E,$21,$22
bld6_l_2__0A:
  .db $25,$26,$25,$29
bld6_r_1__0B:
  .db $1F,$20,$23,$24
bld6_r_2__0C:
  .db $27,$28,$27,$2A

bld7_l_1__0D:
  .db $00,$2B,$2D,$2E
bld7_l_2__0E:
  .db $31,$33,$36,$37
bld7_l_3__0F:
  .db $3A,$3B,$3A,$3D
bld7_r_1__10:
  .db $2C,$00,$2F,$30
bld7_r_2__11:
  .db $34,$35,$38,$39
bld7_r_3__12:
  .db $3C,$39,$3E,$39

torii_l_1__13:
  .db $3F,$40,$83,$84
torii_l_2__14:
  .db $00,$87,$00,$89
torii_r_1__15:
  .db $41,$42,$85,$86
torii_r_2__16:
  .db $88,$00,$8A,$00

pgda_l_1__17:
  .db $00,$8B,$8D,$8E
pgda_l_2__18:
  .db $91,$92,$95,$96
pgda_r_1__19:
  .db $8C,$00,$8F,$90
pgda_r_2__1A:
  .db $93,$94,$97,$98

mini_mtn__1B:
  .db $00,$00,$B1,$B3

med_mtn_1_1C:
  .db $00,$AC,$B1,$B2
med_mtn_2_1D:
  .db $A4,$AF,$B2,$B2
med_mtn_3_1E:
  .db $B0,$B0,$B2,$B2
med_mtn_4_1F:
  .db $00,$00,$B3,$00

big_mtn_1_20:
  .db $00,$AC,$B1,$B2
big_mtn_2_21:
  .db $B0,$00,$B2,$B2
big_mtn_3_22:
  .db $AC,$AD,$B2,$B2
big_mtn4A_23:
  .db $00,$00,$9D,$A2
big_mtn4B_24:
  .db $A5,$AA,$B2,$B2
big_mtn_5_25:
  .db $AB,$00,$B2,$B3

fuji___01_26:
  .db $00,$00,$00,$A3
fuji___02_27:
  .db $00,$AC,$B1,$B2
fuji___03_28:
  .db $00,$9D,$A4,$A5
fuji___04_29:
  .db $AD,$AE,$B2,$B2
fuji___05_2A:
  .db $00,$00,$99,$9A
fuji___06_2B:
  .db $9E,$9F,$A6,$A7

fuji_REPT_2C:
  .db $AE,$AE,$B2,$B2
fuji___08_2D:
  .db $00,$00,$9B,$9C
fuji___09_2E:
  .db $A0,$A1,$A8,$A9
fuji___10_2F:
  .db $AF,$B0,$B2,$B2
fuji___11_30:
  .db $A2,$00,$AA,$AB
fuji___12_31:
  .db $00,$00,$B3,$00

tmpl_l_1__32:
  .db $B4,$B5,$B8,$B9
tmpl_l_2__33:
  .db $BC,$BD,$C0,$C1
tmpl_l_3__34:
  .db $C4,$C5,$C8,$77
tmpl_r_1__35:
  .db $B6,$B7,$BA,$BB
tmpl_r_2__36:
  .db $BE,$BF,$C2,$C3
tmpl_r_3__37:
  .db $C6,$C7,$C9,$CA

chrytre1__38:
  .db $D7,$D8,$D0,$D1
chrytre2__39:
  .db $00,$CC,$00,$00
chrytre3__3A:
  .db $D9,$EB,$D2,$D3
chrytre4__3B:
  .db $CD,$CE,$CB,$00
chrytre5__3C:
  .db $00,$00,$D6,$00
chrytre6__3D:
  .db $CF,$00,$00,$00

torii_l_3_3E:
  .db $00,$89,$00,$89
torii_r_3_3F:
  .db $8A,$00,$8A,$00

chrytreNw_40:
  .db $00,$D8,$D0,$D1

bld7_l_NW_41:
  .db $36,$3B,$36,$3D

tkyo_twrL_42:
  .db $00,$D6,$D7,$EF

tkyo_twrR_43:
  .db $2B,$00,$2C,$00
tkyo_twrR_44:
  .db $2D,$00,$2E,$00
tkyo_twrR_45:
  .db $2F,$00,$30,$F0
tkyo_twrR_46:
  .db $3A,$F6,$CF,$FD

tkyo_twrR_47:
  .db $00,$00,$A6,$00

fuji_06NW_48:
  .db $9E,$9F,$AE,$A7
