;Each background loads left to right, top to bottom.
;So columnxx_1 is the farthest left column of the screen and columnxx_16 is the fartherst right.
;The first byte of each column is the top of the column, the last byte is the bottom.

;for RLE, set bit 7 to 1 == $8(number of times to write),$(metatile number)

;;;;;;;;;;;;;;;;;;

;background_beg, attrib_beg, background_end, & attrib_end serve as header and footer tables.  If you don't have data
;ready to load into the buffer when at the left edge of the first screen or right edge of the last screen, the PPU
;will start loading a bunch of junk onto the screen and eventually go nuts.  These first and last tables prevent
;that from happening.


;;;;;;;;;;;;;;;;;;    ;BEGIN OF BG FILE, BUFFER BACKGROUND;;;
background_19:
  .dw column19_1,column19_2,column19_3,column19_4,column19_5,column19_6,column19_7,column19_8
  .dw column19_9,column19_10,column19_11,column19_12,column19_13,column19_14,column19_15,column19_16

column19_1:
  .db $8B,$00
column19_2:
  .db $8B,$00
column19_3:
  .db $8B,$00
column19_4:
  .db $8B,$00
column19_5:
  .db $8B,$00
column19_6:
  .db $8B,$00
column19_7:
  .db $8B,$00
column19_8:
  .db $8B,$00
column19_9:
  .db $8B,$00
column19_10:
  .db $8B,$00
column19_11:
  .db $8B,$00
column19_12:
  .db $8B,$00
column19_13:
  .db $8B,$00
column19_14:
  .db $8B,$00
column19_15:
  .db $8B,$00
column19_16:
  .db $8B,$00

attrib_19:
  .dw a_column19_1,a_column19_2,a_column19_3,a_column19_4,a_column19_5,a_column19_6,a_column19_7,a_column19_8

a_column19_1:
  .db $00
a_column19_2:
  .db $00
a_column19_3:
  .db $00
a_column19_4:
  .db $00
a_column19_5:
  .db $00
a_column19_6:
  .db $00
a_column19_7:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column19_8:
  .db $00,$00,$00,$00,$00,$00,$00,$00


;;;;;;;;;;;;;;;;;;    ;LEVEL 6 BEGINS HERE;;
background_20:
  .dw column20_1,column20_2,column20_3,column20_4,column20_5,column20_6,column20_7,column20_8
  .dw column20_9,column20_10,column20_11,column20_12,column20_13,column20_14,column20_15,column20_16

column20_1:
  .db $8B,$00
column20_2:
  .db $8B,$00
column20_3:
  .db $89,$00,$13,$14
column20_4:
  .db $87,$00,$1B,$00,$15,$16
column20_5:
  .db $89,$00,$13,$14
column20_6:
  .db $87,$00,$1C,$00,$15,$16
column20_7:
  .db $87,$00,$1E,$83,$00
column20_8:
  .db $87,$00,$1F,$83,$00
column20_9:
  .db $87,$00,$1B,$83,$00
column20_10:
  .db $86,$00,$1B,$1B,$17,$18,$18
column20_11:
  .db $86,$00,$1B,$20,$19,$1A,$1A
column20_12:
  .db $86,$00,$17,$18,$18,$18,$18
column20_13:
  .db $86,$00,$19,$1A,$1A,$1A,$1A
column20_14:
  .db $86,$00,$21,$1D,$17,$18,$18
column20_15:
  .db $86,$00,$22,$1D,$19,$1A,$1A
column20_16:
  .db $85,$00,$23,$24,$21,$83,$00

attrib_20:
  .dw a_column20_1,a_column20_2,a_column20_3,a_column20_4,a_column20_5,a_column20_6,a_column20_7,a_column20_8

a_column20_1:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column20_2:
  .db $00,$00,$00,$00,$00,$00,$F0,$0F
a_column20_3:
  .db $00,$00,$00,$00,$00,$00,$F0,$0F
a_column20_4:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column20_5:
  .db $00,$00,$00,$00,$00,$00,$44,$04
a_column20_6:
  .db $00,$00,$00,$00,$00,$88,$99,$09
a_column20_7:
  .db $00,$00,$00,$00,$00,$22,$66,$06
a_column20_8:
  .db $00,$00,$00,$00,$00,$00,$11,$01


;;;;;;;;;;;;;;;;;;
background_21:
  .dw column21_1,column21_2,column21_3,column21_4,column21_5,column21_6,column21_7,column21_8
  .dw column21_9,column21_10,column21_11,column21_12,column21_13,column21_14,column21_15,column21_16

column21_1:
  .db $86,$00,$25,$31,$83,$00
column21_2:
  .db $86,$00,$03,$04,$04,$04,$04
column21_3:
  .db $86,$00,$07,$08,$08,$08,$08
column21_4:
  .db $88,$00,$09,$0A,$0A
column21_5:
  .db $88,$00,$0B,$0C,$0C
column21_6:
  .db $86,$00,$26,$09,$0A,$0A,$0A
column21_7:
  .db $86,$00,$27,$0B,$0C,$0C,$0C
column21_8:
  .db $86,$00,$1E,$1B,$83,$00
column21_9:
  .db $86,$00,$1F,$1C,$83,$00
column21_10:
  .db $87,$00,$1D,$83,$00
column21_11:
  .db $87,$00,$1E,$83,$00
column21_12:
  .db $86,$00,$26,$1F,$00,$13,$14
column21_13:
  .db $86,$00,$27,$1B,$00,$15,$16
column21_14:
  .db $85,$00,$26,$29,$84,$00
column21_15:
  .db $85,$00,$28,$2C,$84,$00
column21_16:
  .db $84,$00,$2A,$2B,$2C,$84,$00

attrib_21:
  .dw a_column21_1,a_column21_2,a_column21_3,a_column21_4,a_column21_5,a_column21_6,a_column21_7,a_column21_8

a_column21_1:
  .db $00,$00,$00,$00,$00,$88,$88,$08
a_column21_2:
  .db $00,$00,$00,$00,$00,$22,$22,$02
a_column21_3:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column21_4:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column21_5:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column21_6:
  .db $00,$00,$00,$00,$00,$00,$C0,$0C
a_column21_7:
  .db $00,$00,$00,$00,$00,$00,$30,$03
a_column21_8:
  .db $00,$00,$00,$00,$00,$00,$00,$00


;;;;;;;;;;;;;;;;;;
background_22:
  .dw column22_1,column22_2,column22_3,column22_4,column22_5,column22_6,column22_7,column22_8
  .dw column22_9,column22_10,column22_11,column22_12,column22_13,column22_14,column22_15,column22_16

column22_1:
  .db $84,$00,$2D,$2E,$2C,$84,$00
column22_2:
  .db $85,$00,$30,$2C,$84,$00
column22_3:
  .db $86,$00,$2F,$84,$00
column22_4:
  .db $86,$00,$31,$27,$83,$00
column22_5:
  .db $86,$00,$09,$0A,$0A,$0A,$0A
column22_6:
  .db $86,$00,$0B,$0C,$0C,$0C,$0C
column22_7:
  .db $86,$00,$27,$22,$83,$00
column22_8:
  .db $86,$00,$21,$2F,$00,$13,$14
column22_9:
  .db $86,$00,$22,$31,$00,$15,$16
column22_10:
  .db $85,$00,$23,$24,$00,$32,$33,$34
column22_11:
  .db $86,$00,$25,$20,$35,$36,$37
column22_12:
  .db $85,$00,$01,$02,$03,$04,$04,$04,$04
column22_13:
  .db $85,$00,$05,$06,$07,$08,$08,$08,$08
column22_14:
  .db $86,$00,$27,$2F,$83,$00
column22_15:
  .db $86,$00,$1D,$22,$83,$00
column22_16:
  .db $86,$00,$1E,$2F,$83,$00

