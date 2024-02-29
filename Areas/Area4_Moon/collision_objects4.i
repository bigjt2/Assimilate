; [7,6,5,4] = x coord
; [3,2,1,0] = y coord
; string map : [left x coord][right x coord][top y coord]
; in the code, each coord will need to be ASL'd four times to get actual pixel amount

playfield76:
  .db $FF

playfield77:   ;LEVEL 18 beginning
  .db $28,$38,$57,$68

  .db $79,$89,$99,$A9

  .db $B7,$C8

  .db $FF

playfield78:
  .db $18,$26,$38,$45

  .db $69,$96

  .db $D5,$E8

  .db $FF

playfield79:
  .db $19,$2A,$35,$46

  .db $6A,$7A,$8C,$9C,$AC,$BC

  .db $C6,$D6,$E6

  .db $FF

playfield80:
  .db $18,$28,$36,$48

  .db $55,$67,$76,$89,$99

  .db $A6,$B6,$C6,$D7,$E8

  .db $FF

playfield81:
  .db $17,$26,$3A,$4A

  .db $57,$6B,$76,$8A

  .db $98,$A5,$B6,$C6,$D7,$E8

  .db $FF

playfield82:   ;LEVEL 18 end
  .db $17,$26,$39,$49,$59,$69,$79

  .db $87,$98,$A8,$B5,$CA,$DA,$E6

  .db $FF

playfield83:   ;LEVEL 19 beginning
  .db $17,$28,$3B,$47,$55
                               ;$3B & AB are arrows ; 6, 27
  .db $68,$78,$88,$98,$AB

  .db $B6,$C7,$E6

  .db $FF

playfield84:
  .db $15,$2A,$36,$46,$59,$65
                               ;$2A & 59 are arrows ; 3, 12
  .db $97,$A8,$B8,$C8,$D5,$E6

  .db $FF

playfield85:
  .db $15,$29,$3C,$46,$59,$75
                               ;$3C & BB are arrows ; 6, 27
  .db $89,$99,$A9,$BB,$C9,$D9,$E5

  .db $FF

playfield86:
  .db $16,$27,$3C,$45
                                ;$3C & BC  ; 6, 24
  .db $68,$89,$9A,$AA,$BC

  .db $C5,$E7

  .db $FF

playfield87:
  .db $15,$28,$46
                                ;$28 & AA  ; 3, 21
  .db $58,$68,$78,$98,$AA,$B8

  .db $C6,$D6,$E5

  .db $FF

playfield88:   ;LEVEL 19 end
  .db $15,$26,$36,$46,$58,$66

  .db $75,$88                   ;$58 & CB  ; 12, 30

  .db $A6,$B7,$CB,$D7,$E5

  .db $FF

playfield89:   ;LEVEL 20 beginning
  .db $09,$19,$29,$47,$56,$67

  .db $79,$89,$99,$B8           ;$B8  ; 27

  .db $C6,$D5,$E6

  .db $FF

playfield90:
  .db $09,$17,$26,$37,$4C,$59
                                ;$4C ; 12
  .db $65,$75,$88

  .db $99,$A9,$B6,$C5,$D6,$E9

  .db $FF

playfield91:
  .db $09,$16,$25,$36,$58,$79

  .db $88,$95,$A5,$B7,$C7,$D7,$E8
                                ;$58 & E8   ; 12, 36
  .db $FF

playfield92:
  .db $09,$19,$28,$36,$45,$56,$68,$79

  .db $98,$A6,$B5,$C6,$D8,$E9
                                ;$68   ; 18
  .db $FF

playfield93:
  .db $09,$16,$25,$36,$48
                                ;$5A & BB   ; 15, 33
  .db $5A,$69,$76,$85,$96

  .db $A9,$BB,$C5,$D5,$E9

  .db $FF

playfield94:   ;LEVEL 20 end
  .db $09,$16,$25,$45,$65,$75,$86
                                ;$9A   ; 21
  .db $9A,$A9,$C6,$D5,$E6

  .db $FF

playfield95:   ;LEVEL 21 beginning
  .db $2A,$39,$47,$58,$6B

  .db $76,$85,$96,$B7,$C9,$D7,$E9
