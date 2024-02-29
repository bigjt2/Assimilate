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
background_76:
  .dw column76_1,column76_2,column76_3,column76_4,column76_5,column76_6,column76_7,column76_8
  .dw column76_9,column76_10,column76_11,column76_12,column76_13,column76_14,column76_15,column76_16

column76_1:
  .db $8B,$00
column76_2:
  .db $8B,$00
column76_3:
  .db $8B,$00
column76_4:
  .db $8B,$00
column76_5:
  .db $8B,$00
column76_6:
  .db $8B,$00
column76_7:
  .db $8B,$00
column76_8:
  .db $8B,$00
column76_9:
  .db $8B,$00
column76_10:
  .db $8B,$00
column76_11:
  .db $8B,$00
column76_12:
  .db $8B,$00
column76_13:
  .db $8B,$00
column76_14:
  .db $8B,$00
column76_15:
  .db $8B,$00
column76_16:
  .db $8B,$00

attrib_76:
  .dw a_column76_1,a_column76_2,a_column76_3,a_column76_4,a_column76_5,a_column76_6,a_column76_7,a_column76_8

a_column76_1:
  .db $00
a_column76_2:
  .db $00
a_column76_3:
  .db $00
a_column76_4:
  .db $00
a_column76_5:
  .db $00
a_column76_6:
  .db $00
a_column76_7:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column76_8:
  .db $00,$00,$00,$00,$00,$00,$00,$00


;;;;;;;;;;;;;;;;;;    ;LEVEL 18 BEGINS HERE;;
background_77:
  .dw column77_1,column77_2,column77_3,column77_4,column77_5,column77_6,column77_7,column77_8
  .dw column77_9,column77_10,column77_11,column77_12,column77_13,column77_14,column77_15,column77_16

column77_1:
  .db $87,$00,$39,$00,$27,$36
column77_2:
  .db $00,$06,$0e,$16,$40,$84,$00,$28,$37
column77_3:
  .db $00,$07,$0f,$17,$03,$0b,$85,$13
column77_4:
  .db $00,$08,$10,$18,$04,$86,$0c
column77_5:
  .db $39,$84,$00,$1f,$00,$1f,$00,$34,$2d
column77_6:
  .db $83,$00,$02,$14,$0a,$14,$12,$83,$1b
column77_7:
  .db $82,$00,$39,$00,$01,$09,$11,$1a,$00,$24,$33
column77_8:
  .db $83,$00,$40,$00,$1e,$00,$21,$29,$82,$30
column77_9:
  .db $44,$84,$00,$1f,$00,$22,$2a,$82,$31
column77_10:
  .db $85,$00,$1f,$3a,$23,$2b,$82,$32
column77_11:
  .db $82,$00,$43,$82,$00,$20,$83,$00,$27,$26
column77_12:
  .db $00,$39,$00,$04,$87,$0c
column77_13:
  .db $82,$00,$46,$00,$05,$15,$0d,$15,$1d,$82,$1b
column77_14:
  .db $00,$45,$85,$00,$42,$00,$24,$33
column77_15:
  .db $82,$00,$3b,$00,$44,$83,$00,$3b,$28,$36
column77_16:
  .db $86,$00,$42,$3c,$00,$2e,$33

attrib_77:
  .dw a_column77_1,a_column77_2,a_column77_3,a_column77_4,a_column77_5,a_column77_6,a_column77_7,a_column77_8

a_column77_1:
  .db $00,$00,$00,$00,$00,$00,$50,$05
a_column77_2:
  .db $00,$00,$00,$00,$55,$55,$55,$05
a_column77_3:
  .db $00,$00,$00,$C0,$CC,$CC,$DC,$0D
a_column77_4:
  .db $00,$00,$00,$00,$F3,$33,$10,$01
a_column77_5:
  .db $00,$00,$00,$00,$F0,$00,$40,$04
a_column77_6:
  .db $00,$00,$00,$C0,$FC,$CC,$DC,$0D
a_column77_7:
  .db $00,$00,$00,$00,$22,$22,$42,$04
a_column77_8:
  .db $00,$00,$00,$00,$00,$00,$50,$05


;;;;;;;;;;;;;;;;;;
background_78:
  .dw column78_1,column78_2,column78_3,column78_4,column78_5,column78_6,column78_7,column78_8
  .dw column78_9,column78_10,column78_11,column78_12,column78_13,column78_14,column78_15,column78_16

column78_1:
  .db $3a,$82,$00,$3b,$85,$00,$2f,$36
column78_2:
  .db $3b,$00,$39,$38,$02,$0a,$12,$19,$02,$12,$1b
column78_3:
  .db $82,$00,$01,$11,$1a,$02,$0a,$14,$12,$1a,$25
column78_4:
  .db $00,$3b,$00,$00,$02,$14,$09,$14,$1a,$27,$37
column78_5:
  .db $00,$02,$14,$09,$0a,$14,$0a,$1a,$00,$35,$2c
column78_6:
  .db $42,$82,$00,$3b,$84,$00,$44,$34,$2d
column78_7:
  .db $85,$00,$01,$85,$09
column78_8:
  .db $00,$39,$00,$41,$82,$00,$41,$82,$00,$34,$33
column78_9:
  .db $84,$00,$3c,$84,$00,$35,$36
column78_10:
  .db $3a,$00,$01,$0a,$14,$0a,$11,$84,$1b
column78_11:
  .db $82,$00,$38,$82,$00,$3a,$83,$00,$28,$37
column78_12:
  .db $00,$44,$00,$3a,$82,$00,$38,$82,$00,$2e,$2c
column78_13:
  .db $87,$00,$3a,$38,$2f,$2d
column78_14:
  .db $00,$03,$82,$0b,$83,$13,$0b,$83,$13
column78_15:
  .db $82,$00,$3c,$00,$03,$0b,$85,$13
column78_16:
  .db $42,$00,$3a,$83,$00,$3b,$00,$42,$2e,$37

attrib_78:
  .dw a_column78_1,a_column78_2,a_column78_3,a_column78_4,a_column78_5,a_column78_6,a_column78_7,a_column78_8

a_column78_1:
  .db $00,$00,$00,$00,$88,$88,$98,$09
a_column78_2:
  .db $00,$00,$00,$22,$A9,$AA,$56,$05
a_column78_3:
  .db $00,$00,$20,$22,$22,$12,$50,$05
a_column78_4:
  .db $00,$00,$00,$00,$00,$00,$40,$04
a_column78_5:
  .db $00,$00,$00,$88,$88,$88,$98,$09
a_column78_6:
  .db $00,$00,$00,$00,$00,$00,$50,$05
a_column78_7:
  .db $00,$00,$C0,$CC,$CC,$CC,$DC,$0D
a_column78_8:
  .db $00,$00,$00,$00,$33,$33,$73,$07


;;;;;;;;;;;;;;;;;;
background_79:
  .dw column79_1,column79_2,column79_3,column79_4,column79_5,column79_6,column79_7,column79_8
  .dw column79_9,column79_10,column79_11,column79_12,column79_13,column79_14,column79_15,column79_16

column79_1:
  .db $00,$3a,$00,$47,$82,$00,$3c,$00,$3b,$34,$25
column79_2:
  .db $3b,$82,$00,$42,$00,$01,$19,$82,$00,$2f,$26
column79_3:
  .db $84,$00,$3b,$00,$01,$09,$11,$82,$1b
column79_4:
  .db $00,$02,$82,$0a,$12,$01,$1a,$82,$00,$24,$25
column79_5:
  .db $43,$00,$02,$0a,$09,$82,$0a,$82,$09,$82,$14
column79_6:
  .db $38,$83,$00,$41,$82,$00,$44,$00,$35,$26
column79_7:
  .db $83,$00,$44,$82,$00,$21,$84,$30
column79_8:
  .db $00,$3a,$84,$00,$23,$84,$32
column79_9:
  .db $00,$3d,$38,$00,$46,$00,$3c,$00,$1e,$35,$33
column79_10:
  .db $82,$00,$3b,$85,$00,$1f,$27,$36
column79_11:
  .db $84,$00,$3a,$82,$00,$41,$1f,$27,$2c
column79_12:
  .db $00,$44,$84,$00,$20,$00,$20,$2f,$2d
column79_13:
  .db $46,$00,$21,$29,$87,$30
column79_14:
  .db $82,$00,$22,$2a,$82,$31,$83,$0a,$82,$31
column79_15:
  .db $00,$42,$23,$2b,$87,$32
column79_16:
  .db $88,$00,$3a,$35,$2c

attrib_79:
  .dw a_column79_1,a_column79_2,a_column79_3,a_column79_4,a_column79_5,a_column79_6,a_column79_7,a_column79_8

a_column79_1:
  .db $00,$00,$00,$00,$00,$00,$50,$05
a_column79_2:
  .db $00,$00,$00,$00,$00,$00,$40,$04
a_column79_3:
  .db $00,$00,$00,$00,$00,$00,$40,$04
a_column79_4:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column79_5:
  .db $00,$00,$00,$00,$00,$00,$50,$05
a_column79_6:
  .db $00,$00,$00,$00,$00,$00,$50,$05
a_column79_7:
  .db $00,$00,$00,$55,$55,$55,$55,$05
a_column79_8:
  .db $00,$00,$00,$11,$11,$11,$51,$05


;;;;;;;;;;;;;;;;;;
background_80:
  .dw column80_1,column80_2,column80_3,column80_4,column80_5,column80_6,column80_7,column80_8
  .dw column80_9,column80_10,column80_11,column80_12,column80_13,column80_14,column80_15,column80_16

column80_1:
  .db $83,$00,$38,$00,$39,$00,$3f,$00,$35,$2d
column80_2:
  .db $00,$40,$82,$00,$21,$86,$30
column80_3:
  .db $82,$00,$38,$00,$23,$86,$32
column80_4:
  .db $82,$00,$04,$84,$0c,$82,$1e,$24,$25
column80_5:
  .db $82,$00,$39,$00,$04,$86,$0c
column80_6:
  .db $39,$04,$86,$0c,$1f,$27,$37
column80_7:
  .db $00,$40,$00,$03,$0b,$86,$13
column80_8:
  .db $82,$00,$04,$84,$0c,$82,$20,$28,$36
column80_9:
  .db $39,$00,$43,$82,$00,$21,$85,$30
column80_10:
  .db $00,$39,$82,$00,$39,$23,$85,$31
column80_11:
  .db $82,$00,$21,$29,$87,$30
column80_12:
  .db $00,$3a,$22,$2a,$87,$31
column80_13:
  .db $3b,$00,$23,$2b,$87,$32
