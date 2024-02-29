CS_CR_Backgrounds:
  .dw CS_background_00, CS_background_01, CS_background_02, CS_background_03
  .dw CS_background_04, CS_background_05, CS_background_06

CS_CR_Attributes:
  .dw CS_attrib_00, CS_attrib_01, CS_attrib_02, CS_attrib_03
  .dw CS_attrib_04, CS_attrib_05, CS_attrib_06

;;;;;;;;;;;;;;;;;;
CS_background_00:
  .dw column122_1,column122_2,column122_3,column122_4,column122_5,column122_6,column122_7,column122_8
  .dw column122_9,column122_10,column122_11,column122_12,column122_13,column122_14,column122_15,column122_16

column122_1:
  .db $8B,$00
column122_2:
  .db $8B,$00
column122_3:
  .db $8B,$00
column122_4:
  .db $8B,$00
column122_5:
  .db $8B,$00
column122_6:
  .db $8B,$00
column122_7:
  .db $8B,$00
column122_8:
  .db $8B,$00
column122_9:
  .db $8B,$00
column122_10:
  .db $8B,$00
column122_11:
  .db $8B,$00
column122_12:
  .db $8B,$00
column122_13:
  .db $8B,$00
column122_14:
  .db $8B,$00
column122_15:
  .db $8B,$00
column122_16:
  .db $8B,$00

CS_attrib_00:
  .dw a_column122_1,a_column122_2,a_column122_3,a_column122_4,a_column122_5,a_column122_6,a_column122_7,a_column122_8

a_column122_1:
  .db $00,$55,$55,$55,$55,$00,$00,$00
a_column122_2:
  .db $00,$55,$55,$55,$55,$00,$00,$00
a_column122_3:
  .db $00,$55,$00,$00,$55,$00,$00,$00
a_column122_4:
  .db $00,$55,$00,$00,$55,$00,$00,$00
a_column122_5:
  .db $00,$55,$00,$00,$55,$00,$00,$00
a_column122_6:
  .db $00,$55,$00,$00,$55,$00,$00,$00
a_column122_7:
  .db $00,$55,$55,$55,$55,$00,$00,$00
a_column122_8:
  .db $00,$55,$55,$55,$55,$00,$00,$00


;;;;;;;;;;;;;;;;;;  City 1
CS_background_01:
  .dw column125_1,column125_2,column125_3,column125_4,column125_5,column125_6,column125_7,column125_8
  .dw column125_9,column125_10,column125_11,column125_12,column125_13,column125_14,column125_15,column125_16

column125_1:
  .db $86,$00,$17,$1B,$19,$18,$00
column125_2:
  .db $87,$00,$15,$1C,$18,$00
column125_3:
  .db $88,$00,$07,$08,$08
column125_4:
  .db $88,$00,$09,$0A,$0A
column125_5:
  .db $88,$00,$0B,$0C,$0C
column125_6:
  .db $88,$00,$0D,$0E,$0E
column125_7:
  .db $87,$00,$01,$02,$03,$03
column125_8:
  .db $87,$00,$04,$05,$06,$06
column125_9:
  .db $88,$00,$07,$08,$08
column125_10:
  .db $88,$00,$0D,$0E,$0E
column125_11:
  .db $88,$00,$15,$16,$00
column125_12:
  .db $88,$00,$17,$18,$00
column125_13:
  .db $86,$00,$1D,$1E,$1F,$20,$20
column125_14:
  .db $86,$00,$22,$23,$24,$25,$25
column125_15:
  .db $86,$00,$17,$1B,$19,$18,$00
column125_16:
  .db $85,$00,$17,$1B,$19,$19,$18,$00

CS_attrib_01:
  .dw a_column125_1,a_column125_2,a_column125_3,a_column125_4,a_column125_5,a_column125_6,a_column125_7,a_column125_8

a_column125_1:
  .db $00,$F0,$00,$00,$00,$FF,$FF,$00
a_column125_2:       
  .db $00,$F0,$00,$00,$00,$00,$55,$05
a_column125_3:
  .db $00,$F0,$00,$00,$00,$00,$55,$05
a_column125_4:
  .db $00,$F0,$00,$00,$00,$AA,$AA,$AA
;  .db $00,$F0,$00,$00,$00,$80,$88,$08
a_column125_5:
  .db $00,$F0,$00,$00,$00,$99,$99,$99
;  .db $00,$F0,$00,$00,$00,$00,$88,$08 
a_column125_6:
  .db $00,$F0,$00,$00,$00,$00,$FF,$00 
a_column125_7:
  .db $00,$F0,$00,$00,$00,$AA,$AA,$0A
