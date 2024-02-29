; [7,6,5,4] = x coord
; [3,2,1,0] = y coord
; string map : [left x coord][right x coord][top y coord]
; in the code, each coord will need to be ASL'd four times to get actual pixel amount

playfield46:
  .db $FF

playfield47:   ;LEVEL 14 beginning
  .db $1B,$2B

  .db $36,$4A,$5B,$6B

  .db $78,$88

  .db $98,$A8,$B8,$C8,$D8,$E9

  .db $FD

  .db $FF

playfield48:
  .db $0D,$1B,$29,$39,$46

  .db $5A,$6A,$7A,$86

  .db $9A,$A9,$B7,$C9

  .db $DA,$EB,$FC

  .db $FF

playfield49:
  .db $0C,$1B,$29,$36

  .db $46,$56,$6A,$7B,$8B,$9A

  .db $A7,$B7,$CA,$DC

  .db $EC,$FC

  .db $FF

playfield50:
  .db $1C,$28,$3C,$4C

  .db $5A,$66,$76,$87,$97

  .db $AA,$BA,$C6,$DC,$EC,$FC

  .db $FF

playfield51:
  .db $0C,$1A,$25,$3C,$4C,$56

  .db $6C,$7C,$8A,$9A,$A5,$B9

  .db $CD,$DD,$ED,$FD

  .db $FF

playfield52:   ;LEVEL 14 end
  .db $0D,$15,$27,$3B,$4B,$5B

  .db $66,$7B,$8B,$9B,$A6,$BC

  .db $CC,$D7,$EA,$FD

  .db $FF

playfield53:   ;LEVEL 12 beginning
  .db $38,$48

  .db $A7,$B7

  .db $FF

playfield54:
  .db $18,$28

  .db $3A,$4A

  .db $5B,$6B

  .db $8C,$99,$A6,$B9

  .db $D9,$E9

  .db $FF

playfield55:
  .db $1A,$2A

  .db $46,$56,$79

  .db $9A,$AA,$B8,$C8,$D9,$E9

  .db $FF

playfield56:
  .db $2B,$37,$4B,$5B,$6B,$7C

  .db $9C,$A9,$B9

  .db $C5,$D5,$EC

  .db $FF

playfield57:   ;LEVEL 12 end
  .db $68,$78,$89,$99

  .db $A6,$B6

  .db $C9,$D9,$E9

  .db $FF

playfield58:   ;LEVEL 13 begin
  .db $39,$49,$55,$65

  .db $AC,$BC,$CC,$DC

  .db $FF

playfield59:
  .db $1A,$2A,$35,$45

  .db $AB

  .db $FF

playfield60:
  .db $19,$29,$39,$49

  .db $7C,$8A,$9A

  .db $BC,$CB,$DC,$EB

  .db $FF

playfield61:
  .db $1C,$3B,$4B,$5B,$6B,$7B,$8C

  .db $AC,$B5,$C5

  .db $E9,$FC

  .db $FF

playfield62:   ;LEVEL 13 end
  .db $1A

  .db $AA,$B5,$CA,$DA

  .db $FF

playfield63:   ;LEVEL 15 beginning
  .db $17,$27,$3B,$4B

  .db $6B,$78,$8A,$9B

  .db $AB,$BB,$C6,$D6

  .db $FF

playfield64:
  .db $19,$27,$37,$4B

  .db $67,$7B,$8B,$95

  .db $B9,$C9,$D7,$E7

  .db $FF

playfield65:
  .db $18,$28,$37,$47

  .db $5B,$6B,$76

  .db $98,$A7,$B9,$C9,$D7,$E8

  .db $FF

playfield66:
  .db $18,$28,$47,$57

  .db $6A,$7A,$8A,$9A

  .db $A5,$B5,$C8,$D8,$E6

  .db $FF

playfield67:
  .db $17,$27,$39,$49,$56,$66

  .db $7A,$8A,$96,$AA,$BA,$CA,$D6,$EB

  .db $FF

playfield68:    ;LEVEL 15 end
  .db $1A,$28,$36,$58

  .db $86,$95,$A5,$B5,$C5,$D6,$E9

  .db $FF

playfield69:    ;LEVEL 16 begin
  .db $16,$3B,$45,$55,$65,$75

  .db $A6,$B6,$C5,$D5,$E8

  .db $FF

playfield70:
  .db $16,$25,$3C,$4C

  .db $68,$75,$85,$95,$A8,$BB

  .db $D6,$E6

  .db $FF

playfield71:
  .db $19,$25,$35,$48,$59,$75

  .db $85,$98,$B5,$C7,$E5

  .db $FF

playfield72:
  .db $15,$27,$38,$48

  .db $56,$66,$76,$86

  .db $97,$A7,$B7,$C7

  .db $D6,$E6

  .db $FF

playfield73:
  .db $1A,$26,$35,$46,$56,$65

  .db $78,$96,$AA,$BA

  .db $D5,$E6

  .db $FF

playfield74:    ;LEVEL 16 end
  .db $15,$25,$3A

  .db $57,$66,$85,$95

  .db $A8,$C5,$D5,$E6

  .db $FF

playfield75:
  .db $FF


playfield113:   ;BOSS 3
  .db $FF
playfield114:
  .db $FF
playfield115:
  .db $FF


;these numbers point to which value in bldg_RAM to assign arrow coords
;arrowxx value = playfieldxx entry number x 3.  Ex. $AA from playfield01 is entry 2 (counting from zero) so it is $06 in arrow01 
;first byte is halfway point, followed by all locations to test, last byte is terminator byte

arrow46:
  .db $09,$FF

arrow47:   ;LEVEL 14 beginning
  .db $09,$03,$21,$FF

arrow48:
  .db $18,$12,$FF

arrow49:
  .db $18,$15,$2A,$FF

arrow50:
  .db $0F,$09,$21,$FF

arrow51:
  .db $15,$12,$21,$FF

arrow52:   ;LEVEL 14 end
  .db $18,$0C,$15,$2A,$FF

arrow53:   ;LEVEL 12 beginning
  .db $09,$03,$FF

arrow54:
  .db $0C,$06,$FF

arrow55:
  .db $0C,$00,$18,$FF

arrow56:
  .db $0C,$09,$18,$FF

arrow57:   ;LEVEL 12 end
  .db $09,$15,$FF

arrow58:   ;LEVEL 13 beginning
  .db $0C,$03,$FF

arrow59:
  .db $09,$03,$FF

arrow60:
  .db $0C,$06,$FF

arrow61:
  .db $06,$1E,$FF

arrow62:   ;LEVEL 13 end
  .db $06,$09,$FF

arrow63:   ;LEVEL 15 beginning
  .db $0F,$09,$18,$FF

arrow64:
  .db $1B,$0F,$FF

arrow65:
  .db $18,$0C,$1B,$FF

arrow66:
  .db $18,$06,$21,$FF

arrow67:
  .db $18,$06,$1B,$FF

arrow68:   ;LEVEL 15 end
  .db $18,$03,$1E,$FF

arrow69:   ;LEVEL 16 beginning
  .db $0C,$03,$FF

arrow70:
  .db $0C,$06,$FF

arrow71:
  .db $0F,$0C,$15,$FF

arrow72:
  .db $0F,$09,$FF

arrow73:
  .db $0F,$1B,$FF

arrow74:   ;LEVEL 16 end
  .db $0F,$06,15,$FF

arrow75:
  .db $00,$FF


arrow113:      ;BOSS 3
  .db $00,$FF
arrow114:
  .db $00,$FF
arrow115:
  .db $00,$FF