column80_14:
  .db $43,$82,$00,$01,$1a,$01,$1a,$01,$1a,$24,$37
column80_15:
  .db $84,$00,$02,$14,$85,$0a
column80_16:
  .db $83,$00,$44,$82,$00,$38,$82,$00,$2f,$33

attrib_80:
  .dw a_column80_1,a_column80_2,a_column80_3,a_column80_4,a_column80_5,a_column80_6,a_column80_7,a_column80_8

a_column80_1:
  .db $00,$00,$00,$00,$00,$00,$10,$01
a_column80_2:
  .db $00,$00,$00,$CC,$CC,$0C,$40,$04
a_column80_3:
  .db $00,$00,$C0,$CC,$FF,$FF,$73,$07
a_column80_4:
  .db $00,$00,$00,$DC,$DD,$1D,$51,$05
a_column80_5:
  .db $00,$00,$00,$00,$50,$55,$55,$05
a_column80_6:
  .db $00,$00,$00,$FF,$33,$33,$33,$03
a_column80_7:
  .db $00,$00,$00,$F3,$CC,$CC,$4C,$04
a_column80_8:
  .db $00,$00,$00,$00,$00,$00,$40,$04


;;;;;;;;;;;;;;;;;;
background_81:
  .dw column81_1,column81_2,column81_3,column81_4,column81_5,column81_6,column81_7,column81_8
  .dw column81_9,column81_10,column81_11,column81_12,column81_13,column81_14,column81_15,column81_16

column81_1:
  .db $84,$00,$3a,$39,$82,$00,$44,$28,$36
column81_2:
  .db $00,$44,$00,$05,$82,$15,$1d,$84,$1b
column81_3:
  .db $82,$00,$05,$82,$0d,$1d,$85,$1b
column81_4:
  .db $3b,$3c,$00,$41,$82,$00,$82,$1e,$00,$2e,$37
column81_5:
  .db $85,$00,$3f,$82,$1f,$00,$28,$25
column81_6:
  .db $00,$38,$00,$03,$0b,$82,$13,$1f,$83,$13
column81_7:
  .db $38,$83,$00,$42,$00,$82,$1f,$00,$34,$2c
column81_8:
  .db $40,$3b,$03,$0b,$83,$13,$1f,$83,$13
column81_9:
  .db $00,$38,$00,$3a,$82,$00,$1f,$20,$83,$1f
column81_10:
  .db $00,$39,$82,$00,$01,$83,$09,$11,$19,$1f
column81_11:
  .db $00,$01,$85,$09,$11,$19,$01,$19
column81_12:
  .db $82,$00,$01,$11,$1a,$01,$85,$09
column81_13:
  .db $44,$00,$01,$09,$19,$82,$00,$01,$83,$09
column81_14:
  .db $83,$00,$01,$11,$19,$01,$82,$09,$1a,$1f
column81_15:
  .db $84,$00,$01,$09,$11,$1a,$02,$82,$0a
column81_16:
  .db $86,$00,$44,$82,$00,$24,$2c

attrib_81:
  .dw a_column81_1,a_column81_2,a_column81_3,a_column81_4,a_column81_5,a_column81_6,a_column81_7,a_column81_8

a_column81_1:
  .db $00,$00,$00,$80,$88,$88,$98,$09
a_column81_2:
  .db $00,$00,$00,$22,$66,$EE,$66,$06
a_column81_3:
  .db $00,$00,$10,$11,$11,$F3,$10,$01
a_column81_4:
  .db $00,$00,$00,$00,$13,$F3,$11,$01
a_column81_5:
  .db $00,$00,$00,$44,$FC,$FF,$3F,$0F
a_column81_6:
  .db $00,$00,$30,$FF,$F3,$FF,$FC,$0C
a_column81_7:
  .db $00,$00,$40,$F7,$2C,$FE,$3F,$0F
a_column81_8:
  .db $00,$00,$00,$00,$33,$03,$40,$04


;;;;;;;;;;;;;;;;;;    ;LEVEL 18 ENDS HERE;;
background_82:
  .dw column82_1,column82_2,column82_3,column82_4,column82_5,column82_6,column82_7,column82_8
  .dw column82_9,column82_10,column82_11,column82_12,column82_13,column82_14,column82_15,column82_16

column82_1:
  .db $85,$00,$46,$83,$00,$28,$37
column82_2:
  .db $83,$00,$21,$29,$86,$30
column82_3:
  .db $43,$00,$02,$88,$0a
column82_4:
  .db $00,$39,$82,$00,$3a,$1e,$83,$00,$27,$37
column82_5:
  .db $39,$84,$00,$1f,$43,$21,$83,$29
column82_6:
  .db $82,$00,$44,$82,$00,$1f,$00,$22,$83,$2a
column82_7:
  .db $85,$00,$1f,$3a,$23,$83,$2b
column82_8:
  .db $3a,$84,$00,$20,$83,$00,$28,$25
column82_9:
  .db $00,$3c,$00,$04,$87,$0c
column82_10:
  .db $3c,$83,$00,$1e,$00,$1e,$82,$00,$35,$33
column82_11:
  .db $84,$00,$1f,$00,$1f,$82,$00,$34,$36
column82_12:
  .db $00,$03,$0b,$82,$13,$0b,$1f,$13,$0b,$82,$13
column82_13:
  .db $00,$3b,$84,$00,$1f,$00,$1f,$27,$36
column82_14:
  .db $83,$00,$39,$82,$00,$20,$00,$20,$35,$25
column82_15:
  .db $82,$00,$04,$88,$0c
column82_16:
  .db $85,$00,$04,$85,$0c

attrib_82:
  .dw a_column82_1,a_column82_2,a_column82_3,a_column82_4,a_column82_5,a_column82_6,a_column82_7,a_column82_8

a_column82_1:
  .db $00,$00,$00,$80,$88,$88,$98,$09
a_column82_2:
  .db $00,$00,$00,$22,$A6,$66,$66,$06
a_column82_3:
  .db $00,$00,$00,$C0,$A0,$0C,$00,$00
a_column82_4:
  .db $00,$00,$00,$00,$A2,$03,$40,$04
a_column82_5:
  .db $00,$00,$00,$00,$C0,$08,$40,$04
a_column82_6:
  .db $00,$00,$C0,$CC,$FC,$CA,$DC,$0D
a_column82_7:
  .db $00,$00,$00,$00,$22,$2A,$50,$05
a_column82_8:
  .db $00,$00,$00,$00,$00,$00,$00,$00


;;;;;;;;;;;;;;;;;;    ;LEVEL 19 BEGINS HERE;;
background_83:
  .dw column83_1,column83_2,column83_3,column83_4,column83_5,column83_6,column83_7,column83_8
  .dw column83_9,column83_10,column83_11,column83_12,column83_13,column83_14,column83_15,column83_16

column83_1:
  .byte $84,$00,$82,$1f,$00,$39,$00,$27,$36
column83_2:
  .byte $00,$06,$0e,$01,$82,$09,$0a,$11,$19,$28,$37
column83_3:
  .byte $00,$07,$0f,$17,$82,$1f,$1e,$21,$29,$82,$30
column83_4:
  .byte $00,$08,$10,$18,$20,$82,$1f,$22,$2a,$82,$31
column83_5:
  .byte $39,$82,$00,$02,$0a,$1f,$20,$23,$2b,$82,$32
column83_6:
  .byte $00,$02,$83,$0a,$14,$12,$1a,$04,$82,$0c
column83_7:
  .byte $82,$00,$39,$23,$1e,$1f,$00,$04,$83,$0c
column83_8:
  .byte $83,$00,$40,$82,$1f,$04,$84,$0c
column83_9:
  .byte $44,$83,$00,$82,$1f,$00,$1f,$04,$82,$0c
column83_10:
  .byte $84,$00,$82,$1f,$04,$84,$0c
column83_11:
  .byte $84,$00,$1f,$20,$00,$20,$00,$27,$26
column83_12:
  .byte $00,$39,$02,$0a,$1f,$82,$0a,$14,$0a,$14,$0a
column83_13:
  .byte $83,$00,$02,$1f,$0a,$14,$82,$0a,$14,$0a
column83_14:
  .byte $46,$83,$00,$20,$02,$0a,$12,$1a,$24,$33
column83_15:
  .byte $82,$00,$02,$14,$0a,$14,$12,$1a,$01,$82,$09
column83_16:
  .byte $86,$00,$42,$3c,$00,$2e,$33

attrib_83:
  .dw a_column83_1,a_column83_2,a_column83_3,a_column83_4,a_column83_5,a_column83_6,a_column83_7,a_column83_8

a_column83_1:
  .db $00,$00,$00,$40,$44,$44,$50,$05
a_column83_2:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column83_3:
  .db $00,$00,$40,$54,$45,$04,$CC,$0C
a_column83_4:
  .db $00,$00,$00,$10,$00,$FC,$FF,$0F
a_column83_5:
  .db $00,$00,$00,$00,$00,$CC,$FF,$0F
a_column83_6:
  .db $00,$00,$00,$00,$00,$00,$10,$01
a_column83_7:
  .db $00,$00,$00,$00,$40,$44,$40,$04
a_column83_8:
  .db $00,$00,$00,$11,$11,$01,$73,$07


;;;;;;;;;;;;;;;;;;
background_84:
  .dw column84_1,column84_2,column84_3,column84_4,column84_5,column84_6,column84_7,column84_8
  .dw column84_9,column84_10,column84_11,column84_12,column84_13,column84_14,column84_15,column84_16

column84_1:
  .byte $3a,$82,$00,$3b,$85,$00,$2f,$36
column84_2:
  .byte $3b,$01,$82,$0a,$87,$09
column84_3:
  .byte $82,$00,$1e,$83,$00,$23,$2b,$83,$32
column84_4:
  .byte $00,$3b,$1f,$86,$00,$27,$37
column84_5:
  .byte $82,$00,$1f,$86,$00,$35,$2c
column84_6:
  .byte $42,$00,$20,$3b,$00,$21,$29,$84,$30
column84_7:
  .byte $00,$01,$82,$0a,$87,$09
column84_8:
  .byte $00,$39,$00,$41,$82,$00,$41,$82,$00,$34,$33
column84_9:
  .byte $84,$00,$3c,$84,$00,$35,$36
column84_10:
  .byte $3a,$82,$00,$01,$0a,$14,$0a,$84,$09
column84_11:
  .byte $82,$00,$38,$00,$1e,$3a,$1f,$82,$00,$28,$37
column84_12:
  .byte $00,$44,$00,$3a,$1f,$00,$20,$82,$00,$2e,$2c
column84_13:
  .byte $84,$00,$1f,$01,$11,$19,$38,$2f,$2d
