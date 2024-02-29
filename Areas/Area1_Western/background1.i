;Each background loads left to right, top to bottom.
;So columnxx_1 is the farthest left column of the screen and columnxx_16 is the fartherst right.
;The first byte of each column is the top of the column, the last byte is the bottom.

;for RLE, set bit 7 to 1 == $8(number of times to write),$(metatile number)

;;;;;;;;;;;;;;;;;;

;background_beg, attrib_beg, background_end, & attrib_end serve as header and footer tables.  If you don't have data
;ready to load into the buffer when at the left edge of the first screen or right edge of the last screen, the PPU
;will start loading a bunch of junk onto the screen and eventually go nuts.  These first and last tables prevent
;that from happening.

;;;;;;;;;;;;;;;;;;
background_LC:
  .dw columnLC_1,columnLC_2,columnLC_3,columnLC_4,columnLC_5,columnLC_6,columnLC_7,columnLC_8
  .dw columnLC_9,columnLC_10,columnLC_11,columnLC_12,columnLC_13,columnLC_14,columnLC_15,columnLC_16

columnLC_1:
  .db $8B,$00
columnLC_2:
  .db $8B,$00
columnLC_3:
  .db $8B,$00
columnLC_4:
  .db $8B,$00
columnLC_5:
  .db $75,$84,$79,$7C,$85,$00
columnLC_6:
  .db $76,$84,$7A,$7D,$85,$00
columnLC_7:
  .db $76,$84,$7A,$7D,$85,$00
columnLC_8:
  .db $76,$84,$7A,$7D,$85,$00
columnLC_9:
  .db $77,$84,$7A,$7E,$85,$00
columnLC_10:
  .db $77,$84,$7A,$7E,$85,$00
columnLC_11:
  .db $77,$84,$7A,$7E,$85,$00
columnLC_12:
  .db $78,$84,$7B,$7F,$85,$00
columnLC_13:
  .db $8B,$00
columnLC_14:
  .db $8B,$00
columnLC_15:
  .db $8B,$00
columnLC_16:
  .db $8B,$00

attrib_LC:
  .dw a_columnLC_1,a_columnLC_2,a_columnLC_3,a_columnLC_4,a_columnLC_5,a_columnLC_6,a_columnLC_7,a_columnLC_8

a_columnLC_1:
  .db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
a_columnLC_2:
  .db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
a_columnLC_3:
  .db $FF,$FF,$AA,$AA,$AA,$AA,$AA,$AA
a_columnLC_4:
  .db $FF,$FF,$AA,$AA,$AA,$AA,$AA,$AA
a_columnLC_5:
  .db $FF,$FF,$AA,$AA,$AA,$AA,$AA,$AA
a_columnLC_6:
  .db $FF,$FF,$AA,$AA,$AA,$AA,$AA,$AA
a_columnLC_7:
  .db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
a_columnLC_8:
  .db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF


;;;;;;;;;;;;;;;;;;
background_BS:
  .dw columnBS_1,columnBS_2,columnBS_3,columnBS_4,columnBS_5,columnBS_6,columnBS_7,columnBS_8
  .dw columnBS_9,columnBS_10,columnBS_11,columnBS_12,columnBS_13,columnBS_14,columnBS_15,columnBS_16

columnBS_1:
  .db $8B,$00
columnBS_2:
  .db $8B,$00
columnBS_3:
  .db $8B,$00
columnBS_4:
  .db $8B,$00
columnBS_5:
  .db $8B,$00
columnBS_6:
  .db $8B,$00
columnBS_7:
  .db $8B,$00
columnBS_8:
  .db $8B,$00
columnBS_9:
  .db $8B,$00
columnBS_10:
  .db $8B,$00
columnBS_11:
  .db $8B,$00
columnBS_12:
  .db $8B,$00
columnBS_13:
  .db $8B,$00
columnBS_14:
  .db $8B,$00
columnBS_15:
  .db $8B,$00
columnBS_16:
  .db $8B,$00

attrib_BS:
  .dw a_columnBS_1,a_columnBS_2,a_columnBS_3,a_columnBS_4,a_columnBS_5,a_columnBS_6,a_columnBS_7,a_columnBS_8

a_columnBS_1:
  .db $FF,$FF,$00,$00,$00,$00,$00,$00
a_columnBS_2:
  .db $FF,$FF,$00,$00,$00,$00,$00,$00
a_columnBS_3:
  .db $FF,$FF,$00,$00,$00,$00,$00,$00
a_columnBS_4:
  .db $FF,$FF,$00,$00,$00,$00,$00,$00
a_columnBS_5:
  .db $FF,$FF,$00,$00,$00,$00,$00,$00
a_columnBS_6:
  .db $FF,$FF,$00,$00,$00,$00,$00,$00
a_columnBS_7:
  .db $FF,$FF,$00,$00,$00,$00,$00,$00
a_columnBS_8:
  .db $FF,$FF,$00,$00,$00,$00,$00,$00


;;;;;;;;;;;;;;;;;;    ;LEVEL 3 BEGINS HERE;;
background_02:
  .dw column02_1,column02_2,column02_3,column02_4,column02_5,column02_6,column02_7,column02_8
  .dw column02_9,column02_10,column02_11,column02_12,column02_13,column02_14,column02_15,column02_16

column02_1:
  .db $8B,$00
column02_2:
  .db $89,$00,$16,$00
column02_3:
  .db $89,$00,$16,$00
column02_4:
  .db $88,$00,$15,$16,$00
column02_5:
  .db $88,$00,$17,$18,$00
column02_6:
  .db $87,$00,$01,$02,$03,$03
column02_7:
  .db $87,$00,$04,$05,$06,$06
column02_8:
  .db $88,$00,$15,$16,$00
column02_9:
  .db $88,$00,$17,$18,$00
column02_10:
  .db $87,$00,$17,$1C,$18,$00
column02_11:
  .db $86,$00,$01,$02,$03,$03,$03
column02_12:
  .db $86,$00,$04,$05,$06,$06,$06
column02_13:
  .db $87,$00,$17,$1C,$18,$00
column02_14:
  .db $87,$00,$01,$02,$03,$03
column02_15:
  .db $87,$00,$04,$05,$06,$06
column02_16:
  .db $88,$00,$15,$16,$00

attrib_02:
  .dw a_column02_1,a_column02_2,a_column02_3,a_column02_4,a_column02_5,a_column02_6,a_column02_7,a_column02_8

a_column02_1:
  .db $00,$F0,$00,$00,$00,$00,$C0,$00
a_column02_2:
  .db $00,$F0,$00,$00,$00,$00,$FC,$00
a_column02_3:
  .db $00,$F0,$00,$00,$00,$00,$33,$00
a_column02_4:
  .db $00,$F0,$00,$00,$00,$00,$CC,$00
a_column02_5:
  .db $00,$F0,$00,$00,$00,$C0,$FF,$00
a_column02_6:
  .db $00,$F0,$00,$00,$00,$00,$00,$00
a_column02_7:
  .db $00,$F0,$00,$00,$00,$30,$33,$00
