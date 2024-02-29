;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;
;;Palettes
;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;
;fade palettes

Fade_tables:
  .dw Fade_Pal00,Fade_Pal01,Fade_Pal02,Fade_Pal03,Fade_Pal04
  .dw Fade_Pal05,Fade_Pal06,Fade_Pal07,Fade_Pal08,Fade_Pal09
  .dw CR_Fade_Pal00

Fade_Pal00:
  .db $1D,$1E,$1E,$01, $1D,$08,$09,$0B, $1D,$1E,$0C,$10, $1D,$1E,$00,$10   ;palette for earth
  .db $1D,$1E,$1E,$11, $1D,$18,$19,$1B, $1D,$01,$1C,$20, $1D,$1E,$10,$20   ;and lazy American kid
  .db $1D,$1E,$1E,$21, $1D,$28,$39,$2B, $1D,$01,$2C,$30, $1D,$00,$10,$30,$FF
;$06,$08,$38

Fade_Pal01:
  .db $1D,$1E,$1E,$01, $1D,$08,$09,$0B, $1D,$1E,$07,$13, $1D,$1E,$1E,$07    ;palette for kogaru pic
  .db $1D,$1E,$1E,$11, $1D,$18,$19,$1B, $1D,$03,$05,$23, $1D,$1E,$1E,$05
  .db $1D,$1E,$1E,$21, $1D,$28,$39,$2B, $1D,$13,$15,$33, $1D,$1E,$1E,$15,$FF

Fade_Pal02:
  .db $1D,$1E,$1E,$01, $1D,$08,$09,$0B, $1D,$07,$07,$18, $1D,$1E,$00,$18    ;palette for missiles
  .db $1D,$1E,$1E,$11, $1D,$18,$19,$1B, $1D,$05,$17,$28, $1D,$0B,$10,$28
  .db $1D,$1E,$1E,$21, $1D,$28,$39,$2B, $1D,$15,$27,$38, $1D,$0B,$3D,$38,$FF

Fade_Pal03:
  .db $1D,$1E,$1E,$09, $1D,$1E,$1E,$0A, $1D,$1E,$01,$18, $1D,$1E,$1E,$18
  .db $1D,$1E,$1E,$19, $1D,$1E,$09,$1A, $1D,$1E,$11,$28, $1D,$1E,$08,$28
  .db $1D,$1E,$1E,$29, $1D,$0B,$19,$2A, $1D,$08,$21,$38, $1D,$08,$18,$38,$FF ;palette for secret weapon

Fade_Pal04:
  ;;fill in first two rows
  ;;  text             ;;border/fuji    ;;cherry trees   ;;pagoda
  .db $1D,$1E,$1E,$08, $1D,$1E,$02,$00, $1D,$1E,$1E,$06, $1D,$1E,$1E,$01
  .db $1D,$1E,$1E,$18, $1D,$1E,$12,$10, $1D,$1E,$05,$16, $1D,$1E,$1E,$11
  .db $1D,$1E,$1E,$28, $1D,$07,$22,$30, $1D,$06,$15,$36, $1D,$02,$05,$31,$FF ;palette for asia scenery

Fade_Pal05:
  .db $1D,$1E,$1E,$13, $1D,$1E,$11,$03, $1D,$1E,$11,$07, $1D,$1E,$1E,$1E
  .db $1D,$1E,$1E,$23, $1D,$1E,$21,$13, $1D,$1E,$21,$17, $1D,$2D,$01,$2D
  .db $1D,$1E,$1E,$33, $1D,$03,$31,$23, $1D,$03,$31,$27, $1D,$00,$0C,$3D,$FF ;palette for Godzilla & Mecha_Stalin Face

Fade_Pal06:
  .db $1D,$1E,$1E,$05, $1D,$1E,$1E,$08, $1D,$07,$1E,$08, $1D,$06,$1E,$00
  .db $1D,$1E,$1E,$15, $1D,$1E,$06,$18, $1D,$17,$06,$18, $1D,$16,$07,$10
  .db $1D,$1E,$1E,$25, $1D,$06,$16,$28, $1D,$27,$16,$28, $1D,$26,$17,$30,$FF ;palette for Soviet Scenery

Fade_Pal07:
  .db $1D,$1E,$1E,$03, $1D,$1E,$1E,$07, $1D,$1E,$02,$3C, $1D,$1E,$1E,$1E
  .db $1D,$1E,$1E,$13, $1D,$1E,$04,$17, $1D,$2D,$12,$3C, $1D,$02,$05,$1E
  .db $1D,$1E,$1E,$23, $1D,$03,$14,$27, $1D,$00,$32,$3C, $1D,$03,$06,$1E,$FF ;palette for Moon & Kogy Megaship