attrib_22:
  .dw a_column22_1,a_column22_2,a_column22_3,a_column22_4,a_column22_5,a_column22_6,a_column22_7,a_column22_8

a_column22_1:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column22_2:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column22_3:
  .db $00,$00,$00,$00,$00,$AA,$AA,$0A
a_column22_4:
  .db $00,$00,$00,$00,$00,$00,$C0,$0C
a_column22_5:
  .db $00,$00,$00,$00,$00,$00,$74,$07
a_column22_6:
  .db $00,$00,$00,$00,$80,$08,$11,$01
a_column22_7:
  .db $00,$00,$00,$00,$20,$02,$00,$00
a_column22_8:
  .db $00,$00,$00,$00,$00,$00,$00,$00


;;;;;;;;;;;;;;;;;;    ;LEVEL 6 ENDS HERE;;
background_23:
  .dw column23_1,column23_2,column23_3,column23_4,column23_5,column23_6,column23_7,column23_8
  .dw column23_9,column23_10,column23_11,column23_12,column23_13,column23_14,column23_15,column23_16

column23_1:
  .db $86,$00,$21,$1F,$83,$00
column23_2:
  .db $85,$00,$0D,$0E,$0F,$0F,$0F,$0F
column23_3:
  .db $85,$00,$10,$11,$12,$12,$12,$12
column23_4:
  .db $86,$00,$21,$1C,$83,$00
column23_5:
  .db $86,$00,$22,$1E,$83,$00
column23_6:
  .db $85,$00,$23,$24,$1F,$83,$00
column23_7:
  .db $86,$00,$25,$84,$00
column23_8:
  .db $86,$00,$1B,$84,$00
column23_9:
  .db $8B,$00
column23_10:
  .db $86,$00,$0D,$0E,$0F,$0F,$0F
column23_11:
  .db $86,$00,$10,$11,$12,$12,$12
column23_12:
  .db $8B,$00
column23_13:
  .db $87,$00,$1C,$17,$18,$18
column23_14:
  .db $87,$00,$1D,$19,$1A,$1A
column23_15:
  .db $87,$00,$1E,$83,$00
column23_16:
  .db $87,$00,$1F,$83,$00

attrib_23:
  .dw a_column23_1,a_column23_2,a_column23_3,a_column23_4,a_column23_5,a_column23_6,a_column23_7,a_column23_8

a_column23_1:
  .db $00,$00,$00,$00,$40,$44,$44,$04
a_column23_2:
  .db $00,$00,$00,$00,$10,$11,$11,$01
a_column23_3:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column23_4:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column23_5:
  .db $00,$00,$00,$00,$00,$88,$88,$08
a_column23_6:
  .db $00,$00,$00,$00,$00,$22,$22,$02
a_column23_7:
  .db $00,$00,$00,$00,$00,$00,$AA,$0A
a_column23_8:
  .db $00,$00,$00,$00,$00,$00,$00,$00


;;;;;;;;;;;;;;;;;;    ;LEVEL 7 BEGINS HERE;;
background_24:
  .dw column24_1,column24_2,column24_3,column24_4,column24_5,column24_6,column24_7,column24_8
  .dw column24_9,column24_10,column24_11,column24_12,column24_13,column24_14,column24_15,column24_16

column24_1:
  .db $89,$00,$38,$39
column24_2:
  .db $87,$00,$1B,$00,$3A,$3B
column24_3:
  .db $87,$00,$1C,$00,$3C,$3D
column24_4:
  .db $87,$00,$1D,$00,$13,$14
column24_5:
  .db $87,$00,$1E,$00,$15,$16
column24_6:
  .db $87,$00,$22,$32,$33,$34
column24_7:
  .db $86,$00,$23,$24,$35,$36,$37
column24_8:
  .db $84,$00,$01,$02,$03,$84,$04
column24_9:
  .db $84,$00,$05,$06,$07,$84,$08
column24_10:
  .db $86,$00,$03,$84,$04
column24_11:
  .db $86,$00,$07,$84,$08
column24_12:
  .db $87,$00,$1D,$00,$38,$39
column24_13:
  .db $87,$00,$1E,$00,$3A,$3B
column24_14:
  .db $87,$00,$22,$00,$38,$39
column24_15:
  .db $86,$00,$23,$24,$00,$3A,$3B
column24_16:
  .db $87,$00,$25,$00,$3C,$3D

attrib_24:
  .dw a_column24_1,a_column24_2,a_column24_3,a_column24_4,a_column24_5,a_column24_6,a_column24_7,a_column24_8

a_column24_1:
  .db $00,$00,$00,$00,$00,$00,$50,$05
a_column24_2:
  .db $00,$00,$00,$00,$00,$00,$D0,$0D
a_column24_3:
  .db $00,$00,$00,$00,$00,$00,$B8,$0B
a_column24_4:
  .db $00,$00,$00,$00,$88,$00,$22,$02
a_column24_5:
  .db $00,$00,$00,$00,$22,$CC,$CC,$0C
a_column24_6:
  .db $00,$00,$00,$00,$00,$33,$73,$07
a_column24_7:
  .db $00,$00,$00,$00,$00,$00,$50,$05
a_column24_8:
  .db $00,$00,$00,$00,$00,$00,$50,$05


;;;;;;;;;;;;;;;;;;
background_25:
  .dw column25_1,column25_2,column25_3,column25_4,column25_5,column25_6,column25_7,column25_8
  .dw column25_9,column25_10,column25_11,column25_12,column25_13,column25_14,column25_15,column25_16

column25_1:
  .db $87,$00,$1B,$00,$13,$14
column25_2:
  .db $87,$00,$1B,$00,$15,$16
column25_3:
  .db $85,$00,$17,$85,$18
column25_4:
  .db $85,$00,$19,$85,$1A
column25_5:
  .db $84,$00,$0D,$0E,$85,$0F
column25_6:
  .db $84,$00,$10,$11,$85,$12
column25_7:
  .db $85,$00,$09,$85,$0A
column25_8:
  .db $85,$00,$0B,$85,$0C
column25_9:
  .db $86,$00,$09,$84,$0A
column25_10:
  .db $86,$00,$0B,$84,$0C
column25_11:
  .db $86,$00,$26,$29,$00,$38,$39
column25_12:
  .db $86,$00,$28,$2C,$00,$3A,$3B
column25_13:
  .db $85,$00,$2A,$2B,$2C,$00,$3C,$3D
column25_14:
  .db $85,$00,$2D,$2E,$2C,$00,$38,$39
column25_15:
  .db $86,$00,$30,$2C,$00,$3A,$3B
column25_16:
  .db $87,$00,$2F,$00,$3C,$3D

attrib_25:
  .dw a_column25_1,a_column25_2,a_column25_3,a_column25_4,a_column25_5,a_column25_6,a_column25_7,a_column25_8

a_column25_1:
  .db $00,$00,$00,$00,$00,$00,$F0,$0F
a_column25_2:
  .db $00,$00,$00,$00,$A0,$AA,$AA,$0A
a_column25_3:
  .db $00,$00,$00,$00,$55,$55,$55,$05
a_column25_4:
  .db $00,$00,$00,$00,$A0,$AA,$AA,$0A
a_column25_5:
  .db $00,$00,$00,$00,$00,$AA,$AA,$0A
a_column25_6:
  .db $00,$00,$00,$00,$00,$00,$F0,$0F
a_column25_7:
  .db $00,$00,$00,$00,$00,$00,$70,$07
a_column25_8:
  .db $00,$00,$00,$00,$00,$00,$50,$05


;;;;;;;;;;;;;;;;;;
background_26:
  .dw column26_1,column26_2,column26_3,column26_4,column26_5,column26_6,column26_7,column26_8
  .dw column26_9,column26_10,column26_11,column26_12,column26_13,column26_14,column26_15,column26_16

column26_1:
  .db $87,$00,$1E,$00,$38,$39