a_column02_8:
  .db $00,$F0,$00,$00,$00,$00,$CC,$00


;;;;;;;;;;;;;;;;;;
background_03:
  .dw column03_1,column03_2,column03_3,column03_4,column03_5,column03_6,column03_7,column03_8
  .dw column03_9,column03_10,column03_11,column03_12,column03_13,column03_14,column03_15,column03_16

column03_1:
  .db $88,$00,$17,$18,$00
column03_2:
  .db $87,$00,$0F,$10,$11,$11
column03_3:
  .db $87,$00,$12,$13,$14,$14
column03_4:
  .db $86,$00,$01,$02,$03,$03,$03
column03_5:
  .db $86,$00,$04,$05,$06,$06,$06
column03_6:
  .db $88,$00,$07,$08,$08
column03_7:
  .db $88,$00,$09,$0A,$0A
column03_8:
  .db $88,$00,$0B,$0C,$0C
column03_9:
  .db $88,$00,$0D,$0E,$0E
column03_10:
  .db $87,$00,$17,$1C,$18,$00
column03_11:
  .db $87,$00,$17,$1B,$18,$00
column03_12:
  .db $88,$00,$0F,$10,$11
column03_13:
  .db $88,$00,$12,$13,$14
column03_14:
  .db $87,$00,$0F,$10,$11,$11
column03_15:
  .db $87,$00,$12,$13,$14,$14
column03_16:
  .db $86,$00,$15,$1B,$1C,$18,$00

attrib_03:
  .dw a_column03_1,a_column03_2,a_column03_3,a_column03_4,a_column03_5,a_column03_6,a_column03_7,a_column03_8

a_column03_1:
  .db $00,$F0,$00,$00,$00,$40,$77,$04
a_column03_2:       
  .db $00,$F0,$00,$00,$00,$10,$11,$01
a_column03_3:
  .db $00,$F0,$00,$00,$00,$00,$88,$08
a_column03_4:
  .db $00,$F0,$00,$00,$00,$00,$AA,$0A
a_column03_5:
  .db $00,$F0,$00,$00,$00,$C0,$EE,$02
a_column03_6:
  .db $00,$F0,$00,$00,$00,$30,$77,$04
a_column03_7:
  .db $00,$F0,$00,$00,$00,$40,$55,$05
a_column03_8:
  .db $00,$F0,$00,$00,$00,$DC,$DD,$01


;;;;;;;;;;;;;;;;;;
background_04:
  .dw column04_1,column04_2,column04_3,column04_4,column04_5,column04_6,column04_7,column04_8
  .dw column04_9,column04_10,column04_11,column04_12,column04_13,column04_14,column04_15,column04_16

column04_1:
  .db $84,$00,$17,$1B,$1B,$19,$19,$18,$00
column04_2:
  .db $86,$00,$01,$02,$03,$03,$03
column04_3:
  .db $86,$00,$04,$05,$06,$06,$06
column04_4:
  .db $86,$00,$07,$08,$08,$08,$08
column04_5:
  .db $86,$00,$09,$0A,$0A,$0A,$0A
column04_6:
  .db $86,$00,$0B,$0C,$0C,$0C,$0C
column04_7:
  .db $86,$00,$0D,$0E,$0E,$0E,$0E
column04_8:
  .db $87,$00,$0F,$10,$11,$11
column04_9:
  .db $87,$00,$12,$13,$14,$14
column04_10:
  .db $87,$00,$0F,$10,$11,$11
column04_11:
  .db $87,$00,$12,$13,$14,$14
column04_12:
  .db $87,$00,$07,$08,$08,$08
column04_13:
  .db $87,$00,$09,$0A,$0A,$0A
column04_14:
  .db $87,$00,$0B,$0C,$0C,$0C
column04_15:
  .db $87,$00,$0D,$0E,$0E,$0E
column04_16:
  .db $86,$00,$17,$1C,$19,$18,$00

attrib_04:
  .dw a_column04_1,a_column04_2,a_column04_3,a_column04_4,a_column04_5,a_column04_6,a_column04_7,a_column04_8

a_column04_1:
  .db $00,$F0,$00,$00,$33,$33,$33,$00
a_column04_2:
  .db $00,$F0,$00,$00,$00,$88,$88,$88
a_column04_3:
  .db $00,$F0,$00,$00,$00,$AA,$AA,$0A
a_column04_4:
  .db $00,$F0,$00,$00,$00,$A2,$AA,$0A
a_column04_5:
  .db $00,$F0,$00,$00,$00,$20,$22,$02
a_column04_6:
  .db $00,$F0,$00,$00,$00,$80,$88,$08
a_column04_7:
  .db $00,$F0,$00,$00,$00,$A0,$AA,$0A
a_column04_8:
  .db $00,$F0,$00,$00,$00,$EC,$EE,$02


;;;;;;;;;;;;;;;;;;    ;LEVEL 3 ENDS HERE;;
background_05:
  .dw column05_1,column05_2,column05_3,column05_4,column05_5,column05_6,column05_7,column05_8
  .dw column05_9,column05_10,column05_11,column05_12,column05_13,column05_14,column05_15,column05_16

column05_1:
  .db $85,$00,$15,$1B,$1C,$19,$18,$00
column05_2:
  .db $86,$00,$01,$02,$03,$03,$03
column05_3:
  .db $86,$00,$04,$05,$06,$06,$06
column05_4:
  .db $87,$00,$01,$02,$03,$03
column05_5:
  .db $87,$00,$04,$05,$06,$06
column05_6:
  .db $89,$00,$07,$08
column05_7:
  .db $89,$00,$09,$0A
column05_8:
  .db $89,$00,$0B,$0C
column05_9:
  .db $89,$00,$0D,$0E
column05_10:
  .db $88,$00,$0F,$10,$11
column05_11:
  .db $88,$00,$12,$13,$14
column05_12:
  .db $88,$00,$17,$18,$00
column05_13:
  .db $88,$00,$15,$18,$00
column05_14:
  .db $88,$00,$15,$1A,$00
column05_15:
  .db $8B,$00
column05_16:
  .db $8B,$00

attrib_05:
  .dw a_column05_1,a_column05_2,a_column05_3,a_column05_4,a_column05_5,a_column05_6,a_column05_7,a_column05_8

a_column05_1:
  .db $00,$F0,$00,$00,$30,$33,$33,$00
a_column05_2:       
  .db $00,$F0,$00,$00,$00,$00,$00,$00
a_column05_3:
  .db $00,$F0,$00,$00,$00,$00,$00,$00
a_column05_4:
  .db $00,$F0,$00,$00,$00,$00,$00,$00
a_column05_5:
  .db $00,$F0,$00,$00,$00,$00,$44,$04
a_column05_6:
  .db $00,$F0,$00,$00,$00,$00,$DD,$01
a_column05_7:
  .db $00,$F0,$00,$00,$00,$00,$FF,$00
a_column05_8:
  .db $00,$F0,$00,$00,$00,$00,$00,$00