Fade_Pal08:
  .db $1D,$1E,$1E,$03, $1D,$1E,$1E,$07, $1D,$1E,$01,$01, $1D,$1E,$1E,$01
  .db $1D,$1E,$1E,$13, $1D,$1E,$04,$17, $1D,$1E,$11,$11, $1D,$03,$05,$11
  .db $1D,$1E,$1E,$23, $1D,$03,$14,$27, $1D,$08,$21,$31, $1D,$13,$15,$31,$FF ;palette for Ossan chasing Kogy

Fade_Pal09:
  .db $1D,$1E,$1E,$03, $1D,$1E,$07,$1E, $1D,$08,$1E,$0B, $1D,$00,$1E,$10
  .db $1D,$1E,$1E,$13, $1D,$06,$17,$08, $1D,$18,$07,$2B, $1D,$10,$05,$20
  .db $1D,$1E,$1E,$23, $1D,$16,$27,$18, $1D,$28,$17,$3B, $1D,$06,$15,$30,$FF ;palette for Party Ball & US Map


;;;;Credits Background Palettes

CR_Fade_Pal00:
  .db $1D,$1E,$1E,$08,  $1D,$1E,$1E,$09,  $1D,$1E,$0D,$1E,  $1D,$1E,$1E,$1E
  .db $1D,$1E,$1E,$18,  $1D,$1E,$07,$19,  $1D,$1E,$1D,$10,  $1D,$0C,$1E,$1E
  .db $1D,$1E,$1E,$38,  $1D,$06,$17,$39,  $1D,$08,$3D,$20,  $1D,$1C,$0C,$0B,$FF


;fade constants
fade_pal00 = $00
fade_pal01 = $01
fade_pal02 = $02
fade_pal03 = $03
fade_pal04 = $04
fade_pal05 = $05
fade_pal06 = $06
fade_pal07 = $07
fade_pal08 = $08
fade_pal09 = $09
CRfade_pal00 = $0A

;;;;;;;;;;;;;;;;;;
;constant palettes
CS_pal_basic_txt:
  .db $1D,$1E,$1E,$30


;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;
;;Images
;;;;;;;;;;;;;;;;;;;;;

Cutscene_Pic_Index:
  .dw Cutscene_PicKILL
  .dw Cutscene_PicA, Cutscene_PicB, Cutscene_PicC, Cutscene_PicD
  .dw Cutscene_PicE, Cutscene_PicF, Cutscene_PicG, Cutscene_PicH
  .dw Cutscene_PicI, Cutscene_PicJ, Cutscene_PicK, Cutscene_PicL
  .dw Cutscene_PicM, Cutscene_PicN

Cutscene_Pic_Attribute_Index:
  .dw Cutscene_PicKILL_attributes
  .dw Cutscene_PicA_attributes, Cutscene_PicB_attributes
  .dw Cutscene_PicC_attributes, Cutscene_PicD_attributes
  .dw Cutscene_PicE_attributes, Cutscene_PicF_attributes
  .dw Cutscene_PicK_attributes

Cutscene_PicKILL:
  .dw picKILL_row1,picKILL_row2,picKILL_row3,picKILL_row4,picKILL_row5
  .dw picKILL_row6,picKILL_row7,picKILL_row8,picKILL_row9,picKILL_row10

picKILL_row1:
  .db pic_rpt,$12,$00
picKILL_row2:
  .db pic_rpt,$12,$00
picKILL_row3:
  .db pic_rpt,$12,$00
picKILL_row4:
  .db pic_rpt,$12,$00
picKILL_row5:
  .db pic_rpt,$12,$00
picKILL_row6:
  .db pic_rpt,$12,$00
picKILL_row7:
  .db pic_rpt,$12,$00
picKILL_row8:
  .db pic_rpt,$12,$00
picKILL_row9:
  .db pic_rpt,$12,$00
picKILL_row10:
  .db pic_rpt,$12,$00

Cutscene_PicKILL_attributes:
  .db $00,$00,$00,$00
  .db $00,$00,$00,$00



Cutscene_PicA:          ;;Cutscene 1 - The Earth;;
  .dw picA_row1,picA_row2,picA_row3,picA_row4,picA_row5
  .dw picA_row6,picA_row7,picA_row8,picA_row9,picA_row10

picA_row1:
  .db $02, pic_rpt,$08,$03, pic_rpt,$08,$04, $05
