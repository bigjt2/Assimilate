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
background_46:
  .dw column46_1,column46_2,column46_3,column46_4,column46_5,column46_6,column46_7,column46_8
  .dw column46_9,column46_10,column46_11,column46_12,column46_13,column46_14,column46_15,column46_16

column46_1:
  .db $8B,$00
column46_2:
  .db $8B,$00
column46_3:
  .db $8B,$00
column46_4:
  .db $8B,$00
column46_5:
  .db $8B,$00
column46_6:
  .db $8B,$00
column46_7:
  .db $8B,$00
column46_8:
  .db $8B,$00
column46_9:
  .db $8B,$00
column46_10:
  .db $8B,$00
column46_11:
  .db $8B,$00
column46_12:
  .db $8B,$00
column46_13:
  .db $8B,$00
column46_14:
  .db $8B,$00
column46_15:
  .db $8B,$00
column46_16:
  .db $8B,$00

attrib_46:
  .dw a_column46_1,a_column46_2,a_column46_3,a_column46_4,a_column46_5,a_column46_6,a_column46_7,a_column46_8

a_column46_1:
  .db $00
a_column46_2:
  .db $00
a_column46_3:
  .db $00
a_column46_4:
  .db $00
a_column46_5:
  .db $00
a_column46_6:
  .db $00
a_column46_7:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column46_8:
  .db $00,$00,$00,$00,$00,$00,$00,$00


;;;;;;;;;;;;;;;;;;    ;LEVEL 14 BEGINS HERE;;
background_47:
  .dw column47_1,column47_2,column47_3,column47_4,column47_5,column47_6,column47_7,column47_8
  .dw column47_9,column47_10,column47_11,column47_12,column47_13,column47_14,column47_15,column47_16

column47_1:
  .db $8b,$00
column47_2:
  .db $86,$00,$22,$84,$25
column47_3:
  .db $87,$00,$84,$26
column47_4:
  .db $82,$00,$83,$2b,$83,$33,$2d,$82,$45
column47_5:
  .db $86,$00,$2c,$34,$2f,$3a,$4a
column47_6:
  .db $87,$00,$2c,$2f,$3e,$3a
column47_7:
  .db $87,$00,$2a,$30,$82,$4b
column47_8:
  .db $84,$00,$05,$0d,$15,$1d,$83,$25
column47_9:
  .db $84,$00,$06,$0e,$16,$1e,$83,$26
column47_10:
  .db $85,$00,$35,$83,$3b,$48,$3a
column47_11:
  .db $84,$00,$2d,$36,$83,$45,$47,$3a
column47_12:
  .db $84,$00,$2f,$37,$83,$3c,$49,$3a
column47_13:
  .db $84,$00,$82,$2f,$83,$3a,$48,$3a
column47_14:
  .db $84,$00,$30,$2f,$82,$3a,$3d,$48,$3a
column47_15:
  .db $85,$00,$30,$82,$3a,$3e,$48,$3a
column47_16:
  .db $89,$00,$49,$3a

attrib_47:
  .dw a_column47_1,a_column47_2,a_column47_3,a_column47_4,a_column47_5,a_column47_6,a_column47_7,a_column47_8

a_column47_1:
  .db $FF,$FF,$00,$00,$00,$44,$44,$04
a_column47_2:
  .db $FF,$FF,$00,$44,$44,$54,$99,$09
a_column47_3:
  .db $FF,$FF,$00,$00,$00,$62,$AA,$0A
a_column47_4:
  .db $FF,$FF,$00,$00,$40,$98,$AA,$06
a_column47_5:
  .db $FF,$FF,$00,$00,$60,$66,$15,$01
a_column47_6:
  .db $FF,$FF,$00,$00,$55,$55,$05,$00
a_column47_7:
  .db $FF,$FF,$00,$00,$55,$55,$05,$00
a_column47_8:
  .db $FF,$FF,$00,$00,$10,$11,$01,$00


;;;;;;;;;;;;;;;;;;
background_48:
  .dw column48_1,column48_2,column48_3,column48_4,column48_5,column48_6,column48_7,column48_8
  .dw column48_9,column48_10,column48_11,column48_12,column48_13,column48_14,column48_15,column48_16

column48_1:
  .db $88,$00,$35,$82,$3b
column48_2:
  .db $86,$00,$35,$4c,$83,$40
column48_3:
  .db $85,$00,$2d,$36,$84,$45
column48_4:
  .db $85,$00,$30,$37,$4d,$83,$40
column48_5:
  .db $82,$00,$82,$2b,$82,$33,$82,$2f,$37,$82,$3c
column48_6:
  .db $86,$00,$82,$2f,$2e,$82,$3a
column48_7:
  .db $86,$00,$83,$2f,$3a,$4a
column48_8:
  .db $86,$00,$30,$82,$2f,$3d,$3a
column48_9:
  .db $82,$00,$2b,$83,$2c,$34,$82,$2f,$82,$3a
column48_10:
  .db $86,$00,$35,$82,$2f,$82,$3a
column48_11:
  .db $85,$00,$2d,$36,$82,$2f,$4a,$3a
column48_12:
  .db $83,$00,$2c,$34,$2e,$37,$2f,$2e,$82,$3a
column48_13:
  .db $85,$00,$30,$83,$2f,$3a,$3d
column48_14:
  .db $86,$00,$30,$82,$2f,$82,$3a
column48_15:
  .db $87,$00,$30,$2f,$82,$3a
column48_16:
  .db $88,$00,$30,$82,$3a

attrib_48:
  .dw a_column48_1,a_column48_2,a_column48_3,a_column48_4,a_column48_5,a_column48_6,a_column48_7,a_column48_8

a_column48_1:
  .db $FF,$FF,$00,$00,$00,$AA,$AA,$AA
a_column48_2:
  .db $FF,$FF,$00,$00,$AA,$AA,$AA,$AA
a_column48_3:
  .db $FF,$FF,$00,$AA,$AA,$AA,$AA,$AA
a_column48_4:
  .db $FF,$FF,$00,$00,$00,$AA,$AA,$0A
a_column48_5:
  .db $FF,$FF,$00,$AA,$AA,$AA,$AA,$0A
a_column48_6:
  .db $FF,$FF,$00,$AA,$AA,$AA,$AA,$0A
a_column48_7:
  .db $FF,$FF,$00,$00,$AA,$AA,$AA,$0A
a_column48_8:
  .db $FF,$FF,$00,$00,$00,$AA,$AA,$0A


;;;;;;;;;;;;;;;;;;
background_49:
  .dw column49_1,column49_2,column49_3,column49_4,column49_5,column49_6,column49_7,column49_8
  .dw column49_9,column49_10,column49_11,column49_12,column49_13,column49_14,column49_15,column49_16

column49_1:
  .db $88,$00,$35,$82,$3b
column49_2:
  .db $86,$00,$35,$4c,$36,$40,$45
column49_3:
  .db $85,$00,$2d,$85,$45
column49_4:
  .db $82,$00,$82,$2c,$34,$2e,$37,$4d,$36,$40,$45
column49_5:
  .db $85,$00,$83,$2f,$37,$82,$3c
column49_6:
  .db $82,$00,$82,$2c,$83,$34,$82,$2f,$82,$3a
column49_7:
  .db $86,$00,$30,$82,$2f,$82,$3a
column49_8:
  .db $87,$00,$30,$2f,$82,$3a
column49_9:
  .db $88,$00,$30,$82,$3a
column49_10:
  .db $85,$00,$2b,$2c,$82,$34,$48,$4a
column49_11:
  .db $83,$00,$41,$43,$84,$45,$48,$3a
column49_12:
  .db $83,$00,$42,$44,$84,$46,$48,$4b
column49_13:
  .db $85,$00,$2a,$32,$82,$34,$48,$3d
column49_14:
  .db $88,$00,$35,$4c,$40
column49_15:
  .db $88,$00,$48,$3e,$3a
column49_16:
  .db $88,$00,$49,$4b,$3a

attrib_49:
  .dw a_column49_1,a_column49_2,a_column49_3,a_column49_4,a_column49_5,a_column49_6,a_column49_7,a_column49_8

a_column49_1:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column49_2:
  .db $00,$00,$00,$44,$04,$00,$00,$00
a_column49_3:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column49_4:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column49_5:
  .db $00,$00,$00,$00,$40,$44,$04,$00
a_column49_6:
  .db $00,$00,$00,$60,$66,$66,$06,$00
a_column49_7:
  .db $00,$00,$00,$00,$10,$11,$01,$00
a_column49_8:
  .db $00,$00,$00,$00,$00,$00,$F0,$00


;;;;;;;;;;;;;;;;;;
background_50:
  .dw column50_1,column50_2,column50_3,column50_4,column50_5,column50_6,column50_7,column50_8
  .dw column50_9,column50_10,column50_11,column50_12,column50_13,column50_14,column50_15,column50_16

column50_1:
  .db $87,$00,$05,$48,$4a,$3a
column50_2:
  .db $87,$00,$06,$48,$4b,$3a
column50_3:
  .db $84,$00,$29,$31,$85,$39
column50_4:
  .db $88,$00,$49,$82,$4a
column50_5:
  .db $88,$00,$48,$82,$3a
column50_6:
  .db $83,$00,$35,$82,$3b,$4c,$40,$48,$82,$3a
column50_7:
  .db $82,$00,$28,$2d,$45,$36,$45,$36,$83,$45
column50_8:
  .db $82,$00,$21,$2d,$36,$83,$45,$36,$82,$45