column26_2:
  .db $87,$00,$22,$00,$3A,$3B
column26_3:
  .db $87,$00,$2F,$00,$3C,$3D
column26_4:
  .db $87,$00,$22,$00,$38,$39
column26_5:
  .db $86,$00,$23,$24,$00,$3A,$3B
column26_6:
  .db $86,$00,$01,$02,$03,$04,$04
column26_7:
  .db $86,$00,$05,$06,$07,$08,$08
column26_8:
  .db $85,$00,$17,$85,$18
column26_9:
  .db $85,$00,$19,$85,$1A
column26_10:
  .db $85,$00,$17,$85,$18
column26_11:
  .db $85,$00,$19,$85,$1A
column26_12:
  .db $84,$00,$09,$86,$0A
column26_13:
  .db $84,$00,$0B,$86,$0C
column26_14:
  .db $85,$00,$0D,$0E,$84,$0F
column26_15:
  .db $85,$00,$10,$11,$84,$12
column26_16:
  .db $87,$00,$20,$00,$38,$39

attrib_26:
  .dw a_column26_1,a_column26_2,a_column26_3,a_column26_4,a_column26_5,a_column26_6,a_column26_7,a_column26_8

a_column26_1:
  .db $00,$00,$00,$00,$00,$00,$50,$05
a_column26_2:
  .db $00,$00,$00,$00,$00,$00,$D0,$0D
a_column26_3:
  .db $00,$00,$00,$00,$00,$88,$74,$07
a_column26_4:
  .db $00,$00,$00,$00,$00,$22,$11,$01
a_column26_5:
  .db $00,$00,$00,$00,$40,$44,$44,$04
a_column26_6:
  .db $00,$00,$00,$00,$54,$55,$55,$05
a_column26_7:
  .db $00,$00,$00,$00,$91,$99,$99,$09
a_column26_8:
  .db $00,$00,$00,$00,$20,$22,$62,$06


;;;;;;;;;;;;;;;;;;    ;LEVEL 7 ENDS HERE;;
background_27:
  .dw column27_1,column27_2,column27_3,column27_4,column27_5,column27_6,column27_7,column27_8
  .dw column27_9,column27_10,column27_11,column27_12,column27_13,column27_14,column27_15,column27_16

column27_1:
  .db $87,$00,$21,$00,$3A,$3B
column27_2:
  .db $84,$00,$01,$02,$03,$84,$04
column27_3:
  .db $84,$00,$05,$06,$07,$84,$08
column27_4:
  .db $86,$00,$17,$84,$18
column27_5:
  .db $86,$00,$19,$84,$1A
column27_6:
  .db $87,$00,$1B,$32,$33,$34
column27_7:
  .db $87,$00,$1C,$35,$36,$37
column27_8:
  .db $86,$00,$1B,$1D,$00,$38,$39
column27_9:
  .db $86,$00,$20,$29,$00,$3A,$3B
column27_10:
  .db $86,$00,$1D,$2F,$00,$3A,$3B
column27_11:
  .db $86,$00,$21,$1E,$00,$3C,$3D
column27_12:
  .db $86,$00,$1F,$21,$00,$13,$14
column27_13:
  .db $87,$00,$1F,$00,$15,$16
column27_14:
  .db $85,$00,$0D,$0E,$84,$0F
column27_15:
  .db $85,$00,$10,$11,$84,$12
column27_16:
  .db $8B,$00

attrib_27:
  .dw a_column27_1,a_column27_2,a_column27_3,a_column27_4,a_column27_5,a_column27_6,a_column27_7,a_column27_8

a_column27_1:
  .db $00,$00,$00,$00,$44,$00,$10,$01
a_column27_2:
  .db $00,$00,$00,$00,$11,$88,$88,$08
a_column27_3:
  .db $00,$00,$00,$00,$00,$22,$AA,$0A
a_column27_4:
  .db $00,$00,$00,$00,$00,$00,$62,$06
a_column27_5:
  .db $00,$00,$00,$00,$00,$00,$50,$05
a_column27_6:
  .db $00,$00,$00,$00,$00,$00,$D0,$0D
a_column27_7:
  .db $00,$00,$00,$00,$40,$44,$74,$07
a_column27_8:
  .db $00,$00,$00,$00,$10,$11,$11,$01


;;;;;;;;;;;;;;;;;;    ;LEVEL 8 BEGINS HERE;;
background_28:
  .dw column28_1,column28_2,column28_3,column28_4,column28_5,column28_6,column28_7,column28_8
  .dw column28_9,column28_10,column28_11,column28_12,column28_13,column28_14,column28_15,column28_16

column28_1:
  .db $85,$00,$26,$2C,$00,$3A,$3B,$00
column28_2:
  .db $85,$00,$28,$2C,$00,$3A,$3B,$00
column28_3:
  .db $85,$00,$30,$2C,$00,$3A,$3B,$00
column28_4:
  .db $84,$00,$09,$85,$0A,$00
column28_5:
  .db $84,$00,$0B,$85,$0C,$00
column28_6:
  .db $85,$00,$09,$84,$0A,$00
column28_7:
  .db $85,$00,$0B,$84,$0C,$00
column28_8:
  .db $86,$00,$0E,$83,$41,$00
column28_9:
  .db $86,$00,$11,$83,$12,$00
column28_10:
  .db $85,$00,$26,$29,$32,$33,$34,$00
column28_11:
  .db $85,$00,$28,$2C,$35,$36,$37,$00
column28_12:
  .db $84,$00,$0E,$85,$41,$00
column28_13:
  .db $84,$00,$11,$85,$12,$00
column28_14:
  .db $84,$00,$0B,$85,$0C,$00
column28_15:
  .db $86,$00,$2F,$13,$14,$3E,$00
column28_16:
  .db $86,$00,$22,$15,$16,$3F,$00

attrib_28:
  .dw a_column28_1,a_column28_2,a_column28_3,a_column28_4,a_column28_5,a_column28_6,a_column28_7,a_column28_8

a_column28_1:
  .db $00,$00,$00,$00,$00,$00,$55,$00
a_column28_2:
  .db $00,$00,$00,$00,$88,$88,$99,$00
a_column28_3:
  .db $00,$00,$00,$00,$A2,$AA,$AA,$00
a_column28_4:
  .db $00,$00,$00,$00,$20,$22,$22,$00
a_column28_5:
  .db $00,$00,$00,$00,$00,$40,$44,$00
a_column28_6:
  .db $00,$00,$00,$00,$88,$98,$99,$00
a_column28_7:
  .db $00,$00,$00,$00,$AA,$AA,$AA,$00
a_column28_8:
  .db $00,$00,$00,$00,$00,$50,$55,$00


;;;;;;;;;;;;;;;;;;
background_29:
  .dw column29_1,column29_2,column29_3,column29_4,column29_5,column29_6,column29_7,column29_8
  .dw column29_9,column29_10,column29_11,column29_12,column29_13,column29_14,column29_15,column29_16

column29_1:
  .db $86,$00,$2F,$00,$40,$39,$00
column29_2:
  .db $86,$00,$31,$00,$3A,$3B,$00
column29_3:
  .db $86,$00,$17,$83,$18,$00
column29_4:
  .db $86,$00,$19,$83,$1A,$00
column29_5:
  .db $84,$00,$01,$02,$03,$83,$04,$00
column29_6:
  .db $84,$00,$05,$06,$07,$83,$08,$00
column29_7:
  .db $84,$00,$01,$02,$03,$83,$04,$00
column29_8:
  .db $84,$00,$05,$06,$07,$83,$08,$00
column29_9:
  .db $83,$00,$0E,$86,$41,$00
column29_10:
  .db $83,$00,$11,$86,$12,$00
column29_11:
  .db $85,$00,$09,$84,$0A,$00
column29_12:
  .db $85,$00,$0B,$84,$0C,$00