picA_row2:
  .db $06,$07, pic_rpt,$0E,$00, $08,$09 
picA_row3:
  .db $06, pic_rpt,$10,$00, $09 
picA_row4:
  .db $06, pic_rpt,$0E,$00, $2C, $00,$09
picA_row5:
  .db $06, pic_rpt,$08,$00, $10,$11,$12,$13,$14,$15, $00,$00,$09
picA_row6:
  .db $06, pic_rpt,$04,$00, $2C, $00,$00, $2C, $16,$17,$18,$19,$1A,$1B, $00,$00, $09
picA_row7:
  .db $06, pic_rpt,$08,$00, $1C,$1D,$1E,$1F,$20,$21, $00,$00, $09
picA_row8:
  .db $06, pic_rpt,$08,$00, $22,$23,$24,$25,$26,$27, $00, $2C, $09
picA_row9:
  .db $06,$0A, $00,$2C, pic_rpt,$06,$00, $28,$29,$2A,$2B, $00,$00, $0B,$09
picA_row10:
  .db $0C, pic_rpt,$08,$0D, pic_rpt,$08,$0E, $0F

Cutscene_PicA_attributes:
  .db $AA,$AA,$AA,$AA
  .db $AA,$AA,$AA,$AA


Cutscene_PicB:          ;;Cutscene 1 - Missiles;;
  .dw picB_row1,picB_row2,picB_row3,picB_row4,picB_row5
  .dw picB_row6,picB_row7,picB_row8,picB_row9,picB_row10

picB_row1:
  .db $02, pic_rpt,$08,$03, pic_rpt,$08,$04, $05
picB_row2:
  .db $06,$07, pic_rpt,$07,$00, $2D,$2E,$2F,$30, pic_rpt,$03,$00, $08,$09 
picB_row3:
  .db $06, pic_rpt,$08,$00, $31,$32,$33,$34,$35, pic_rpt,$03,$00,  $09
picB_row4:
  .db $06, pic_rpt,$05,$00, $36,$37,$38, $00, $39,$3A,$3B,$3C,$3D,$3E, $00, $09
picB_row5:
  .db $06, $3F, $00, $40,$41,$42,$43,$44,$45, $00, $46,$47,$48,$49,$4A,$4B,$4C, $09
picB_row6:
  .db $06, $4D,$4E,$4F,$50,$51,$52, pic_rpt,$05,$00, $53,$54,$55,$56,$57, $09
picB_row7:
  .db $06, $58,$59,$5A,$5B,$5C,$5D, pic_rpt,$05,$00, $46,$5F,$60,$61,$62, $09
picB_row8:
  .db $06, $63,$64,$65,$66,$67, pic_rpt,$07,$00, $68,$69,$6A,$6B, $09
picB_row9:
  .db $06, $6C,$6D,$6E, pic_rpt,$0C,$00, $6F,$09
picB_row10:
  .db $0C, pic_rpt,$08,$0D, pic_rpt,$08,$0E, $0F

Cutscene_PicB_attributes:
  .db $AA,$AA,$FF,$FF
  .db $AA,$AA,$FF,$FF


Cutscene_PicC:          ;;Cutscene 1 - Where is Kogyaru?;;
  .dw picC_row1,picC_row2,picC_row3,picC_row4,picC_row5
  .dw picC_row6,picC_row7,picC_row8,picC_row9,picC_row10

picC_row1:
  .db $02, pic_rpt,$08,$03, pic_rpt,$08,$04, $05
picC_row2:
  .db $06, pic_rpt,$05,$00, $5E,$70, pic_rpt,$04,$00, $71,$72,$73,$74, $00,$09 
;  .db $06,$07, pic_rpt,$04,$00, $5E,$70, pic_rpt,$04,$00, $71,$72,$73,$74, $08,$09 
picC_row3:
  .db $06, $75,$76,$77,$78, $00, $79,$7A, $00,$00, $7B,$7C,$7D,$7E,$7F,$80, $00, $09
picC_row4:
  .db $06, $81,$82,$83,$84,$85,$86, pic_rpt,$03,$00, $87,$88,$89,$8A,$8B,$8C, $00, $09
picC_row5:
  .db $06, $00, $8D,$8E,$8F,$90,$91,$92, $00,$00, $93,$94,$95,$96,$97,$98, $00, $09
picC_row6:
  .db $06, $00,$00, $99,$9A,$9B,$9C, pic_rpt,$04,$00, $9D,$9E,$9F,$A0, $00,$00, $09