column84_14:
  .byte $00,$01,$82,$09,$82,$0a,$14,$84,$09
column84_15:
  .byte $82,$00,$01,$09,$82,$0a,$14,$84,$09
column84_16:
  .byte $42,$00,$3a,$83,$00,$3b,$00,$42,$2e,$37

attrib_84:
  .dw a_column84_1,a_column84_2,a_column84_3,a_column84_4,a_column84_5,a_column84_6,a_column84_7,a_column84_8

a_column84_1:
  .db $00,$00,$00,$44,$00,$00,$10,$01
a_column84_2:
  .db $00,$00,$00,$00,$00,$33,$73,$07
a_column84_3:
  .db $00,$00,$00,$00,$C0,$CC,$DC,$0D
a_column84_4:
  .db $00,$00,$00,$11,$00,$CC,$4C,$04
a_column84_5:
  .db $00,$00,$00,$C0,$00,$C0,$DF,$0D
a_column84_6:
  .db $00,$00,$00,$00,$00,$00,$50,$05
a_column84_7:
  .db $00,$00,$00,$00,$FC,$0F,$10,$01
a_column84_8:
  .db $00,$00,$00,$33,$00,$30,$73,$07


;;;;;;;;;;;;;;;;;;
background_85:
  .dw column85_1,column85_2,column85_3,column85_4,column85_5,column85_6,column85_7,column85_8
  .dw column85_9,column85_10,column85_11,column85_12,column85_13,column85_14,column85_15,column85_16

column85_1:
  .byte $00,$3a,$84,$00,$3c,$00,$3b,$34,$25
column85_2:
  .byte $3b,$03,$0b,$88,$13
column85_3:
  .byte $84,$00,$3b,$04,$84,$0c,$1e
column85_4:
  .byte $88,$00,$04,$82,$0c
column85_5:
  .byte $43,$00,$05,$0d,$82,$15,$0d,$1d,$1b,$19,$1f
column85_6:
  .byte $38,$83,$00,$41,$01,$82,$09,$11,$82,$1b
column85_7:
  .byte $83,$00,$44,$82,$00,$01,$11,$83,$1b
column85_8:
  .byte $00,$05,$15,$82,$0d,$82,$15,$1d,$1b,$1a,$1f
column85_9:
  .byte $82,$00,$38,$00,$46,$1e,$3c,$03,$83,$13
column85_10:
  .byte $82,$00,$3b,$82,$00,$1f,$83,$00,$27,$36
column85_11:
  .byte $84,$00,$3a,$1f,$02,$12,$19,$27,$2c
column85_12:
  .byte $00,$44,$83,$00,$1f,$00,$02,$83,$0a
column85_13:
  .byte $46,$84,$00,$1f,$02,$12,$1a,$23,$32
column85_14:
  .byte $85,$00,$20,$00,$21,$83,$30
column85_15:
  .byte $00,$03,$0b,$82,$13,$0b,$85,$13
column85_16:
  .byte $88,$00,$3a,$35,$2c

attrib_85:
  .dw a_column85_1,a_column85_2,a_column85_3,a_column85_4,a_column85_5,a_column85_6,a_column85_7,a_column85_8

a_column85_1:
  .db $00,$00,$00,$00,$00,$00,$10,$01
a_column85_2:
  .db $00,$00,$00,$00,$30,$37,$FF,$0C
a_column85_3:
  .db $00,$00,$00,$00,$40,$44,$55,$04
a_column85_4:
  .db $00,$00,$00,$11,$00,$15,$55,$01
a_column85_5:
  .db $00,$00,$00,$C0,$00,$C0,$4C,$04
a_column85_6:
  .db $00,$00,$00,$00,$00,$F3,$DF,$0D
a_column85_7:
  .db $00,$00,$00,$00,$0C,$3F,$33,$03
a_column85_8:
  .db $00,$00,$00,$00,$00,$00,$40,$04


;;;;;;;;;;;;;;;;;;
background_86:
  .dw column86_1,column86_2,column86_3,column86_4,column86_5,column86_6,column86_7,column86_8
  .dw column86_9,column86_10,column86_11,column86_12,column86_13,column86_14,column86_15,column86_16

column86_1:
  .byte $83,$00,$38,$00,$39,$00,$3f,$00,$35,$2d
column86_2:
  .byte $00,$40,$02,$84,$14,$12,$19,$2f,$25
column86_3:
  .byte $83,$00,$1e,$00,$1e,$82,$00,$01,$14,$0a
column86_4:
  .byte $83,$00,$20,$00,$20,$00,$00,$01,$14,$0a
column86_5:
  .byte $00,$02,$85,$14,$12,$1a,$1c,$36
column86_6:
  .byte $39,$85,$00,$04,$84,$0c
column86_7:
  .byte $00,$40,$82,$00,$04,$86,$0c
column86_8:
  .byte $87,$00,$04,$83,$0c
column86_9:
  .byte $39,$84,$00,$04,$85,$0c
column86_10:
  .byte $00,$39,$84,$00,$1f,$82,$00,$1c,$25
column86_11:
  .byte $83,$00,$45,$82,$00,$1f,$82,$00,$24,$37
column86_12:
  .byte $86,$00,$1f,$00,$01,$82,$1b
column86_13:
  .byte $3b,$05,$15,$0d,$15,$1d,$83,$1b,$1f,$1b
column86_14:
  .byte $43,$83,$00,$01,$82,$1b,$09,$1b,$1f,$1b
column86_15:
  .byte $83,$00,$05,$0d,$1d,$1b,$1a,$01,$82,$1b
column86_16:
  .byte $3a,$00,$00,$44,$82,$00,$38,$82,$00,$2f,$33

attrib_86:
  .dw a_column86_1,a_column86_2,a_column86_3,a_column86_4,a_column86_5,a_column86_6,a_column86_7,a_column86_8

a_column86_1:
  .db $00,$00,$00,$00,$00,$00,$50,$05
a_column86_2:
  .db $00,$00,$00,$00,$00,$33,$00,$00
a_column86_3:
  .db $00,$00,$00,$00,$C0,$CC,$DC,$0D
a_column86_4:
  .db $00,$00,$00,$11,$33,$FF,$FF,$0F
a_column86_5:
  .db $00,$00,$00,$C0,$30,$F3,$7F,$07
a_column86_6:
  .db $00,$00,$00,$00,$00,$00,$10,$01
a_column86_7:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column86_8:
  .db $00,$00,$00,$03,$00,$00,$40,$04


;;;;;;;;;;;;;;;;;;
background_87:
  .dw column87_1,column87_2,column87_3,column87_4,column87_5,column87_6,column87_7,column87_8
  .dw column87_9,column87_10,column87_11,column87_12,column87_13,column87_14,column87_15,column87_16

column87_1:
  .byte $84,$00,$3a,$39,$82,$00,$44,$28,$36
column87_2:
  .byte $00,$02,$84,$0a,$14,$84,$0a
column87_3:
  .byte $84,$00,$03,$0b,$13,$1f,$83,$13
column87_4:
  .byte $3b,$3c,$00,$41,$03,$0b,$13,$1f,$83,$13
column87_5:
  .byte $82,$00,$02,$83,$0a,$14,$84,$0a
column87_6:
  .byte $00,$38,$82,$00,$1f,$3c,$83,$00,$35,$2c
column87_7:
  .byte $38,$83,$00,$1f,$00,$21,$29,$00,$1c,$2d
column87_8:
  .byte $40,$3b,$82,$00,$1f,$21,$22,$2a,$12,$24,$25
column87_9:
  .byte $00,$38,$00,$3a,$1f,$82,$22,$2a,$12,$27,$37
column87_10:
  .byte $00,$39,$82,$00,$1f,$23,$22,$2a,$12,$34,$25
column87_11:
  .byte $84,$00,$1f,$00,$23,$2b,$00,$2e,$33
column87_12:
  .byte $84,$00,$20,$39,$00,$1e,$00,$1c,$36
column87_13:
  .byte $44,$00,$01,$82,$09,$11,$19,$1f,$00,$24,$37
column87_14:
  .byte $82,$00,$01,$09,$82,$0a,$12,$1f,$00,$35,$33
column87_15:
  .byte $00,$01,$89,$09
column87_16:
  .byte $86,$00,$44,$82,$00,$24,$2c

attrib_87:
  .dw a_column87_1,a_column87_2,a_column87_3,a_column87_4,a_column87_5,a_column87_6,a_column87_7,a_column87_8

a_column87_1:
  .db $00,$00,$40,$44,$44,$44,$54,$05
a_column87_2:
  .db $00,$00,$00,$00,$55,$05,$55,$05
a_column87_3:
  .db $00,$00,$00,$11,$D1,$DD,$5D,$05
a_column87_4:
  .db $00,$00,$00,$11,$40,$55,$50,$05
a_column87_5:
  .db $00,$00,$00,$C0,$50,$55,$50,$05
a_column87_6:
  .db $00,$00,$00,$00,$00,$11,$50,$05
a_column87_7:
  .db $00,$00,$00,$55,$55,$05,$50,$05
a_column87_8:
  .db $00,$00,$10,$11,$11,$11,$51,$05


;;;;;;;;;;;;;;;;;;    ;LEVEL 19 ENDS HERE;;
background_88:
  .dw column88_1,column88_2,column88_3,column88_4,column88_5,column88_6,column88_7,column88_8
  .dw column88_9,column88_10,column88_11,column88_12,column88_13,column88_14,column88_15,column88_16

column88_1:
  .byte $85,$00,$46,$83,$00,$28,$37
column88_2:
  .byte $00,$05,$0d,$15,$0d,$15,$82,$0d,$1d,$82,$1b
column88_3:
  .byte $43,$00,$1e,$82,$00,$01,$85,$1b
column88_4:
  .byte $00,$39,$1f,$38,$82,$00,$1f,$3b,$00,$27,$37
column88_5:
  .byte $39,$00,$1f,$00,$3b,$00,$20,$82,$00,$1c,$25
column88_6:
  .byte $82,$00,$1f,$00,$01,$0a,$09,$11,$00,$24,$26
column88_7:
  .byte $82,$00,$20,$86,$00,$28,$37
column88_8:
  .byte $3a,$04,$89,$0c
column88_9:
  .byte $00,$3c,$82,$00,$04,$86,$0c
column88_10:
  .byte $3c,$85,$00,$3b,$82,$00,$35,$33
column88_11:
  .byte $82,$00,$02,$0a,$12,$83,$00,$03,$82,$13
column88_12:
  .byte $83,$00,$1f,$00,$03,$0b,$84,$13
column88_13:
  .byte $00,$43,$00,$1f,$3b,$00,$00,$03,$83,$13