column29_13:
  .db $86,$00,$20,$00,$40,$39,$00
column29_14:
  .db $85,$00,$1C,$1E,$00,$3A,$3B,$00
column29_15:
  .db $85,$00,$1D,$1F,$00,$3A,$3B,$00
column29_16:
  .db $85,$00,$1E,$1B,$00,$3A,$3B,$00

attrib_29:
  .dw a_column29_1,a_column29_2,a_column29_3,a_column29_4,a_column29_5,a_column29_6,a_column29_7,a_column29_8

a_column29_1:
  .db $00,$00,$00,$00,$00,$00,$55,$00
a_column29_2:
  .db $00,$00,$00,$00,$50,$55,$55,$00
a_column29_3:
  .db $00,$00,$00,$00,$FF,$AA,$AA,$00
a_column29_4:
  .db $00,$00,$00,$00,$00,$55,$55,$00
a_column29_5:
  .db $00,$00,$00,$A0,$AA,$AA,$AA,$00
a_column29_6:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column29_7:
  .db $00,$00,$00,$00,$00,$00,$55,$00
a_column29_8:
  .db $00,$00,$00,$00,$00,$00,$55,$00


;;;;;;;;;;;;;;;;;;
background_30:
  .dw column30_1,column30_2,column30_3,column30_4,column30_5,column30_6,column30_7,column30_8
  .dw column30_9,column30_10,column30_11,column30_12,column30_13,column30_14,column30_15,column30_16

column30_1:
  .db $85,$00,$22,$20,$00,$3A,$3B,$00
column30_2:
  .db $85,$00,$2F,$21,$00,$3A,$3B,$00
column30_3:
  .db $85,$00,$0E,$84,$41,$00
column30_4:
  .db $85,$00,$11,$84,$12,$00
column30_5:
  .db $85,$00,$1B,$0B,$83,$0C,$00
column30_6:
  .db $85,$00,$1C,$1B,$00,$3A,$3B,$00
column30_7:
  .db $85,$00,$1D,$00,$00,$3A,$3B,$00
column30_8:
  .db $85,$00,$1E,$1B,$42,$3A,$3B,$00
column30_9:
  .db $84,$00,$43,$44,$45,$46,$3A,$3B,$00
column30_10:
  .db $85,$00,$1C,$1B,$47,$3A,$3B,$00
column30_11:
  .db $85,$00,$1E,$1B,$00,$3A,$3B,$00
column30_12:
  .db $85,$00,$1F,$00,$32,$33,$34,$00
column30_13:
  .db $86,$00,$1B,$35,$36,$37,$00
column30_14:
  .db $84,$00,$17,$85,$18,$00
column30_15:
  .db $84,$00,$19,$85,$1A,$00
column30_16:
  .db $86,$00,$1C,$13,$14,$3E,$00

attrib_30:
  .dw a_column30_1,a_column30_2,a_column30_3,a_column30_4,a_column30_5,a_column30_6,a_column30_7,a_column30_8

a_column30_1:
  .db $00,$00,$00,$00,$00,$00,$55,$00
a_column30_2:
  .db $00,$00,$00,$00,$A0,$AA,$AA,$00
a_column30_3:
  .db $00,$00,$00,$00,$00,$22,$66,$00
a_column30_4:
  .db $00,$00,$00,$00,$00,$40,$55,$00
a_column30_5:
  .db $00,$00,$00,$00,$11,$51,$55,$00
a_column30_6:
  .db $00,$00,$00,$00,$00,$C0,$DD,$00
a_column30_7:
  .db $00,$00,$00,$00,$00,$30,$33,$00
a_column30_8:
  .db $00,$00,$00,$00,$00,$80,$88,$00


;;;;;;;;;;;;;;;;;;
background_31:
  .dw column31_1,column31_2,column31_3,column31_4,column31_5,column31_6,column31_7,column31_8
  .dw column31_9,column31_10,column31_11,column31_12,column31_13,column31_14,column31_15,column31_16

column31_1:
  .db $85,$00,$26,$29,$15,$16,$3F,$00
column31_2:
  .db $85,$00,$28,$2C,$00,$40,$39,$00
column31_3:
  .db $84,$00,$2A,$48,$2C,$00,$3A,$3B,$00
column31_4:
  .db $84,$00,$2D,$2E,$2C,$00,$3A,$3B,$00
column31_5:
  .db $85,$00,$30,$2C,$13,$14,$3E,$00
column31_6:
  .db $86,$00,$2F,$15,$16,$3F,$00
column31_7:
  .db $85,$00,$0E,$84,$41,$00
column31_8:
  .db $85,$00,$11,$84,$12,$00
column31_9:
  .db $85,$00,$03,$84,$04,$00
column31_10:
  .db $85,$00,$07,$84,$08,$00
column31_11:
  .db $00,$00,$01,$02,$03,$85,$04,$00
column31_12:
  .db $00,$00,$05,$06,$07,$85,$08,$00
column31_13:
  .db $85,$00,$03,$84,$04,$00
column31_14:
  .db $85,$00,$07,$84,$08,$00
column31_15:
  .db $86,$00,$27,$32,$33,$34,$00
column31_16:
  .db $86,$00,$1D,$35,$36,$37,$00

attrib_31:
  .dw a_column31_1,a_column31_2,a_column31_3,a_column31_4,a_column31_5,a_column31_6,a_column31_7,a_column31_8

a_column31_1:
  .db $00,$00,$00,$00,$00,$20,$66,$00
a_column31_2:
  .db $00,$00,$00,$00,$00,$00,$55,$00
a_column31_3:
  .db $00,$00,$00,$00,$00,$A0,$AA,$00
a_column31_4:
  .db $00,$00,$00,$00,$50,$55,$55,$00
a_column31_5:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column31_6:
  .db $00,$00,$00,$00,$AA,$AA,$AA,$00
a_column31_7:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column31_8:
  .db $00,$00,$00,$00,$00,$50,$55,$00


;;;;;;;;;;;;;;;;;;    ;LEVEL 8 ENDS HERE;;
background_32:
  .dw column32_1,column32_2,column32_3,column32_4,column32_5,column32_6,column32_7,column32_8
  .dw column32_9,column32_10,column32_11,column32_12,column32_13,column32_14,column32_15,column32_16

column32_1:
  .db $86,$00,$1E,$00,$40,$39,$00
column32_2:
  .db $86,$00,$1E,$00,$3A,$3B,$00
column32_3:
  .db $85,$00,$09,$84,$0A,$00
column32_4:
  .db $85,$00,$0B,$84,$0C,$00
column32_5:
  .db $84,$00,$0E,$85,$41,$00
column32_6:
  .db $84,$00,$11,$85,$12,$00
column32_7:
  .db $85,$00,$17,$84,$18,$00
column32_8:
  .db $85,$00,$19,$84,$1A,$00
column32_9:
  .db $83,$00,$0E,$86,$41,$00
column32_10:
  .db $83,$00,$11,$86,$12,$00
column32_11:
  .db $84,$00,$09,$85,$0A,$00
column32_12:
  .db $84,$00,$0B,$85,$0C,$00
column32_13:
  .db $86,$00,$26,$03,$04,$04,$00
column32_14:
  .db $86,$00,$1B,$07,$08,$08,$00
column32_15:
  .db $86,$00,$1B,$00,$40,$39,$00
column32_16:
  .db $86,$00,$1B,$00,$3A,$3B,$00

attrib_32:
  .dw a_column32_1,a_column32_2,a_column32_3,a_column32_4,a_column32_5,a_column32_6,a_column32_7,a_column32_8

a_column32_1:
  .db $00,$00,$00,$00,$00,$00,$55,$00
a_column32_2:
  .db $00,$00,$00,$00,$50,$55,$55,$00
a_column32_3:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column32_4:
  .db $00,$00,$00,$00,$F0,$FF,$FF,$00