picC_row7:
  .db $06, $00, $A1,$A2,$A3,$A4,$A5,$A6, pic_rpt,$03,$00, $A7,$A8, pic_rpt,$04,$00, $09
picC_row8:
  .db $06, $00, $A9,$AA, $00,$00, $AB,$AC, pic_rpt,$03,$00, $AD,$AE, pic_rpt,$04,$00, $09
picC_row9:
  .db $06, pic_rpt,$0B,$00, $AF, pic_rpt,$04,$00, $09
;  .db $06,$0A, pic_rpt,$0A,$00, $AF, pic_rpt,$03,$00, $0B,$09
picC_row10:
  .db $0C, pic_rpt,$08,$0D, pic_rpt,$08,$0E, $0F

Cutscene_PicC_attributes:
  .db $AA,$AA,$FF,$FF
  .db $AA,$AA,$FF,$FF


Cutscene_PicD:            ;;Cutscene 1 - Fat American Schoolchild;;
  .dw picD_row1,picD_row2,picD_row3,picD_row4,picD_row5
  .dw picD_row6,picD_row7,picD_row8,picD_row9,picD_row10

picD_row1:
  .db $02, pic_rpt,$08,$03, pic_rpt,$08,$04, $05
picD_row2:
  .db $06,$07, $10,$11,$12, pic_rpt,$0B,$00, $08,$09 
picD_row3:
  .db $06, $13,$14,$15,$16, pic_rpt,$04,$00, $17,$18,$19,$1A,$1B,$1C, $00,$00, $09
picD_row4:
  .db $06, $1D,$1E,$1F,$20, pic_rpt,$05,$00, $21,$22,$23,$24, pic_rpt,$03,$00, $09
picD_row5:
  .db $06, pic_rpt,$04,$00, $25,$26,$27, $00,$00, $28,$29,$2A,$2B, pic_rpt,$03,$00, $09
picD_row6:
  .db $06, pic_rpt,$03,$00, $2C,$2D,$2E,$2F, pic_rpt,$05,$00, $30, pic_rpt,$03,$00, $09
picD_row7:
  .db $06, pic_rpt,$03,$00, $31,$32,$33,$34,$35,$36,$37,$38,$39,$3A,$3B, $00,$00, $09
picD_row8:
  .db $06, pic_rpt,$07,$00, $3C, $00, $3D,$3E,$3F,$40,$41, $00,$00, $09
picD_row9:
  .db $06,$0A, pic_rpt,$09,$00, $42,$43, pic_rpt,$03,$00, $0B,$09
picD_row10:
  .db $0C, pic_rpt,$08,$0D, pic_rpt,$08,$0E, $0F

Cutscene_PicD_attributes:
  .db $FF,$FF,$FF,$FF
  .db $FF,$FF,$FF,$FF


Cutscene_PicE:            ;Cutscene 2 - Secret Weapon chasing Ossan
  .dw picE_row1,picE_row2,picE_row3,picE_row4,picE_row5
  .dw picE_row6,picE_row7,picE_row8,picE_row9,picE_row10

picE_row1:
  .db $02, pic_rpt,$08,$03, pic_rpt,$08,$04, $05
picE_row2:
  .db $06, pic_rpt,$0B,$00, $44,$45,$46,$47,$48, $09 
picE_row3:
  .db $06, $00,$00, $49,$4A,$4B,$4C,$4D,$4E,$4F,$50,$51,$52,$53,$54,$55,$56, $09
picE_row4:
  .db $06, $57,$58, pic_rpt,$07,$00, $59,$5A,$5B,$5C,$5D,$5E,$5F, $09
picE_row5:
  .db $06, pic_rpt,$03,$00, $60, $00, $61,$62,$63,$64,$65,$66,$67,$68,$69,$6A, $00, $09
picE_row6:
  .db $06, pic_rpt,$03,$00, $6B, $00, $6C,$6D,$6E, $00, $6F,$70,$71,$72,$73, $00,$00, $09
picE_row7:
  .db $06, $00,$00, $74,$75,$76,$77, $00,$00, $78, $00, $79,$7A,$7B,$7C, $00,$00, $09
picE_row8:
  .db $06, $7D,$7E,$7F,$80,$81,$82,$83,$84,$85, $00,$00, $86,$00,$87, $00,$00, $09
picE_row9:
  .db $06,$0A, $00, $88,$89,$8A,$8B,$8C,$8D, $00,$00, $8E,$8F,$90, $00,$00, $0B,$09
picE_row10:
  .db $0C, pic_rpt,$08,$0D, pic_rpt,$08,$0E, $0F