column88_14:
  .byte $83,$00,$20,$85,$00,$35,$25
column88_15:
  .byte $00,$03,$0b,$88,$13
column88_16:
  .byte $84,$00,$04,$86,$0c

attrib_88:
  .dw a_column88_1,a_column88_2,a_column88_3,a_column88_4,a_column88_5,a_column88_6,a_column88_7,a_column88_8

a_column88_1:
  .db $00,$00,$40,$44,$44,$44,$14,$01
a_column88_2:
  .db $00,$00,$00,$00,$30,$00,$40,$04
a_column88_3:
  .db $00,$00,$00,$00,$0C,$CC,$5C,$05
a_column88_4:
  .db $00,$00,$C0,$CC,$CC,$CC,$DC,$0D
a_column88_5:
  .db $00,$00,$00,$C0,$00,$C0,$4C,$04
a_column88_6:
  .db $00,$00,$00,$00,$C0,$CC,$FF,$0F
a_column88_7:
  .db $00,$00,$00,$00,$FC,$3F,$73,$07
a_column88_8:
  .db $00,$00,$00,$00,$00,$00,$00,$00


;;;;;;;;;;;;;;;;;;    ;LEVEL 20 BEGINS HERE;;
background_89:
  .dw column89_1,column89_2,column89_3,column89_4,column89_5,column89_6,column89_7,column89_8
  .dw column89_9,column89_10,column89_11,column89_12,column89_13,column89_14,column89_15,column89_16

column89_1:
  .byte $85,$00,$1f,$83,$00,$27,$36
column89_2:
  .byte $00,$06,$0e,$16,$00,$1f,$83,$00,$28,$37
column89_3:
  .byte $00,$07,$0f,$17,$00,$20,$21,$29,$83,$30
column89_4:
  .byte $00,$08,$10,$18,$21,$29,$22,$2a,$83,$31
column89_5:
  .byte $39,$00,$21,$29,$22,$2a,$85,$31
column89_6:
  .byte $82,$00,$22,$2a,$82,$31,$2a,$31,$2a,$82,$31
column89_7:
  .byte $82,$00,$23,$2b,$87,$32
column89_8:
  .byte $83,$00,$40,$23,$2b,$85,$32
column89_9:
  .byte $44,$84,$00,$1e,$23,$2b,$83,$32
column89_10:
  .byte $85,$00,$20,$21,$29,$83,$30
column89_11:
  .byte $84,$00,$21,$29,$85,$30
column89_12:
  .byte $00,$39,$82,$00,$22,$84,$2a,$82,$31
column89_13:
  .byte $00,$21,$29,$88,$30
column89_14:
  .byte $46,$22,$2a,$88,$31
column89_15:
  .byte $00,$23,$2b,$88,$32
column89_16:
  .byte $85,$00,$1e,$41,$00,$1f,$2e,$33

attrib_89:
  .dw a_column89_1,a_column89_2,a_column89_3,a_column89_4,a_column89_5,a_column89_6,a_column89_7,a_column89_8

a_column89_1:
  .db $00,$00,$00,$00,$50,$00,$50,$05
a_column89_2:
  .db $00,$00,$00,$00,$DC,$FF,$FF,$0F
a_column89_3:
  .db $00,$00,$00,$FF,$FF,$FF,$FF,$0F
a_column89_4:
  .db $00,$00,$00,$33,$FF,$FF,$FF,$0F
a_column89_5:
  .db $00,$00,$00,$00,$50,$BB,$BB,$0B
a_column89_6:
  .db $00,$00,$00,$00,$AA,$AA,$AA,$0A
a_column89_7:
  .db $00,$00,$A0,$AA,$AA,$AA,$AA,$0A
a_column89_8:
  .db $00,$00,$20,$22,$62,$22,$66,$06


;;;;;;;;;;;;;;;;;;
background_90:
  .dw column90_1,column90_2,column90_3,column90_4,column90_5,column90_6,column90_7,column90_8
  .dw column90_9,column90_10,column90_11,column90_12,column90_13,column90_14,column90_15,column90_16

column90_1:
  .byte $3a,$82,$00,$3b,$00,$1f,$82,$00,$1f,$2f,$36
column90_2:
  .byte $3b,$00,$21,$29,$87,$30
column90_3:
  .byte $82,$00,$22,$2a,$87,$31
column90_4:
  .byte $00,$3b,$23,$2b,$87,$32
column90_5:
  .byte $85,$00,$1f,$3c,$00,$1f,$35,$2c
column90_6:
  .byte $42,$82,$00,$3b,$00,$1f,$82,$00,$20,$2f,$2d
column90_7:
  .byte $00,$21,$82,$29,$87,$30
column90_8:
  .byte $00,$23,$82,$2b,$87,$32
column90_9:
  .byte $83,$00,$23,$2b,$86,$32
column90_10:
  .byte $3a,$84,$00,$1f,$21,$29,$83,$30
column90_11:
  .byte $82,$00,$38,$82,$00,$1f,$22,$2a,$83,$31
column90_12:
  .byte $00,$21,$29,$82,$30,$1f,$85,$30
column90_13:
  .byte $00,$22,$2a,$82,$31,$1f,$85,$31
column90_14:
  .byte $00,$23,$2b,$82,$32,$1f,$85,$32
column90_15:
  .byte $85,$00,$1f,$21,$84,$29
column90_16:
  .byte $42,$00,$3a,$82,$00,$1f,$22,$84,$2a

attrib_90:
  .dw a_column90_1,a_column90_2,a_column90_3,a_column90_4,a_column90_5,a_column90_6,a_column90_7,a_column90_8

a_column90_1:
  .db $00,$00,$00,$CC,$DC,$CC,$DD,$0D
a_column90_2:
  .db $00,$00,$00,$FF,$FF,$FF,$FF,$0F
a_column90_3:
  .db $00,$00,$00,$00,$50,$00,$55,$05
a_column90_4:
  .db $00,$00,$A0,$AA,$EE,$EE,$EE,$0E
a_column90_5:
  .db $00,$00,$00,$20,$62,$AA,$AA,$0A
a_column90_6:
  .db $00,$00,$80,$88,$58,$AA,$AA,$0A
a_column90_7:
  .db $00,$00,$A0,$AA,$5A,$AA,$AA,$0A
a_column90_8:
  .db $00,$00,$00,$00,$50,$AA,$AA,$0A


;;;;;;;;;;;;;;;;;;
background_91:
  .dw column91_1,column91_2,column91_3,column91_4,column91_5,column91_6,column91_7,column91_8
  .dw column91_9,column91_10,column91_11,column91_12,column91_13,column91_14,column91_15,column91_16

column91_1:
  .byte $00,$3a,$83,$00,$1f,$23,$84,$2b
column91_2:
  .byte $3b,$21,$89,$29
column91_3:
  .byte $00,$22,$89,$2a
column91_4:
  .byte $00,$23,$89,$2b
column91_5:
  .byte $43,$83,$00,$21,$1f,$00,$1e,$00,$24,$37
column91_6:
  .byte $38,$83,$00,$22,$1f,$46,$1f,$00,$27,$25
column91_7:
  .byte $83,$00,$44,$23,$1f,$00,$1f,$38,$28,$26
column91_8:
  .byte $84,$00,$21,$1f,$44,$1f,$00,$2e,$33
column91_9:
  .byte $82,$00,$38,$21,$22,$1f,$00,$1f,$00,$27,$36
column91_10:
  .byte $00,$21,$29,$82,$22,$1f,$30,$1f,$83,$30
column91_11:
  .byte $00,$23,$2b,$82,$22,$1f,$32,$1f,$83,$32
column91_12:
  .byte $00,$44,$00,$82,$22,$1f,$00,$1f,$00,$2f,$37
column91_13:
  .byte $46,$82,$00,$82,$22,$1f,$44,$1f,$00,$34,$2c
column91_14:
  .byte $83,$00,$23,$22,$1f,$00,$1f,$3a,$2f,$2d
column91_15:
  .byte $84,$00,$23,$1f,$38,$1f,$00,$35,$37
column91_16:
  .byte $85,$00,$1f,$00,$1f,$3a,$34,$2c

attrib_91:
  .dw a_column91_1,a_column91_2,a_column91_3,a_column91_4,a_column91_5,a_column91_6,a_column91_7,a_column91_8

a_column91_1:
  .db $00,$00,$C0,$CC,$DC,$EE,$EE,$0E
a_column91_2:
  .db $00,$00,$F0,$FF,$FF,$FF,$FF,$0F
a_column91_3:
  .db $00,$00,$00,$00,$5A,$50,$50,$05
a_column91_4:
  .db $00,$00,$00,$00,$5A,$50,$50,$05
a_column91_5:
  .db $00,$00,$40,$A4,$5A,$54,$54,$05
a_column91_6:
  .db $00,$00,$10,$A1,$5A,$51,$51,$05
a_column91_7:
  .db $00,$00,$00,$A0,$5A,$50,$50,$05
a_column91_8:
  .db $00,$00,$00,$00,$52,$50,$50,$05


;;;;;;;;;;;;;;;;;;
background_92:
  .dw column92_1,column92_2,column92_3,column92_4,column92_5,column92_6,column92_7,column92_8
  .dw column92_9,column92_10,column92_11,column92_12,column92_13,column92_14,column92_15,column92_16

column92_1:
  .byte $83,$00,$38,$00,$20,$00,$20,$00,$35,$2d
column92_2:
  .byte $00,$40,$82,$00,$21,$29,$85,$30
column92_3:
  .byte $83,$00,$21,$29,$22,$2a,$84,$31
column92_4:
  .byte $00,$21,$29,$22,$2a,$86,$30
column92_5:
  .byte $00,$22,$2a,$88,$31
column92_6:
  .byte $39,$23,$2b,$85,$32,$1e,$82,$32
column92_7:
  .byte $00,$40,$00,$23,$2b,$83,$32,$1f,$82,$32
column92_8:
  .byte $85,$00,$23,$2b,$32,$1f,$82,$32
column92_9:
  .byte $39,$00,$43,$82,$00,$21,$29,$30,$1f,$82,$30
column92_10:
  .byte $00,$39,$00,$21,$29,$83,$30,$1f,$82,$30
column92_11:
  .byte $00,$21,$29,$85,$30,$1f,$82,$30
column92_12:
  .byte $00,$22,$2a,$85,$31,$1f,$82,$31
column92_13:
  .byte $3b,$23,$2b,$22,$2a,$83,$31,$1f,$82,$31
column92_14:
  .byte $43,$82,$00,$23,$2b,$83,$32,$1f,$82,$32
column92_15:
  .byte $84,$00,$23,$2b,$82,$32,$1f,$82,$32