a_column125_8:
  .db $00,$F0,$00,$00,$C0,$FF,$FF,$00


;;;;;;;;;;;;;;;;;;
CS_background_02:
  .dw column126_1,column126_2,column126_3,column126_4,column126_5,column126_6,column126_7,column126_8
  .dw column126_9,column126_10,column126_11,column126_12,column126_13,column126_14,column126_15,column126_16

column126_1:
  .db $86,$00,$17,$1B,$19,$18,$00
column126_2:
  .db $87,$00,$15,$1C,$18,$00
column126_3:
  .db $87,$00,$21,$1F,$20,$20
column126_4:
  .db $87,$00,$26,$24,$25,$25
column126_5:
  .db $88,$00,$01,$02,$03
column126_6:
  .db $88,$00,$04,$05,$06
column126_7:
  .db $88,$00,$15,$16,$00
column126_8:
  .db $88,$00,$01,$02,$03
column126_9:
  .db $88,$00,$04,$05,$06
column126_10:
  .db $88,$00,$17,$18,$00
column126_11:
  .db $87,$00,$17,$1C,$18,$00
column126_12:
  .db $87,$00,$17,$1B,$18,$00
column126_13:
  .db $87,$00,$01,$02,$03,$03
column126_14:
  .db $87,$00,$04,$05,$06,$06
column126_15:
  .db $88,$00,$17,$18,$00
column126_16:
  .db $88,$00,$17,$18,$00

CS_attrib_02:
  .dw a_column126_1,a_column126_2,a_column126_3,a_column126_4,a_column126_5,a_column126_6,a_column126_7,a_column126_8

a_column126_1:
  .db $00,$F0,$00,$F0,$FF,$F3,$FF,$00
a_column126_2:
  .db $00,$F0,$00,$00,$30,$AC,$AA,$0A
a_column126_3:
  .db $00,$F0,$00,$00,$F0,$FF,$99,$09
a_column126_4:
  .db $00,$F0,$00,$00,$FC,$CF,$77,$04
a_column126_5:
  .db $00,$F0,$00,$00,$FC,$3F,$EE,$02
a_column126_6:
  .db $00,$F0,$00,$00,$FF,$FF,$FF,$00
a_column126_7:
  .db $00,$F0,$00,$00,$03,$AF,$AA,$0A
a_column126_8:
  .db $00,$F0,$00,$00,$C0,$0F,$FF,$00


;;;;;;;;;;;;;;;;;;    City 2
CS_background_03:
  .dw column127_1,column127_2,column127_3,column127_4,column127_5,column127_6,column127_7,column127_8
  .dw column127_9,column127_10,column127_11,column127_12,column127_13,column127_14,column127_15,column127_16

column127_1:
  .db $87,$00,$17,$1B,$16,$00
;  .db $8B,$00
column127_2:
  .db $88,$00,$17,$16,$00
;  .db $89,$00,$16,$00
column127_3:
  .db $89,$00,$16,$00
column127_4:
  .db $88,$00,$15,$16,$00
column127_5:
  .db $88,$00,$17,$18,$00
column127_6:
  .db $87,$00,$01,$02,$03,$03
column127_7:
  .db $87,$00,$04,$05,$06,$06
column127_8:
  .db $88,$00,$15,$16,$00
column127_9:
  .db $88,$00,$17,$18,$00
column127_10:
  .db $87,$00,$17,$1C,$18,$00
column127_11:
  .db $86,$00,$01,$02,$03,$03,$03
column127_12:
  .db $86,$00,$04,$05,$06,$06,$06
column127_13:
  .db $87,$00,$17,$1C,$18,$00
column127_14:
  .db $87,$00,$01,$02,$03,$03
column127_15:
  .db $87,$00,$04,$05,$06,$06
column127_16:
  .db $88,$00,$15,$16,$00

CS_attrib_03:
  .dw a_column127_1,a_column127_2,a_column127_3,a_column127_4,a_column127_5,a_column127_6,a_column127_7,a_column127_8

a_column127_1:
  .db $00,$F0,$00,$00,$00,$F0,$FF,$00
;  .db $00,$F0,$00,$00,$00,$00,$C0,$00
a_column127_2:
  .db $00,$F0,$00,$00,$00,$00,$FC,$00
a_column127_3:
  .db $00,$F0,$00,$00,$00,$BB,$BB,$BB
;  .db $00,$F0,$00,$00,$00,$00,$33,$00
a_column127_4:
  .db $00,$F0,$00,$00,$00,$DD,$DD,$DD