a_column32_5:
  .db $00,$00,$00,$A0,$AA,$AA,$AA,$00
a_column32_6:
  .db $00,$00,$00,$00,$AA,$AA,$AA,$00
a_column32_7:
  .db $00,$00,$00,$00,$00,$A0,$AA,$00
a_column32_8:
  .db $00,$00,$00,$00,$00,$00,$55,$00


;;;;;;;;;;;;;;;;;;    ;LEVEL 9 BEGINS HERE;;
background_33:
  .dw column33_1,column33_2,column33_3,column33_4,column33_5,column33_6,column33_7,column33_8
  .dw column33_9,column33_10,column33_11,column33_12,column33_13,column33_14,column33_15,column33_16

column33_1:
  .db $85,$00,$1B,$85,$00
column33_2:
  .db $84,$00,$0E,$85,$41,$00
column33_3:
  .db $84,$00,$11,$85,$12,$00
column33_4:
  .db $85,$00,$1C,$00,$32,$33,$34,$00
column33_5:
  .db $85,$00,$21,$00,$35,$36,$37,$00
column33_6:
  .db $83,$00,$03,$86,$04,$00
column33_7:
  .db $83,$00,$07,$86,$08,$00
column33_8:
  .db $84,$00,$0B,$85,$0C,$00
column33_9:
  .db $83,$00,$03,$86,$04,$00
column33_10:
  .db $83,$00,$07,$86,$08,$00
column33_11:
  .db $84,$00,$17,$85,$18,$00
column33_12:
  .db $84,$00,$19,$85,$1A,$00
column33_13:
  .db $85,$00,$0E,$84,$41,$00
column33_14:
  .db $84,$00,$23,$11,$84,$12,$00
column33_15:
  .db $85,$00,$2F,$00,$00,$40,$39,$00
column33_16:
  .db $85,$00,$22,$00,$00,$3A,$3B,$00

attrib_33:
  .dw a_column33_1,a_column33_2,a_column33_3,a_column33_4,a_column33_5,a_column33_6,a_column33_7,a_column33_8

a_column33_1:
  .db $55,$05,$00,$00,$00,$00,$00,$00
a_column33_2:
  .db $55,$05,$00,$00,$00,$00,$00,$00
a_column33_3:
  .db $55,$05,$00,$00,$C0,$C0,$FF,$00
a_column33_4:
  .db $55,$05,$00,$00,$00,$00,$00,$00
a_column33_5:
  .db $55,$05,$00,$00,$00,$00,$00,$00
a_column33_6:
  .db $55,$05,$00,$00,$00,$00,$00,$00
a_column33_7:
  .db $55,$05,$00,$00,$C0,$00,$0C,$00
a_column33_8:
  .db $55,$05,$00,$00,$00,$00,$00,$00


;;;;;;;;;;;;;;;;;;
background_34:
  .dw column34_1,column34_2,column34_3,column34_4,column34_5,column34_6,column34_7,column34_8
  .dw column34_9,column34_10,column34_11,column34_12,column34_13,column34_14,column34_15,column34_16

column34_1:
  .db $85,$00,$2F,$00,$00,$3A,$3B,$00
column34_2:
  .db $84,$00,$17,$85,$18,$00
column34_3:
  .db $84,$00,$19,$85,$1A,$00
column34_4:
  .db $85,$00,$1D,$09,$83,$0A,$00
column34_5:
  .db $85,$00,$1D,$0B,$83,$0C,$00
column34_6:
  .db $83,$00,$01,$02,$03,$84,$04,$00
column34_7:
  .db $83,$00,$05,$06,$07,$84,$08,$00
column34_8:
  .db $84,$00,$28,$2C,$13,$14,$3E,$3E,$00
column34_9:
  .db $84,$00,$30,$2C,$15,$16,$3F,$3F,$00
column34_10:
  .db $85,$00,$1D,$00,$00,$40,$39,$00
column34_11:
  .db $84,$00,$26,$29,$00,$00,$3A,$3B,$00
column34_12:
  .db $84,$00,$2D,$24,$00,$00,$3A,$3B,$00
column34_13:
  .db $85,$00,$25,$00,$00,$3A,$3B,$00
column34_14:
  .db $87,$00,$42,$3A,$3B,$00
column34_15:
  .db $84,$00,$43,$44,$45,$46,$3A,$3B,$00
column34_16:
  .db $84,$00,$26,$29,$00,$47,$3A,$3B,$00

attrib_34:
  .dw a_column34_1,a_column34_2,a_column34_3,a_column34_4,a_column34_5,a_column34_6,a_column34_7,a_column34_8

a_column34_1:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column34_2:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column34_3:
  .db $00,$00,$00,$40,$C4,$FF,$FF,$00
a_column34_4:
  .db $00,$00,$00,$10,$31,$FF,$FF,$00
a_column34_5:
  .db $00,$00,$00,$00,$00,$11,$11,$00
a_column34_6:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column34_7:
  .db $00,$00,$00,$00,$00,$40,$00,$00
a_column34_8:
  .db $00,$00,$00,$00,$11,$51,$00,$00


;;;;;;;;;;;;;;;;;;
background_35:
  .dw column35_1,column35_2,column35_3,column35_4,column35_5,column35_6,column35_7,column35_8
  .dw column35_9,column35_10,column35_11,column35_12,column35_13,column35_14,column35_15,column35_16

column35_1:
  .db $84,$00,$28,$2C,$00,$00,$3A,$3B,$00
column35_2:
  .db $83,$00,$2A,$48,$2C,$00,$00,$3A,$3B,$00
column35_3:
  .db $83,$00,$2D,$2E,$2C,$00,$13,$14,$3E,$00
column35_4:
  .db $84,$00,$30,$2C,$00,$15,$16,$3F,$00
column35_5:
  .db $85,$00,$2F,$03,$83,$04,$00
column35_6:
  .db $83,$00,$0E,$86,$41,$00
column35_7:
  .db $83,$00,$11,$86,$12,$00
column35_8:
  .db $84,$00,$07,$85,$08,$00
column35_9:
  .db $85,$00,$09,$84,$0A,$00
column35_10:
  .db $85,$00,$0B,$84,$0C,$00
column35_11:
  .db $86,$00,$09,$83,$0A,$00
column35_12:
  .db $86,$00,$0B,$83,$0C,$00
column35_13:
  .db $84,$00,$17,$85,$18,$00
column35_14:
  .db $84,$00,$19,$85,$1A,$00
column35_15:
  .db $84,$00,$26,$29,$00,$00,$40,$39,$00
column35_16:
  .db $84,$00,$28,$2C,$00,$00,$3A,$3B,$00

attrib_35:
  .dw a_column35_1,a_column35_2,a_column35_3,a_column35_4,a_column35_5,a_column35_6,a_column35_7,a_column35_8

a_column35_1:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column35_2:
  .db $00,$00,$00,$00,$00,$00,$55,$00
a_column35_3:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column35_4:
  .db $00,$00,$00,$C3,$F0,$F0,$3C,$00
a_column35_5:
  .db $00,$00,$00,$00,$22,$22,$22,$00
a_column35_6:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column35_7:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column35_8:
  .db $00,$00,$00,$00,$00,$00,$00,$00


;;;;;;;;;;;;;;;;;;
background_36:
  .dw column36_1,column36_2,column36_3,column36_4,column36_5,column36_6,column36_7,column36_8
  .dw column36_9,column36_10,column36_11,column36_12,column36_13,column36_14,column36_15,column36_16

column36_1:
  .db $84,$00,$30,$2C,$00,$00,$3A,$3B,$00
column36_2:
  .db $85,$00,$2F,$00,$32,$33,$34,$00
column36_3:
  .db $85,$00,$1E,$00,$35,$36,$37,$00
column36_4:
  .db $83,$00,$01,$02,$03,$84,$04,$00