column92_16:
  .byte $3a,$00,$00,$44,$00,$1e,$21,$29,$1f,$82,$30

attrib_92:
  .dw a_column92_1,a_column92_2,a_column92_3,a_column92_4,a_column92_5,a_column92_6,a_column92_7,a_column92_8

a_column92_1:
  .db $00,$00,$00,$00,$DC,$DC,$DC,$0D
a_column92_2:
  .db $00,$00,$C0,$FC,$FF,$FF,$FF,$0F
a_column92_3:
  .db $00,$00,$F0,$BF,$BB,$BB,$B7,$0B
a_column92_4:
  .db $00,$00,$00,$20,$A2,$AA,$A5,$0A
a_column92_5:
  .db $00,$00,$00,$80,$A8,$AA,$A5,$0A
a_column92_6:
  .db $00,$00,$A0,$AA,$AA,$AA,$A5,$0A
a_column92_7:
  .db $00,$00,$20,$F2,$EF,$EE,$E5,$0E
a_column92_8:
  .db $00,$00,$00,$00,$73,$FF,$F5,$0F


;;;;;;;;;;;;;;;;;;
background_93:
  .dw column93_1,column93_2,column93_3,column93_4,column93_5,column93_6,column93_7,column93_8
  .dw column93_9,column93_10,column93_11,column93_12,column93_13,column93_14,column93_15,column93_16

column93_1:
  .byte $83,$00,$21,$29,$83,$30,$1f,$82,$30
column93_2:
  .byte $00,$21,$29,$85,$30,$20,$82,$30
column93_3:
  .byte $00,$22,$2a,$88,$31
column93_4:
  .byte $3b,$23,$2b,$88,$32
column93_5:
  .byte $83,$00,$23,$2b,$86,$32
column93_6:
  .byte $00,$38,$83,$00,$1f,$23,$2b,$83,$32
column93_7:
  .byte $38,$83,$00,$42,$1f,$83,$00,$34,$25
column93_8:
  .byte $40,$21,$82,$29,$87,$30
column93_9:
  .byte $00,$22,$82,$2a,$31,$2a,$82,$31,$2a,$82,$31
column93_10:
  .byte $00,$23,$82,$2b,$87,$32
column93_11:
  .byte $85,$00,$1f,$38,$1e,$00,$24,$33
column93_12:
  .byte $82,$00,$38,$82,$00,$1f,$00,$20,$00,$28,$36
column93_13:
  .byte $44,$21,$82,$29,$87,$30
column93_14:
  .byte $00,$23,$82,$2b,$87,$32
column93_15:
  .byte $85,$00,$1f,$83,$00,$28,$25
column93_16:
  .byte $85,$00,$1f,$44,$82,$00,$24,$2c

attrib_93:
  .dw a_column93_1,a_column93_2,a_column93_3,a_column93_4,a_column93_5,a_column93_6,a_column93_7,a_column93_8

a_column93_1:
  .db $00,$00,$80,$A8,$AA,$AA,$A5,$0A
a_column93_2:
  .db $00,$00,$A0,$AA,$AA,$AA,$AA,$0A
a_column93_3:
  .db $00,$00,$00,$20,$62,$AA,$AA,$0A
a_column93_4:
  .db $00,$00,$C0,$CC,$DC,$CC,$DC,$0D
a_column93_5:
  .db $00,$00,$F0,$FF,$FF,$FF,$FF,$0F
a_column93_6:
  .db $00,$00,$00,$00,$50,$50,$50,$05
a_column93_7:
  .db $00,$00,$40,$44,$77,$77,$77,$07
a_column93_8:
  .db $00,$00,$00,$00,$50,$00,$50,$05


;;;;;;;;;;;;;;;;;;    ;LEVEL 20 ENDS HERE;;
background_94:
  .dw column94_1,column94_2,column94_3,column94_4,column94_5,column94_6,column94_7,column94_8
  .dw column94_9,column94_10,column94_11,column94_12,column94_13,column94_14,column94_15,column94_16

column94_1:
  .byte $85,$00,$20,$21,$29,$83,$30
column94_2:
  .byte $00,$21,$29,$83,$30,$22,$2a,$83,$30
column94_3:
  .byte $43,$22,$2a,$83,$31,$22,$2a,$83,$31
column94_4:
  .byte $00,$22,$2a,$83,$30,$22,$2a,$83,$30
column94_5:
  .byte $39,$22,$2a,$83,$31,$22,$2a,$83,$31
column94_6:
  .byte $00,$22,$2a,$83,$30,$22,$2a,$83,$30
column94_7:
  .byte $00,$22,$2a,$83,$31,$22,$2a,$83,$31
column94_8:
  .byte $3a,$22,$2a,$83,$30,$22,$2a,$83,$30
column94_9:
  .byte $00,$23,$2b,$83,$32,$22,$2a,$83,$32
column94_10:
  .byte $3c,$84,$00,$1f,$23,$2b,$83,$32
column94_11:
  .byte $85,$00,$1f,$83,$00,$34,$36
column94_12:
  .byte $84,$00,$21,$29,$85,$30
column94_13:
  .byte $00,$21,$29,$88,$30
column94_14:
  .byte $00,$22,$2a,$88,$31
column94_15:
  .byte $00,$23,$2b,$88,$32
column94_16:
  .byte $84,$00,$23,$2b,$85,$32

attrib_94:
  .dw a_column94_1,a_column94_2,a_column94_3,a_column94_4,a_column94_5,a_column94_6,a_column94_7,a_column94_8

a_column94_1:
  .db $00,$00,$80,$88,$98,$55,$FF,$0F
a_column94_2:
  .db $00,$00,$A0,$AA,$AA,$55,$DD,$0D
a_column94_3:
  .db $00,$00,$A0,$AA,$AA,$55,$DD,$0D
a_column94_4:
  .db $00,$00,$A0,$AA,$AA,$55,$DD,$0D
a_column94_5:
  .db $00,$00,$20,$22,$62,$55,$55,$05
a_column94_6:
  .db $00,$00,$00,$00,$54,$44,$54,$05
a_column94_7:
  .db $00,$00,$50,$75,$77,$77,$77,$07
a_column94_8:
  .db $00,$00,$10,$11,$55,$55,$55,$05


;;;;;;;;;;;;;;;;;;    ;LEVEL 21 BEGINS HERE;;
background_95:
  .dw column95_1,column95_2,column95_3,column95_4,column95_5,column95_6,column95_7,column95_8
  .dw column95_9,column95_10,column95_11,column95_12,column95_13,column95_14,column95_15,column95_16

column95_1:
  .db $85,$00,$3b,$83,$00,$27,$36
column95_2:
  .db $00,$06,$0e,$16,$3a,$84,$00,$28,$37
column95_3:
  .db $00,$07,$0f,$17,$82,$00,$02,$84,$0a
column95_4:
  .db $00,$08,$10,$18,$00,$02,$85,$0a
column95_5:
  .db $39,$82,$00,$01,$09,$0a,$11,$1e,$23,$2b,$32
column95_6:
  .db $84,$00,$04,$1f,$0c,$1f,$83,$0c
column95_7:
  .db $85,$00,$1f,$00,$1f,$21,$29,$30
column95_8:
  .db $82,$00,$04,$82,$0c,$1f,$0c,$1f,$83,$0c
column95_9:
  .db $44,$04,$83,$0c,$1f,$0c,$1f,$83,$0c
column95_10:
  .db $82,$00,$03,$0b,$13,$1f,$13,$1f,$83,$13
column95_11:
  .db $85,$00,$20,$29,$20,$83,$30
column95_12:
  .db $00,$39,$00,$01,$83,$09,$0a,$11,$82,$31
column95_13:
  .db $85,$00,$23,$2b,$84,$32
column95_14:
  .db $46,$82,$00,$04,$87,$0c
column95_15:
  .db $85,$00,$03,$0b,$84,$13
column95_16:
  .db $86,$00,$41,$82,$00,$2e,$33

attrib_95:
  .dw a_column95_1,a_column95_2,a_column95_3,a_column95_4,a_column95_5,a_column95_6,a_column95_7,a_column95_8

a_column95_1:
  .db $00,$00,$40,$44,$00,$00,$A0,$0A
a_column95_2:
  .db $00,$00,$50,$55,$00,$00,$00,$00
a_column95_3:
  .db $00,$00,$00,$00,$40,$50,$33,$03
a_column95_4:
  .db $00,$00,$00,$88,$58,$58,$BB,$0B
a_column95_5:
  .db $00,$00,$20,$AA,$5A,$5A,$AA,$0A
a_column95_6:
  .db $00,$00,$00,$00,$10,$13,$F3,$0F
a_column95_7:
  .db $00,$00,$00,$00,$30,$33,$33,$03
a_column95_8:
  .db $00,$00,$00,$00,$60,$22,$A6,$0A


;;;;;;;;;;;;;;;;;;
background_96:
  .dw column96_1,column96_2,column96_3,column96_4,column96_5,column96_6,column96_7,column96_8
  .dw column96_9,column96_10,column96_11,column96_12,column96_13,column96_14,column96_15,column96_16

column96_1:
  .db $3a,$82,$00,$3b,$85,$00,$2f,$36
column96_2:
  .db $3b,$00,$05,$0d,$15,$0d,$15,$1d,$83,$1b
column96_3:
  .db $85,$00,$1e,$02,$12,$19,$1c,$2d
column96_4:
  .db $00,$3b,$83,$00,$1f,$00,$02,$83,$0a
column96_5:
  .db $83,$00,$02,$14,$0a,$14,$12,$19,$1f,$26
column96_6:
  .db $42,$82,$00,$3b,$02,$0a,$1e,$21,$29,$1f,$30
column96_7:
  .db $86,$00,$1f,$22,$2a,$1f,$31
column96_8:
  .db $00,$04,$84,$0c,$1f,$22,$2a,$1f,$31
column96_9:
  .db $84,$00,$40,$00,$1f,$22,$2a,$1f,$31
column96_10:
  .db $3a,$85,$00,$1f,$22,$2a,$1f,$31
column96_11:
  .db $82,$00,$03,$0b,$82,$13,$1f,$22,$2a,$1f,$31
column96_12:
  .db $84,$00,$03,$0b,$20,$23,$2b,$1f,$32
column96_13:
  .db $00,$3b,$00,$02,$14,$0a,$14,$12,$1a,$1f,$33
column96_14:
  .db $87,$00,$1f,$00,$1f,$36
column96_15:
  .db $82,$00,$05,$82,$0d,$15,$1d,$84,$09
column96_16:
  .db $42,$00,$3a,$84,$00,$3b,$00,$35,$36