column50_9:
  .db $82,$00,$27,$37,$82,$3c,$4d,$84,$40
column50_10:
  .db $83,$00,$30,$3a,$4b,$2e,$82,$3a,$48,$3a
column50_11:
  .db $86,$00,$30,$3a,$2f,$48,$3a
column50_12:
  .db $86,$00,$82,$22,$2f,$48,$3a
column50_13:
  .db $82,$00,$82,$2b,$84,$33,$2f,$48,$3a
column50_14:
  .db $88,$00,$30,$48,$3a
column50_15:
  .db $88,$00,$35,$82,$3b
column50_16:
  .db $87,$00,$23,$47,$82,$48

attrib_50:
  .dw a_column50_1,a_column50_2,a_column50_3,a_column50_4,a_column50_5,a_column50_6,a_column50_7,a_column50_8

a_column50_1:
  .db $00,$00,$00,$00,$00,$00,$F0,$00
a_column50_2:
  .db $00,$00,$00,$00,$00,$00,$C0,$00
a_column50_3:
  .db $00,$00,$00,$66,$66,$66,$F0,$00
a_column50_4:
  .db $00,$00,$00,$55,$55,$55,$55,$A5
a_column50_5:
  .db $00,$00,$00,$51,$55,$55,$55,$05
a_column50_6:
  .db $00,$00,$00,$00,$00,$55,$55,$05
a_column50_7:
  .db $00,$00,$00,$11,$11,$11,$55,$05
a_column50_8:
  .db $00,$00,$00,$00,$00,$00,$00,$00


;;;;;;;;;;;;;;;;;;
background_51:
  .dw column51_1,column51_2,column51_3,column51_4,column51_5,column51_6,column51_7,column51_8
  .dw column51_9,column51_10,column51_11,column51_12,column51_13,column51_14,column51_15,column51_16

column51_1:
  .db $87,$00,$23,$24,$82,$48
column51_2:
  .db $86,$00,$23,$84,$24
column51_3:
  .db $00,$83,$2c,$83,$34,$48,$3a,$4a,$3a
column51_4:
  .db $8a,$00,$1d
column51_5:
  .db $88,$00,$82,$16,$1e
column51_6:
  .db $82,$00,$82,$2b,$84,$33,$2d,$82,$45
column51_7:
  .db $88,$00,$2f,$37,$3c
column51_8:
  .db $88,$00,$82,$2f,$3a
column51_9:
  .db $86,$00,$2d,$45,$2f,$2e,$3a
column51_10:
  .db $86,$00,$38,$3a,$82,$2f,$3a
column51_11:
  .db $00,$33,$84,$34,$2f,$3d,$82,$2f,$3a
column51_12:
  .db $85,$00,$30,$82,$3a,$30,$2f,$3a
column51_13:
  .db $89,$00,$30,$3a
column51_14:
  .db $89,$00,$17,$28
column51_15:
  .db $8a,$00,$22
column51_16:
  .db $89,$00,$21,$22

attrib_51:
  .dw a_column51_1,a_column51_2,a_column51_3,a_column51_4,a_column51_5,a_column51_6,a_column51_7,a_column51_8

a_column51_1:
  .db $00,$00,$00,$00,$00,$54,$45,$04
a_column51_2:
  .db $00,$00,$10,$11,$11,$01,$00,$08
a_column51_3:
  .db $00,$00,$00,$00,$00,$00,$22,$02
a_column51_4:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column51_5:
  .db $00,$00,$00,$00,$00,$55,$00,$00
a_column51_6:
  .db $00,$00,$20,$22,$62,$55,$00,$00
a_column51_7:
  .db $00,$00,$00,$00,$00,$00,$80,$08
a_column51_8:
  .db $00,$00,$00,$00,$00,$00,$80,$0A


;;;;;;;;;;;;;;;;;;    ;LEVEL 14 ENDS HERE;;
background_52:
  .dw column52_1,column52_2,column52_3,column52_4,column52_5,column52_6,column52_7,column52_8
  .dw column52_9,column52_10,column52_11,column52_12,column52_13,column52_14,column52_15,column52_16

column52_1:
  .db $88,$00,$35,$82,$3b
column52_2:
  .db $00,$84,$2c,$83,$34,$36,$82,$45
column52_3:
  .db $83,$00,$82,$2b,$83,$33,$36,$82,$45
column52_4:
  .db $87,$00,$25,$37,$82,$3c
column52_5:
  .db $87,$00,$26,$2f,$3a,$3e
column52_6:
  .db $88,$00,$30,$82,$3a
column52_7:
  .db $82,$00,$82,$2b,$83,$33,$2d,$45,$36,$45
column52_8:
  .db $87,$00,$2f,$37,$82,$3c
column52_9:
  .db $87,$00,$2f,$38,$3a,$48
column52_10:
  .db $87,$00,$30,$38,$3a,$4a
column52_11:
  .db $82,$00,$83,$2a,$83,$32,$2f,$82,$3a
column52_12:
  .db $88,$00,$30,$82,$3a
column52_13:
  .db $88,$00,$83,$25
column52_14:
  .db $83,$00,$28,$82,$15,$1d,$84,$25
column52_15:
  .db $86,$00,$1e,$84,$26
column52_16:
  .db $89,$00,$82,$26

attrib_52:
  .dw a_column52_1,a_column52_2,a_column52_3,a_column52_4,a_column52_5,a_column52_6,a_column52_7,a_column52_8

a_column52_1:
  .db $00,$00,$55,$55,$55,$55,$55,$05
a_column52_2:
  .db $00,$00,$00,$10,$11,$51,$55,$05
a_column52_3:
  .db $00,$00,$00,$00,$00,$10,$55,$05
a_column52_4:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column52_5:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column52_6:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column52_7:
  .db $00,$00,$00,$40,$55,$55,$44,$54
a_column52_8:
  .db $00,$00,$00,$00,$55,$55,$15,$51


;;;;;;;;;;;;;;;;;;    ;LEVEL 12 BEGINS HERE;;
background_53:
  .dw column53_1,column53_2,column53_3,column53_4,column53_5,column53_6,column53_7,column53_8
  .dw column53_9,column53_10,column53_11,column53_12,column53_13,column53_14,column53_15,column53_16

column53_1:
  .db $87,$00,$07,$0f,$35,$3b
column53_2:
  .db $87,$00,$08,$10,$48,$3a
column53_3:
  .db $87,$00,$07,$0f,$49,$3a
column53_4:
  .db $83,$00,$01,$09,$11,$85,$19
column53_5:
  .db $83,$00,$02,$0a,$12,$85,$1a
column53_6:
  .db $87,$00,$07,$0f,$48,$4a
column53_7:
  .db $87,$00,$08,$10,$47,$3a
column53_8:
  .db $87,$00,$07,$0f,$48,$3a
column53_9:
  .db $87,$00,$08,$10,$48,$3a
column53_10:
  .db $87,$00,$07,$0f,$4a,$4b
column53_11:
  .db $82,$00,$01,$0b,$13,$86,$1b
column53_12:
  .db $82,$00,$02,$0c,$14,$86,$1c
column53_13:
  .db $87,$00,$08,$10,$48,$3a
column53_14:
  .db $87,$00,$07,$0f,$47,$3a
column53_15:
  .db $87,$00,$08,$10,$48,$3a
column53_16:
  .db $87,$00,$07,$0f,$48,$3a

attrib_53:
  .dw a_column53_1,a_column53_2,a_column53_3,a_column53_4,a_column53_5,a_column53_6,a_column53_7,a_column53_8

a_column53_1:
  .db $FF,$FF,$00,$00,$00,$00,$50,$05
a_column53_2:
  .db $FF,$FF,$00,$80,$48,$44,$54,$05
a_column53_3:
  .db $FF,$FF,$00,$20,$12,$11,$51,$05
a_column53_4:
  .db $FF,$FF,$00,$00,$00,$00,$50,$05
a_column53_5:
  .db $FF,$FF,$00,$00,$00,$00,$50,$05
a_column53_6:
  .db $FF,$FF,$00,$AA,$00,$00,$00,$00
a_column53_7:
  .db $FF,$FF,$00,$00,$00,$00,$50,$05
a_column53_8:
  .db $FF,$FF,$00,$00,$00,$00,$50,$05


;;;;;;;;;;;;;;;;;;
background_54:
  .dw column54_1,column54_2,column54_3,column54_4,column54_5,column54_6,column54_7,column54_8
  .dw column54_9,column54_10,column54_11,column54_12,column54_13,column54_14,column54_15,column54_16

column54_1:
  .db $87,$00,$08,$10,$48,$3a
column54_2:
  .db $83,$00,$01,$09,$11,$85,$19
column54_3:
  .db $83,$00,$02,$0a,$12,$85,$1a
column54_4:
  .db $85,$00,$01,$09,$11,$83,$19
column54_5:
  .db $85,$00,$02,$0a,$12,$83,$1a
column54_6:
  .db $86,$00,$03,$82,$0b,$13,$1b
column54_7:
  .db $86,$00,$04,$82,$0c,$14,$1c
column54_8:
  .db $89,$00,$35,$3b
column54_9:
  .db $88,$00,$2d,$36,$45
column54_10:
  .db $85,$00,$2a,$82,$32,$2e,$37,$3c
column54_11:
  .db $82,$00,$84,$2a,$82,$32,$82,$2f,$3a
column54_12:
  .db $85,$00,$2a,$82,$32,$30,$2f,$3a
column54_13:
  .db $89,$00,$30,$3a
column54_14:
  .db $85,$00,$05,$0d,$15,$1d,$82,$25