column36_5:
  .db $83,$00,$05,$06,$07,$84,$08,$00
column36_6:
  .db $85,$00,$22,$00,$00,$13,$14,$00
column36_7:
  .db $85,$00,$25,$00,$00,$15,$16,$00
column36_8:
  .db $85,$00,$1B,$0E,$83,$41,$00
column36_9:
  .db $83,$00,$03,$86,$04,$00
column36_10:
  .db $83,$00,$07,$86,$08,$00
column36_11:
  .db $85,$00,$11,$84,$12,$00
column36_12:
  .db $85,$00,$09,$84,$0A,$00
column36_13:
  .db $85,$00,$0B,$84,$0C,$00
column36_14:
  .db $86,$00,$09,$83,$0A,$00
column36_15:
  .db $86,$00,$0B,$83,$0C,$00
column36_16:
  .db $85,$00,$1B,$00,$00,$13,$14,$00

attrib_36:
  .dw a_column36_1,a_column36_2,a_column36_3,a_column36_4,a_column36_5,a_column36_6,a_column36_7,a_column36_8

a_column36_1:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column36_2:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column36_3:
  .db $00,$00,$00,$00,$00,$00,$44,$00
a_column36_4:
  .db $00,$00,$00,$00,$00,$CC,$DD,$00
a_column36_5:
  .db $00,$00,$00,$C0,$33,$3C,$0F,$00
a_column36_6:
  .db $00,$00,$00,$00,$00,$30,$00,$00
a_column36_7:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column36_8:
  .db $00,$00,$00,$00,$00,$00,$44,$00


;;;;;;;;;;;;;;;;;;    ;LEVEL 9 ENDS HERE;;
background_37:
  .dw column37_1,column37_2,column37_3,column37_4,column37_5,column37_6,column37_7,column37_8
  .dw column37_9,column37_10,column37_11,column37_12,column37_13,column37_14,column37_15,column37_16

column37_1:
  .db $85,$00,$1B,$00,$00,$15,$16,$00
column37_2:
  .db $85,$00,$03,$84,$04,$00
column37_3:
  .db $00,$00,$0E,$87,$41,$00
column37_4:
  .db $00,$00,$11,$87,$12,$00
column37_5:
  .db $83,$00,$07,$86,$08,$00
column37_6:
  .db $85,$00,$1D,$17,$83,$18,$00
column37_7:
  .db $85,$00,$1E,$19,$83,$1A,$00
column37_8:
  .db $84,$00,$17,$85,$18,$00
column37_9:
  .db $84,$00,$19,$85,$1A,$00
column37_10:
  .db $85,$00,$22,$00,$32,$33,$34,$00
column37_11:
  .db $85,$00,$25,$00,$35,$36,$37,$00
column37_12:
  .db $83,$00,$01,$02,$03,$84,$04,$00
column37_13:
  .db $83,$00,$05,$06,$07,$84,$08,$00
column37_14:
  .db $85,$00,$1B,$00,$00,$40,$39,$00
column37_15:
  .db $85,$00,$1F,$00,$00,$3A,$3B,$00
column37_16:
  .db $88,$00,$3A,$3B,$00

attrib_37:
  .dw a_column37_1,a_column37_2,a_column37_3,a_column37_4,a_column37_5,a_column37_6,a_column37_7,a_column37_8

a_column37_1:
  .db $00,$00,$00,$00,$C0,$CC,$FF,$00
a_column37_2:
  .db $00,$00,$00,$CC,$00,$0C,$00,$00
a_column37_3:
  .db $00,$00,$00,$30,$33,$FF,$FF,$00
a_column37_4:
  .db $00,$00,$00,$00,$CC,$FF,$FF,$00
a_column37_5:
  .db $00,$00,$00,$00,$33,$B3,$BB,$00
a_column37_6:
  .db $00,$00,$00,$40,$C4,$EC,$EE,$00
a_column37_7:
  .db $00,$00,$00,$10,$01,$30,$B8,$00
a_column37_8:
  .db $00,$00,$00,$00,$00,$00,$22,$00


;;;;;;;;;;;;;;;;;;    ;LEVEL 10 BEGINS HERE;;
background_38:
  .dw column38_1,column38_2,column38_3,column38_4,column38_5,column38_6,column38_7,column38_8
  .dw column38_9,column38_10,column38_11,column38_12,column38_13,column38_14,column38_15,column38_16

column38_1:
  .db $85,$00,$26,$2C,$00,$3A,$3B,$00
column38_2:
  .db $85,$00,$28,$2C,$00,$3A,$3B,$00
column38_3:
  .db $85,$00,$30,$2C,$00,$3A,$3B,$00
column38_4:
  .db $86,$00,$2F,$32,$33,$34,$00
column38_5:
  .db $86,$00,$31,$35,$36,$37,$00
column38_6:
  .db $00,$00,$09,$87,$0A,$00
column38_7:
  .db $00,$00,$0B,$87,$0C,$00
column38_8:
  .db $86,$00,$11,$83,$12,$00
column38_9:
  .db $86,$00,$1B,$00,$07,$08,$00
column38_10:
  .db $87,$00,$42,$83,$00
column38_11:
  .db $84,$00,$43,$44,$45,$46,$13,$14,$00
column38_12:
  .db $86,$00,$20,$47,$15,$16,$00
column38_13:
  .db $00,$00,$01,$02,$03,$85,$04,$00
column38_14:
  .db $00,$00,$05,$06,$07,$85,$08,$00
column38_15:
  .db $86,$00,$2F,$00,$3A,$3B,$00
column38_16:
  .db $86,$00,$22,$00,$3A,$3B,$00

attrib_38:
  .dw a_column38_1,a_column38_2,a_column38_3,a_column38_4,a_column38_5,a_column38_6,a_column38_7,a_column38_8

a_column38_1:
  .db $00,$00,$00,$00,$00,$00,$55,$00
a_column38_2:
  .db $00,$00,$00,$00,$00,$C0,$DD,$00
a_column38_3:
  .db $00,$00,$00,$88,$88,$B8,$BB,$00
a_column38_4:
  .db $00,$00,$00,$22,$22,$EE,$EE,$00
a_column38_5:
  .db $00,$00,$00,$00,$00,$80,$33,$00
a_column38_6:
  .db $00,$00,$00,$00,$22,$A2,$AA,$00
a_column38_7:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column38_8:
  .db $00,$00,$00,$00,$00,$00,$AA,$00


;;;;;;;;;;;;;;;;;;
background_39:
  .dw column39_1,column39_2,column39_3,column39_4,column39_5,column39_6,column39_7,column39_8
  .dw column39_9,column39_10,column39_11,column39_12,column39_13,column39_14,column39_15,column39_16

column39_1:
  .db $86,$00,$2F,$00,$3A,$3B,$00
column39_2:
  .db $86,$00,$31,$00,$3A,$3B,$00
column39_3:
  .db $00,$00,$0E,$87,$41,$00
column39_4:
  .db $00,$00,$11,$87,$12,$00
column39_5:
  .db $87,$00,$32,$33,$34,$00
column39_6:
  .db $87,$00,$35,$36,$37,$00
column39_7:
  .db $84,$00,$03,$85,$04,$00
column39_8:
  .db $84,$00,$07,$85,$08,$00
column39_9:
  .db $85,$00,$13,$14,$83,$3E,$00
column39_10:
  .db $85,$00,$15,$16,$83,$3F,$00
column39_11:
  .db $86,$00,$20,$13,$14,$3E,$00
column39_12:
  .db $86,$00,$1D,$15,$16,$3F,$00
column39_13:
  .db $85,$00,$1B,$1E,$00,$40,$39,$00
column39_14:
  .db $86,$00,$22,$00,$3A,$3B,$00
column39_15:
  .db $85,$00,$23,$24,$00,$3A,$3B,$00