attrib_96:
  .dw a_column96_1,a_column96_2,a_column96_3,a_column96_4,a_column96_5,a_column96_6,a_column96_7,a_column96_8

a_column96_1:
  .db $00,$00,$00,$88,$88,$88,$20,$02
a_column96_2:
  .db $00,$00,$00,$00,$50,$00,$20,$02
a_column96_3:
  .db $00,$00,$00,$20,$AA,$A6,$5A,$0A
a_column96_4:
  .db $00,$00,$C0,$CC,$CC,$A5,$5A,$0A
a_column96_5:
  .db $00,$00,$00,$00,$00,$A5,$5A,$0A
a_column96_6:
  .db $00,$00,$00,$33,$FF,$A5,$5A,$0A
a_column96_7:
  .db $00,$00,$00,$00,$00,$40,$50,$0A
a_column96_8:
  .db $00,$00,$00,$22,$22,$02,$80,$08


;;;;;;;;;;;;;;;;;;
background_97:
  .dw column97_1,column97_2,column97_3,column97_4,column97_5,column97_6,column97_7,column97_8
  .dw column97_9,column97_10,column97_11,column97_12,column97_13,column97_14,column97_15,column97_16

column97_1:
  .db $00,$3a,$83,$00,$3b,$83,$00,$2f,$25
column97_2:
  .db $3b,$21,$29,$12,$19,$03,$0b,$84,$13
column97_3:
  .db $00,$22,$2a,$83,$14,$82,$0a,$83,$14
column97_4:
  .db $00,$23,$2b,$12,$1a,$00,$21,$29,$19,$24,$33
column97_5:
  .db $43,$85,$00,$22,$2a,$0a,$82,$14
column97_6:
  .db $38,$00,$21,$29,$12,$19,$23,$2b,$12,$27,$25
column97_7:
  .db $82,$00,$22,$2a,$83,$0a,$82,$14,$82,$0a
column97_8:
  .db $82,$00,$23,$2b,$1a,$21,$29,$12,$19,$2e,$33
column97_9:
  .db $82,$00,$38,$82,$00,$22,$2a,$82,$14,$82,$0a
column97_10:
  .db $00,$21,$29,$12,$19,$23,$2b,$12,$1a,$2e,$26
column97_11:
  .db $00,$22,$2a,$0a,$14,$83,$0a,$14,$82,$0a
column97_12:
  .db $00,$23,$2b,$12,$1a,$00,$04,$84,$0c
column97_13:
  .db $46,$85,$00,$44,$82,$00,$34,$2c
column97_14:
  .db $84,$00,$04,$86,$0c
column97_15:
  .db $82,$00,$04,$88,$0c
column97_16:
  .db $88,$00,$3a,$34,$2c

attrib_97:
  .dw a_column97_1,a_column97_2,a_column97_3,a_column97_4,a_column97_5,a_column97_6,a_column97_7,a_column97_8

a_column97_1:
  .db $00,$00,$00,$00,$80,$88,$A8,$0A
a_column97_2:
  .db $00,$00,$00,$00,$00,$88,$88,$08
a_column97_3:
  .db $00,$00,$00,$00,$00,$AA,$AA,$0A
a_column97_4:
  .db $00,$00,$00,$00,$80,$88,$88,$08
a_column97_5:
  .db $00,$00,$00,$00,$A0,$AA,$AA,$0A
a_column97_6:
  .db $00,$00,$00,$00,$00,$88,$88,$08
a_column97_7:
  .db $00,$00,$00,$00,$88,$88,$A8,$0A
a_column97_8:
  .db $00,$00,$00,$22,$22,$22,$A2,$0A


;;;;;;;;;;;;;;;;;;
background_98:
  .dw column98_1,column98_2,column98_3,column98_4,column98_5,column98_6,column98_7,column98_8
  .dw column98_9,column98_10,column98_11,column98_12,column98_13,column98_14,column98_15,column98_16

column98_1:
  .db $83,$00,$38,$85,$00,$35,$2d
column98_2:
  .db $00,$02,$14,$82,$0a,$14,$82,$0a,$14,$82,$0a
column98_3:
  .db $39,$00,$02,$82,$0a,$1e,$21,$29,$19,$34,$37
column98_4:
  .db $83,$00,$39,$00,$1f,$22,$2a,$83,$0a
column98_5:
  .db $85,$00,$1f,$23,$2b,$12,$24,$26
column98_6:
  .db $39,$04,$83,$0c,$1f,$82,$0c,$1f,$82,$0c
column98_7:
  .db $00,$40,$83,$00,$1f,$21,$29,$1f,$82,$30
column98_8:
  .db $85,$00,$1f,$22,$2a,$1f,$82,$31
column98_9:
  .db $39,$00,$43,$04,$0c,$1f,$82,$0c,$1f,$82,$0c
column98_10:
  .db $00,$39,$83,$00,$1f,$04,$0c,$20,$82,$0c
column98_11:
  .db $00,$03,$0b,$82,$13,$1f,$82,$13,$0b,$82,$13
column98_12:
  .db $84,$00,$03,$1f,$13,$0b,$83,$13
column98_13:
  .db $3b,$84,$00,$20,$00,$22,$2a,$82,$31
column98_14:
  .db $43,$00,$01,$88,$30
column98_15:
  .db $82,$00,$01,$09,$87,$32
column98_16:
  .db $3a,$82,$00,$44,$82,$00,$3d,$82,$00,$34,$25

attrib_98:
  .dw a_column98_1,a_column98_2,a_column98_3,a_column98_4,a_column98_5,a_column98_6,a_column98_7,a_column98_8

a_column98_1:
  .db $00,$00,$00,$00,$00,$00,$20,$02
a_column98_2:
  .db $00,$00,$00,$00,$50,$00,$20,$02
a_column98_3:
  .db $00,$00,$80,$88,$58,$88,$A4,$0A
a_column98_4:
  .db $00,$00,$00,$00,$50,$FF,$F5,$0F
a_column98_5:
  .db $00,$00,$00,$20,$52,$AA,$A5,$0A
a_column98_6:
  .db $00,$00,$20,$22,$5E,$EE,$EE,$0E
a_column98_7:
  .db $00,$00,$00,$00,$10,$30,$33,$03
a_column98_8:
  .db $00,$00,$00,$00,$00,$00,$80,$08


;;;;;;;;;;;;;;;;;;
background_99:
  .dw column99_1,column99_2,column99_3,column99_4,column99_5,column99_6,column99_7,column99_8
  .dw column99_9,column99_10,column99_11,column99_12,column99_13,column99_14,column99_15,column99_16

column99_1:
  .db $89,$00,$35,$37
column99_2:
  .db $82,$00,$01,$88,$30
column99_3:
  .db $00,$01,$82,$09,$87,$32
column99_4:
  .db $3b,$00,$1e,$00,$01,$82,$09,$1b,$83,$09
column99_5:
  .db $82,$00,$1f,$82,$00,$1e,$22,$2a,$1e,$27,$36
column99_6:
  .db $00,$38,$1f,$04,$0c,$1f,$23,$2b,$1f,$1c,$26
column99_7:
  .db $38,$00,$20,$00,$04,$1f,$0c,$1e,$1f,$24,$25
column99_8:
  .db $40,$02,$83,$0a,$1f,$85,$0a
column99_9:
  .db $83,$00,$03,$0b,$1f,$13,$82,$1f,$1c,$2d
column99_10:
  .db $82,$00,$40,$82,$00,$1f,$0c,$82,$1f,$24,$26
column99_11:
  .db $85,$00,$1f,$04,$82,$1f,$27,$33
column99_12:
  .db $00,$04,$83,$0c,$1f,$0c,$82,$1f,$82,$0c
column99_13:
  .db $44,$84,$00,$1f,$21,$29,$1f,$2e,$37
column99_14:
  .db $85,$00,$1f,$22,$2a,$1f,$35,$25
column99_15:
  .db $83,$00,$02,$0a,$14,$82,$0a,$14,$82,$0a
column99_16:
  .db $86,$00,$44,$82,$00,$24,$2c

attrib_99:
  .dw a_column99_1,a_column99_2,a_column99_3,a_column99_4,a_column99_5,a_column99_6,a_column99_7,a_column99_8

a_column99_1:
  .db $00,$00,$00,$00,$00,$00,$20,$02
a_column99_2:
  .db $00,$00,$00,$04,$22,$22,$22,$02
a_column99_3:
  .db $00,$00,$00,$85,$58,$00,$AA,$0A
a_column99_4:
  .db $00,$00,$00,$01,$52,$22,$22,$02
a_column99_5:
  .db $00,$00,$00,$20,$52,$AA,$AA,$0A
a_column99_6:
  .db $00,$00,$C0,$CC,$5C,$AE,$EA,$0E
a_column99_7:
  .db $00,$00,$30,$33,$53,$AA,$AA,$0A
a_column99_8:
  .db $00,$00,$00,$00,$00,$00,$80,$08


;;;;;;;;;;;;;;;;;;
background_100:
  .dw column100_1,column100_2,column100_3,column100_4,column100_5,column100_6,column100_7,column100_8
  .dw column100_9,column100_10,column100_11,column100_12,column100_13,column100_14,column100_15,column100_16

column100_1:
  .db $89,$00,$35,$2d
column100_2:
  .db $84,$00,$01,$83,$09,$11,$34,$37
column100_3:
  .db $43,$05,$15,$0d,$15,$0d,$1d,$09,$11,$82,$30
column100_4:
  .db $84,$00,$22,$2b,$31,$1f,$83,$31
column100_5:
  .db $39,$83,$00,$23,$2b,$32,$1f,$83,$32
column100_6:
  .db $83,$00,$45,$00,$21,$29,$1f,$83,$30
column100_7:
  .db $85,$00,$01,$09,$0a,$83,$09
column100_8:
  .db $3a,$05,$82,$0d,$15,$1d,$11,$1a,$00,$28,$37
column100_9:
  .db $84,$00,$04,$86,$0c
column100_10:
  .db $3c,$82,$00,$03,$0b,$86,$13
column100_11:
  .db $82,$00,$04,$83,$0c,$1f,$0c,$1f,$82,$0c
column100_12:
  .db $85,$00,$04,$1f,$0c,$1f,$82,$0c
column100_13:
  .db $00,$03,$0b,$83,$13,$1f,$13,$1f,$82,$13
column100_14:
  .db $86,$00,$1f,$04,$1f,$82,$0c
column100_15:
  .db $00,$01,$89,$09
column100_16:
  .db $85,$00,$39,$83,$00,$2e,$37

attrib_100:
  .dw a_column100_1,a_column100_2,a_column100_3,a_column100_4,a_column100_5,a_column100_6,a_column100_7,a_column100_8