;;;;;;;;;;;;;;;;;;    ;LEVEL 2 BEGINS HERE;;
background_06:
  .dw column06_1,column06_2,column06_3,column06_4,column06_5,column06_6,column06_7,column06_8
  .dw column06_9,column06_10,column06_11,column06_12,column06_13,column06_14,column06_15,column06_16

column06_1:
  .db $8B,$00
column06_2:
  .db $8B,$00
column06_3:
  .db $88,$00,$15,$16,$00
column06_4:
  .db $89,$00,$16,$00
column06_5:
  .db $88,$00,$1B,$16,$00
column06_6:
  .db $86,$00,$15,$1B,$19,$18,$00
column06_7:
  .db $87,$00,$0F,$10,$11,$11
column06_8:
  .db $87,$00,$12,$13,$14,$14
column06_9:
  .db $87,$00,$15,$1B,$16,$00
column06_10:
  .db $88,$00,$15,$18,$00
column06_11:
  .db $88,$00,$09,$0A,$0A
column06_12:
  .db $88,$00,$0B,$0C,$0C
column06_13:
  .db $87,$00,$0A,$0A,$0A,$0A
column06_14:
  .db $87,$00,$0C,$0C,$0C,$0C
column06_15:
  .db $87,$00,$04,$05,$06,$06
column06_16:
  .db $88,$00,$17,$18,$00

attrib_06:
  .dw a_column06_1,a_column06_2,a_column06_3,a_column06_4,a_column06_5,a_column06_6,a_column06_7,a_column06_8

a_column06_1:
  .db $00,$F0,$00,$00,$00,$00,$00,$00
a_column06_2:       
  .db $00,$F0,$00,$00,$00,$00,$F3,$00
a_column06_3:
  .db $00,$F0,$00,$00,$00,$CC,$FF,$00
a_column06_4:
  .db $00,$F0,$00,$00,$00,$00,$00,$00
a_column06_5:
  .db $00,$F0,$00,$00,$00,$30,$FF,$00
a_column06_6:
  .db $00,$F0,$00,$00,$00,$00,$00,$00
a_column06_7:
  .db $00,$F0,$00,$00,$00,$50,$55,$05
a_column06_8:
  .db $00,$F0,$00,$00,$00,$10,$DD,$01
  

;;;;;;;;;;;;;;;;;;
background_07:
  .dw column07_1,column07_2,column07_3,column07_4,column07_5,column07_6,column07_7,column07_8
  .dw column07_9,column07_10,column07_11,column07_12,column07_13,column07_14,column07_15,column07_16

column07_1:
  .db $86,$00,$17,$1B,$19,$18,$00
column07_2:
  .db $87,$00,$15,$1C,$18,$00
column07_3:
  .db $88,$00,$07,$08,$08
column07_4:
  .db $88,$00,$09,$0A,$0A
column07_5:
  .db $88,$00,$0B,$0C,$0C
column07_6:
  .db $88,$00,$0D,$0E,$0E
column07_7:
  .db $87,$00,$01,$02,$03,$03
column07_8:
  .db $87,$00,$04,$05,$06,$06
column07_9:
  .db $88,$00,$07,$08,$08
column07_10:
  .db $88,$00,$0D,$0E,$0E
column07_11:
  .db $88,$00,$15,$16,$00
column07_12:
  .db $88,$00,$17,$18,$00
column07_13:
  .db $86,$00,$1D,$1E,$1F,$20,$20
column07_14:
  .db $86,$00,$22,$23,$24,$25,$25
column07_15:
  .db $86,$00,$17,$1B,$19,$18,$00
column07_16:
  .db $85,$00,$17,$1B,$19,$19,$18,$00

attrib_07:
  .dw a_column07_1,a_column07_2,a_column07_3,a_column07_4,a_column07_5,a_column07_6,a_column07_7,a_column07_8

a_column07_1:
  .db $00,$F0,$00,$00,$00,$FF,$FF,$00
a_column07_2:       
  .db $00,$F0,$00,$00,$00,$00,$55,$05
a_column07_3:
  .db $00,$F0,$00,$00,$00,$00,$55,$05
a_column07_4:
  .db $00,$F0,$00,$00,$00,$80,$88,$08
a_column07_5:
  .db $00,$F0,$00,$00,$00,$00,$88,$08 
a_column07_6:
  .db $00,$F0,$00,$00,$00,$00,$FF,$00 
a_column07_7:
  .db $00,$F0,$00,$00,$00,$AA,$AA,$0A
a_column07_8:
  .db $00,$F0,$00,$00,$C0,$FF,$FF,$00


;;;;;;;;;;;;;;;;;;
background_08:
  .dw column08_1,column08_2,column08_3,column08_4,column08_5,column08_6,column08_7,column08_8
  .dw column08_9,column08_10,column08_11,column08_12,column08_13,column08_14,column08_15,column08_16

column08_1:
  .db $86,$00,$17,$1B,$19,$18,$00
column08_2:
  .db $87,$00,$15,$1C,$18,$00
column08_3:
  .db $87,$00,$21,$1F,$20,$20
column08_4:
  .db $87,$00,$26,$24,$25,$25
column08_5:
  .db $88,$00,$01,$02,$03
column08_6:
  .db $88,$00,$04,$05,$06
column08_7:
  .db $88,$00,$15,$16,$00
column08_8:
  .db $88,$00,$01,$02,$03
column08_9:
  .db $88,$00,$04,$05,$06
column08_10:
  .db $88,$00,$17,$18,$00
column08_11:
  .db $87,$00,$17,$1C,$18,$00
column08_12:
  .db $87,$00,$17,$1B,$18,$00
column08_13:
  .db $87,$00,$01,$02,$03,$03
column08_14:
  .db $87,$00,$04,$05,$06,$06
column08_15:
  .db $88,$00,$17,$18,$00
column08_16:
  .db $88,$00,$17,$18,$00

attrib_08:
  .dw a_column08_1,a_column08_2,a_column08_3,a_column08_4,a_column08_5,a_column08_6,a_column08_7,a_column08_8

a_column08_1:
  .db $00,$F0,$00,$F0,$FF,$F3,$FF,$00
a_column08_2:
  .db $00,$F0,$00,$00,$30,$AC,$AA,$0A
a_column08_3:
  .db $00,$F0,$00,$00,$F0,$FF,$99,$09
a_column08_4:
  .db $00,$F0,$00,$00,$FC,$CF,$77,$04
a_column08_5:
  .db $00,$F0,$00,$00,$FC,$3F,$EE,$02
a_column08_6:
  .db $00,$F0,$00,$00,$FF,$FF,$FF,$00
a_column08_7:
  .db $00,$F0,$00,$00,$03,$AF,$AA,$0A
a_column08_8:
  .db $00,$F0,$00,$00,$C0,$0F,$FF,$00


;;;;;;;;;;;;;;;;;;    ;LEVEL 2 ENDS HERE;;
background_09:
  .dw column09_1,column09_2,column09_3,column09_4,column09_5,column09_6,column09_7,column09_8
  .dw column09_9,column09_10,column09_11,column09_12,column09_13,column09_14,column09_15,column09_16

column09_1:
  .db $87,$00,$17,$1C,$18,$00