column54_15:
  .db $85,$00,$06,$0e,$16,$1e,$82,$26
column54_16:
  .db $87,$00,$08,$0f,$17,$22

attrib_54:
  .dw a_column54_1,a_column54_2,a_column54_3,a_column54_4,a_column54_5,a_column54_6,a_column54_7,a_column54_8

a_column54_1:
  .db $FF,$FF,$00,$40,$44,$44,$54,$05
a_column54_2:
  .db $FF,$FF,$00,$10,$91,$19,$11,$01
a_column54_3:
  .db $FF,$FF,$00,$00,$20,$02,$40,$04
a_column54_4:
  .db $FF,$FF,$00,$00,$00,$00,$90,$09
a_column54_5:
  .db $FF,$FF,$00,$00,$00,$00,$AA,$0A
a_column54_6:
  .db $FF,$FF,$00,$00,$00,$00,$AA,$0A
a_column54_7:
  .db $FF,$FF,$00,$00,$40,$44,$64,$06
a_column54_8:
  .db $FF,$FF,$00,$00,$10,$11,$D1,$0D


;;;;;;;;;;;;;;;;;;
background_55:
  .dw column55_1,column55_2,column55_3,column55_4,column55_5,column55_6,column55_7,column55_8
  .dw column55_9,column55_10,column55_11,column55_12,column55_13,column55_14,column55_15,column55_16

column55_1:
  .db $87,$00,$07,$10,$00,$22
column55_2:
  .db $86,$00,$05,$0d,$15,$1d,$25
column55_3:
  .db $86,$00,$06,$0e,$16,$1e,$26
column55_4:
  .db $87,$00,$08,$10,$48,$4a
column55_5:
  .db $00,$03,$0b,$82,$13,$84,$1b,$48,$3a
column55_6:
  .db $00,$04,$0c,$82,$14,$84,$1c,$49,$3a
column55_7:
  .db $87,$00,$07,$0f,$82,$39
column55_8:
  .db $85,$00,$29,$31,$84,$39
column55_9:
  .db $87,$00,$08,$0f,$82,$39
column55_10:
  .db $85,$00,$01,$09,$11,$19,$47,$3a
column55_11:
  .db $85,$00,$02,$0a,$12,$1a,$48,$4a
column55_12:
  .db $83,$00,$01,$82,$09,$11,$82,$19,$48,$3a
column55_13:
  .db $83,$00,$02,$82,$0a,$12,$82,$1a,$48,$3e
column55_14:
  .db $84,$00,$01,$09,$11,$82,$19,$47,$3a
column55_15:
  .db $84,$00,$02,$0a,$12,$82,$1a,$48,$4b
column55_16:
  .db $87,$00,$07,$0f,$48,$3a

attrib_55:
  .dw a_column55_1,a_column55_2,a_column55_3,a_column55_4,a_column55_5,a_column55_6,a_column55_7,a_column55_8

a_column55_1:
  .db $00,$00,$00,$00,$00,$C0,$CC,$0F
a_column55_2:
  .db $00,$00,$00,$00,$00,$30,$B3,$0B
a_column55_3:
  .db $00,$00,$00,$A0,$AA,$AA,$AA,$0A
a_column55_4:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column55_5:
  .db $00,$00,$00,$00,$40,$44,$84,$08
a_column55_6:
  .db $00,$00,$00,$C0,$5C,$55,$A5,$0A
a_column55_7:
  .db $00,$00,$00,$30,$57,$55,$A5,$0A
a_column55_8:
  .db $00,$00,$00,$00,$11,$11,$A1,$0A


;;;;;;;;;;;;;;;;;;
background_56:
  .dw column56_1,column56_2,column56_3,column56_4,column56_5,column56_6,column56_7,column56_8
  .dw column56_9,column56_10,column56_11,column56_12,column56_13,column56_14,column56_15,column56_16

column56_1:
  .db $87,$00,$08,$10,$48,$3e
column56_2:
  .db $88,$00,$35,$82,$3b
column56_3:
  .db $87,$00,$4c,$83,$40
column56_4:
  .db $83,$00,$82,$2c,$82,$34,$2d,$36,$82,$45
column56_5:
  .db $87,$00,$4d,$83,$40
column56_6:
  .db $87,$00,$2e,$37,$82,$3c
column56_7:
  .db $87,$00,$30,$2f,$4a,$3a
column56_8:
  .db $88,$00,$30,$3a,$4a
column56_9:
  .db $89,$00,$35,$3b
column56_10:
  .db $88,$00,$23,$48,$3a
column56_11:
  .db $85,$00,$05,$0d,$15,$23,$48,$3a
column56_12:
  .db $85,$00,$06,$0e,$16,$23,$48,$3a
column56_13:
  .db $00,$05,$82,$0d,$15,$0d,$15,$1d,$23,$48,$3a
column56_14:
  .db $00,$06,$82,$0e,$16,$0e,$16,$1e,$23,$48,$3a
column56_15:
  .db $88,$00,$23,$48,$3a
column56_16:
  .db $88,$00,$23,$48,$3a

attrib_56:
  .dw a_column56_1,a_column56_2,a_column56_3,a_column56_4,a_column56_5,a_column56_6,a_column56_7,a_column56_8

a_column56_1:
  .db $00,$00,$00,$00,$00,$00,$20,$02
a_column56_2:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column56_3:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column56_4:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column56_5:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column56_6:
  .db $00,$00,$00,$00,$00,$55,$00,$00
a_column56_7:
  .db $00,$00,$00,$A5,$5A,$55,$00,$00
a_column56_8:
  .db $00,$00,$00,$00,$00,$00,$00,$00


;;;;;;;;;;;;;;;;;;    ;LEVEL 12 ENDS HERE;;
background_57:
  .dw column57_1,column57_2,column57_3,column57_4,column57_5,column57_6,column57_7,column57_8
  .dw column57_9,column57_10,column57_11,column57_12,column57_13,column57_14,column57_15,column57_16

column57_1:
  .db $87,$00,$17,$18,$82,$22
column57_2:
  .db $89,$00,$82,$22
column57_3:
  .db $88,$00,$21,$82,$22
column57_4:
  .db $89,$00,$82,$22
column57_5:
  .db $88,$00,$20,$82,$22
column57_6:
  .db $89,$00,$82,$22
column57_7:
  .db $83,$00,$01,$09,$11,$85,$19
column57_8:
  .db $83,$00,$02,$0a,$12,$83,$1a,$82,$4e
column57_9:
  .db $84,$00,$03,$0b,$83,$13,$3a,$3d
column57_10:
  .db $84,$00,$04,$0c,$83,$1c,$82,$3a
column57_11:
  .db $00,$03,$83,$0b,$84,$13,$82,$3a
column57_12:
  .db $00,$04,$83,$0c,$14,$83,$1c,$82,$3a
column57_13:
  .db $84,$00,$03,$0b,$83,$13,$82,$3a
column57_14:
  .db $84,$00,$04,$0c,$83,$14,$82,$3a
column57_15:
  .db $84,$00,$01,$09,$11,$82,$19,$82,$3a
column57_16:
  .db $84,$00,$02,$0a,$12,$84,$1a

attrib_57:
  .dw a_column57_1,a_column57_2,a_column57_3,a_column57_4,a_column57_5,a_column57_6,a_column57_7,a_column57_8

a_column57_1:
  .db $00,$00,$00,$00,$00,$30,$F3,$0F
a_column57_2:
  .db $00,$00,$00,$00,$00,$00,$F3,$0F
a_column57_3:
  .db $00,$00,$00,$00,$00,$00,$F3,$0F
a_column57_4:
  .db $00,$00,$00,$F0,$5F,$55,$15,$01
a_column57_5:
  .db $00,$00,$00,$00,$55,$00,$00,$00
a_column57_6:
  .db $00,$00,$F0,$5F,$0F,$00,$00,$00
a_column57_7:
  .db $00,$00,$00,$00,$55,$00,$00,$00
a_column57_8:
  .db $00,$00,$00,$00,$FF,$55,$45,$04


;;;;;;;;;;;;;;;;;;    ;LEVEL 13 BEGINS HERE;;
background_58:
  .dw column58_1,column58_2,column58_3,column58_4,column58_5,column58_6,column58_7,column58_8
  .dw column58_9,column58_10,column58_11,column58_12,column58_13,column58_14,column58_15,column58_16

column58_1:
  .db $87,$00,$07,$0f,$17,$18
column58_2:
  .db $87,$00,$08,$10,$82,$00
column58_3:
  .db $87,$00,$07,$0f,$17,$18
column58_4:
  .db $85,$00,$05,$0d,$15,$1d,$82,$25
column58_5:
  .db $85,$00,$06,$0e,$16,$1e,$82,$26
column58_6:
  .db $00,$05,$0d,$15,$1d,$86,$25
column58_7:
  .db $00,$06,$0e,$16,$1e,$86,$26
column58_8:
  .db $87,$00,$07,$0f,$35,$3b
column58_9:
  .db $87,$00,$08,$10,$48,$3a
column58_10:
  .db $87,$00,$07,$0f,$48,$4b
column58_11:
  .db $87,$00,$07,$23,$82,$24
column58_12:
  .db $87,$00,$08,$23,$82,$24
column58_13:
  .db $87,$00,$08,$23,$82,$24
column58_14:
  .db $87,$00,$07,$23,$82,$24
column58_15:
  .db $87,$00,$08,$10,$48,$4a
column58_16:
  .db $87,$00,$07,$0f,$48,$3a

