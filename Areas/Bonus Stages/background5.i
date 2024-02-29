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
background_104:
  .dw column104_1,column104_2,column104_3,column104_4,column104_5,column104_6,column104_7,column104_8
  .dw column104_9,column104_10,column104_11,column104_12,column104_13,column104_14,column104_15,column104_16

column104_1:
  .db $8B,$00
column104_2:
  .db $8B,$00
column104_3:
  .db $8B,$00
column104_4:
  .db $8B,$00
column104_5:
  .db $8B,$00
column104_6:
  .db $8B,$00
column104_7:
  .db $8B,$00
column104_8:
  .db $8B,$00
column104_9:
  .db $8B,$00
column104_10:
  .db $8B,$00
column104_11:
  .db $8B,$00
column104_12:
  .db $8B,$00
column104_13:
  .db $8B,$00
column104_14:
  .db $8B,$00
column104_15:
  .db $8B,$00
column104_16:
  .db $8B,$00

attrib_104:
  .dw a_column104_1,a_column104_2,a_column104_3,a_column104_4,a_column104_5,a_column104_6,a_column104_7,a_column104_8

a_column104_1:
  .db $00
a_column104_2:
  .db $00
a_column104_3:
  .db $00
a_column104_4:
  .db $00
a_column104_5:
  .db $00
a_column104_6:
  .db $00
a_column104_7:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column104_8:
  .db $00,$00,$00,$00,$00,$00,$00,$00


;;;;;;;;;;;;;;;;;;    ;COW LEVEL BEGINS HERE;;
background_105:
  .dw column105_1,column105_2,column105_3,column105_4,column105_5,column105_6,column105_7,column105_8
  .dw column105_9,column105_10,column105_11,column105_12,column105_13,column105_14,column105_15,column105_16

column105_1:
  .byte $89,$00,$20,$00
column105_2:
  .byte $86,$00,$28,$82,$00,$21,$00
column105_3:
  .byte $83,$00,$2a,$82,$00,$01,$07,$0e,$16,$00
column105_4:
  .byte $86,$00,$02,$08,$0f,$17,$00
column105_5:
  .byte $86,$00,$03,$09,$10,$18,$00
column105_6:
  .byte $86,$00,$04,$0a,$11,$19,$00
column105_7:
  .byte $00,$29,$84,$00,$04,$0b,$12,$1a,$00
column105_8:
  .byte $86,$00,$05,$0b,$13,$1b,$00
column105_9:
  .byte $86,$00,$06,$0c,$14,$1c,$00
column105_10:
  .byte $00,$2a,$85,$00,$0d,$15,$1d,$00
column105_11:
  .byte $85,$00,$29,$83,$00,$22,$00
column105_12:
  .byte $82,$00,$26,$2c,$85,$00,$23,$00
column105_13:
  .byte $82,$00,$27,$2d,$00,$1e,$84,$24,$00
column105_14:
  .byte $85,$00,$1f,$84,$25,$00
column105_15:
  .byte $89,$00,$20,$00
column105_16:
  .byte $89,$00,$21,$00

attrib_105:
  .dw a_column105_1,a_column105_2,a_column105_3,a_column105_4,a_column105_5,a_column105_6,a_column105_7,a_column105_8

a_column105_1:
  .db $FF,$FF,$00,$00,$00,$00,$A0,$00
a_column105_2:
  .db $FF,$FF,$00,$00,$00,$55,$55,$00
a_column105_3:
  .db $FF,$FF,$00,$00,$00,$55,$55,$00
a_column105_4:
  .db $FF,$FF,$00,$00,$00,$55,$55,$00
a_column105_5:
  .db $FF,$FF,$00,$00,$00,$51,$55,$00
a_column105_6:
  .db $FF,$FF,$00,$00,$00,$00,$A0,$00
a_column105_7:
  .db $FF,$FF,$00,$00,$00,$00,$00,$00
a_column105_8:
  .db $FF,$FF,$00,$00,$00,$00,$A0,$00