column39_16:
  .db $86,$00,$25,$00,$3A,$3B,$00

attrib_39:
  .dw a_column39_1,a_column39_2,a_column39_3,a_column39_4,a_column39_5,a_column39_6,a_column39_7,a_column39_8

a_column39_1:
  .db $00,$00,$00,$00,$00,$00,$AA,$00
a_column39_2:
  .db $00,$00,$00,$AA,$AA,$AA,$AA,$00
a_column39_3:
  .db $00,$00,$00,$00,$00,$A0,$AA,$00
a_column39_4:
  .db $00,$00,$00,$00,$FF,$FF,$FF,$00
a_column39_5:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column39_6:
  .db $00,$00,$00,$00,$00,$F0,$FF,$00
a_column39_7:
  .db $00,$00,$00,$00,$00,$00,$55,$00
a_column39_8:
  .db $00,$00,$00,$00,$00,$00,$55,$00


;;;;;;;;;;;;;;;;;;
background_40:
  .dw column40_1,column40_2,column40_3,column40_4,column40_5,column40_6,column40_7,column40_8
  .dw column40_9,column40_10,column40_11,column40_12,column40_13,column40_14,column40_15,column40_16

column40_1:
  .db $86,$00,$1C,$00,$3A,$3B,$00
column40_2:
  .db $86,$00,$21,$00,$3A,$3B,$00
column40_3:
  .db $85,$00,$0E,$84,$41,$00
column40_4:
  .db $85,$00,$11,$84,$12,$00
column40_5:
  .db $85,$00,$1B,$0B,$83,$0C,$00
column40_6:
  .db $83,$00,$01,$02,$03,$84,$04,$00
column40_7:
  .db $83,$00,$05,$06,$07,$84,$08,$00
column40_8:
  .db $85,$00,$1D,$1C,$00,$3A,$3B,$00
column40_9:
  .db $85,$00,$1D,$2F,$00,$3A,$3B,$00
column40_10:
  .db $83,$00,$17,$86,$18,$00
column40_11:
  .db $83,$00,$19,$86,$1A,$00
column40_12:
  .db $85,$00,$1E,$00,$32,$33,$34,$00
column40_13:
  .db $85,$00,$21,$26,$35,$36,$37,$00
column40_14:
  .db $84,$00,$17,$85,$18,$00
column40_15:
  .db $84,$00,$19,$85,$1A,$00
column40_16:
  .db $85,$00,$1F,$20,$84,$00

attrib_40:
  .dw a_column40_1,a_column40_2,a_column40_3,a_column40_4,a_column40_5,a_column40_6,a_column40_7,a_column40_8

a_column40_1:
  .db $00,$00,$00,$00,$00,$00,$55,$00
a_column40_2:
  .db $00,$00,$00,$00,$A0,$AA,$AA,$00
a_column40_3:
  .db $00,$00,$00,$00,$00,$22,$22,$00
a_column40_4:
  .db $00,$00,$00,$00,$00,$00,$44,$00
a_column40_5:
  .db $00,$00,$00,$00,$00,$00,$11,$00
a_column40_6:
  .db $00,$00,$00,$00,$00,$C0,$CC,$00
a_column40_7:
  .db $00,$00,$00,$00,$00,$30,$33,$00
a_column40_8:
  .db $00,$00,$00,$00,$00,$00,$00,$00


;;;;;;;;;;;;;;;;;;
background_41:
  .dw column41_1,column41_2,column41_3,column41_4,column41_5,column41_6,column41_7,column41_8
  .dw column41_9,column41_10,column41_11,column41_12,column41_13,column41_14,column41_15,column41_16

column41_1:
  .db $85,$00,$26,$29,$84,$00
column41_2:
  .db $85,$00,$28,$2C,$00,$40,$39,$00
column41_3:
  .db $84,$00,$2A,$48,$2C,$00,$3A,$3B,$00
column41_4:
  .db $84,$00,$2D,$2E,$2C,$13,$14,$3E,$00
column41_5:
  .db $85,$00,$30,$2C,$15,$16,$3F,$00
column41_6:
  .db $86,$00,$2F,$00,$13,$14,$00
column41_7:
  .db $86,$00,$22,$00,$15,$16,$00
column41_8:
  .db $86,$00,$2F,$32,$33,$34,$00
column41_9:
  .db $86,$00,$31,$35,$36,$37,$00
column41_10:
  .db $00,$00,$17,$87,$18,$00
column41_11:
  .db $00,$00,$19,$87,$1A,$00
column41_12:
  .db $85,$00,$09,$84,$0A,$00
column41_13:
  .db $85,$00,$0B,$84,$0C,$00
column41_14:
  .db $87,$00,$03,$04,$04,$00
column41_15:
  .db $86,$00,$20,$07,$08,$08,$00
column41_16:
  .db $86,$00,$1D,$00,$40,$39,$00

attrib_41:
  .dw a_column41_1,a_column41_2,a_column41_3,a_column41_4,a_column41_5,a_column41_6,a_column41_7,a_column41_8

a_column41_1:
  .db $00,$00,$00,$00,$00,$00,$44,$00
a_column41_2:
  .db $00,$00,$00,$00,$00,$80,$99,$00
a_column41_3:
  .db $00,$00,$00,$00,$00,$20,$EE,$00
a_column41_4:
  .db $00,$00,$00,$00,$00,$40,$77,$00
a_column41_5:
  .db $00,$00,$00,$CC,$CC,$DC,$DD,$00
a_column41_6:
  .db $00,$00,$00,$33,$F3,$FF,$FF,$00
a_column41_7:
  .db $00,$00,$00,$00,$30,$33,$33,$00
a_column41_8:
  .db $00,$00,$00,$00,$00,$00,$00,$00



;;;;;;;;;;;;;;;;;;    ;LEVEL 10 ENDS HERE;;
background_42:
  .dw column42_1,column42_2,column42_3,column42_4,column42_5,column42_6,column42_7,column42_8
  .dw column42_9,column42_10,column42_11,column42_12,column42_13,column42_14,column42_15,column42_16

column42_1:
  .db $86,$00,$1E,$00,$3A,$3B,$00
column42_2:
  .db $00,$00,$0E,$87,$41,$00
column42_3:
  .db $00,$00,$11,$87,$12,$00
column42_4:
  .db $85,$00,$0B,$84,$0C,$00
column42_5:
  .db $85,$00,$28,$2C,$84,$00
column42_6:
  .db $85,$00,$30,$2C,$84,$00
column42_7:
  .db $85,$00,$17,$84,$18,$00
column42_8:
  .db $85,$00,$19,$84,$1A,$00
column42_9:
  .db $85,$00,$28,$2C,$84,$00
column42_10:
  .db $85,$00,$30,$2C,$84,$00
column42_11:
  .db $83,$00,$09,$86,$0A,$00
column42_12:
  .db $83,$00,$0B,$86,$0C,$00
column42_13:
  .db $85,$00,$01,$02,$03,$04,$04,$00
column42_14:
  .db $85,$00,$05,$06,$07,$08,$08,$00
column42_15:
  .db $86,$00,$25,$00,$40,$39,$00
column42_16:
  .db $86,$00,$1B,$00,$3A,$3B,$00

attrib_42:
  .dw a_column42_1,a_column42_2,a_column42_3,a_column42_4,a_column42_5,a_column42_6,a_column42_7,a_column42_8

a_column42_1:
  .db $00,$00,$00,$44,$44,$44,$44,$00
a_column42_2:
  .db $00,$00,$00,$11,$51,$55,$55,$00
a_column42_3:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column42_4:
  .db $00,$00,$00,$00,$F0,$FF,$FF,$00
a_column42_5:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column42_6:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column42_7:
  .db $00,$00,$00,$00,$A0,$AA,$AA,$00
a_column42_8:
  .db $00,$00,$00,$00,$00,$00,$55,$00