;  .db $00,$F0,$00,$00,$00,$00,$CC,$00
a_column127_5:
  .db $00,$F0,$00,$00,$00,$C0,$FF,$00
a_column127_6:
  .db $00,$F0,$00,$00,$00,$AA,$AA,$AA
;  .db $00,$F0,$00,$00,$00,$00,$00,$00
a_column127_7:
  .db $00,$F0,$00,$00,$00,$BB,$BB,$BB
;  .db $00,$F0,$00,$00,$00,$30,$33,$00
a_column127_8:
  .db $00,$F0,$00,$00,$00,$DD,$DD,$DD
;  .db $00,$F0,$00,$00,$00,$00,$CC,$00


;;;;;;;;;;;;;;;;;;
CS_background_04:
  .dw column128_1,column128_2,column128_3,column128_4,column128_5,column128_6,column128_7,column128_8
  .dw column128_9,column128_10,column128_11,column128_12,column128_13,column128_14,column128_15,column128_16

column128_1:
  .db $84,$00,$17,$1B,$1B,$19,$19,$18,$00
column128_2:
  .db $86,$00,$01,$02,$03,$03,$03
column128_3:
  .db $86,$00,$04,$05,$06,$06,$06
column128_4:
  .db $86,$00,$07,$08,$08,$08,$08
column128_5:
  .db $86,$00,$09,$0A,$0A,$0A,$0A
column128_6:
  .db $86,$00,$0B,$0C,$0C,$0C,$0C
column128_7:
  .db $86,$00,$0D,$0E,$0E,$0E,$0E
column128_8:
  .db $87,$00,$0F,$10,$11,$11
column128_9:
  .db $87,$00,$12,$13,$14,$14
column128_10:
  .db $87,$00,$0F,$10,$11,$11
column128_11:
  .db $87,$00,$12,$13,$14,$14
column128_12:
  .db $87,$00,$07,$08,$08,$08
column128_13:
  .db $87,$00,$09,$0A,$0A,$0A
column128_14:
  .db $87,$00,$0B,$0C,$0C,$0C
column128_15:
  .db $87,$00,$0D,$0E,$0E,$0E
column128_16:
  .db $86,$00,$17,$1C,$19,$18,$00

CS_attrib_04:
  .dw a_column128_1,a_column128_2,a_column128_3,a_column128_4,a_column128_5,a_column128_6,a_column128_7,a_column128_8

a_column128_1:
  .db $00,$F0,$00,$00,$BB,$BB,$BB,$BB
;  .db $00,$F0,$00,$00,$33,$33,$33,$00
a_column128_2:
  .db $00,$F0,$00,$00,$00,$99,$99,$99
;  .db $00,$F0,$00,$00,$00,$88,$88,$88
a_column128_3:
  .db $00,$F0,$00,$00,$00,$AA,$AA,$0A
a_column128_4:
  .db $00,$F0,$00,$00,$00,$A2,$AA,$0A
a_column128_5:
  .db $00,$F0,$00,$00,$00,$AA,$AA,$AA
;  .db $00,$F0,$00,$00,$00,$20,$22,$02
a_column128_6:
  .db $00,$F0,$00,$00,$00,$66,$66,$66
;  .db $00,$F0,$00,$00,$00,$80,$88,$08
a_column128_7:
  .db $00,$F0,$00,$00,$00,$A0,$AA,$0A
a_column128_8:
  .db $00,$F0,$00,$00,$00,$EC,$EE,$02


;;;;;;;;;;;;;;;;;;       City 3
CS_background_05:
  .dw column129_1,column129_2,column129_3,column129_4,column129_5,column129_6,column129_7,column129_8
  .dw column129_9,column129_10,column129_11,column129_12,column129_13,column129_14,column129_15,column129_16

column129_1:
  .db $87,$00,$17,$1C,$18,$00
column129_2:
  .db $86,$00,$0F,$10,$11,$11,$11
column129_3:
  .db $86,$00,$12,$13,$14,$14,$14
column129_4:
  .db $85,$00,$07,$08,$08,$08,$08,$08
column129_5:
  .db $85,$00,$0D,$0E,$0E,$0E,$0E,$0E
column129_6:
  .db $86,$00,$07,$08,$08,$08,$08
column129_7:
  .db $86,$00,$09,$0A,$0A,$0A,$0A
column129_8:
  .db $86,$00,$0B,$0C,$0C,$0C,$0C
column129_9:
  .db $86,$00,$0D,$0E,$0E,$0E,$0E
column129_10:
  .db $87,$00,$17,$19,$18,$00
column129_11:
  .db $87,$00,$0F,$10,$11,$11