column09_2:
  .db $88,$00,$17,$18,$00
column09_3:
  .db $88,$00,$09,$0A,$0A
column09_4:
  .db $88,$00,$0B,$0C,$0C
column09_5:
  .db $88,$00,$0A,$0A,$0A
column09_6:
  .db $88,$00,$0C,$0C,$0C
column09_7:
  .db $88,$00,$04,$05,$06
column09_8:
  .db $87,$00,$15,$1C,$18,$00
column09_9:
  .db $87,$00,$17,$1B,$18,$00
column09_10:
  .db $88,$00,$0F,$10,$11
column09_11:
  .db $00,$27,$28,$85,$00,$12,$13,$14
column09_12:
  .db $00,$29,$2A,$85,$00,$17,$18,$00
column09_13:
  .db $88,$00,$17,$16,$00
column09_14:
  .db $88,$00,$15,$1A,$00
column09_15:
  .db $8B,$00
column09_16:
  .db $8B,$00

attrib_09:
  .dw a_column09_1,a_column09_2,a_column09_3,a_column09_4,a_column09_5,a_column09_6,a_column09_7,a_column09_8

a_column09_1:
  .db $00,$F0,$00,$00,$30,$FF,$FF,$0F
a_column09_2:
  .db $00,$F0,$00,$00,$00,$FF,$00,$01
a_column09_3:
  .db $00,$F0,$00,$00,$00,$30,$00,$00
a_column09_4:
  .db $00,$F0,$00,$00,$00,$C0,$EE,$0E
a_column09_5:
  .db $00,$F0,$00,$00,$00,$30,$77,$07
a_column09_6:
  .db $00,$F0,$A3,$3A,$33,$00,$DD,$0D
a_column09_7:
  .db $00,$F0,$00,$00,$00,$00,$FF,$03
a_column09_8:
  .db $00,$F0,$00,$00,$00,$00,$C0,$00


;;;;;;;;;;;;;;;;;;    ;LEVEL 1 BEGINS HERE;;
background_10:
  .dw column10_1,column10_2,column10_3,column10_4,column10_5,column10_6,column10_7,column10_8
  .dw column10_9,column10_10,column10_11,column10_12,column10_13,column10_14,column10_15,column10_16

column10_1:
  .db $8B,$00
column10_2:
  .db $89,$00,$16,$00
column10_3:
  .db $88,$00,$15,$16,$00
column10_4:
  .db $88,$00,$0F,$10,$11
column10_5:
  .db $88,$00,$12,$13,$14
column10_6:
  .db $87,$00,$15,$1B,$18,$00
column10_7:
  .db $87,$00,$17,$19,$18,$00
column10_8:
  .db $87,$00,$01,$02,$03,$03
column10_9:
  .db $87,$00,$04,$05,$06,$06
column10_10:
  .db $86,$00,$17,$1B,$19,$18,$00
column10_11:
  .db $87,$00,$17,$1B,$18,$00
column10_12:
  .db $88,$00,$01,$02,$03
column10_13:
  .db $88,$00,$04,$05,$06
column10_14:
  .db $86,$00,$15,$1B,$1C,$18,$00
column10_15:
  .db $87,$00,$17,$19,$18,$00
column10_16:
  .db $86,$00,$17,$1B,$19,$18,$00

attrib_10:
  .dw a_column10_1,a_column10_2,a_column10_3,a_column10_4,a_column10_5,a_column10_6,a_column10_7,a_column10_8

a_column10_1:
  .db $00,$F0,$00,$00,$00,$00,$C0,$00
a_column10_2:
  .db $00,$F0,$00,$00,$00,$00,$33,$00
a_column10_3:
  .db $00,$F0,$00,$00,$00,$C0,$CC,$00
a_column10_4:
  .db $00,$F0,$00,$00,$00,$30,$33,$00
a_column10_5:
  .db $00,$F0,$00,$00,$00,$FC,$FF,$03
a_column10_6:
  .db $00,$F0,$00,$00,$00,$30,$33,$00
a_column10_7:
  .db $00,$F0,$00,$00,$00,$CC,$CC,$00
a_column10_8:
  .db $00,$F0,$00,$00,$00,$FC,$FF,$00


;;;;;;;;;;;;;;;;;;
background_11:
  .dw column11_1,column11_2,column11_3,column11_4,column11_5,column11_6,column11_7,column11_8
  .dw column11_9,column11_10,column11_11,column11_12,column11_13,column11_14,column11_15,column11_16

column11_1:
  .db $87,$00,$17,$1C,$18,$00
column11_2:
  .db $86,$00,$17,$1B,$1B,$18,$00
column11_3:
  .db $88,$00,$07,$08,$08
column11_4:
  .db $88,$00,$0D,$0E,$0E
column11_5:
  .db $88,$00,$01,$02,$03
column11_6:
  .db $88,$00,$04,$05,$06
column11_7:
  .db $86,$00,$17,$1C,$19,$18,$00
column11_8:
  .db $85,$00,$17,$19,$19,$19,$18,$00
column11_9:
  .db $83,$00,$17,$1B,$1B,$19,$19,$0A,$0A,$0A
column11_10:
  .db $85,$00,$17,$1B,$1B,$0C,$0C,$0C
column11_11:
  .db $88,$00,$26,$24,$25
column11_12:
  .db $86,$00,$17,$19,$19,$18,$00
column11_13:
  .db $86,$00,$15,$1B,$1B,$18,$00
column11_14:
  .db $88,$00,$0F,$10,$11
column11_15:
  .db $88,$00,$12,$13,$14
column11_16:
  .db $85,$00,$17,$1B,$19,$19,$18,$00

attrib_11:
  .dw a_column11_1,a_column11_2,a_column11_3,a_column11_4,a_column11_5,a_column11_6,a_column11_7,a_column11_8

a_column11_1:
  .db $00,$F0,$00,$00,$00,$FC,$FF,$00
a_column11_2:
  .db $00,$F0,$00,$00,$00,$00,$00,$00
a_column11_3:
  .db $00,$F0,$00,$00,$00,$00,$00,$00
a_column11_4:
  .db $00,$F0,$00,$00,$C0,$FF,$FF,$00
a_column11_5:
  .db $00,$F0,$00,$30,$F3,$FF,$AA,$0A
a_column11_6:
  .db $00,$F0,$00,$00,$00,$CC,$EE,$02
a_column11_7:
  .db $00,$F0,$00,$00,$00,$33,$BB,$08
a_column11_8:
  .db $00,$F0,$00,$00,$C0,$CC,$EE,$02


;;;;;;;;;;;;;;;;;;    ;LEVEL 1 ENDS HERE;;
background_12:
  .dw column12_1,column12_2,column12_3,column12_4,column12_5,column12_6,column12_7,column12_8
  .dw column12_9,column12_10,column12_11,column12_12,column12_13,column12_14,column12_15,column12_16

column12_1:
  .db $86,$00,$17,$1B,$19,$18,$00
column12_2:
  .db $87,$00,$17,$0A,$0A,$0A
column12_3:
  .db $87,$00,$17,$0C,$0C,$0C