a_column100_1:
  .db $00,$00,$00,$00,$88,$88,$A8,$0A
a_column100_2:
  .db $00,$00,$20,$22,$EE,$AE,$FE,$0F
a_column100_3:
  .db $00,$00,$00,$00,$F3,$AF,$FF,$0F
a_column100_4:
  .db $00,$00,$80,$88,$A8,$AA,$A2,$0A
a_column100_5:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column100_6:
  .db $00,$00,$00,$22,$E2,$E5,$E5,$0E
a_column100_7:
  .db $00,$00,$20,$22,$22,$E5,$E5,$0E
a_column100_8:
  .db $00,$00,$00,$00,$00,$00,$80,$08


;;;;;;;;;;;;;;;;;;
background_101:
  .dw column101_1,column101_2,column101_3,column101_4,column101_5,column101_6,column101_7,column101_8
  .dw column101_9,column101_10,column101_11,column101_12,column101_13,column101_14,column101_15,column101_16

column101_1:
  .db $39,$86,$00,$39,$00,$1c,$25
column101_2:
  .db $82,$00,$01,$09,$11,$00,$01,$09,$11,$24,$26
column101_3:
  .db $83,$00,$1f,$03,$0b,$13,$1f,$83,$13
column101_4:
  .db $00,$46,$00,$1f,$00,$04,$0c,$1f,$83,$0c
column101_5:
  .db $82,$00,$04,$1f,$83,$0c,$1f,$0c,$1f,$0c
column101_6:
  .db $83,$00,$1f,$04,$82,$0c,$1f,$83,$0c
column101_7:
  .db $83,$00,$20,$03,$0b,$13,$20,$1f,$82,$13
column101_8:
  .db $00,$01,$89,$1b
column101_9:
  .db $83,$00,$22,$2a,$1e,$82,$31,$1e,$82,$31
column101_10:
  .db $00,$3b,$00,$23,$2b,$1f,$82,$32,$1f,$82,$32
column101_11:
  .db $82,$00,$3b,$00,$03,$1f,$82,$13,$1f,$82,$13
column101_12:
  .db $85,$00,$1f,$03,$0b,$1f,$82,$13
column101_13:
  .db $00,$04,$83,$0c,$1f,$0c,$82,$1f,$82,$0c
column101_14:
  .db $83,$00,$01,$82,$09,$11,$83,$1f,$13
column101_15:
  .db $84,$00,$01,$84,$09,$82,$0a
column101_16:
  .db $85,$00,$3b,$83,$00,$1c,$36

attrib_101:
  .dw a_column101_1,a_column101_2,a_column101_3,a_column101_4,a_column101_5,a_column101_6,a_column101_7,a_column101_8

a_column101_1:
  .db $00,$00,$00,$00,$00,$00,$A0,$0A
a_column101_2:
  .db $00,$00,$00,$50,$A2,$5A,$AA,$0A
a_column101_3:
  .db $00,$00,$00,$57,$BB,$5B,$BB,$0B
a_column101_4:
  .db $00,$00,$00,$10,$22,$12,$20,$02
a_column101_5:
  .db $00,$00,$00,$F0,$5F,$FF,$F5,$0F
a_column101_6:
  .db $00,$00,$00,$00,$53,$33,$35,$03
a_column101_7:
  .db $00,$00,$30,$33,$13,$03,$F5,$0F
a_column101_8:
  .db $00,$00,$00,$00,$00,$00,$80,$08


;;;;;;;;;;;;;;;;;;    ;LEVEL 21 ENDS HERE;;
background_102:
  .dw column102_1,column102_2,column102_3,column102_4,column102_5,column102_6,column102_7,column102_8
  .dw column102_9,column102_10,column102_11,column102_12,column102_13,column102_14,column102_15,column102_16

column102_1:
  .db $82,$00,$43,$86,$00,$24,$33
column102_2:
  .db $00,$21,$29,$12,$19,$21,$29,$84,$30
column102_3:
  .db $00,$22,$2a,$0a,$14,$86,$0a
column102_4:
  .db $00,$23,$2b,$12,$1a,$00,$04,$84,$0c
column102_5:
  .db $85,$00,$04,$83,$0c,$1f,$0c
column102_6:
  .db $00,$04,$87,$0c,$1f,$0c
column102_7:
  .db $82,$00,$44,$84,$00,$40,$00,$1f,$26
column102_8:
  .db $84,$00,$05,$82,$0d,$15,$1d,$82,$1b
column102_9:
  .db $82,$00,$05,$82,$0d,$82,$15,$1d,$83,$1b
column102_10:
  .db $83,$00,$3a,$05,$82,$0d,$15,$1d,$82,$1b
column102_11:
  .db $44,$85,$00,$44,$82,$00,$1f,$33
column102_12:
  .db $82,$00,$03,$0b,$87,$13
column102_13:
  .db $86,$00,$03,$0b,$1e,$82,$13
column102_14:
  .db $00,$21,$29,$12,$19,$03,$0b,$13,$1f,$82,$13
column102_15:
  .db $00,$22,$2a,$0a,$14,$86,$0a
column102_16:
  .db $00,$23,$2b,$12,$1a,$00,$03,$0b,$1f,$82,$13

attrib_102:
  .dw a_column102_1,a_column102_2,a_column102_3,a_column102_4,a_column102_5,a_column102_6,a_column102_7,a_column102_8

a_column102_1:
  .db $00,$00,$00,$00,$C0,$CC,$EC,$0E
a_column102_2:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column102_3:
  .db $00,$00,$C0,$CC,$FC,$FF,$0F,$0F
a_column102_4:
  .db $00,$00,$00,$00,$88,$88,$08,$02
a_column102_5:
  .db $00,$00,$00,$22,$AA,$AA,$08,$00
a_column102_6:
  .db $00,$00,$00,$88,$88,$88,$A8,$0A
a_column102_7:
  .db $00,$00,$00,$00,$C0,$FF,$FA,$0F
a_column102_8:
  .db $00,$00,$00,$00,$00,$CC,$C8,$0C


;;;;;;;;;;;;;;;;;;      End of file - Buffer table 
background_103:
  .dw column103_1,column103_2,column103_3,column103_4,column103_5,column103_6,column103_7,column103_8
  .dw column103_9,column103_10,column103_11,column103_12,column103_13,column103_14,column103_15,column103_16

column103_1:
  .db $8A,$00,$00
column103_2:
  .db $8A,$00,$00
column103_3:
  .db $8A,$00,$00
column103_4:
  .db $8A,$00,$00
column103_5:
  .db $8A,$00,$00
column103_6:
  .db $8A,$00,$00
column103_7:
  .db $8A,$00,$00
column103_8:
  .db $8A,$00,$00
column103_9:
  .db $8A,$00,$00
column103_10:
  .db $8A,$00,$00
column103_11:
  .db $8A,$00,$00
column103_12:
  .db $8A,$00,$00
column103_13:
  .db $8A,$00,$00
column103_14:
  .db $8A,$00,$00
column103_15:
  .db $8A,$00,$00
column103_16:
  .db $8A,$00,$00

attrib_103:
  .dw a_column103_1,a_column103_2,a_column103_3,a_column103_4,a_column103_5,a_column103_6,a_column103_7,a_column103_8

a_column103_1:
  .db $00
a_column103_2:
  .db $00
a_column103_3:
  .db $00
a_column103_4:
  .db $00
a_column103_5:
  .db $00
a_column103_6:
  .db $00
a_column103_7:
  .db $00
a_column103_8:
  .db $00


;;;;;;;;;;;;;;;;;;; BOSS 4 - KOGYARU


;;;;;;;;;;;;;;;;;;
background_116:
  .dw column116_1,column116_2,column116_3,column116_4,column116_5,column116_6,column116_7,column116_8
  .dw column116_9,column116_10,column116_11,column116_12,column116_13,column116_14,column116_15,column116_16

column116_1:
  .db $8b,$00
column116_2:
  .db $8b,$00
column116_3:
  .db $8b,$00
column116_4:
  .db $8b,$00
column116_5:
  .db $8b,$00
column116_6:
  .db $8b,$00
column116_7:
  .db $8b,$00
column116_8:
  .db $8b,$00
column116_9:
  .db $8b,$00
column116_10:
  .db $8b,$00
column116_11:
  .db $8b,$00
column116_12:
  .db $8b,$00
column116_13:
  .db $8b,$00
column116_14:
  .db $8b,$00
column116_15:
  .db $8b,$00
column116_16:
  .db $8b,$00

attrib_116:
  .dw a_column116_1,a_column116_2,a_column116_3,a_column116_4,a_column116_5,a_column116_6,a_column116_7,a_column116_8

a_column116_1:
  .db $FF,$FF,$00,$00,$00,$00,$00,$00
a_column116_2:
  .db $FF,$FF,$00,$00,$00,$00,$00,$00
a_column116_3:
  .db $FF,$FF,$00,$00,$00,$00,$00,$00
a_column116_4:
  .db $FF,$FF,$00,$00,$00,$00,$00,$00
a_column116_5:
  .db $FF,$FF,$00,$00,$00,$00,$00,$00
a_column116_6:
  .db $FF,$FF,$00,$00,$00,$00,$00,$00
a_column116_7:
  .db $FF,$FF,$00,$00,$00,$00,$00,$00
a_column116_8:
  .db $FF,$FF,$00,$00,$00,$00,$00,$00


;;;;;;;;;;;;;;;;;;
background_117:
  .dw column117_1,column117_2,column117_3,column117_4,column117_5,column117_6,column117_7,column117_8
  .dw column117_9,column117_10,column117_11,column117_12,column117_13,column117_14,column117_15,column117_16

column117_1:
  .db $8b,$00
column117_2:
  .db $8b,$00
column117_3:
  .db $8b,$00
column117_4:
  .db $8b,$00
column117_5:
  .db $83,$00,$0d,$15,$1b,$23,$83,$00,$00
column117_6:
  .db $00,$01,$07,$0e,$00,$1c,$24,$2b,$83,$00
column117_7:
  .db $00,$02,$08,$0f,$16,$1d,$25,$2c,$30,$00,$00
column117_8:
  .db $00,$03,$09,$10,$17,$1e,$26,$2d,$83,$00
column117_9:
  .db $00,$04,$0a,$11,$18,$1f,$27,$2e,$31,$00,$00
column117_10:
  .db $00,$05,$0b,$12,$19,$20,$28,$2f,$32,$00,$00
column117_11:
  .db $00,$06,$0c,$13,$00,$21,$29,$84,$00
column117_12:
  .db $83,$00,$14,$1a,$22,$2a,$84,$00