Cutscene_PicE_attributes:
  .db $AA,$AA,$FF,$FF
  .db $AA,$AA,$FF,$FF


Cutscene_PicF:           ;Cutscene 3 - Asian Scenery
  .dw picF_row1,picF_row2,picF_row3,picF_row4,picF_row5
  .dw picF_row6,picF_row7,picF_row8,picF_row9,picF_row10

picF_row1:
  .db $02, pic_rpt,$08,$03, pic_rpt,$08,$04, $05
picF_row2:
  .db $06,$10, $00,$00, $11,$12, $00,$00,$00, $13,$14, $00,$00,$00,$00,$00, $15,$09 
picF_row3:
  .db $06, $16,$17,$18,$19,$1A,$1B,$1C,$1D,$1E,$1F,$20, $00, $21,$22,$23,$24, $09
picF_row4:
  .db $06, $25,$26,$27,$28,$29,$2A,$2B,$2C,$2D, pic_rpt,$03,$00, $2E,$2F,$30,$31, $09
picF_row5:
  .db $06, $32,$33,$34,$35,$36,$37,$38,$39,$3A,$3B,$3C,$3D,$3E,$3F,$40,$41, $09
picF_row6:
  .db $06, pic_rpt,$05,$00, $42,$43,$44,$45, $00, $46,$47,$48,$2F,$49,$4A, $09
picF_row7:
  .db $06, $4B,$4C,$4D,$4E,$4F,$50,$51,$52,$53,$54,$55,$56, $00, $57,$58,$59, $09
picF_row8:
  .db $06, $5A,$5B,$5C,$5D,$5E,$5F,$60,$61,$62,$63,$64,$65,$66,$67,$68,$69,  $09
picF_row9:
  .db $06,$6A, $6B,$6C,$6D,$6E,$6F,$70,$71,$72,$73,$74, $00, $75,$76,$77,$78, $09
picF_row10:
  .db $0C, pic_rpt,$08,$0D, pic_rpt,$08,$0E, $0F

Cutscene_PicF_attributes:
  .db $55,$55,$55,$FF
  .db $AA,$AA,$AA,$FF


Cutscene_PicG:         ;Cutscene 4 - Godzilla destroying shit
  .dw picG_row1,picG_row2,picG_row3,picG_row4,picG_row5
  .dw picG_row6,picG_row7,picG_row8,picG_row9,picG_row10

picG_row1:
  .db $02, pic_rpt,$08,$03, pic_rpt,$08,$04, $05
picG_row2:
  .db $06,$11,$12,$13, pic_rpt,$05,$00, $14,$15,$16, $00,$00, $17,$18, $08,$09 
picG_row3:
  .db $06, $19,$1A,$1B, $00,$00, $1C,$1D,$1E,$1F,$20,$21, $00, $22,$23,$24,$25, $09
picG_row4:
  .db $06, $26,$27,$28, $00, $29,$2A,$2B,$2C,$2D,$2E,$2F, $00, $30, $00, $31, $00, $09
picG_row5:
  .db $06, $32,$33,$34,$35,$36,$37,$38,$39,$3A,$3B,$3C,$3D, $00, $3E,$3F, $00, $09
picG_row6:
  .db $06, $40,$41,$42,$43,$44,$45,$46,$47,$48,$49,$4A,$4B,$4C,$4D,$4E, $00,$09
picG_row7:
  .db $06, $4F,$50,$51,$52,$53,$54,$55,$56,$57,$58,$59,$5A,$5B,$5C,$5D,$5E, $09
picG_row8:
  .db $06, $5F,$60,$61,$62,$63,$64,$65,$66,$67,$68,$69,$6A,$6B,$6C,$6D,$6E, $09
picG_row9:
  .db $06,$6F, $70,$71,$72,$73,$74,$75,$76,$77,$78,$79,$7A,$7B,$7C,$73, $10,$09
picG_row10:
  .db $0C, pic_rpt,$08,$0D, pic_rpt,$08,$0E, $0F


Cutscene_PicH:         ;Cutscene 5 - Soviet scenery
  .dw picH_row1,picH_row2,picH_row3,picH_row4,picH_row5
  .dw picH_row6,picH_row7,picH_row8,picH_row9,picH_row10

picH_row1:
  .db $02, pic_rpt,$08,$03, pic_rpt,$08,$04, $05
picH_row2:
  .db $06,$07, $00, $81, $00, $82, pic_rpt,$06,$00, $83, pic_rpt,$03,$00, $08,$09 
picH_row3:
  .db $06, $00, $84,$85,$86,$87,$88,$89, pic_rpt,$04,$00, $8A, pic_rpt,$04,$00, $09