attrib_58:
  .dw a_column58_1,a_column58_2,a_column58_3,a_column58_4,a_column58_5,a_column58_6,a_column58_7,a_column58_8

a_column58_1:
  .db $FF,$FF,$00,$00,$00,$50,$05,$00
a_column58_2:
  .db $FF,$FF,$00,$00,$00,$98,$49,$04
a_column58_3:
  .db $FF,$FF,$00,$88,$48,$66,$56,$05
a_column58_4:
  .db $FF,$FF,$00,$22,$12,$51,$15,$01
a_column58_5:
  .db $FF,$FF,$00,$00,$00,$50,$05,$00
a_column58_6:
  .db $FF,$FF,$00,$00,$00,$50,$AA,$0A
a_column58_7:
  .db $FF,$FF,$00,$00,$00,$50,$AA,$0A
a_column58_8:
  .db $FF,$FF,$00,$00,$00,$50,$05,$00


;;;;;;;;;;;;;;;;;;
background_59:
  .dw column59_1,column59_2,column59_3,column59_4,column59_5,column59_6,column59_7,column59_8
  .dw column59_9,column59_10,column59_11,column59_12,column59_13,column59_14,column59_15,column59_16

column59_1:
  .byte $87,$00,$08,$10,$48,$3e
column59_2:
  .byte $86,$00,$05,$0d,$1d,$48,$3a
column59_3:
  .byte $86,$00,$06,$0e,$1e,$49,$3a
column59_4:
  .byte $00,$05,$0d,$83,$25,$0d,$15,$1d,$48,$3e
column59_5:
  .byte $00,$06,$0e,$83,$26,$0e,$16,$1e,$48,$4b
column59_6:
  .byte $87,$00,$07,$0f,$00,$22
column59_7:
  .byte $87,$00,$08,$10,$00,$22
column59_8:
  .byte $87,$00,$07,$0f,$1f,$22
column59_9:
  .byte $87,$00,$08,$10,$20,$22
column59_10:
  .byte $87,$00,$07,$0f,$1f,$22
column59_11:
  .byte $87,$00,$29,$31,$82,$39
column59_12:
  .byte $87,$00,$07,$0f,$20,$22
column59_13:
  .byte $87,$00,$08,$10,$20,$22
column59_14:
  .byte $87,$00,$07,$0f,$00,$22
column59_15:
  .byte $87,$00,$08,$10,$35,$3b
column59_16:
  .byte $87,$00,$07,$0f,$48,$3a

attrib_59:
  .dw a_column59_1,a_column59_2,a_column59_3,a_column59_4,a_column59_5,a_column59_6,a_column59_7,a_column59_8

a_column59_1:
  .db $FF,$FF,$00,$00,$00,$50,$05,$00
a_column59_2:
  .db $FF,$FF,$00,$C4,$C4,$54,$05,$00
a_column59_3:
  .db $FF,$FF,$00,$31,$31,$51,$05,$04
a_column59_4:
  .db $FF,$FF,$00,$00,$00,$50,$45,$05
a_column59_5:
  .db $FF,$FF,$00,$00,$00,$50,$55,$05
a_column59_6:
  .db $FF,$FF,$00,$00,$00,$43,$44,$04
a_column59_7:
  .db $FF,$FF,$00,$00,$00,$50,$55,$05
a_column59_8:
  .db $FF,$FF,$00,$00,$00,$50,$05,$00


;;;;;;;;;;;;;;;;;;
background_60:
  .dw column60_1,column60_2,column60_3,column60_4,column60_5,column60_6,column60_7,column60_8
  .dw column60_9,column60_10,column60_11,column60_12,column60_13,column60_14,column60_15,column60_16

column60_1:
  .byte $86,$00,$35,$82,$3b,$48,$3e
column60_2:
  .byte $85,$00,$41,$49,$3e,$4b,$48,$3a
column60_3:
  .byte $85,$00,$42,$49,$82,$24,$48,$3a
column60_4:
  .byte $85,$00,$41,$48,$82,$24,$48,$4a
column60_5:
  .byte $85,$00,$42,$48,$3a,$4b,$48,$3a
column60_6:
  .byte $87,$00,$08,$10,$49,$3a
column60_7:
  .byte $87,$00,$07,$0f,$35,$3b
column60_8:
  .byte $87,$00,$07,$2d,$36,$45
column60_9:
  .byte $86,$00,$2c,$34,$2f,$37,$3c
column60_10:
  .byte $86,$00,$2c,$82,$34,$2f,$3a
column60_11:
  .byte $87,$00,$07,$0f,$30,$4a
column60_12:
  .byte $87,$00,$35,$23,$82,$24
column60_13:
  .byte $87,$00,$47,$82,$3a,$3e
column60_14:
  .byte $87,$00,$35,$3a,$24,$3a
column60_15:
  .byte $87,$00,$48,$3a,$24,$4b
column60_16:
  .byte $88,$00,$48,$82,$3a

attrib_60:
  .dw a_column60_1,a_column60_2,a_column60_3,a_column60_4,a_column60_5,a_column60_6,a_column60_7,a_column60_8

a_column60_1:
  .db $00,$00,$00,$00,$C0,$A1,$01,$00
a_column60_2:
  .db $00,$00,$00,$00,$F0,$A0,$00,$00
a_column60_3:
  .db $00,$00,$00,$00,$30,$60,$04,$00
a_column60_4:
  .db $00,$00,$00,$00,$00,$50,$01,$00
a_column60_5:
  .db $00,$00,$00,$00,$00,$AA,$08,$00
a_column60_6:
  .db $00,$00,$00,$00,$00,$92,$89,$08
a_column60_7:
  .db $00,$00,$00,$00,$00,$80,$80,$00
a_column60_8:
  .db $00,$00,$00,$00,$00,$00,$20,$00


;;;;;;;;;;;;;;;;;;
background_61:
  .dw column61_1,column61_2,column61_3,column61_4,column61_5,column61_6,column61_7,column61_8
  .dw column61_9,column61_10,column61_11,column61_12,column61_13,column61_14,column61_15,column61_16

column61_1:
  .byte $87,$00,$07,$0f,$48,$3a
column61_2:
  .byte $87,$00,$08,$23,$82,$24
column61_3:
  .byte $87,$00,$08,$0f,$23,$24
column61_4:
  .byte $87,$00,$4c,$40,$23,$24
column61_5:
  .byte $87,$00,$4d,$40,$23,$24
column61_6:
  .byte $87,$00,$2e,$37,$23,$24
column61_7:
  .byte $87,$00,$82,$2f,$23,$24
column61_8:
  .byte $87,$00,$30,$2f,$23,$24
column61_9:
  .byte $87,$00,$07,$30,$23,$24
column61_10:
  .byte $87,$00,$08,$10,$23,$24
column61_11:
  .byte $87,$00,$07,$23,$82,$24
column61_12:
  .byte $00,$05,$82,$0d,$15,$25,$0d,$15,$23,$82,$24
column61_13:
  .byte $00,$06,$82,$0e,$16,$26,$0e,$16,$23,$82,$24
column61_14:
  .byte $86,$00,$0d,$15,$23,$82,$24
column61_15:
  .byte $85,$00,$21,$0e,$16,$23,$82,$24
column61_16:
  .byte $87,$00,$07,$0f,$82,$24

attrib_61:
  .dw a_column61_1,a_column61_2,a_column61_3,a_column61_4,a_column61_5,a_column61_6,a_column61_7,a_column61_8

a_column61_1:
  .db $00,$00,$00,$00,$00,$50,$89,$08
a_column61_2:
  .db $00,$00,$00,$00,$00,$90,$A9,$0A
a_column61_3:
  .db $00,$00,$00,$00,$00,$A0,$AA,$0A
a_column61_4:
  .db $00,$00,$00,$00,$00,$A0,$AA,$0A
a_column61_5:
  .db $00,$00,$00,$00,$00,$50,$A6,$0A
a_column61_6:
  .db $00,$00,$00,$00,$C0,$10,$AA,$0A
a_column61_7:
  .db $00,$00,$00,$00,$30,$00,$AA,$0A
a_column61_8:
  .db $00,$00,$00,$00,$10,$40,$A6,$0A


;;;;;;;;;;;;;;;;;;    ;LEVEL 13 ENDS HERE;;
background_62:
  .dw column62_1,column62_2,column62_3,column62_4,column62_5,column62_6,column62_7,column62_8
  .dw column62_9,column62_10,column62_11,column62_12,column62_13,column62_14,column62_15,column62_16

column62_1:
  .db $88,$00,$35,$23,$24
column62_2:
  .db $86,$00,$29,$31,$48,$82,$3a
column62_3:
  .db $87,$00,$08,$10,$00,$22
column62_4:
  .db $87,$00,$07,$0f,$20,$22
column62_5:
  .db $87,$00,$08,$10,$00,$22
column62_6:
  .db $87,$00,$07,$0f,$00,$22
column62_7:
  .db $87,$00,$08,$10,$00,$22
column62_8:
  .db $87,$00,$07,$0f,$17,$18
column62_9:
  .db $87,$00,$08,$10,$00,$22
column62_10:
  .db $86,$00,$35,$83,$3b,$22
column62_11:
  .db $00,$05,$4c,$83,$40,$48,$3a,$82,$24,$3a
column62_12:
  .db $00,$06,$48,$3a,$24,$82,$3a,$24,$83,$3a
column62_13:
  .db $86,$00,$05,$0d,$15,$1d,$25
column62_14:
  .db $86,$00,$06,$0e,$16,$1e,$26