column12_4:
  .db $88,$00,$04,$05,$06
column12_5:
  .db $88,$00,$01,$02,$03
column12_6:
  .db $88,$00,$04,$05,$06
column12_7:
  .db $86,$00,$17,$1B,$19,$18,$00
column12_8:
  .db $87,$00,$15,$19,$18,$00
column12_9:
  .db $87,$00,$17,$1B,$18,$00
column12_10:
  .db $88,$00,$01,$02,$03
column12_11:
  .db $88,$00,$04,$05,$06
column12_12:
  .db $87,$00,$17,$1C,$18,$00
column12_13:
  .db $88,$00,$17,$18,$00
column12_14:
  .db $88,$00,$17,$18,$00
column12_15:
  .db $88,$00,$15,$1A,$00
column12_16:
  .db $8B,$00

attrib_12:
  .dw a_column12_1,a_column12_2,a_column12_3,a_column12_4,a_column12_5,a_column12_6,a_column12_7,a_column12_8

a_column12_1:
  .db $00,$F0,$00,$F0,$FF,$F3,$33,$00
a_column12_2:
  .db $00,$F0,$00,$00,$30,$3C,$00,$00
a_column12_3:
  .db $00,$F0,$00,$00,$F0,$FF,$AA,$0A
a_column12_4:
  .db $00,$F0,$00,$00,$FC,$FF,$FF,$00
a_column12_5:
  .db $00,$F0,$00,$00,$FC,$3F,$33,$00
a_column12_6:
  .db $00,$F0,$00,$00,$FF,$CF,$CC,$00
a_column12_7:
  .db $00,$F0,$00,$00,$03,$00,$FF,$00
a_column12_8:
  .db $00,$F0,$00,$00,$C0,$0F,$33,$00


;;;;;;;;;;;;;;;;;;    ;LEVEL 4 BEGINS HERE;;
background_13:
  .dw column13_1,column13_2,column13_3,column13_4,column13_5,column13_6,column13_7,column13_8
  .dw column13_9,column13_10,column13_11,column13_12,column13_13,column13_14,column13_15,column13_16

column13_1:
  .db $8B,$00
column13_2:
  .db $87,$00,$09,$0A,$0A,$0A
column13_3:
  .db $87,$00,$0B,$0C,$0C,$0C
column13_4:
  .db $87,$00,$07,$08,$08,$08
column13_5:
  .db $87,$00,$09,$0A,$0A,$0A
column13_6:
  .db $87,$00,$0B,$0C,$0C,$0C
column13_7:
  .db $87,$00,$0D,$0E,$0E,$0E
column13_8:
  .db $86,$00,$01,$02,$03,$03,$03
column13_9:
  .db $86,$00,$04,$05,$06,$06,$06
column13_10:
  .db $88,$00,$17,$18,$00
column13_11:
  .db $87,$00,$17,$19,$18,$00
column13_12:
  .db $85,$00,$21,$1F,$20,$20,$20,$20
column13_13:
  .db $85,$00,$26,$24,$25,$25,$25,$25
column13_14:
  .db $86,$00,$01,$02,$03,$03,$03
column13_15:
  .db $86,$00,$04,$05,$06,$06,$06
column13_16:
  .db $85,$00,$17,$1B,$1B,$19,$18,$00

attrib_13:
  .dw a_column13_1,a_column13_2,a_column13_3,a_column13_4,a_column13_5,a_column13_6,a_column13_7,a_column13_8

a_column13_1:
  .db $00,$F0,$00,$00,$00,$80,$B8,$0B
a_column13_2:
  .db $00,$F0,$00,$00,$00,$20,$22,$02
a_column13_3:
  .db $00,$F0,$00,$00,$00,$00,$00,$00
a_column13_4:
  .db $00,$F0,$00,$00,$00,$EE,$EE,$0E
a_column13_5:
  .db $00,$F0,$00,$00,$00,$11,$DD,$01
a_column13_6:
  .db $00,$F0,$00,$00,$40,$74,$77,$04
a_column13_7:
  .db $00,$F0,$00,$00,$10,$11,$11,$01
a_column13_8:
  .db $00,$F0,$00,$00,$C0,$CC,$CC,$00


;;;;;;;;;;;;;;;;;;
background_14:
  .dw column14_1,column14_2,column14_3,column14_4,column14_5,column14_6,column14_7,column14_8
  .dw column14_9,column14_10,column14_11,column14_12,column14_13,column14_14,column14_15,column14_16

column14_1:
  .db $87,$00,$17,$1C,$18,$00
column14_2:
  .db $86,$00,$0F,$10,$11,$11,$11
column14_3:
  .db $86,$00,$12,$13,$14,$14,$14
column14_4:
  .db $85,$00,$07,$08,$08,$08,$08,$08
column14_5:
  .db $85,$00,$0D,$0E,$0E,$0E,$0E,$0E
column14_6:
  .db $86,$00,$07,$08,$08,$08,$08
column14_7:
  .db $86,$00,$09,$0A,$0A,$0A,$0A
column14_8:
  .db $86,$00,$0B,$0C,$0C,$0C,$0C
column14_9:
  .db $86,$00,$0D,$0E,$0E,$0E,$0E
column14_10:
  .db $87,$00,$17,$19,$18,$00
column14_11:
  .db $87,$00,$0F,$10,$11,$11
column14_12:
  .db $87,$00,$12,$13,$14,$14
column14_13:
  .db $86,$00,$17,$1C,$19,$18,$00
column14_14:
  .db $85,$00,$1D,$1E,$1F,$20,$20,$20
column14_15:
  .db $85,$00,$22,$23,$24,$25,$25,$25
column14_16:
  .db $85,$00,$17,$1B,$19,$19,$18,$00

attrib_14:
  .dw a_column14_1,a_column14_2,a_column14_3,a_column14_4,a_column14_5,a_column14_6,a_column14_7,a_column14_8

a_column14_1:
  .db $00,$F0,$00,$00,$00,$74,$77,$04
a_column14_2:
  .db $00,$F0,$00,$00,$80,$99,$99,$09
a_column14_3:
  .db $00,$F0,$00,$00,$20,$AA,$AA,$0A
a_column14_4:
  .db $00,$F0,$00,$00,$00,$00,$00,$00
a_column14_5:
  .db $00,$F0,$00,$00,$00,$C0,$CC,$00
a_column14_6:
  .db $00,$F0,$00,$00,$00,$00,$00,$00
a_column14_7:
  .db $00,$F0,$00,$00,$80,$BB,$BB,$08
a_column14_8:
  .db $00,$F0,$00,$00,$E0,$EE,$EE,$02


;;;;;;;;;;;;;;;;;;
background_15:
  .dw column15_1,column15_2,column15_3,column15_4,column15_5,column15_6,column15_7,column15_8
  .dw column15_9,column15_10,column15_11,column15_12,column15_13,column15_14,column15_15,column15_16

column15_1:
  .db $86,$00,$17,$1B,$1B,$1A,$00
column15_2:
  .db $85,$00,$1D,$1E,$1F,$20,$20,$20