picH_row4:
  .db $06, $8B,$8C,$8D,$8E,$8F,$90,$91,$92, $00,$00, $93,$94,$95,$96, $00,$00, $09
picH_row5:
  .db $06, $97,$98,$99,$9A,$9B,$9C,$9D,$9E, $00, $9F,$A0,$A1,$A2,$A3,$A4, $00, $09
picH_row6:
  .db $06, $A5,$A6,$A7,$A8,$A9,$AA,$AB,$AC, $00, $AD,$AE,$AF,$B0,$B1,$B2, $00, $09
picH_row7:
  .db $06, $B3,$B4,$B5,$B6,$B7,$B8,$B9, $00,$00, $BA,$BB,$BC,$BD,$BE,$BF, $00, $09
picH_row8:
  .db $06, $00, $C0,$C1,$C2,$C3,$C4,$C5,$C6, $00, $C7,$C8,$C9,$CA,$CB,$CC, $00, $09
picH_row9:
  .db $06,$0A, pic_rpt,$07,$00, $CD,$CE,$CF,$D0,$D1,$D2,$D3, $0B,$09
picH_row10:
  .db $0C, pic_rpt,$08,$0D, pic_rpt,$08,$0E, $0F


Cutscene_PicI:         ;Cutscene 6 - Mecha-Stalin Face
  .dw picI_row1,picI_row2,picI_row3,picI_row4,picI_row5
  .dw picI_row6,picI_row7,picI_row8,picI_row9,picI_row10

picI_row1:
  .db $02, pic_rpt,$08,$03, pic_rpt,$08,$04, $05
picI_row2:
  .db $06,$07, pic_rpt,$04,$00, $91, pic_rpt,$04,$92, $93, pic_rpt,$04,$00, $08,$09 
picI_row3:
  .db $06, pic_rpt,$05,$00, $94, pic_rpt,$04,$95, $96, pic_rpt,$05,$00, $09
picI_row4:
  .db $06, pic_rpt,$05,$00, $97,$98,$99,$9A,$9B,$9C, pic_rpt,$05,$00, $09
picI_row5:
  .db $06, $00,$00,$00, $9D,$9E,$9F,$A0, $00,$00, $A1,$A2,$A3,$A4, $00,$00,$00, $09
picI_row6:
  .db $06, $00,$00,$00, $A5,$A6,$A7,$A8, $00,$00, $A9,$AA,$AB,$AC, $00,$00,$00, $09
picI_row7:
  .db $06, pic_rpt,$10,$00, $09
picI_row8:
  .db $06, $00,$00, $AD,$AE,$AF,$B0,$B1,$B2,$B3,$B4,$B5,$B6,$B7,$B8,  $00,$00, $09
picI_row9:
  .db $06,$0A, $00,$00, $B9,$BA,$BB,$BC,$BD,$BE,$BF,$C0,$C1,$C2, $00,$00, $0B,$09
picI_row10:
  .db $0C, pic_rpt,$08,$0D, pic_rpt,$08,$0E, $0F


Cutscene_PicJ:         ;Cutscene 7 - The Moon
  .dw picJ_row1,picJ_row2,picJ_row3,picJ_row4,picJ_row5
  .dw picJ_row6,picJ_row7,picJ_row8,picJ_row9,picJ_row10

picJ_row1:
  .db $02, pic_rpt,$08,$03, pic_rpt,$08,$04, $05
picJ_row2:
  .db $06,$07, pic_rpt,$0E,$00,  $08,$09 
picJ_row3:
  .db $06, $7D, $00,$00,$00, $7E, $00,$00,$00,$00, $7F,$80,$81,$82, $00,$00,$00, $09
picJ_row4:
  .db $06, pic_rpt,$05,$00, $7D, $00,$00,$00, $83,$84,$85,$86, $00,$00,$00, $09
picJ_row5:
  .db $06, pic_rpt,$09,$00, $87,$88,$89,$8A,$8B, $00,$00, $09
picJ_row6:
  .db $06, pic_rpt,$04,$00, $7D, $00,$00, $7E, $00, $8C,$8D,$8E,$8F,$90,$91, $00, $09
picJ_row7:
  .db $06, $00,$00, $7D, pic_rpt,$07,$00, $92,$93,$94,$95,$96,$97, $09
picJ_row8:
  .db $06, pic_rpt,$04,$00, $98, pic_rpt,$04,$00, $99, $00, $9A,$9B,$9C,$9D,$9E, $09