column62_15:
  .db $87,$00,$07,$0f,$82,$00
column62_16:
  .db $87,$00,$08,$10,$17,$18

attrib_62:
  .dw a_column62_1,a_column62_2,a_column62_3,a_column62_4,a_column62_5,a_column62_6,a_column62_7,a_column62_8

a_column62_1:
  .db $00,$00,$00,$00,$00,$88,$AA,$0A
a_column62_2:
  .db $00,$00,$00,$00,$00,$50,$45,$00
a_column62_3:
  .db $00,$00,$00,$00,$00,$50,$05,$00
a_column62_4:
  .db $00,$00,$00,$00,$00,$50,$85,$08
a_column62_5:
  .db $00,$00,$00,$00,$00,$54,$45,$00
a_column62_6:
  .db $00,$00,$00,$99,$99,$AA,$AA,$0A
a_column62_7:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column62_8:
  .db $00,$00,$00,$00,$00,$50,$85,$08


;;;;;;;;;;;;;;;;;;    ;LEVEL 15 BEGINS HERE;;
background_63:
  .dw column63_1,column63_2,column63_3,column63_4,column63_5,column63_6,column63_7,column63_8
  .dw column63_9,column63_10,column63_11,column63_12,column63_13,column63_14,column63_15,column63_16

column63_1:
  .db $85,$00,$53,$85,$55
column63_2:
  .db $83,$00,$53,$87,$55
column63_3:
  .db $83,$00,$54,$87,$56
column63_4:
  .db $87,$00,$48,$82,$3a,$3e
column63_5:
  .db $87,$00,$48,$3a,$3d,$3a
column63_6:
  .db $88,$00,$17,$18,$22
column63_7:
  .db $86,$00,$41,$43,$83,$45
column63_8:
  .db $84,$00,$29,$31,$48,$4f,$5b,$3a,$4a
column63_9:
  .db $86,$00,$49,$5a,$52,$4b,$3a
column63_10:
  .db $86,$00,$42,$44,$83,$46
column63_11:
  .db $87,$00,$53,$83,$55
column63_12:
  .db $87,$00,$54,$83,$56
column63_13:
  .db $00,$01,$82,$09,$11,$19,$11,$84,$19
column63_14:
  .db $00,$02,$82,$0a,$12,$1a,$12,$83,$1a,$60
column63_15:
  .db $89,$00,$17,$22
column63_16:
  .db $89,$00,$17,$22

attrib_63:
  .dw a_column63_1,a_column63_2,a_column63_3,a_column63_4,a_column63_5,a_column63_6,a_column63_7,a_column63_8

a_column63_1:
  .db $FF,$FF,$00,$40,$55,$55,$55,$05
a_column63_2:
  .db $FF,$FF,$00,$10,$11,$11,$11,$01
a_column63_3:
  .db $FF,$FF,$00,$00,$00,$00,$44,$04
a_column63_4:
  .db $FF,$FF,$00,$00,$00,$F3,$3F,$03
a_column63_5:
  .db $FF,$FF,$00,$00,$00,$B8,$8B,$08
a_column63_6:
  .db $FF,$FF,$00,$00,$00,$50,$55,$05
a_column63_7:
  .db $FF,$FF,$50,$55,$AA,$AA,$AA,$0A
a_column63_8:
  .db $FF,$FF,$00,$00,$00,$00,$A0,$0A


;;;;;;;;;;;;;;;;;;
background_64:
  .dw column64_1,column64_2,column64_3,column64_4,column64_5,column64_6,column64_7,column64_8
  .dw column64_9,column64_10,column64_11,column64_12,column64_13,column64_14,column64_15,column64_16

column64_1:
  .db $89,$00,$17,$22
column64_2:
  .db $85,$00,$53,$85,$55
column64_3:
  .db $83,$00,$53,$87,$55
column64_4:
  .db $83,$00,$54,$87,$56
column64_5:
  .db $87,$00,$54,$83,$56
column64_6:
  .db $87,$00,$35,$83,$3b
column64_7:
  .db $83,$00,$5d,$2a,$82,$32,$36,$83,$45
column64_8:
  .db $87,$00,$37,$83,$3c
column64_9:
  .db $87,$00,$38,$59,$51,$4a
column64_10:
  .db $00,$82,$5e,$82,$2b,$33,$34,$2f,$50,$5c,$3a
column64_11:
  .db $87,$00,$30,$83,$3a
column64_12:
  .db $85,$00,$41,$43,$84,$45
column64_13:
  .db $85,$00,$42,$44,$84,$46
column64_14:
  .db $83,$00,$41,$43,$86,$45
column64_15:
  .db $83,$00,$42,$44,$86,$46
column64_16:
  .db $89,$00,$49,$4a

attrib_64:
  .dw a_column64_1,a_column64_2,a_column64_3,a_column64_4,a_column64_5,a_column64_6,a_column64_7,a_column64_8

a_column64_1:
  .db $FF,$FF,$00,$00,$40,$44,$54,$05
a_column64_2:
  .db $FF,$FF,$00,$50,$55,$55,$55,$05
a_column64_3:
  .db $FF,$FF,$00,$00,$00,$10,$11,$01
a_column64_4:
  .db $FF,$FF,$00,$00,$03,$00,$00,$00
a_column64_5:
  .db $FF,$FF,$00,$C0,$00,$00,$FF,$00
a_column64_6:
  .db $FF,$FF,$00,$00,$80,$88,$88,$08
a_column64_7:
  .db $FF,$FF,$00,$80,$A8,$AA,$AA,$0A
a_column64_8:
  .db $FF,$FF,$00,$20,$22,$22,$22,$02


;;;;;;;;;;;;;;;;;;
background_65:
  .dw column65_1,column65_2,column65_3,column65_4,column65_5,column65_6,column65_7,column65_8
  .dw column65_9,column65_10,column65_11,column65_12,column65_13,column65_14,column65_15,column65_16

column65_1:
  .db $89,$00,$48,$3a
column65_2:
  .db $83,$00,$03,$82,$0b,$13,$82,$1b,$48,$4b
column65_3:
  .db $83,$00,$04,$82,$0c,$14,$65,$63,$47,$3a
column65_4:
  .db $82,$00,$01,$09,$11,$84,$19,$48,$3d
column65_5:
  .db $82,$00,$02,$0a,$12,$82,$1a,$64,$62,$48,$3a
column65_6:
  .db $87,$00,$48,$4a,$57,$51
column65_7:
  .db $87,$00,$48,$4b,$58,$52
column65_8:
  .db $82,$00,$29,$31,$85,$39,$48,$4a
column65_9:
  .db $84,$00,$41,$43,$83,$45,$49,$3a
column65_10:
  .db $83,$00,$41,$43,$84,$45,$48,$4b
column65_11:
  .db $83,$00,$49,$85,$3a,$47,$4a
column65_12:
  .db $85,$00,$4f,$51,$48,$3e,$48,$3a
column65_13:
  .db $83,$00,$35,$3b,$50,$52,$48,$3a,$48,$4a
column65_14:
  .db $83,$00,$84,$48,$3a,$82,$48,$3a
column65_15:
  .db $83,$00,$42,$44,$84,$46,$49,$3e
column65_16:
  .db $89,$00,$48,$3a

attrib_65:
  .dw a_column65_1,a_column65_2,a_column65_3,a_column65_4,a_column65_5,a_column65_6,a_column65_7,a_column65_8

a_column65_1:
  .db $00,$00,$00,$40,$44,$00,$00,$00
a_column65_2:
  .db $00,$00,$00,$98,$99,$88,$08,$00
a_column65_3:
  .db $00,$00,$00,$22,$22,$A2,$CA,$0C
a_column65_4:
  .db $00,$00,$00,$00,$00,$20,$32,$03
a_column65_5:
  .db $00,$00,$00,$80,$AA,$AA,$0A,$00
a_column65_6:
  .db $00,$00,$00,$00,$C0,$0C,$00,$00
a_column65_7:
  .db $00,$00,$00,$20,$32,$03,$00,$00
a_column65_8:
  .db $00,$00,$00,$20,$22,$22,$02,$00


;;;;;;;;;;;;;;;;;;
background_66:
  .dw column66_1,column66_2,column66_3,column66_4,column66_5,column66_6,column66_7,column66_8
  .dw column66_9,column66_10,column66_11,column66_12,column66_13,column66_14,column66_15,column66_16

column66_1:
  .db $89,$00,$48,$4b
column66_2:
  .db $84,$00,$53,$86,$55
column66_3:
  .db $84,$00,$54,$86,$56
column66_4:
  .db $83,$00,$35,$4c,$86,$40
column66_5:
  .db $83,$00,$57,$5b,$3a,$4a,$59,$5b,$82,$3a
column66_6:
  .db $83,$00,$58,$5c,$82,$3a,$5a,$5c,$4b,$3a
column66_7:
  .db $85,$00,$03,$0b,$82,$13,$82,$1b
column66_8:
  .db $85,$00,$04,$0c,$82,$14,$82,$1c
column66_9:
  .db $85,$00,$03,$0b,$82,$13,$82,$1b
column66_10:
  .db $85,$00,$04,$0c,$82,$14,$82,$1c
column66_11:
  .db $00,$53,$89,$55
column66_12:
  .db $00,$54,$89,$56
column66_13:
  .db $84,$00,$53,$86,$55
column66_14:
  .db $82,$00,$35,$3b,$54,$86,$56
column66_15:
  .db $82,$00,$54,$88,$56
column66_16:
  .db $88,$00,$17,$18,$22