column15_3:
  .db $85,$00,$22,$23,$24,$25,$25,$25
column15_4:
  .db $88,$00,$01,$02,$03
column15_5:
  .db $88,$00,$04,$05,$06
column15_6:
  .db $85,$00,$17,$1B,$19,$19,$18,$00
column15_7:
  .db $84,$00,$17,$1B,$0A,$0A,$0A,$0A,$0A
column15_8:
  .db $85,$00,$15,$0C,$0C,$0C,$0C,$0C
column15_9:
  .db $83,$00,$17,$1B,$0A,$0A,$0A,$0A,$0A,$0A
column15_10:
  .db $83,$00,$15,$1B,$0C,$0C,$0C,$0C,$0C,$0C
column15_11:
  .db $85,$00,$26,$24,$25,$25,$25,$25
column15_12:
  .db $85,$00,$01,$02,$03,$03,$03,$03
column15_13:
  .db $85,$00,$04,$05,$06,$06,$06,$06
column15_14:
  .db $86,$00,$0F,$10,$11,$11,$11
column15_15:
  .db $86,$00,$12,$13,$14,$14,$14
column15_16:
  .db $85,$00,$17,$1B,$1B,$19,$18,$00

attrib_15:
  .dw a_column15_1,a_column15_2,a_column15_3,a_column15_4,a_column15_5,a_column15_6,a_column15_7,a_column15_8

a_column15_1:
  .db $00,$F0,$00,$F0,$3F,$33,$33,$00
a_column15_2:
  .db $00,$F0,$00,$00,$00,$0C,$00,$00
a_column15_3:
  .db $00,$F0,$00,$00,$F0,$CC,$FF,$03
a_column15_4:
  .db $00,$F0,$00,$00,$FF,$55,$55,$05
a_column15_5:
  .db $00,$F0,$00,$F0,$0F,$00,$00,$00
a_column15_6:
  .db $00,$F0,$00,$00,$8C,$88,$88,$08
a_column15_7:
  .db $00,$F0,$00,$00,$23,$AA,$AA,$0A
a_column15_8:
  .db $00,$F0,$00,$00,$C0,$EE,$EE,$02


;;;;;;;;;;;;;;;;;;    ;LEVEL 4 ENDS HERE;;
background_16:
  .dw column16_1,column16_2,column16_3,column16_4,column16_5,column16_6,column16_7,column16_8
  .dw column16_9,column16_10,column16_11,column16_12,column16_13,column16_14,column16_15,column16_16

column16_1:
  .db $87,$00,$17,$1C,$18,$00
column16_2:
  .db $85,$00,$21,$1F,$20,$20,$20,$20
column16_3:
  .db $85,$00,$26,$24,$25,$25,$25,$25
column16_4:
  .db $86,$00,$07,$08,$08,$08,$08
column16_5:
  .db $86,$00,$09,$0A,$0A,$0A,$0A
column16_6:
  .db $86,$00,$0B,$0C,$0C,$0C,$0C
column16_7:
  .db $86,$00,$0D,$0E,$0E,$0E,$0E
column16_8:
  .db $87,$00,$15,$1C,$18,$00
column16_9:
  .db $87,$00,$17,$1B,$18,$00
column16_10:
  .db $86,$00,$0A,$0A,$0A,$0A,$0A
column16_11:
  .db $00,$27,$28,$00,$00,$17,$0C,$0C,$0C,$0C,$0C
column16_12:
  .db $00,$29,$2A,$83,$00,$04,$05,$06,$06,$06
column16_13:
  .db $87,$00,$0F,$10,$11,$11
column16_14:
  .db $87,$00,$12,$13,$14,$14
column16_15:
  .db $88,$00,$15,$1A,$00
column16_16:
  .db $8B,$00

attrib_16:
  .dw a_column16_1,a_column16_2,a_column16_3,a_column16_4,a_column16_5,a_column16_6,a_column16_7,a_column16_8

a_column16_1:
  .db $00,$F0,$00,$00,$B0,$BB,$BB,$0B
a_column16_2:
  .db $00,$F0,$00,$00,$20,$62,$66,$06
a_column16_3:
  .db $00,$F0,$00,$00,$00,$55,$55,$05
a_column16_4:
  .db $00,$F0,$00,$00,$00,$E2,$EE,$0E
a_column16_5:
  .db $00,$F0,$00,$00,$00,$B8,$BB,$0B
a_column16_6:
  .db $00,$F0,$03,$30,$F0,$AA,$AA,$0A
a_column16_7:
  .db $00,$F0,$00,$00,$00,$50,$55,$05
a_column16_8:
  .db $00,$F0,$00,$00,$00,$00,$F3,$00


;;;;;;;;;;;;;;;;;;    ;BOSS 1;;
background_17:
  .dw column17_1,column17_2,column17_3,column17_4,column17_5,column17_6,column17_7,column17_8
  .dw column17_9,column17_10,column17_11,column17_12,column17_13,column17_14,column17_15,column17_16

column17_1:
  .db $8B,$00
column17_2:
  .db $8B,$00
column17_3:
  .db $8B,$00
column17_4:
  .db $8B,$00
column17_5:
  .db $8B,$00
column17_6:
  .db $8B,$00
column17_7:
  .db $8B,$00
column17_8:
  .db $8B,$00
column17_9:
  .db $8B,$00
column17_10:
  .db $85,$00,$2B,$2C,$2D,$83,00
column17_11:
  .db $84,$00,$2E,$2F,$30,$31,$83,00
column17_12:
  .db $84,$00,$32,$33,$34,$35,$83,00
column17_13:
  .db $84,$00,$36,$37,$38,$39,$83,00
column17_14:
  .db $84,$00,$3A,$3B,$3C,$83,00
column17_15:
  .db $84,$00,$3D,$3E,$3F,$84,00
column17_16:
  .db $84,$00,$40,$41,$85,$00

attrib_17:
  .dw a_column17_1,a_column17_2,a_column17_3,a_column17_4,a_column17_5,a_column17_6,a_column17_7,a_column17_8

a_column17_1:
  .db $00,$F0,$AA,$AA,$AA,$AA,$AA,$AA
a_column17_2:
  .db $00,$F0,$AA,$AA,$AA,$AA,$AA,$AA
a_column17_3:
  .db $00,$F0,$AA,$AA,$AA,$AA,$AA,$AA
a_column17_4:
  .db $00,$F0,$AA,$AA,$AA,$AA,$AA,$AA
a_column17_5:
  .db $00,$F0,$AA,$AA,$AA,$AA,$AA,$AA
a_column17_6:
  .db $00,$F0,$AA,$AA,$AA,$AA,$AA,$AA
a_column17_7:
  .db $00,$F0,$AA,$AA,$AA,$AA,$AA,$AA
a_column17_8:
  .db $00,$F0,$AA,$AA,$AA,$AA,$AA,$AA


;;;;;;;;;;;;;;;;;;
background_18:    ;END OF BG FILE, BUFFER BACKGROUND;;;
  .dw column18_1,column18_2,column18_3,column18_4,column18_5,column18_6,column18_7,column18_8
  .dw column18_9,column18_10,column18_11,column18_12,column18_13,column18_14,column18_15,column18_16