column129_12:
  .db $87,$00,$12,$13,$14,$14
column129_13:
  .db $86,$00,$17,$1C,$19,$18,$00
column129_14:
  .db $85,$00,$1D,$1E,$1F,$20,$20,$20
column129_15:
  .db $85,$00,$22,$23,$24,$25,$25,$25
column129_16:
  .db $85,$00,$17,$1B,$19,$19,$18,$00

CS_attrib_05:
  .dw a_column129_1,a_column129_2,a_column129_3,a_column129_4,a_column129_5,a_column129_6,a_column129_7,a_column129_8

a_column129_1:
  .db $00,$F0,$00,$00,$00,$74,$77,$04
a_column129_2:
  .db $00,$F0,$00,$00,$80,$99,$99,$09
a_column129_3:
  .db $00,$F0,$00,$00,$20,$AA,$AA,$0A
a_column129_4:
  .db $00,$F0,$00,$00,$00,$55,$55,$55
;  .db $00,$F0,$00,$00,$00,$00,$00,$00
a_column129_5:
  .db $00,$F0,$00,$00,$00,$DD,$DD,$DD
;  .db $00,$F0,$00,$00,$00,$C0,$CC,$00
a_column129_6:
  .db $00,$F0,$00,$00,$00,$F0,$FF,$FF
;  .db $00,$F0,$00,$00,$00,$00,$00,$00
a_column129_7:
  .db $00,$F0,$00,$00,$80,$BB,$BB,$08
a_column129_8:
  .db $00,$F0,$00,$00,$E0,$EE,$EE,$02


;;;;;;;;;;;;;;;;;;
CS_background_06:
  .dw column130_1,column130_2,column130_3,column130_4,column130_5,column130_6,column130_7,column130_8
  .dw column130_9,column130_10,column130_11,column130_12,column130_13,column130_14,column130_15,column130_16

column130_1:
  .db $86,$00,$17,$1B,$1B,$1A,$00
column130_2:
  .db $85,$00,$1D,$1E,$1F,$20,$20,$20
column130_3:
  .db $85,$00,$22,$23,$24,$25,$25,$25
column130_4:
  .db $88,$00,$01,$02,$03
column130_5:
  .db $88,$00,$04,$05,$06
column130_6:
  .db $85,$00,$17,$1B,$19,$19,$18,$00
column130_7:
  .db $84,$00,$17,$1B,$0A,$0A,$0A,$0A,$0A
column130_8:
  .db $85,$00,$15,$0C,$0C,$0C,$0C,$0C
column130_9:
  .db $83,$00,$17,$1B,$0A,$0A,$0A,$0A,$0A,$0A
column130_10:
  .db $83,$00,$15,$1B,$0C,$0C,$0C,$0C,$0C,$0C
column130_11:
  .db $85,$00,$26,$24,$25,$25,$25,$25
column130_12:
  .db $85,$00,$01,$02,$03,$03,$03,$03
column130_13:
  .db $85,$00,$04,$05,$06,$06,$06,$06
column130_14:
  .db $86,$00,$0F,$10,$11,$11,$11
column130_15:
  .db $86,$00,$12,$13,$14,$14,$14
column130_16:
  .db $85,$00,$17,$1B,$1B,$19,$18,$00

CS_attrib_06:
  .dw a_column130_1,a_column130_2,a_column130_3,a_column130_4,a_column130_5,a_column130_6,a_column130_7,a_column130_8

a_column130_1:
  .db $00,$F0,$00,$F0,$BF,$BB,$BB,$BB
;  .db $00,$F0,$00,$F0,$3F,$33,$33,$00
a_column130_2:
  .db $00,$F0,$00,$00,$55,$55,$55,$55
;  .db $00,$F0,$00,$00,$00,$0C,$00,$00
a_column130_3:
  .db $00,$F0,$00,$00,$F0,$CC,$FF,$03
a_column130_4:
  .db $00,$F0,$00,$00,$FF,$55,$55,$05
a_column130_5:
  .db $00,$F0,$00,$F0,$5F,$55,$55,$55
;  .db $00,$F0,$00,$F0,$0F,$00,$00,$00
a_column130_6:
  .db $00,$F0,$00,$00,$9C,$99,$99,$99
;  .db $00,$F0,$00,$00,$8C,$88,$88,$08
a_column130_7:
  .db $00,$F0,$00,$00,$23,$AA,$AA,$0A
a_column130_8:
  .db $00,$F0,$00,$00,$C0,$EE,$EE,$02


;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;
metatiles_bullshit:
  .dw bullshit00

bullshit00:
  .db $00,$00,$00,$00