attrib_66:
  .dw a_column66_1,a_column66_2,a_column66_3,a_column66_4,a_column66_5,a_column66_6,a_column66_7,a_column66_8

a_column66_1:
  .db $00,$00,$00,$00,$44,$44,$44,$04
a_column66_2:
  .db $00,$00,$00,$40,$55,$55,$55,$05
a_column66_3:
  .db $00,$00,$00,$F0,$0F,$F0,$0F,$00
a_column66_4:
  .db $00,$00,$00,$00,$50,$55,$55,$05
a_column66_5:
  .db $00,$00,$00,$00,$50,$55,$55,$05
a_column66_6:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column66_7:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column66_8:
  .db $00,$00,$00,$00,$00,$00,$00,$00


;;;;;;;;;;;;;;;;;;
background_67:
  .dw column67_1,column67_2,column67_3,column67_4,column67_5,column67_6,column67_7,column67_8
  .dw column67_9,column67_10,column67_11,column67_12,column67_13,column67_14,column67_15,column67_16

column67_1:
  .db $88,$00,$17,$18,$22
column67_2:
  .db $83,$00,$41,$43,$86,$45
column67_3:
  .db $83,$00,$42,$44,$86,$46
column67_4:
  .db $85,$00,$41,$43,$84,$45
column67_5:
  .db $85,$00,$42,$44,$84,$46
column67_6:
  .db $82,$00,$41,$43,$87,$45
column67_7:
  .db $82,$00,$42,$44,$87,$46
column67_8:
  .db $86,$00,$35,$4c,$83,$40
column67_9:
  .db $86,$00,$36,$84,$45
column67_10:
  .db $82,$00,$5d,$2a,$82,$34,$37,$4d,$83,$40
column67_11:
  .db $86,$00,$82,$2f,$3a,$3e,$3a
column67_12:
  .db $86,$00,$30,$2f,$3e,$4a,$3a
column67_13:
  .db $84,$00,$82,$33,$2d,$2f,$3a,$3d,$3a
column67_14:
  .db $82,$00,$5d,$2a,$82,$32,$30,$2f,$83,$3a
column67_15:
  .db $87,$00,$30,$4f,$51,$3a
column67_16:
  .db $88,$00,$17,$18,$22

attrib_67:
  .dw a_column67_1,a_column67_2,a_column67_3,a_column67_4,a_column67_5,a_column67_6,a_column67_7,a_column67_8

a_column67_1:
  .db $00,$00,$00,$80,$88,$88,$88,$08
a_column67_2:
  .db $00,$00,$00,$20,$A2,$AA,$AA,$0A
a_column67_3:
  .db $00,$00,$00,$44,$64,$66,$66,$06
a_column67_4:
  .db $00,$00,$00,$22,$22,$66,$66,$06
a_column67_5:
  .db $00,$00,$00,$44,$44,$55,$55,$05
a_column67_6:
  .db $00,$00,$00,$00,$00,$55,$55,$05
a_column67_7:
  .db $00,$00,$00,$44,$55,$55,$55,$05
a_column67_8:
  .db $00,$00,$00,$00,$00,$10,$33,$01


;;;;;;;;;;;;;;;;;;    ;LEVEL 15 ENDS HERE;;
background_68:
  .dw column68_1,column68_2,column68_3,column68_4,column68_5,column68_6,column68_7,column68_8
  .dw column68_9,column68_10,column68_11,column68_12,column68_13,column68_14,column68_15,column68_16

column68_1:
  .db $88,$00,$17,$18,$22
column68_2:
  .db $84,$00,$35,$3b,$4c,$84,$40
column68_3:
  .db $82,$00,$35,$3b,$54,$86,$56
column68_4:
  .db $82,$00,$54,$88,$56
column68_5:
  .db $86,$00,$53,$84,$55
column68_6:
  .db $84,$00,$29,$31,$85,$39
column68_7:
  .db $89,$00,$1f,$22
column68_8:
  .db $88,$00,$17,$18,$22
column68_9:
  .db $82,$00,$41,$43,$87,$45
column68_10:
  .db $00,$41,$43,$88,$45
column68_11:
  .db $00,$57,$51,$3e,$3a,$3d,$49,$82,$3a,$4b,$3a
column68_12:
  .db $00,$58,$52,$3a,$4b,$83,$3a,$3e,$4a,$3a
column68_13:
  .db $00,$42,$44,$88,$46
column68_14:
  .db $82,$00,$42,$44,$87,$46
column68_15:
  .db $84,$00,$01,$09,$11,$82,$19,$11,$19
column68_16:
  .db $84,$00,$02,$0a,$12,$82,$1a,$12,$1a

attrib_68:
  .dw a_column68_1,a_column68_2,a_column68_3,a_column68_4,a_column68_5,a_column68_6,a_column68_7,a_column68_8

a_column68_1:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column68_2:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column68_3:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column68_4:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column68_5:
  .db $00,$00,$C0,$FF,$FF,$FF,$FF,$0F
a_column68_6:
  .db $00,$00,$F0,$0F,$00,$00,$00,$00
a_column68_7:
  .db $00,$00,$20,$AA,$AA,$AA,$AA,$0A
a_column68_8:
  .db $00,$00,$00,$00,$FF,$AA,$AA,$0A


;;;;;;;;;;;;;;;;;;    ;LEVEL 16 BEGINS HERE;;
background_69:
  .dw column69_1,column69_2,column69_3,column69_4,column69_5,column69_6,column69_7,column69_8
  .dw column69_9,column69_10,column69_11,column69_12,column69_13,column69_14,column69_15,column69_16

column69_1:
  .byte $00,$03,$0b,$83,$13,$85,$1b
column69_2:
  .byte $00,$04,$0c,$83,$14,$83,$1c,$82,$61
column69_3:
  .byte $87,$00,$48,$4a,$82,$3a
column69_4:
  .byte $87,$00,$49,$3a,$4b,$3a
column69_5:
  .byte $00,$41,$43,$88,$45
column69_6:
  .byte $00,$47,$83,$48,$59,$51,$84,$48
column69_7:
  .byte $00,$84,$48,$50,$5c,$84,$48
column69_8:
  .byte $00,$42,$44,$88,$46
column69_9:
  .byte $88,$00,$17,$82,$22
column69_10:
  .byte $88,$00,$17,$82,$22
column69_11:
  .byte $00,$00,$41,$43,$87,$45
column69_12:
  .byte $00,$00,$42,$44,$87,$46
column69_13:
  .byte $00,$41,$43,$88,$45
column69_14:
  .byte $00,$42,$44,$88,$46
column69_15:
  .byte $83,$00,$2a,$87,$34
column69_16:
  .byte $89,$00,$82,$22

attrib_69:
  .dw a_column69_1,a_column69_2,a_column69_3,a_column69_4,a_column69_5,a_column69_6,a_column69_7,a_column69_8

a_column69_1:
  .db $FF,$FF,$A0,$AA,$AA,$AA,$AA,$0A
a_column69_2:
  .db $FF,$FF,$00,$00,$00,$00,$55,$00
a_column69_3:
  .db $FF,$FF,$A0,$AA,$EA,$AE,$AA,$0A
a_column69_4:
  .db $FF,$FF,$20,$22,$32,$23,$22,$02
a_column69_5:
  .db $FF,$FF,$00,$00,$00,$00,$AA,$0A
a_column69_6:
  .db $FF,$FF,$00,$88,$88,$88,$88,$08
a_column69_7:
  .db $FF,$FF,$80,$88,$88,$88,$88,$08
a_column69_8:
  .db $FF,$FF,$00,$20,$22,$22,$22,$02


;;;;;;;;;;;;;;;;;;
background_70:
  .dw column70_1,column70_2,column70_3,column70_4,column70_5,column70_6,column70_7,column70_8
  .dw column70_9,column70_10,column70_11,column70_12,column70_13,column70_14,column70_15,column70_16

column70_1:
  .byte $89,$00,$82,$22
column70_2:
  .byte $00,$35,$53,$88,$55
column70_3:
  .byte $00,$54,$89,$56
column70_4:
  .byte $88,$00,$2d,$82,$45
column70_5:
  .byte $88,$00,$30,$3d,$3a
column70_6:
  .byte $87,$00,$35,$3b,$82,$40
column70_7:
  .byte $00,$35,$82,$3b,$2d,$82,$45,$40,$36,$45,$40
column70_8:
  .byte $00,$36,$45,$40,$36,$45,$40,$36,$45,$82,$40
column70_9:
  .byte $00,$37,$82,$3c,$2d,$82,$45,$40,$36,$45,$40
column70_10:
  .byte $00,$30,$82,$3a,$2f,$5f,$34,$37,$83,$3c
column70_11:
  .byte $84,$00,$30,$82,$3a,$2f,$5f,$82,$34
column70_12:
  .byte $87,$00,$30,$83,$3a
column70_13:
  .byte $88,$00,$21,$82,$22
column70_14:
  .byte $00,$01,$09,$11,$82,$19,$11,$82,$19,$11,$19
column70_15:
  .byte $00,$02,$0a,$12,$82,$1a,$12,$82,$1a,$12,$60
column70_16:
  .byte $89,$00,$17,$22

attrib_70:
  .dw a_column70_1,a_column70_2,a_column70_3,a_column70_4,a_column70_5,a_column70_6,a_column70_7,a_column70_8

a_column70_1:
  .db $FF,$FF,$80,$88,$88,$88,$88,$08
a_column70_2:
  .db $FF,$FF,$20,$22,$22,$22,$22,$02
a_column70_3:
  .db $FF,$FF,$00,$00,$00,$80,$88,$08