;;;;;;;;;;;;;;;;;;    ;BOSS 2 - Frame 1;;
background_43:
  .dw column43_0,column43_1,column43_2,column43_3,column43_4,column43_5,column43_6,column43_7
  .dw column43_8,column43_9,column43_10,column43_11,column43_12,column43_13,column43_14,column43_15

column43_0:
  .db $8b,$00
column43_1:
  .db $8a,$00,$1d
column43_2:
  .db $89,$00,$17,$1e
column43_3:
  .db $87,$00,$0f,$13,$18,$1f
column43_4:
  .db $84,$00,$03,$07,$0b,$10,$14,$19,$20
column43_5:
  .db $83,$00,$01,$04,$08,$0c,$11,$15,$1a,$21
column43_6:
  .db $83,$00,$02,$05,$09,$0d,$12,$16,$1b,$22
column43_7:
  .db $84,$00,$06,$0a,$0e,$82,$00,$1c,$23
column43_8:
  .db $8b,$00
column43_9:
  .db $8b,$00
column43_10:
  .db $8b,$00
column43_11:
  .db $8b,$00
column43_12:
  .db $8b,$00
column43_13:
  .db $8b,$00
column43_14:
  .db $8b,$00
column43_15:
  .db $8b,$00

attrib_43:
  .word a_column43_0,a_column43_1,a_column43_2,a_column43_3,a_column43_4,a_column43_5,a_column43_6,a_column43_7

a_column43_0:
  .db $00,$00,$00,$00,$00,$00,$00,$04
a_column43_1:
  .db $00,$00,$00,$00,$00,$40,$54,$05
a_column43_2:
  .db $00,$00,$00,$55,$55,$9d,$99,$0a    ;changed these and the eye tiles in this frame and the next
;  .db $00,$00,$00,$00,$50,$9d,$99,$0a   ;so I could get the fade out to work without fading the status bar too
a_column43_3:
  .db $00,$00,$00,$55,$a5,$2b,$a2,$0a
;  .db $00,$00,$00,$00,$a0,$2b,$a2,$0a
a_column43_4:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column43_5:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column43_6:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column43_7:
  .db $00,$00,$00,$00,$00,$00,$00,$00


;;;;;;;;;;;;;;;;;;    ;BOSS 2 - Frame 2;;
background_44:
  .dw column44_0,column44_1,column44_2,column44_3,column44_4,column44_5,column44_6,column44_7
  .dw column44_8,column44_9,column44_10,column44_11,column44_12,column44_13,column44_14,column44_15

column44_0:
  .db $8b,$00
column44_1:
  .db $8a,$00,$3E
column44_2:
  .db $89,$00,$39,$3F
column44_3:
  .db $87,$00,$30,$35,$3A,$40
column44_4:
  .db $84,$00,$26,$2A,$2D,$31,$36,$3B,$41
column44_5:
  .db $83,$00,$24,$27,$2B,$2E,$32,$37,$3C,$42
column44_6:
  .db $83,$00,$25,$28,$2C,$2F,$33,$38,$3D,$43
column44_7:
  .db $84,$00,$29,$82,$00,$34,$83,$00
column44_8:
  .db $8b,$00
column44_9:
  .db $8b,$00
column44_10:
  .db $8b,$00
column44_11:
  .db $8b,$00
column44_12:
  .db $8b,$00
column44_13:
  .db $8b,$00
column44_14:
  .db $8b,$00
column44_15:
  .db $8b,$00


attrib_44:
  .dw a_column44_0,a_column44_1,a_column44_2,a_column44_3,a_column44_4,a_column44_5,a_column44_6,a_column44_7

a_column44_0:
  .db $04,$00,$00,$00,$00,$00,$00,$04
a_column44_1:
  .db $0e,$00,$00,$00,$00,$40,$54,$05
a_column44_2:
  .db $00,$00,$00,$55,$55,$99,$99,$0a
;  .db $00,$00,$00,$00,$50,$99,$99,$0a
a_column44_3:
  .db $00,$00,$00,$55,$25,$a3,$22,$02
;  .db $00,$00,$00,$00,$20,$a3,$22,$02
a_column44_4:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column44_5:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column44_6:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column44_7:
  .db $00,$00,$00,$00,$00,$00,$00,$00


;;;;;;;;;;;;;;;;;;      End of file - Buffer table 
background_45:
  .dw column45_1,column45_2,column45_3,column45_4,column45_5,column45_6,column45_7,column45_8
  .dw column45_9,column45_10,column45_11,column45_12,column45_13,column45_14,column45_15,column45_16

column45_1:
  .db $8A,$00,$00
column45_2:
  .db $8A,$00,$00
column45_3:
  .db $8A,$00,$00
column45_4:
  .db $8A,$00,$00
column45_5:
  .db $8A,$00,$00
column45_6:
  .db $8A,$00,$00
column45_7:
  .db $8A,$00,$00
column45_8:
  .db $8A,$00,$00
column45_9:
  .db $8A,$00,$00
column45_10:
  .db $8A,$00,$00
column45_11:
  .db $8A,$00,$00
column45_12:
  .db $8A,$00,$00
column45_13:
  .db $8A,$00,$00
column45_14:
  .db $8A,$00,$00
column45_15:
  .db $8A,$00,$00
column45_16:
  .db $8A,$00,$00

attrib_45:
  .dw a_column45_1,a_column45_2,a_column45_3,a_column45_4,a_column45_5,a_column45_6,a_column45_7,a_column45_8

a_column45_1:
  .db $00
a_column45_2:
  .db $00
a_column45_3:
  .db $00
a_column45_4:
  .db $00
a_column45_5:
  .db $00
a_column45_6:
  .db $00
a_column45_7:
  .db $00
a_column45_8:
  .db $00


;;;;;TEMPLATE TABLE BELOW;;;;;

;;;;;;;;;;;;;;;;;;
background_0y:
  .dw column0y_1,column0y_2,column0y_3,column0y_4,column0y_5,column0y_6,column0y_7,column0y_8
  .dw column0y_9,column0y_10,column0y_11,column0y_12,column0y_13,column0y_14,column0y_15,column0y_16

column0y_1:
  .db $8A,$00,$00
column0y_2:
  .db $8A,$00,$00
column0y_3:
  .db $8A,$00,$00
column0y_4:
  .db $8A,$00,$00
column0y_5:
  .db $8A,$00,$00
column0y_6:
  .db $8A,$00,$00
column0y_7:
  .db $8A,$00,$00
column0y_8:
  .db $8A,$00,$00
column0y_9:
  .db $8A,$00,$00
column0y_10:
  .db $8A,$00,$00
column0y_11:
  .db $8A,$00,$00
column0y_12:
  .db $8A,$00,$00
column0y_13:
  .db $8A,$00,$00
column0y_14:
  .db $8A,$00,$00
column0y_15:
  .db $8A,$00,$00
column0y_16:
  .db $8A,$00,$00

attrib_0y:
  .dw a_column0y_1,a_column0y_2,a_column0y_3,a_column0y_4,a_column0y_5,a_column0y_6,a_column0y_7,a_column0y_8

a_column0y_1:
  .db $00
a_column0y_2:
  .db $00
a_column0y_3:
  .db $00
a_column0y_4:
  .db $00
a_column0y_5:
  .db $00
a_column0y_6:
  .db $00
a_column0y_7:
  .db $00
a_column0y_8:
  .db $00


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


init_pb_attr06:
  .db $00,$00,$00,$00,$00
init_pb_attr07:
  .db $00,$00,$00,$00,$00
init_pb_attr08:
  .db $00,$00,$00,$00,$00
init_pb_attr09:
  .db $00,$00,$00,$00,$00
init_pb_attr10:
  .db $00,$00,$00,$00,$00
init_pb_attr11:
  .db $00,$00,$00,$00,$00


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Palette data for ALL levels goes in background1.i