;;;;;;;;;;;;;;;;;;
background_106:
  .dw column106_1,column106_2,column106_3,column106_4,column106_5,column106_6,column106_7,column106_8
  .dw column106_9,column106_10,column106_11,column106_12,column106_13,column106_14,column106_15,column106_16

column106_1:
  .byte $85,$00,$2b,$83,$00,$22,$00
column106_2:
  .byte $85,$00,$01,$07,$82,$0e,$16,$00
column106_3:
  .byte $00,$28,$83,$00,$02,$08,$1b,$0f,$17,$00
column106_4:
  .byte $85,$00,$03,$09,$1c,$10,$18,$00
column106_5:
  .byte $85,$00,$04,$0a,$82,$11,$19,$00
column106_6:
  .byte $83,$00,$2a,$00,$04,$0b,$10,$12,$1a,$00
column106_7:
  .byte $85,$00,$05,$0b,$1b,$13,$1b,$00
column106_8:
  .byte $85,$00,$06,$0c,$10,$14,$1c,$00
column106_9:
  .byte $00,$2b,$84,$00,$0d,$82,$15,$1d,$00
column106_10:
  .byte $82,$00,$2b,$83,$00,$2a,$82,$00,$23,$00
column106_11:
  .byte $89,$00,$20,$00
column106_12:
  .byte $84,$00,$1e,$85,$24,$00
column106_13:
  .byte $00,$2a,$82,$00,$1f,$85,$25,$00
column106_14:
  .byte $85,$00,$1e,$84,$24,$00
column106_15:
  .byte $83,$00,$2a,$00,$1f,$84,$25,$00
column106_16:
  .byte $88,$00,$2a,$21,$00

attrib_106:
  .dw a_column106_1,a_column106_2,a_column106_3,a_column106_4,a_column106_5,a_column106_6,a_column106_7,a_column106_8

a_column106_1:
  .db $FF,$FF,$00,$00,$64,$66,$66,$00
a_column106_2:
  .db $FF,$FF,$00,$00,$50,$55,$55,$00
a_column106_3:
  .db $FF,$FF,$00,$00,$50,$55,$55,$00
a_column106_4:
  .db $FF,$FF,$00,$00,$50,$55,$55,$00
a_column106_5:
  .db $FF,$FF,$00,$00,$10,$11,$91,$00
a_column106_6:
  .db $FF,$FF,$00,$00,$00,$00,$20,$00
a_column106_7:
  .db $FF,$FF,$00,$00,$00,$00,$00,$00
a_column106_8:
  .db $FF,$FF,$00,$00,$00,$00,$80,$00


;;;;;;;;;;;;;;;;;;
background_107:
  .dw column107_1,column107_2,column107_3,column107_4,column107_5,column107_6,column107_7,column107_8
  .dw column107_9,column107_10,column107_11,column107_12,column107_13,column107_14,column107_15,column107_16

column107_1:
  .byte $89,$00,$22,$00
column107_2:
  .byte $2a,$84,$00,$28,$83,$00,$23,$00
column107_3:
  .byte $84,$00,$2b,$84,$00,$20,$00
column107_4:
  .byte $89,$00,$21,$00
column107_5:
  .byte $84,$00,$1e,$85,$24,$00
column107_6:
  .byte $84,$00,$1f,$85,$25,$00
column107_7:
  .byte $85,$00,$1e,$84,$24,$00
column107_8:
  .byte $00,$29,$83,$00,$1f,$84,$25,$00
column107_9:
  .byte $88,$00,$02,$17,$00
column107_10:
  .byte $85,$00,$29,$82,$00,$03,$09,$00
column107_11:
  .byte $82,$00,$2a,$85,$00,$04,$0a,$00
column107_12:
  .byte $88,$00,$05,$0b,$00
column107_13:
  .byte $29,$84,$00,$2a,$82,$00,$06,$0b,$00