a_column70_4:
  .db $FF,$FF,$A0,$AA,$AA,$AA,$AA,$0A
a_column70_5:
  .db $FF,$FF,$A0,$AA,$2A,$A2,$AA,$0A
a_column70_6:
  .db $FF,$FF,$00,$00,$22,$A2,$88,$08
a_column70_7:
  .db $FF,$FF,$80,$88,$88,$88,$88,$08
a_column70_8:
  .db $FF,$FF,$20,$22,$22,$22,$A2,$0A


;;;;;;;;;;;;;;;;;;
background_71:
  .dw column71_1,column71_2,column71_3,column71_4,column71_5,column71_6,column71_7,column71_8
  .dw column71_9,column71_10,column71_11,column71_12,column71_13,column71_14,column71_15,column71_16

column71_1:
  .byte $89,$00,$17,$22
column71_2:
  .byte $85,$00,$53,$85,$55
column71_3:
  .byte $00,$53,$83,$55,$54,$85,$56
column71_4:
  .byte $00,$54,$82,$56,$53,$86,$55
column71_5:
  .byte $84,$00,$54,$86,$56
column71_6:
  .byte $85,$00,$53,$85,$55
column71_7:
  .byte $00,$35,$83,$3b,$54,$56,$53,$83,$55
column71_8:
  .byte $00,$54,$85,$56,$54,$83,$56
column71_9:
  .byte $00,$53,$89,$55
column71_10:
  .byte $84,$00,$54,$56,$53,$84,$55
column71_11:
  .byte $00,$35,$84,$3b,$54,$84,$56
column71_12:
  .byte $00,$54,$85,$56,$53,$83,$55
column71_13:
  .byte $83,$00,$54,$83,$56,$54,$83,$56
column71_14:
  .byte $83,$00,$29,$31,$86,$39
column71_15:
  .byte $00,$29,$31,$88,$39
column71_16:
  .byte $88,$00,$57,$5b,$00

attrib_71:
  .dw a_column71_1,a_column71_2,a_column71_3,a_column71_4,a_column71_5,a_column71_6,a_column71_7,a_column71_8

a_column71_1:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column71_2:
  .db $00,$00,$A0,$AA,$02,$00,$00,$00
a_column71_3:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column71_4:
  .db $00,$00,$50,$55,$45,$04,$00,$00
a_column71_5:
  .db $00,$00,$10,$11,$55,$11,$11,$01
a_column71_6:
  .db $00,$00,$A0,$AA,$AA,$08,$00,$00
a_column71_7:
  .db $00,$00,$00,$A0,$AA,$8A,$88,$08
a_column71_8:
  .db $00,$00,$20,$22,$22,$22,$EE,$02


;;;;;;;;;;;;;;;;;;
background_72:
  .dw column72_1,column72_2,column72_3,column72_4,column72_5,column72_6,column72_7,column72_8
  .dw column72_9,column72_10,column72_11,column72_12,column72_13,column72_14,column72_15,column72_16

column72_1:
  .byte $88,$00,$58,$52,$00
column72_2:
  .byte $00,$29,$31,$88,$39
column72_3:
  .byte $83,$00,$29,$31,$86,$39
column72_4:
  .byte $83,$00,$03,$0b,$13,$1b,$83,$13,$1b
column72_5:
  .byte $83,$00,$04,$0c,$14,$1c,$14,$65,$82,$63
column72_6:
  .byte $00,$01,$09,$82,$19,$11,$19,$11,$83,$19
column72_7:
  .byte $00,$02,$0a,$82,$1a,$12,$1a,$12,$1a,$64,$62
column72_8:
  .byte $00,$01,$09,$83,$19,$11,$19,$11,$48,$4a
column72_9:
  .byte $00,$02,$0a,$1a,$82,$12,$64,$82,$62,$48,$3e
column72_10:
  .byte $82,$00,$03,$0b,$09,$0b,$83,$13,$47,$3a
column72_11:
  .byte $82,$00,$04,$0c,$0a,$0c,$83,$14,$48,$3a
column72_12:
  .byte $82,$00,$01,$09,$0b,$09,$83,$19,$48,$4b
column72_13:
  .byte $82,$00,$02,$0a,$0c,$0a,$82,$1a,$64,$48,$4a
column72_14:
  .byte $00,$03,$82,$0b,$13,$84,$1b,$48,$3a
column72_15:
  .byte $00,$04,$82,$0c,$14,$83,$1c,$61,$65,$63
column72_16:
  .byte $88,$00,$22,$48,$3a

attrib_72:
  .dw a_column72_1,a_column72_2,a_column72_3,a_column72_4,a_column72_5,a_column72_6,a_column72_7,a_column72_8

a_column72_1:
  .db $00,$00,$80,$88,$88,$88,$BB,$08
a_column72_2:
  .db $00,$00,$00,$60,$26,$22,$22,$02
a_column72_3:
  .db $00,$00,$00,$10,$01,$00,$00,$00
a_column72_4:
  .db $00,$00,$80,$88,$88,$88,$08,$00
a_column72_5:
  .db $00,$00,$20,$22,$2A,$22,$02,$00
a_column72_6:
  .db $00,$00,$00,$00,$0A,$44,$04,$00
a_column72_7:
  .db $00,$00,$80,$88,$8A,$99,$09,$00
a_column72_8:
  .db $00,$00,$20,$22,$22,$22,$AA,$0A


;;;;;;;;;;;;;;;;;;
background_73:
  .dw column73_1,column73_2,column73_3,column73_4,column73_5,column73_6,column73_7,column73_8
  .dw column73_9,column73_10,column73_11,column73_12,column73_13,column73_14,column73_15,column73_16

column73_1:
  .byte $86,$00,$35,$3b,$4c,$48,$3a
column73_2:
  .byte $82,$00,$35,$83,$3b,$36,$84,$45
column73_3:
  .byte $82,$00,$36,$83,$45,$37,$84,$3c
column73_4:
  .byte $00,$5f,$37,$83,$3c,$2f,$3e,$83,$3a
column73_5:
  .byte $82,$00,$2f,$3a,$4b,$3a,$2f,$3a,$2d,$82,$40
column73_6:
  .byte $82,$00,$30,$3a,$2d,$45,$82,$40,$2f,$37,$3c
column73_7:
  .byte $00,$5f,$82,$2c,$82,$34,$82,$40,$82,$2f,$4a
column73_8:
  .byte $84,$00,$30,$3a,$37,$3c,$82,$2f,$3a
column73_9:
  .byte $86,$00,$2f,$4b,$2f,$30,$3a
column73_10:
  .byte $00,$00,$5f,$2c,$84,$34,$2f,$82,$3a
column73_11:
  .byte $86,$00,$30,$3a,$30,$82,$3a
column73_12:
  .byte $86,$00,$53,$84,$55
column73_13:
  .byte $00,$35,$84,$3b,$54,$84,$56
column73_14:
  .byte $00,$54,$89,$56
column73_15:
  .byte $82,$00,$54,$88,$56
column73_16:
  .byte $88,$00,$21,$82,$22

attrib_73:
  .dw a_column73_1,a_column73_2,a_column73_3,a_column73_4,a_column73_5,a_column73_6,a_column73_7,a_column73_8

a_column73_1:
  .db $00,$00,$00,$88,$88,$00,$20,$02
a_column73_2:
  .db $00,$00,$80,$AA,$AA,$00,$00,$00
a_column73_3:
  .db $00,$00,$20,$AA,$AA,$88,$00,$00
a_column73_4:
  .db $00,$00,$00,$00,$88,$AA,$00,$00
a_column73_5:
  .db $00,$00,$00,$00,$00,$22,$00,$00
a_column73_6:
  .db $00,$00,$00,$00,$00,$22,$00,$00
a_column73_7:
  .db $00,$00,$A0,$AA,$AA,$88,$88,$08
a_column73_8:
  .db $00,$00,$00,$22,$22,$22,$22,$02


;;;;;;;;;;;;;;;;;;    ;LEVEL 16 ENDS HERE;;
background_74:
  .dw column74_1,column74_2,column74_3,column74_4,column74_5,column74_6,column74_7,column74_8
  .dw column74_9,column74_10,column74_11,column74_12,column74_13,column74_14,column74_15,column74_16

column74_1:
  .byte $88,$00,$17,$82,$22
column74_2:
  .byte $00,$41,$43,$88,$45
column74_3:
  .byte $00,$42,$44,$83,$46,$41,$43,$83,$45
column74_4:
  .byte $86,$00,$42,$44,$83,$46
column74_5:
  .byte $86,$00,$41,$43,$83,$45
column74_6:
  .byte $83,$00,$41,$43,$45,$42,$44,$83,$46
column74_7:
  .byte $82,$00,$41,$43,$87,$45
column74_8:
  .byte $82,$00,$48,$83,$3a,$48,$84,$3a
column74_9:
  .byte $00,$41,$43,$88,$45
column74_10:
  .byte $00,$42,$89,$46
column74_11:
  .byte $84,$00,$41,$48,$4f,$5b,$83,$3a
column74_12:
  .byte $84,$00,$42,$48,$5a,$52,$83,$3a
column74_13:
  .byte $00,$41,$43,$88,$45
column74_14:
  .byte $00,$42,$44,$88,$46
column74_15:
  .byte $82,$00,$42,$83,$3a,$41,$43,$83,$45
column74_16:
  .byte $83,$00,$41,$43,$45,$42,$44,$83,$46