;6B,C9 = 12 & 27
  .db $FF

playfield96:
  .db $16,$29,$3B,$47,$58,$6B

  .db $75,$8A,$9A,$A6

  .db $B8,$C7,$DB,$E6
;3B,6B = 6 & 15
  .db $FF

playfield97:
  .db $16,$25,$36,$4A,$57,$66,$77

  .db $89,$96,$A5,$B6,$D8,$E6
;4A,89 = 9 & 21
  .db $FF

playfield98:
  .db $15,$26,$3A,$49

  .db $55,$69,$87,$A5,$B8

  .db $CB,$D6,$E6
;3A,CB = 6 & 27
  .db $FF

playfield99:
  .db $16,$25,$36,$49,$56,$66

  .db $75,$87,$99,$AA,$B5

  .db $C9,$D9,$E7
;49,B5 = 9 & 30
  .db $FF

playfield100:
  .db $18,$25,$38,$49,$5A

  .db $75,$88,$97,$A6,$B9,$C5,$DA,$E5
;B9,DA = 27 & 33
  .db $FF

playfield101:
  .db $16,$27,$39,$46,$57,$75

  .db $87,$98,$A8,$B9,$C5,$D7,$E8
;39,B9 = 6 & 27
  .db $FF

playfield102:   ;LEVEL 21 end
  .db $16,$25,$36,$49,$55

  .db $78,$86,$98

  .db $B6,$CA,$D6,$E5
;49,CA = 9 & 27
  .db $FF

playfield103:
  .db $FF

playfield116:   ;BOSS 4
  .db $FF
playfield117:
  .db $FF
playfield118:
  .db $FF

playfield119:   ;KOGYARU CHASE
  .db $FF
playfield120:
  .db $FF
playfield121:
  .db $FF


;these numbers point to which value in bldg_RAM to assign arrow coords
;arrowxx value = playfieldxx entry number x 3.  Ex. $AA from playfield01 is entry 2 (counting from zero) so it is $06 in arrow01 
;first byte is halfway point, followed by all locations to test, last byte is terminator byte

arrow76:
  .db $09,$FF

arrow77:   ;LEVEL 18 beginning
  .db $0F,$09,$FF

arrow78:
  .db $18,$06,$FF

arrow79:
  .db $18,$0F,$FF

arrow80:
  .db $0F,$09,$18,$FF

arrow81:
  .db $15,$0F,$FF

arrow82:   ;LEVEL 18 end
  .db $18,$1B,$FF

arrow83:   ;LEVEL 19 beginning
  .db $15,$06,$1B,$FF

arrow84:
  .db $15,$03,$0C,$FF

arrow85:
  .db $15,$06,$1B,$FF

arrow86:
  .db $15,$06,$18,$FF

arrow87:
  .db $0F,$03,$15,$FF

arrow88:   ;LEVEL 19 end
  .db $15,$0C,$1E,$FF

arrow89:   ;LEVEL 20 beginning
  .db $15,$1B,$FF

arrow90:
  .db $15,$0C,$FF

arrow91:
  .db $15,$0C,$24,$FF

arrow92:
  .db $15,$12,$FF

arrow93:
  .db $1B,$0F,$21,$FF

arrow94:   ;LEVEL 20 end
  .db $09,$15,$FF

arrow95:   ;LEVEL 21 beginning
  .db $15,$0C,$1B,$FF

arrow96:
  .db $15,$06,$0F,$FF

arrow97:
  .db $0F,$09,$15,$FF

arrow98:
  .db $15,$06,$1B,$FF

arrow99:
  .db $12,$09,$1B,$FF

arrow100:
  .db $12,$1B,$21,$FF

arrow101:
  .db $12,$06,$1B,$FF

arrow102:   ;LEVEL 21 end
  .db $12,$09,$1B,$FF

arrow103:
  .db $03,$FF

arrow116:   ;BOSS 4
  .db $03,$FF
arrow117:
  .db $03,$FF
arrow118:
  .db $03,$FF

arrow119:   ;KOGYARU CHASE
  .db $03,$FF
arrow120:
  .db $03,$FF
arrow121:
  .db $03,$FF