column107_14:
  .byte $86,$00,$29,$82,$00,$0d,$00
column107_15:
  .byte $89,$00,$22,$00
column107_16:
  .byte $83,$00,$2a,$85,$00,$23,$00

attrib_107:
  .dw a_column107_1,a_column107_2,a_column107_3,a_column107_4,a_column107_5,a_column107_6,a_column107_7,a_column107_8

a_column107_1:
  .db $00,$00,$00,$00,$00,$00,$A0,$00
a_column107_2:
  .db $00,$00,$00,$00,$00,$00,$A0,$00
a_column107_3:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column107_4:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column107_5:
  .db $00,$00,$00,$00,$00,$00,$55,$00
a_column107_6:
  .db $00,$00,$00,$00,$00,$00,$55,$00
a_column107_7:
  .db $00,$00,$00,$00,$00,$00,$55,$00
a_column107_8:
  .db $00,$00,$00,$00,$00,$00,$A0,$00


;;;;;;;;;;;;;;;;;;    ;COW LEVEL ENDS HERE;;
background_108:
  .dw column108_1,column108_2,column108_3,column108_4,column108_5,column108_6,column108_7,column108_8
  .dw column108_9,column108_10,column108_11,column108_12,column108_13,column108_14,column108_15,column108_16

column108_1:
  .byte $87,$00,$29,$00,$20,$00
column108_2:
  .byte $89,$00,$21,$00
column108_3:
  .byte $00,$29,$83,$00,$2a,$83,$00,$22,$00
column108_4:
  .byte $89,$00,$23,$00
column108_5:
  .byte $82,$00,$2b,$86,$00,$20,$00
column108_6:
  .byte $85,$00,$01,$07,$82,$0e,$16,$00
column108_7:
  .byte $85,$00,$02,$08,$82,$0f,$17,$00
column108_8:
  .byte $00,$29,$83,$00,$03,$09,$82,$10,$18,$00
column108_9:
  .byte $85,$00,$04,$0a,$82,$11,$19,$00
column108_10:
  .byte $85,$00,$05,$0b,$14,$12,$1b,$00
column108_11:
  .byte $84,$00,$29,$06,$0b,$12,$14,$1c,$00
column108_12:
  .byte $86,$00,$0d,$82,$15,$1d,$00
column108_13:
  .byte $00,$2a,$00,$1e,$86,$24,$00
column108_14:
  .byte $83,$00,$1f,$86,$25,$00
column108_15:
  .byte $83,$00,$1e,$86,$24,$00
column108_16:
  .byte $83,$00,$1f,$86,$25,$00

attrib_108:
  .dw a_column108_1,a_column108_2,a_column108_3,a_column108_4,a_column108_5,a_column108_6,a_column108_7,a_column108_8

a_column108_1:
  .db $00,$00,$00,$00,$00,$00,$A0,$00
a_column108_2:
  .db $00,$00,$00,$00,$00,$00,$A0,$00
a_column108_3:
  .db $00,$00,$00,$00,$40,$44,$64,$00
a_column108_4:
  .db $00,$00,$00,$00,$50,$55,$55,$00
a_column108_5:
  .db $00,$00,$00,$00,$50,$55,$55,$00
a_column108_6:
  .db $00,$00,$00,$00,$50,$55,$55,$00
a_column108_7:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column108_8:
  .db $00,$00,$00,$00,$00,$00,$00,$00


;;;;;;;;;;;;;;;;;;    ;CAMPOUT LEVEL BEGINS HERE;;
background_109:
  .dw column109_1,column109_2,column109_3,column109_4,column109_5,column109_6,column109_7,column109_8
  .dw column109_9,column109_10,column109_11,column109_12,column109_13,column109_14,column109_15,column109_16

column109_1:
  .db $8A,$00,$00
column109_2:
  .db $8A,$00,$00
column109_3:
  .db $8A,$00,$00
column109_4:
  .db $8A,$00,$00
column109_5:
  .db $8A,$00,$00