attrib_74:
  .dw a_column74_1,a_column74_2,a_column74_3,a_column74_4,a_column74_5,a_column74_6,a_column74_7,a_column74_8

a_column74_1:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column74_2:
  .db $00,$00,$20,$22,$22,$11,$11,$01
a_column74_3:
  .db $00,$00,$00,$00,$00,$11,$11,$01
a_column74_4:
  .db $00,$00,$00,$22,$22,$22,$22,$02
a_column74_5:
  .db $00,$00,$20,$22,$22,$22,$22,$02
a_column74_6:
  .db $00,$00,$00,$00,$A4,$FF,$AA,$0A
a_column74_7:
  .db $00,$00,$20,$22,$22,$22,$22,$02
a_column74_8:
  .db $00,$00,$00,$22,$22,$11,$11,$01


;;;;;;;;;;;;;;;;;;      End of file - Buffer table 
background_75:
  .dw column75_1,column75_2,column75_3,column75_4,column75_5,column75_6,column75_7,column75_8
  .dw column75_9,column75_10,column75_11,column75_12,column75_13,column75_14,column75_15,column75_16

column75_1:
  .db $8B,$00
column75_2:
  .db $8B,$00
column75_3:
  .db $8B,$00
column75_4:
  .db $8B,$00
column75_5:
  .db $8B,$00
column75_6:
  .db $8B,$00
column75_7:
  .db $8B,$00
column75_8:
  .db $8B,$00
column75_9:
  .db $8B,$00
column75_10:
  .db $8B,$00
column75_11:
  .db $8B,$00
column75_12:
  .db $8B,$00
column75_13:
  .db $8B,$00
column75_14:
  .db $8B,$00
column75_15:
  .db $8B,$00
column75_16:
  .db $8B,$00

attrib_75:
  .dw a_column75_1,a_column75_2,a_column75_3,a_column75_4,a_column75_5,a_column75_6,a_column75_7,a_column75_8

a_column75_1:
  .db $00
a_column75_2:
  .db $00
a_column75_3:
  .db $00
a_column75_4:
  .db $00
a_column75_5:
  .db $00
a_column75_6:
  .db $00
a_column75_7:
  .db $00
a_column75_8:
  .db $00


;;;;;;;;;;;;;;;;;;; BOSS 3 - MECHA STALIN


;;;;;;;;;;;;;;;;;;  buffer table
background_113:
  .dw column113_1,column113_2,column113_3,column113_4,column113_5,column113_6,column113_7,column113_8
  .dw column113_9,column113_10,column113_11,column113_12,column113_13,column113_14,column113_15,column113_16

column113_1:
  .db $8B,$00
column113_2:
  .db $8B,$00
column113_3:
  .db $8B,$00
column113_4:
  .db $8B,$00
column113_5:
  .db $8B,$00
column113_6:
  .db $8B,$00
column113_7:
  .db $8B,$00
column113_8:
  .db $8B,$00
column113_9:
  .db $8B,$00
column113_10:
  .db $8B,$00
column113_11:
  .db $8B,$00
column113_12:
  .db $8B,$00
column113_13:
  .db $8B,$00
column113_14:
  .db $8B,$00
column113_15:
  .db $8B,$00
column113_16:
  .db $8B,$00

attrib_113:
  .dw a_column113_1,a_column113_2,a_column113_3,a_column113_4,a_column113_5,a_column113_6,a_column113_7,a_column113_8

a_column113_1:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column113_2:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column113_3:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column113_4:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column113_5:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column113_6:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column113_7:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column113_8:
  .db $00,$00,$00,$00,$00,$00,$00,$00


;;;;;;;;;;;;;;;;;;
background_114:
  .dw column114_1,column114_2,column114_3,column114_4,column114_5,column114_6,column114_7,column114_8
  .dw column114_9,column114_10,column114_11,column114_12,column114_13,column114_14,column114_15,column114_16

column114_1:
  .db $8b,$00
column114_2:
  .db $8b,$00
column114_3:
  .db $8b,$00
column114_4:
  .db $8b,$00
column114_5:
  .db $8b,$00
column114_6:
  .db $8b,$00
column114_7:
  .db $8b,$00
column114_8:
  .db $8b,$00
column114_9:
  .db $8b,$00
column114_10:
  .db $89,$00,$26,$2d
column114_11:
  .db $88,$00,$20,$27,$2e
column114_12:
  .db $88,$00,$21,$28,$2f
column114_13:
  .db $01,$05,$09,$0d,$11,$15,$19,$1d,$22,$29,$30
column114_14:
  .db $02,$06,$0a,$0e,$12,$16,$1a,$1e,$23,$2a,$31
column114_15:
  .db $03,$07,$0b,$0f,$13,$17,$1b,$1f,$24,$2b,$32
column114_16:
  .db $04,$08,$0c,$10,$14,$18,$1c,$00,$25,$2c,$33

attrib_114:
  .dw a_column114_1,a_column114_2,a_column114_3,a_column114_4,a_column114_5,a_column114_6,a_column114_7,a_column114_8

a_column114_1:
  .db $FF,$FF,$00,$00,$00,$00,$00,$00
a_column114_2:
  .db $FF,$FF,$00,$00,$00,$00,$00,$00
a_column114_3:
  .db $FF,$FF,$00,$00,$00,$00,$00,$00
a_column114_4:
  .db $FF,$FF,$00,$00,$00,$00,$00,$00
a_column114_5:
  .db $FF,$FF,$00,$00,$00,$00,$00,$00
a_column114_6:
  .db $FF,$FF,$00,$00,$00,$00,$00,$00
a_column114_7:
  .db $FF,$FF,$00,$00,$00,$00,$00,$00
a_column114_8:
  .db $FF,$FF,$00,$00,$00,$00,$00,$00


;;;;;;;;;;;;;;;;;;
background_115:
  .dw column115_1,column115_2,column115_3,column115_4,column115_5,column115_6,column115_7,column115_8
  .dw column115_9,column115_10,column115_11,column115_12,column115_13,column115_14,column115_15,column115_16

column115_1:
  .db $8b,$00
column115_2:
  .db $8b,$00
column115_3:
  .db $8b,$00
column115_4:
  .db $8b,$00
column115_5:
  .db $8b,$00
column115_6:
  .db $8b,$00
column115_7:
  .db $8b,$00
column115_8:
  .db $8b,$00
column115_9:
  .db $8b,$00
column115_10:
  .db $8b,$00
column115_11:
  .db $8b,$00
column115_12:
  .db $8b,$00
column115_13:
  .db $8b,$00
column115_14:
  .db $8b,$00
column115_15:
  .db $8b,$00
column115_16:
  .db $8b,$00

attrib_115:
  .dw a_column115_1,a_column115_2,a_column115_3,a_column115_4,a_column115_5,a_column115_6,a_column115_7,a_column115_8

a_column115_1:
  .db $FF,$FF,$00,$00,$00,$00,$00,$00
a_column115_2:
  .db $FF,$FF,$00,$00,$00,$00,$00,$00
a_column115_3:
  .db $FF,$FF,$00,$00,$00,$00,$00,$00
a_column115_4:
  .db $FF,$FF,$00,$00,$00,$00,$00,$00
a_column115_5:
  .db $FF,$FF,$00,$00,$00,$00,$00,$00
a_column115_6:
  .db $FF,$FF,$00,$00,$00,$00,$00,$00
a_column115_7:
  .db $FF,$FF,$00,$00,$00,$00,$00,$00
a_column115_8:
  .db $FF,$FF,$00,$00,$00,$00,$00,$00


;;;;;TEMPLATE TABLE BELOW;;;;;

;;;;;;;;;;;;;;;;;;
background_0s:
  .dw column0s_1,column0s_2,column0s_3,column0s_4,column0s_5,column0s_6,column0s_7,column0s_8
  .dw column0s_9,column0s_10,column0s_11,column0s_12,column0s_13,column0s_14,column0s_15,column0s_16

column0s_1:
  .db $8B,$00
column0s_2:
  .db $8B,$00
column0s_3:
  .db $8B,$00
column0s_4:
  .db $8B,$00
column0s_5:
  .db $8B,$00
column0s_6:
  .db $8B,$00
column0s_7:
  .db $8B,$00
column0s_8:
  .db $8B,$00
column0s_9:
  .db $8B,$00
column0s_10:
  .db $8B,$00
column0s_11:
  .db $8B,$00
column0s_12:
  .db $8B,$00
column0s_13:
  .db $8B,$00
column0s_14:
  .db $8B,$00
column0s_15:
  .db $8B,$00
column0s_16:
  .db $8B,$00

attrib_0s:
  .dw a_column0s_1,a_column0s_2,a_column0s_3,a_column0s_4,a_column0s_5,a_column0s_6,a_column0s_7,a_column0s_8

a_column0s_1:
  .db $00
a_column0s_2:
  .db $00
a_column0s_3:
  .db $00
a_column0s_4:
  .db $00
a_column0s_5:
  .db $00
a_column0s_6:
  .db $00
a_column0s_7:
  .db $00
a_column0s_8:
  .db $00


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

init_pb_attr12:
  .db $FF,$FF,$FF,$FF,$FF
init_pb_attr13:
  .db $FF,$FF,$FF,$FF,$FF
init_pb_attr14:
  .db $FF,$FF,$FF,$FF,$FF
init_pb_attr15:
  .db $FF,$FF,$FF,$FF,$FF
init_pb_attr16:
  .db $FF,$FF,$FF,$FF,$FF
init_pb_attr17:
  .db $FF,$FF,$FF,$FF,$FF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Palette data for ALL levels goes in background1.i