picJ_row9:
  .db $06,$0A, pic_rpt,$0E,$00, $0B,$09
picJ_row10:
  .db $0C, pic_rpt,$08,$0D, pic_rpt,$08,$0E, $0F


Cutscene_PicK:         ;Cutscene 8 - Ossan chasing Kogyaru
  .dw picK_row1,picK_row2,picK_row3,picK_row4,picK_row5
  .dw picK_row6,picK_row7,picK_row8,picK_row9,picK_row10

picK_row1:
  .db $02, pic_rpt,$08,$03, pic_rpt,$08,$04, $05
picK_row2:
  .db $06, pic_rpt,$0E,$00, $9F,$A0, $09 
picK_row3:
  .db $06, pic_rpt,$08,$00, $A1,$A2,$A3, $00, $A4,$A5,$A6,$A7, $09
picK_row4:
  .db $06, $00,$00,$00, $A1,$A8, $00,$00, $A9,$AA,$AB,$AC,$AD,$AE,$AF,$B0,$B1, $09
picK_row5:
  .db $06, $00, $B2,$A4, $B3,$B4,$B5,$B6,$B7,$B8, $00, $B9,$BA,$BB,$BC,$BD, $00, $09
picK_row6:
  .db $06, $00,$00, $BE,$BF,$C0,$C1,$C2, $00, $C3,$C4,$C5,$C6,$C7,$C8, $00,$00,  $09
picK_row7:
  .db $06, $00,$00, $C9,$CA,$CB,$CC,$CD, $00,$00,$00, $CE,$CF,$B8, $00,$00,$00, $09
picK_row8:
  .db $06, $00,$00, $D0,$D1,$D2,$D3, pic_rpt,$0A,$00, $09
picK_row9:
  .db $06, pic_rpt,$10,$00, $09
picK_row10:
  .db $0C, pic_rpt,$08,$0D, pic_rpt,$08,$0E, $0F

Cutscene_PicK_attributes:
  .db $FF,$FF,$AA,$AA
  .db $FF,$FF,$AA,$AA


Cutscene_PicL:         ;Cutscene 9 - Kogyaru's megaship lurking behind Ossan
  .dw picL_row1,picL_row2,picL_row3,picL_row4,picL_row5
  .dw picL_row6,picL_row7,picL_row8,picL_row9,picL_row10

picL_row1:
  .db $02, pic_rpt,$08,$03, pic_rpt,$08,$04, $05
picL_row2:
  .db $06, pic_rpt,$10,$00, $09 
picL_row3:
  .db $06, $00,$10, $00,$00,$00, $11,$12, $00,$00, $13,$14, $00,$00,$00, $15,$00, $09
picL_row4:
  .db $06, $00,$16, $00,$00,$00, $17, $00,$00,$00, $18,$19, $00,$00,$00, $1A,$00, $09
picL_row5:
  .db $06, $1B,$1C, $00,$00,$00, $1D,$1E,$1F,$20,$21,$22, $00,$00,$00, $23,$24, $09
picL_row6:
  .db $06, $25,$26,$27,$28,$29, $00,$00, $2A,$2B, $00,$00, $2C,$2D,$2E,$2F,$30, $09
picL_row7:
  .db $06, $31,$32,$33,$34,$35, pic_rpt,$06,$00, $36,$37,$38,$39,$3A, $09
picL_row8:
  .db $06, $00, $3B,$3C,$3D, pic_rpt,$08,$00, $3E,$3F,$40, $00, $09
picL_row9:
  .db $06, pic_rpt,$10,$00, $09
picL_row10:
  .db $0C, pic_rpt,$08,$0D, pic_rpt,$08,$0E, $0F


Cutscene_PicM:         ;Cutscene 10 - Party ball opening
  .dw picM_row1,picM_row2,picM_row3,picM_row4,picM_row5
  .dw picM_row6,picM_row7,picM_row8,picM_row9,picM_row10

picM_row1:
  .db $02, pic_rpt,$08,$03, pic_rpt,$08,$04, $05
picM_row2:
  .db $06,$07, pic_rpt,$07,$00, $41, pic_rpt,$06,$00, $08,$09 
picM_row3:
  .db $06, pic_rpt,$07,$00, $42, pic_rpt,$08,$00, $09
picM_row4:
  .db $06, pic_rpt,$04,$00, $43,$44,$45,$46,$47,$48,$49,$4A, pic_rpt,$04,$00, $09
picM_row5:
  .db $06, pic_rpt,$04,$00, $4B,$4C,$4D,$4E,$4F,$50,$51,$52, pic_rpt,$04,$00, $09