column109_6:
  .db $8A,$00,$00
column109_7:
  .db $8A,$00,$00
column109_8:
  .db $8A,$00,$00
column109_9:
  .db $8A,$00,$00
column109_10:
  .db $8A,$00,$00
column109_11:
  .db $8A,$00,$00
column109_12:
  .db $8A,$00,$00
column109_13:
  .db $8A,$00,$00
column109_14:
  .db $8A,$00,$00
column109_15:
  .db $8A,$00,$00
column109_16:
  .db $8A,$00,$00

attrib_109:
  .dw a_column109_1,a_column109_2,a_column109_3,a_column109_4,a_column109_5,a_column109_6,a_column109_7,a_column109_8

a_column109_1:
  .db $00,$00,$FF,$FF,$FF,$FF,$00,$00
a_column109_2:
  .db $00,$00,$FF,$FF,$FF,$FF,$00,$00
a_column109_3:
  .db $00,$00,$FF,$FF,$FF,$FF,$00,$00
a_column109_4:
  .db $00,$00,$FF,$FF,$FF,$FF,$00,$00
a_column109_5:
  .db $00,$00,$FF,$FF,$FF,$FF,$00,$00
a_column109_6:
  .db $00,$00,$FF,$FF,$FF,$FF,$00,$00
a_column109_7:
  .db $00,$00,$FF,$FF,$FF,$FF,$00,$00
a_column109_8:
  .db $00,$00,$FF,$FF,$FF,$FF,$00,$00


;;;;;;;;;;;;;;;;;;
background_110:
  .dw column110_1,column110_2,column110_3,column110_4,column110_5,column110_6,column110_7,column110_8
  .dw column110_9,column110_10,column110_11,column110_12,column110_13,column110_14,column110_15,column110_16

column110_1:
  .db $8A,$00,$00
column110_2:
  .db $8A,$00,$00
column110_3:
  .db $8A,$00,$00
column110_4:
  .db $8A,$00,$00
column110_5:
  .db $8A,$00,$00
column110_6:
  .db $8A,$00,$00
column110_7:
  .db $8A,$00,$00
column110_8:
  .db $8A,$00,$00
column110_9:
  .db $8A,$00,$00
column110_10:
  .db $8A,$00,$00
column110_11:
  .db $8A,$00,$00
column110_12:
  .db $8A,$00,$00
column110_13:
  .db $8A,$00,$00
column110_14:
  .db $8A,$00,$00
column110_15:
  .db $8A,$00,$00
column110_16:
  .db $8A,$00,$00

attrib_110:
  .dw a_column110_1,a_column110_2,a_column110_3,a_column110_4,a_column110_5,a_column110_6,a_column110_7,a_column110_8

a_column110_1:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column110_2:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column110_3:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column110_4:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column110_5:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column110_6:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column110_7:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column110_8:
  .db $00,$00,$00,$00,$00,$00,$00,$00


;;;;;;;;;;;;;;;;;;    ;CAMPOUT LEVEL ENDS HERE;;
background_111:
  .dw column111_1,column111_2,column111_3,column111_4,column111_5,column111_6,column111_7,column111_8
  .dw column111_9,column111_10,column111_11,column111_12,column111_13,column111_14,column111_15,column111_16

column111_1:
  .db $8A,$00,$00
column111_2:
  .db $8A,$00,$00
column111_3:
  .db $8A,$00,$00
column111_4:
  .db $8A,$00,$00
column111_5:
  .db $8A,$00,$00
column111_6:
  .db $8A,$00,$00
column111_7:
  .db $8A,$00,$00
column111_8:
  .db $8A,$00,$00
column111_9:
  .db $8A,$00,$00
column111_10:
  .db $8A,$00,$00
column111_11:
  .db $8A,$00,$00
column111_12:
  .db $8A,$00,$00
column111_13:
  .db $8A,$00,$00
column111_14:
  .db $8A,$00,$00
column111_15:
  .db $8A,$00,$00