column18_1:
  .db $8B,$00
column18_2:
  .db $8B,$00
column18_3:
  .db $8B,$00
column18_4:
  .db $8B,$00
column18_5:
  .db $8B,$00
column18_6:
  .db $8B,$00
column18_7:
  .db $8B,$00
column18_8:
  .db $8B,$00
column18_9:
  .db $8B,$00
column18_10:
  .db $8B,$00
column18_11:
  .db $8B,$00
column18_12:
  .db $8B,$00
column18_13:
  .db $8B,$00
column18_14:
  .db $8B,$00
column18_15:
  .db $8B,$00
column18_16:
  .db $8B,$00

attrib_18:
  .dw a_column18_1,a_column18_2,a_column18_3,a_column18_4,a_column18_5,a_column18_6,a_column18_7,a_column18_8

a_column18_1:
  .db $00,$F0,$AA,$AA,$AA,$AA,$AA,$AA
a_column18_2:
  .db $00,$F0,$AA,$AA,$AA,$AA,$AA,$AA
a_column18_3:
  .db $00
a_column18_4:
  .db $00
a_column18_5:
  .db $00
a_column18_6:
  .db $00
a_column18_7:
  .db $00
a_column18_8:
  .db $00


;;;;;;;;;;;;;;;;;;
background_spl:
  .dw columnspl_1,columnspl_2,columnspl_3,columnspl_4,columnspl_5,columnspl_6,columnspl_7,columnspl_8
  .dw columnspl_9,columnspl_10,columnspl_11,columnspl_12,columnspl_13,columnspl_14,columnspl_15,columnspl_16

columnspl_1:
  .db $8F,$00
columnspl_2:
  .db $8F,$00
columnspl_3:
  .db $8F,$00
columnspl_4:
  .db $8F,$00
columnspl_5:
  .db $85,$00,$2e,$32,$3a,$42,$86,$00
columnspl_6:
  .db $85,$00,$2f,$33,$3b,$43,$86,$00
columnspl_7:
  .db $86,$00,$34,$3c,$44,$86,$00
columnspl_8:
  .db $86,$00,$35,$3d,$45,$86,$00
columnspl_9:
  .db $85,$00,$30,$36,$3e,$46,$86,$00
columnspl_10:
  .db $85,$00,$31,$37,$3f,$87,$00
columnspl_11:
  .db $86,$00,$38,$40,$87,$00
columnspl_12:
  .db $86,$00,$39,$41,$87,$00
columnspl_13:
  .db $8F,$00
columnspl_14:
  .db $8F,$00
columnspl_15:
  .db $8F,$00
columnspl_16:
  .db $8F,$00

attrib_spl:
  .dw a_columnspl_1,a_columnspl_2,a_columnspl_3,a_columnspl_4,a_columnspl_5,a_columnspl_6,a_columnspl_7,a_columnspl_8

a_columnspl_1:
  .db $55,$55,$55,$55,$55,$55,$55,$55
a_columnspl_2:
  .db $55,$55,$55,$55,$55,$55,$55,$55
a_columnspl_3:
  .db $55,$55,$55,$55,$55,$55,$55,$55
a_columnspl_4:
  .db $55,$55,$55,$55,$55,$55,$55,$55
a_columnspl_5:
  .db $55,$55,$55,$55,$55,$55,$55,$55
a_columnspl_6:
  .db $55,$55,$55,$55,$55,$55,$55,$55
a_columnspl_7:
  .db $55,$55,$55,$55,$55,$55,$55,$55
a_columnspl_8:
  .db $55,$55,$55,$55,$55,$55,$55,$55


;;;;;;;;;;;;;;;;;;
background_tit:
  .dw columntit_1,columntit_2,columntit_3,columntit_4,columntit_5,columntit_6,columntit_7,columntit_8
  .dw columntit_9,columntit_10,columntit_11,columntit_12,columntit_13,columntit_14,columntit_15,columntit_16

columntit_1:
  .db $8F,$00
columntit_2:
  .db $85,$00,$25,$2a,$2c,$2d,$86,$00
columntit_3:
  .db $00,$00,$04,$11,$1e,$26,$2b,$88,$00
columntit_4:
  .db $00,$01,$05,$12,$1f,$27,$89,$00
columntit_5:
  .db $00,$02,$06,$13,$20,$28,$89,$00
columntit_6:
  .db $00,$03,$07,$14,$21,$29,$89,$00
columntit_7:
  .db $00,$00,$08,$15,$8B,$00
columntit_8:
  .db $00,$00,$09,$16,$8B,$00
columntit_9:
  .db $00,$00,$0a,$17,$22,$8A,$00
columntit_10:
  .db $00,$00,$0b,$18,$00,$8A,$00
columntit_11:
  .db $00,$00,$0c,$19,$23,$8A,$00
columntit_12:
  .db $00,$00,$0d,$1a,$24,$8A,$00
columntit_13:
  .db $00,$00,$0e,$1b,$8B,$00
columntit_14:
  .db $00,$00,$0f,$1c,$8B,$00
columntit_15:
  .db $00,$00,$10,$1d,$8B,$00
columntit_16:
  .db $8F,$00

attrib_tit:
  .dw a_columntit_1,a_columntit_2,a_columntit_3,a_columntit_4,a_columntit_5,a_columntit_6,a_columntit_7,a_columntit_8

a_columntit_1:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_columntit_2:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_columntit_3:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_columntit_4:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_columntit_5:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_columntit_6:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_columntit_7:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_columntit_8:
  .db $00,$00,$00,$00,$00,$00,$00,$00


;;;;;TEMPLATE TABLE BELOW;;;;;

;;;;;;;;;;;;;;;;;;
background_0z:
  .dw column0z_1,column0z_2,column0z_3,column0z_4,column0z_5,column0z_6,column0z_7,column0z_8
  .dw column0z_9,column0z_10,column0z_11,column0z_12,column0z_13,column0z_14,column0z_15,column0z_16

column0z_1:
  .db $8B,$00
column0z_2:
  .db $8B,$00
column0z_3:
  .db $8B,$00
column0z_4:
  .db $8B,$00
column0z_5:
  .db $8B,$00
column0z_6:
  .db $8B,$00
column0z_7:
  .db $8B,$00
column0z_8:
  .db $8B,$00
column0z_9:
  .db $8B,$00
column0z_10:
  .db $8B,$00
column0z_11:
  .db $8B,$00
column0z_12:
  .db $8B,$00
column0z_13:
  .db $8B,$00
column0z_14:
  .db $8B,$00
column0z_15:
  .db $8B,$00
column0z_16:
  .db $8B,$00

attrib_0z:
  .dw a_column0z_1,a_column0z_2,a_column0z_3,a_column0z_4,a_column0z_5,a_column0z_6,a_column0z_7,a_column0z_8

a_column0z_1:
  .db $00
a_column0z_2:
  .db $00
a_column0z_3:
  .db $00
a_column0z_4:
  .db $00
a_column0z_5:
  .db $00