picM_row6:
  .db $06, pic_rpt,$04,$00, $53,$54,$55,$56,$57,$58,$59,$5A, pic_rpt,$04,$00, $09
picM_row7:
  .db $06, pic_rpt,$05,$00, $5C,$5D,$5E,$5F,$60,$61, pic_rpt,$05,$00, $09
picM_row8:
  .db $06, pic_rpt,$06,$00, $62,$63,$64,$65, pic_rpt,$06,$00, $09
picM_row9:
  .db $06,$0A, pic_rpt,$05,$00, $66,$00,$67,$68, pic_rpt,$05,$00, $0B,$09
picM_row10:
  .db $0C, pic_rpt,$08,$0D, pic_rpt,$08,$0E, $0F


Cutscene_PicN:         ;Cutscene 10 - US Map
  .dw picN_row1,picN_row2,picN_row3,picN_row4,picN_row5
  .dw picN_row6,picN_row7,picN_row8,picN_row9,picN_row10

picN_row1:
  .db $02, pic_rpt,$08,$03, pic_rpt,$08,$04, $05
picN_row2:
  .db $06,$07, pic_rpt,$0C,$00, $70, $00, $08,$09
picN_row3:
  .db $06, $00, $71,$72,$73,$74,$75,$75,$76,$76,$77,$78,$79,$7A,$7B,$7C, $00, $09
picN_row4:
  .db $06, $00, $7D, pic_rpt,$04,$7E, $7F,$80,$81,$82, pic_rpt,$03,$7E, $83, $00,$00, $09
picN_row5:
  .db $06, $00, $84, pic_rpt,$04,$7E, $85,$86,$86,$87, pic_rpt,$03,$7E, $88, $00,$00, $09
picN_row6:
  .db $06, $00, $89, pic_rpt,$04,$7E, $8A,$86,$86,$8B, pic_rpt,$03,$7E, $8C, $00,$00, $09
picN_row7:
  .db $06, $00,$00, $8D,$8E,$7E,$7E, $8F,$90,$91,$92,$93,$94,$95, $00,$00,$00, $09
picN_row8:
  .db $06, $00,$00,$00, $96,$97,$98,$99, $7E, $9A,$9B,$9C,$9D,$9E, $00,$00,$00, $09
picN_row9:
  .db $06,$0A, pic_rpt,$05,$00, $9D,$9F, pic_rpt,$04,$00, $A0,$A1, $00, $0B,$09
picN_row10:
  .db $0C, pic_rpt,$08,$0D, pic_rpt,$08,$0E, $0F


;;;template

Cutscene_Pic_TMP:
  .dw pic_TMP_row1,pic_TMP_row2,pic_TMP_row3,pic_TMP_row4,pic_TMP_row5
  .dw pic_TMP_row6,pic_TMP_row7,pic_TMP_row8,pic_TMP_row9,pic_TMP_row10

pic_TMP_row1:
  .db $02, pic_rpt,$08,$03, pic_rpt,$08,$04, $05
pic_TMP_row2:
  .db $06,$07,  $08,$09 
pic_TMP_row3:
  .db $06, $09
pic_TMP_row4:
  .db $06, $09
pic_TMP_row5:
  .db $06, $09
pic_TMP_row6:
  .db $06, $09
pic_TMP_row7:
  .db $06, $09
pic_TMP_row8:
  .db $06, $09
pic_TMP_row9:
  .db $06,$0A,  $0B,$09
pic_TMP_row10:
  .db $0C, pic_rpt,$08,$0D, pic_rpt,$08,$0E, $0F


;;;;;;;;;;;;;;;;;;;;;;;;;
onscreen_pic_addresses:
  .db $20,$E7
  .db $21,$07
  .db $21,$27
  .db $21,$47
  .db $21,$67
  .db $21,$87
  .db $21,$A7
  .db $21,$C7
  .db $21,$E7
  .db $22,$07


;Constants

pic_rpt = $FE  ;repeate the next tile

PIC_KILL = $00
PIC_KILL_attr = $00
PIC_A = $01
PIC_A_attr = $01
PIC_B = $02
PIC_B_attr = $02
PIC_C = $03
PIC_C_attr = $03
PIC_D = $04
PIC_D_attr = $04
PIC_E = $05
PIC_E_attr = $05
PIC_F = $06
PIC_F_attr = $06
PIC_G = $07
PIC_H = $08
PIC_I = $09
PIC_J = $0A
PIC_K = $0B
PIC_K_attr = $07
PIC_L = $0C
PIC_M = $0D
PIC_N = $0E