column117_13:
  .db $8b,$00
column117_14:
  .db $8b,$00
column117_15:
  .db $8b,$00
column117_16:
  .db $8b,$00

attrib_117:
  .dw a_column117_1,a_column117_2,a_column117_3,a_column117_4,a_column117_5,a_column117_6,a_column117_7,a_column117_8

a_column117_1:
  .db $FF,$FF,$00,$00,$00,$00,$00,$00
a_column117_2:
  .db $FF,$FF,$00,$00,$00,$00,$00,$00
a_column117_3:
  .db $FF,$FF,$00,$00,$00,$00,$00,$00
a_column117_4:
  .db $FF,$FF,$00,$00,%01000101,$00,$00,$00  ;%01000000
a_column117_5:
  .db $FF,$FF,$00,$00,%00010101,$00,$00,$00  ;%00010000
a_column117_6:
  .db $FF,$FF,$00,$00,$00,$00,$00,$00
a_column117_7:
  .db $FF,$FF,$00,$00,$00,$00,$00,$00
a_column117_8:
  .db $FF,$FF,$00,$00,$00,$00,$00,$00


;;;;;;;;;;;;;;;;;;
background_118:
  .dw column118_1,column118_2,column118_3,column118_4,column118_5,column118_6,column118_7,column118_8
  .dw column118_9,column118_10,column118_11,column118_12,column118_13,column118_14,column118_15,column118_16

column118_1:
  .db $8B,$00
column118_2:
  .db $8B,$00
column118_3:
  .db $8B,$00
column118_4:
  .db $8B,$00
column118_5:
  .db $8B,$00
column118_6:
  .db $8B,$00
column118_7:
  .db $8B,$00
column118_8:
  .db $8B,$00
column118_9:
  .db $8B,$00
column118_10:
  .db $8B,$00
column118_11:
  .db $8B,$00
column118_12:
  .db $8B,$00
column118_13:
  .db $8B,$00
column118_14:
  .db $8B,$00
column118_15:
  .db $8B,$00
column118_16:
  .db $8B,$00

attrib_118:
  .dw a_column118_1,a_column118_2,a_column118_3,a_column118_4,a_column118_5,a_column118_6,a_column118_7,a_column118_8

a_column118_1:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column118_2:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column118_3:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column118_4:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column118_5:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column118_6:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column118_7:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column118_8:
  .db $00,$00,$00,$00,$00,$00,$00,$00


;;;;;;;;;;;;;;;;;;
background_119:
  .dw column119_1,column119_2,column119_3,column119_4,column119_5,column119_6,column119_7,column119_8
  .dw column119_9,column119_10,column119_11,column119_12,column119_13,column119_14,column119_15,column119_16

column119_1:
  .db $00,$47,$85,$00,$39,$00,$27,$36
column119_2:
  .db $84,$00,$40,$84,$00,$28,$37
column119_3:
  .db $00,$3d,$84,$00,$3a,$82,$00,$2e,$37
column119_4:
  .db $89,$00,$27,$33
column119_5:
  .db $39,$83,$00,$38,$00,$3c,$82,$00,$34,$2d
column119_6:
  .db $89,$00,$35,$37
column119_7:
  .db $82,$00,$39,$82,$00,$39,$83,$00,$34,$33
column119_8:
  .db $83,$00,$40,$00,$39,$83,$00,$27,$36
column119_9:
  .db $44,$86,$00,$3a,$00,$28,$37
column119_10:
  .db $86,$00,$3a,$82,$00,$24,$25
column119_11:
  .db $82,$00,$43,$86,$00,$27,$33
column119_12:
  .db $00,$39,$87,$00,$27,$2d
column119_13:
  .db $82,$00,$46,$86,$00,$28,$37
column119_14:
  .db $00,$45,$85,$00,$42,$00,$24,$33
column119_15:
  .db $82,$00,$3b,$00,$44,$83,$00,$3b,$28,$36
column119_16:
  .db $86,$00,$42,$3c,$00,$2e,$33

attrib_119:
  .dw a_column119_1,a_column119_2,a_column119_3,a_column119_4,a_column119_5,a_column119_6,a_column119_7,a_column119_8

a_column119_1:
  .db $00,$00,$55,$55,$55,$55,$55,$55
a_column119_2:
  .db $00,$00,$55,$55,$55,$55,$55,$55
a_column119_3:
  .db $00,$00,$55,$55,$55,$55,$55,$55
a_column119_4:
  .db $00,$00,$55,$55,$55,$55,$55,$55
a_column119_5:
  .db $00,$00,$55,$55,$55,$55,$55,$55
a_column119_6:
  .db $00,$00,$55,$55,$55,$55,$55,$55
a_column119_7:
  .db $00,$00,$55,$55,$55,$55,$55,$55
a_column119_8:
  .db $00,$00,$55,$55,$55,$55,$55,$55


;;;;;;;;;;;;;;;;;;
background_120:
  .dw column120_1,column120_2,column120_3,column120_4,column120_5,column120_6,column120_7,column120_8
  .dw column120_9,column120_10,column120_11,column120_12,column120_13,column120_14,column120_15,column120_16

column120_1:
  .db $3a,$82,$00,$3b,$85,$00,$2f,$36
column120_2:
  .db $3b,$00,$39,$38,$85,$00,$34,$37
column120_3:
  .db $86,$00,$3a,$82,$00,$28,$25
column120_4:
  .db $85,$00,$3e,$83,$00,$2e,$37
column120_5:
  .db $82,$00,$3a,$86,$00,$35,$2c
column120_6:
  .db $42,$82,$00,$82,$39,$83,$00,$44,$35,$2d
column120_7:
  .db $89,$00,$27,$26
column120_8:
  .db $00,$39,$00,$41,$82,$00,$41,$82,$00,$34,$33
column120_9:
  .db $84,$00,$3c,$84,$00,$35,$36
column120_10:
  .db $3a,$88,$00,$27,$37
column120_11:
  .db $82,$00,$38,$82,$00,$3a,$83,$00,$28,$37
column120_12:
  .db $00,$44,$00,$3a,$82,$00,$38,$82,$00,$2e,$2c
column120_13:
  .db $87,$00,$3a,$38,$2f,$2d
column120_14:
  .db $89,$00,$35,$26
column120_15:
  .db $82,$00,$3c,$86,$00,$28,$25
column120_16:
  .db $42,$00,$3a,$83,$00,$3b,$00,$42,$2e,$37

attrib_120:
  .dw a_column120_1,a_column120_2,a_column120_3,a_column120_4,a_column120_5,a_column120_6,a_column120_7,a_column120_8

a_column120_1:
  .db $00,$00,$55,$55,$55,$55,$55,$55
a_column120_2:
  .db $00,$00,$55,$55,$55,$55,$55,$55
a_column120_3:
  .db $00,$00,$55,$55,$55,$55,$55,$55
a_column120_4:
  .db $00,$00,$55,$55,$55,$55,$55,$55
a_column120_5:
  .db $00,$00,$55,$55,$55,$55,$55,$55
a_column120_6:
  .db $00,$00,$55,$55,$55,$55,$55,$55
a_column120_7:
  .db $00,$00,$55,$55,$55,$55,$55,$55
a_column120_8:
  .db $00,$00,$55,$55,$55,$55,$55,$55


;;;;;;;;;;;;;;;;;;
background_121:
  .dw column121_1,column121_2,column121_3,column121_4,column121_5,column121_6,column121_7,column121_8
  .dw column121_9,column121_10,column121_11,column121_12,column121_13,column121_14,column121_15,column121_16

column121_1:
  .db $8B,$00
column121_2:
  .db $8B,$00
column121_3:
  .db $8B,$00
column121_4:
  .db $8B,$00
column121_5:
  .db $8B,$00
column121_6:
  .db $8B,$00
column121_7:
  .db $8B,$00
column121_8:
  .db $8B,$00
column121_9:
  .db $8B,$00
column121_10:
  .db $8B,$00
column121_11:
  .db $8B,$00
column121_12:
  .db $8B,$00
column121_13:
  .db $8B,$00
column121_14:
  .db $8B,$00
column121_15:
  .db $8B,$00
column121_16:
  .db $8B,$00

attrib_121:
  .dw a_column121_1,a_column121_2,a_column121_3,a_column121_4,a_column121_5,a_column121_6,a_column121_7,a_column121_8

a_column121_1:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column121_2:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column121_3:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column121_4:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column121_5:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column121_6:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column121_7:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column121_8:
  .db $00,$00,$00,$00,$00,$00,$00,$00


;;;;;TEMPLATE TABLE BELOW;;;;;

;;;;;;;;;;;;;;;;;;
background_0t:
  .dw column0t_1,column0t_2,column0t_3,column0t_4,column0t_5,column0t_6,column0t_7,column0t_8
  .dw column0t_9,column0t_10,column0t_11,column0t_12,column0t_13,column0t_14,column0t_15,column0t_16

column0t_1:
  .db $8A,$00,$00
column0t_2:
  .db $8A,$00,$00
column0t_3:
  .db $8A,$00,$00
column0t_4:
  .db $8A,$00,$00
column0t_5:
  .db $8A,$00,$00
column0t_6:
  .db $8A,$00,$00
column0t_7:
  .db $8A,$00,$00
column0t_8:
  .db $8A,$00,$00
column0t_9:
  .db $8A,$00,$00
column0t_10:
  .db $8A,$00,$00
column0t_11:
  .db $8A,$00,$00
column0t_12:
  .db $8A,$00,$00
column0t_13:
  .db $8A,$00,$00
column0t_14:
  .db $8A,$00,$00
column0t_15:
  .db $8A,$00,$00
column0t_16:
  .db $8A,$00,$00

attrib_0t:
  .dw a_column0t_1,a_column0t_2,a_column0t_3,a_column0t_4,a_column0t_5,a_column0t_6,a_column0t_7,a_column0t_8

a_column0t_1:
  .db $00
a_column0t_2:
  .db $00
a_column0t_3:
  .db $00
a_column0t_4:
  .db $00
a_column0t_5:
  .db $00
a_column0t_6:
  .db $00
a_column0t_7:
  .db $00
a_column0t_8:
  .db $00


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

init_pb_attr18:
  .db $00,$00,$00,$00,$00
init_pb_attr19:
  .db $00,$00,$00,$00,$00
init_pb_attr20:
  .db $00,$00,$00,$00,$00
init_pb_attr21:
  .db $00,$00,$00,$00,$00
init_pb_attr22:
  .db $00,$00,$00,$00,$00
init_pb_attr23:
  .db $FF,$FF,$FF,$FF,$FF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Palette data for ALL levels goes in background1.i