a_column0z_6:
  .db $00
a_column0z_7:
  .db $00
a_column0z_8:
  .db $00


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

init_pb_attr00:    ;;end of level screen
  .db $FF,$FF,$FF,$FF,$FF

init_pb_attr01:    ;;level 1
  .db $F0,$F0,$F0,$F0,$F0

init_pb_attr02:    ;;level 2
  .db $F0,$F0,$F0,$F0,$F0

init_pb_attr03:    ;;level 3
  .db $F0,$F0,$F0,$F0,$F0

init_pb_attr04:    ;;level 4
  .db $F0,$F0,$F0,$F0,$F0

init_pb_attr05:    ;;boss 1
  .db $F0,$F0,$F0,$F0,$F0


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

bg_palette_spltit:
  .db $1D,$0B,$1A,$20,  $1D,$06,$08,$38,  $1D,$01,$1C,$30,  $1D,$1D,$1D,$28

bg_palette00:   ;End of level screen
  .db $1D,$39,$21,$33,  $1D,$2C,$22,$0C,  $1D,$39,$1A,$00,  $1D,$1D,$1D,$1D

bg_palette01:   ;LEVEL 1 & 3
  .db $1D,$12,$32,$38,  $1D,$06,$17,$39,  $1D,$08,$3D,$20,  $1D,$1C,$0C,$0B
bg_palette02:   ;LEVEL 2
  .db $1D,$05,$17,$3B,  $1D,$06,$17,$39,  $1D,$07,$3D,$20,  $1D,$05,$27,$17
bg_palette03:   ;LEVEL 4 & 10
  .db $1D,$08,$2A,$3A,  $1D,$0B,$07,$3A,  $1D,$09,$2D,$29,  $1D,$1C,$08,$2A
bg_palette04:   ;BOSS 1
  .db $1D,$08,$2A,$3A,  $1D,$0B,$07,$3A,  $1D,$08,$18,$38,  $1D,$1C,$08,$2A
bg_palette05:   ;LEVEL 6
  .db $1D,$00,$2B,$39,  $1D,$06,$15,$36,  $1D,$06,$27,$30,  $1D,$09,$05,$17
bg_palette06:   ;LEVEL 7
  .db $1D,$1C,$2B,$39,  $1D,$07,$15,$36,  $1D,$16,$27,$33,  $1D,$0B,$15,$37
bg_palette07:   ;LEVEL 8
  .db $1D,$01,$2B,$30,  $1D,$16,$08,$20,  $1D,$2D,$07,$2C,  $1D,$28,$21,$37
bg_palette08:   ;LEVEL 9
  .db $1D,$01,$1D,$03,  $1D,$04,$02,$10,  $1D,$0C,$1D,$28,  $1D,$01,$28,$03
bg_palette09:   ;BOSS 2
  .db $0d,$21,$0b,$20,  $0d,$21,$0b,$01,  $0d,$01,$12,$21,  $0d,$12,$20,$01
bg_palette10:   ;LEVEL 12
  .db $1D,$0B,$32,$30,  $1D,$07,$08,$3B,  $1D,$22,$0C,$2C,  $1D,$00,$16,$39
bg_palette11:   ;LEVEL 13
  .db $1D,$22,$33,$39,  $1D,$08,$3B,$29,  $1D,$0b,$00,$18,  $1D,$06,$16,$38
bg_palette12:   ;LEVEL 14 & 15
  .db $1D,$00,$32,$39,  $1D,$08,$2D,$00,  $1D,$07,$22,$1C,  $1D,$06,$16,$38 ;$27,$39
bg_palette13:   ;LEVEL 16
  .db $1D,$08,$2A,$3A,  $1D,$0B,$07,$3A,  $1D,$09,$2D,$29,  $1D,$06,$27,$39
bg_palette14:   ;LEVEL 18, 19, Kogyaru Chase
  .db $1D,$01,$21,$30,  $1D,$00,$32,$3C,  $1D,$1A,$00,$28,  $1D,$03,$14,$27
bg_palette15:   ;LEVEL 20
  .db $1D,$01,$21,$30,  $1D,$00,$32,$3C,  $1D,$0B,$18,$38,  $1D,$0C,$28,$3C
bg_palette16:   ;LEVEL 21
  .db $1D,$08,$2A,$3A,  $1D,$01,$21,$30,  $1D,$09,$2D,$29,  $1D,$2E,$0B,$1B

bg_palette17:   ;monochrome palette
  .db $1D,$00,$10,$30,  $1D,$00,$10,$30,  $1D,$00,$10,$30,  $1D,$00,$10,$30

bg_palette_bonus:   ;BONUS STAGES
  .db $1D,$23,$26,$38,  $1D,$05,$02,$10,  $1D,$0C,$09,$38,  $1D,$03,$12,$1C

bg_palette_campout_DL:   ;CAMPOUT LEVEL FOR FULL DONWLOAD ROM
  .db $1D,$1E,$1E,$1E,  $1D,$1E,$1E,$1E,  $1D,$1E,$1E,$1E,  $1D,$03,$12,$1C

bg_palette18:   ;BOSS 3
  .db $1D,$32,$0C,$00,  $1D,$01,$21,$30,  $1D,$09,$2D,$29,  $1D,$06,$16,$38
bg_palette19:   ;BOSS 4
  .db $0D,$1C,$06,$04,  $1D,$09,$21,$04,  $1D,$09,$2D,$29,  $1D,$2D,$04,$06
;  .db $0D,$27,$06,$08,  $1D,$09,$21,$08,  $1D,$09,$2D,$29,  $1D,$2E,$0B,$1B


sp_palette00:
  .db $1D,$08,$21,$31,  $1D,$05,$26,$07,  $1D,$20,$3B,$38,  $1D,$34,$3D,$20
sp_palette01:
  .db $1D,$08,$21,$31,  $1D,$05,$26,$07,  $1D,$20,$3B,$38,  $1D,$0C,$2D,$3D
sp_palette02:
  .db $1D,$08,$21,$31,  $1D,$05,$27,$0C,  $1D,$03,$21,$37,  $1D,$01,$2D,$37
sp_palette03:
  .db $1D,$08,$21,$31,  $1D,$08,$05,$28,  $1D,$05,$2D,$38,  $1D,$01,$2D,$37  ;Soviet palette for the mig = $02; ICBM = $01
sp_palette04:
  .db $1D,$08,$21,$31,  $1D,$13,$15,$33,  $1D,$16,$27,$08,  $1D,$01,$2D,$37  ;Moon sprite palette
sp_palette05:
  .db $1D,$08,$21,$31,  $1D,$08,$05,$28,  $1D,$05,$2D,$38,  $1D,$1D,$2D,$37  ;Soviet palette for MechaStalin

sp_cow_level:
  .db $1D,$08,$21,$31,  $1D,$01,$24,$30,  $1D,$07,$17,$37,  $1D,$0B,$18,$2A
sp_campout:
  .db $1D,$08,$21,$31,  $1D,$01,$27,$30,  $1D,$01,$0D,$05,  $1D,$0B,$38,$05
                                                  ;3C