column111_16:
  .db $8A,$00,$00

attrib_111:
  .dw a_column111_1,a_column111_2,a_column111_3,a_column111_4,a_column111_5,a_column111_6,a_column111_7,a_column111_8

a_column111_1:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column111_2:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column111_3:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column111_4:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column111_5:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column111_6:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column111_7:
  .db $00,$00,$00,$00,$00,$00,$00,$00
a_column111_8:
  .db $00,$00,$00,$00,$00,$00,$00,$00


;;;;;;;;;;;;;;;;;;      End of file - Buffer table 
background_112:
  .dw column112_1,column112_2,column112_3,column112_4,column112_5,column112_6,column112_7,column112_8
  .dw column112_9,column112_10,column112_11,column112_12,column112_13,column112_14,column112_15,column112_16

column112_1:
  .db $8A,$00,$00
column112_2:
  .db $8A,$00,$00
column112_3:
  .db $8A,$00,$00
column112_4:
  .db $8A,$00,$00
column112_5:
  .db $8A,$00,$00
column112_6:
  .db $8A,$00,$00
column112_7:
  .db $8A,$00,$00
column112_8:
  .db $8A,$00,$00
column112_9:
  .db $8A,$00,$00
column112_10:
  .db $8A,$00,$00
column112_11:
  .db $8A,$00,$00
column112_12:
  .db $8A,$00,$00
column112_13:
  .db $8A,$00,$00
column112_14:
  .db $8A,$00,$00
column112_15:
  .db $8A,$00,$00
column112_16:
  .db $8A,$00,$00

attrib_112:
  .dw a_column112_1,a_column112_2,a_column112_3,a_column112_4,a_column112_5,a_column112_6,a_column112_7,a_column112_8

a_column112_1:
  .db $00
a_column112_2:
  .db $00
a_column112_3:
  .db $00
a_column112_4:
  .db $00
a_column112_5:
  .db $00
a_column112_6:
  .db $00
a_column112_7:
  .db $00
a_column112_8:
  .db $00


;;;;;TEMPLATE TABLE BELOW;;;;;

;;;;;;;;;;;;;;;;;;
background_0u:
  .dw column0u_1,column0u_2,column0u_3,column0u_4,column0u_5,column0u_6,column0u_7,column0u_8
  .dw column0u_9,column0u_10,column0u_11,column0u_12,column0u_13,column0u_14,column0u_15,column0u_16

column0u_1:
  .db $8A,$00,$00
column0u_2:
  .db $8A,$00,$00
column0u_3:
  .db $8A,$00,$00
column0u_4:
  .db $8A,$00,$00
column0u_5:
  .db $8A,$00,$00
column0u_6:
  .db $8A,$00,$00
column0u_7:
  .db $8A,$00,$00
column0u_8:
  .db $8A,$00,$00
column0u_9:
  .db $8A,$00,$00
column0u_10:
  .db $8A,$00,$00
column0u_11:
  .db $8A,$00,$00
column0u_12:
  .db $8A,$00,$00
column0u_13:
  .db $8A,$00,$00
column0u_14:
  .db $8A,$00,$00
column0u_15:
  .db $8A,$00,$00
column0u_16:
  .db $8A,$00,$00

attrib_0u:
  .dw a_column0u_1,a_column0u_2,a_column0u_3,a_column0u_4,a_column0u_5,a_column0u_6,a_column0u_7,a_column0u_8

a_column0u_1:
  .db $00
a_column0u_2:
  .db $00
a_column0u_3:
  .db $00
a_column0u_4:
  .db $00
a_column0u_5:
  .db $00
a_column0u_6:
  .db $00
a_column0u_7:
  .db $00
a_column0u_8:
  .db $00


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

init_pb_attr24:
  .db $FF,$FF,$FF,$FF,$FF
init_pb_attr25:
  .db $FF,$FF,$FF,$FF,$FF


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Palette data for ALL levels goes in background1.i
