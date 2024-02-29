
kplayfield76:
  .db $FF

kplayfield77:   ;LEVEL 18 beginning
  .db $28,$38,$57,$68

  .db $79,$89,$99,$A9

  .db $B7,$C8

  .db $FF

kplayfield78:
  .db $18,$26,$38,$45

  .db $69,$96

  .db $D5,$E8

  .db $FF

kplayfield79:
  .db $19,$2A,$35,$46

  .db $6A,$7A,$8C,$9C,$AC,$BC

  .db $C6,$D6,$E6

  .db $FF

kplayfield80:
  .db $18,$28,$36,$48

  .db $55,$67,$76,$89,$99

  .db $A6,$B6,$C6,$D7,$E8

  .db $FF

kplayfield81:
  .db $17,$26,$3A,$4A

  .db $57,$6B,$76,$8A

  .db $98,$A5,$B6,$C6,$D7,$E8

  .db $FF

kplayfield82:   ;LEVEL 18 end
  .db $17,$26,$39,$49,$59,$69,$79

  .db $87,$98,$A8,$B5,$CA,$DA,$E6

  .db $FF

kplayfield83:   ;LEVEL 19 beginning
  .db $17,$28,$3B,$47,$55

  .db $68,$78,$88,$98,$AB

  .db $B6,$C7,$E6

  .db $FF

kplayfield84:
  .db $15,$2A,$36,$46,$59,$65

  .db $97,$A8,$B8,$C8,$D5,$E6

  .db $FF

kplayfield85:
  .db $15,$29,$3C,$46,$59,$75

  .db $89,$99,$A9,$BB,$C9,$D9,$E5

  .db $FF

kplayfield86:
  .db $16,$27,$3C,$45

  .db $68,$89,$9A,$AA,$BC

  .db $C5,$E7

  .db $FF

kplayfield87:
  .db $15,$28,$46

  .db $58,$68,$78,$98,$AA,$B8

  .db $C6,$D6,$E5

  .db $FF

kplayfield88:   ;LEVEL 19 end
  .db $15,$26,$36,$46,$58,$66

  .db $75,$88

  .db $A6,$B7,$CB,$D7,$E5

  .db $FF

kplayfield89:   ;LEVEL 20 beginning
  .db $09,$19,$29,$47,$56,$67

  .db $79,$89,$99,$B8

  .db $C6,$D5,$E6

  .db $FF

kplayfield90:
  .db $09,$17,$26,$37,$4C,$59

  .db $65,$75,$88

  .db $99,$A9,$B6,$C5,$D6,$E9

  .db $FF

kplayfield91:
  .db $09,$16,$25,$36,$58,$79

  .db $88,$95,$A5,$B7,$C7,$D7,$E8

  .db $FF

kplayfield92:
  .db $09,$19,$28,$36,$45,$56,$68,$79

  .db $98,$A6,$B5,$C6,$D8,$E9

  .db $FF

kplayfield93:
  .db $09,$16,$25,$36,$48

  .db $5A,$69,$76,$85,$96

  .db $A9,$BB,$C5,$D5,$E9

  .db $FF

kplayfield94:   ;LEVEL 20 end
  .db $09,$16,$25,$45,$65,$75,$86

  .db $9A,$A9,$C6,$D5,$E6

  .db $FF

kplayfield95:   ;LEVEL 21 beginning
  .db $2A,$39,$47,$58,$6B

  .db $76,$85,$96,$B7,$C9,$D7,$E9

  .db $FF

kplayfield96:
  .db $16,$29,$3B,$47,$58,$6B

  .db $75,$8A,$9A,$A6

  .db $B8,$C7,$DB,$E6

  .db $FF

kplayfield97:
  .db $16,$25,$36,$4A,$57,$66,$77

  .db $89,$96,$A5,$B6,$D8,$E6

  .db $FF

kplayfield98:
  .db $15,$26,$3A,$49

  .db $55,$69,$87,$A5,$B8

  .db $CB,$D6,$E6

  .db $FF

kplayfield99:
  .db $16,$25,$36,$49,$56,$66

  .db $75,$87,$99,$AA,$B5

  .db $C9,$D9,$E7

  .db $FF

kplayfield100:
  .db $18,$25,$38,$49,$5A

  .db $75,$88,$97,$A6,$B9,$C5,$DA,$E5

  .db $FF

kplayfield101:
  .db $16,$27,$39,$46,$57,$75

  .db $87,$98,$A8,$B9,$C5,$D7,$E8

  .db $FF

kplayfield102:   ;LEVEL 21 end
  .db $16,$25,$36,$49,$55

  .db $78,$86,$98

  .db $B6,$CA,$D6,$E5

  .db $FF

kplayfield103:
  .db $FF

;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;

kogyaru_arrow_pulls:
  .dw kplayfield77,kplayfield78,kplayfield79,kplayfield80,kplayfield81,kplayfield82,kplayfield83
  .dw kplayfield84,kplayfield85,kplayfield86,kplayfield87,kplayfield88,kplayfield89,kplayfield90
  .dw kplayfield91,kplayfield92,kplayfield93,kplayfield94,kplayfield95,kplayfield96,kplayfield97
  .dw kplayfield98,kplayfield99,kplayfield100,kplayfield101,kplayfield102,kplayfield103