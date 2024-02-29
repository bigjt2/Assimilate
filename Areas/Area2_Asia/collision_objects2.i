; [7,6,5,4] = x coord
; [3,2,1,0] = y coord
; string map : [left x coord][right x coord][top y coord]
; in the code, each coord will need to be ASL'd four times to get actual pixel amount

playfield19:
  .db $FF

playfield20:
  .db $2D,$3D

  .db $4D,$5D

  .db $9C,$AC

  .db $BA,$CA

  .db $DC,$EC

  .db $FF

playfield21:
  .db $1A,$2A

  .db $3C,$4C

  .db $5B,$6B

  .db $BD,$CD

  .db $FF

playfield22:
  .db $4A,$5A

  .db $7D,$8D

  .db $9C,$AC

  .db $B9,$C9

  .db $FF

playfield23:
  .db $19,$29

  .db $9A,$AA

  .db $CC,$DC

  .db $FF

playfield24:
  .db $5C,$6C

  .db $78,$88

  .db $9A,$AA

  .db $FF

playfield25:
  .db $29,$39

  .db $48,$58

  .db $69,$79

  .db $8A,$9A

  .db $FF

playfield26:
  .db $5A,$6A

  .db $79,$89

  .db $99,$A9

  .db $B8,$C8

  .db $D9,$E9

  .db $FF

playfield27:
  .db $18,$28 

  .db $3A,$4A

  .db $5C,$6C

  .db $D9,$E9

  .db $FF


playfield28:
  .db $38,$48

  .db $59,$69

  .db $7A,$8A

  .db $9B,$AB

  .db $B8,$C8,$D8

  .db $FF

playfield29:
  .db $2A,$3A

  .db $48,$58

  .db $68,$78

  .db $87,$97

  .db $A9,$B9

  .db $FF

playfield30:
  .db $29,$39,$4A

  .db $BB,$CB

  .db $D8,$E8

  .db $FF

playfield31:
  .db $69,$79

  .db $89,$99

  .db $A6,$B6

  .db $C9,$D9

  .db $EB

  .db $FF

playfield32:
  .db $29,$39

  .db $48,$58

  .db $69,$79

  .db $87,$97

  .db $A8,$B8

  .db $CB,$DB

  .db $FF



playfield33:
  .db $18,$28

  .db $3B,$4B

  .db $57,$67,$78

  .db $87,$97

  .db $A8,$B8

  .db $C9,$D9

  .db $FF

playfield34:
  .db $18,$28

  .db $3A,$4A

  .db $57,$67

  .db $7A,$8A

  .db $FF

playfield35:
  .db $2B,$3B

  .db $4A,$57,$67,$78

  .db $89,$99

  .db $AA,$BA

  .db $C8,$D8

  .db $FF

playfield36:
  .db $1B,$2B

  .db $37,$47

  .db $5C,$6C

  .db $7A,$87,$97,$A9

  .db $B9,$C9

  .db $DA,$EA

  .db $FF

playfield37:
  .db $19,$26,$36,$47

  .db $5A,$6A

  .db $78,$88

  .db $9B,$AB

  .db $B7,$C7

  .db $FF

playfield38:
  .db $3B,$4B

  .db $56,$66,$7A,$8C

  .db $C6,$D6

  .db $FF

playfield39:
  .db $26,$36

  .db $4B,$5B

  .db $68,$78

  .db $89,$99

  .db $AB,$BB

  .db $FF

playfield40:
  .db $29,$39,$49

  .db $57,$67

  .db $97,$A7

  .db $BB,$CB

  .db $D8,$E8

  .db $FF

playfield41:
  .db $3B,$4B

  .db $7B,$8B

  .db $96,$A6

  .db $B9,$C9

  .db $DB,$EB

  .db $FF

playfield42:
  .db $16,$26,$39

  .db $69,$79

  .db $A7,$B7

  .db $C9,$D9

  .db $FF

playfield43:
  .db $FF

playfield44:
  .db $FF

playfield45:
  .db $FF

;these numbers point to which value in bldg_RAM to assign arrow coords
;arrowxx value = playfieldxx entry number x 3.  Ex. $AA from playfield01 is entry 2 (counting from zero) so it is $06 in arrow01 
;first byte is halfway point, followed by all locations to test, last byte is terminator byte

arrow19:
  .db $03,$FF
arrow20:
  .db $0A,$06,$12,$FF
arrow21:
  .db $0A,$00,$06,$FF
arrow22:
  .db $09,$03,$0C,$FF
arrow23:
  .db $06,$00,$09,$FF

arrow24:
  .db $09,$03,$FF
;  .db $09,$06,$0C,$FF
arrow25:
  .db $10,$03,$0C,$FF
arrow26:
  .db $0E,$03,$15,$FF
arrow27:
  .db $0C,$09,$FF
;  .db $0F,$0C,$12,$FF

arrow28:
  .db $03,$00,$15,$1B,$FF
arrow29:
  .db $0F,$03,$0C,$FF
arrow30:
  .db $09,$06,$0C,$FF
arrow31:
  .db $03,$00,$0C,$12,$FF
arrow32:
  .db $0F,$0C,$15,$21,$FF

arrow33:
  .db $0C,$00,$09,$1B,$FF
arrow34:
  .db $0F,$09,$0C,$FF
arrow35:
  .db $06,$03,$15,$FF
arrow36:
  .db $0F,$0C,$18,$21,$FF
arrow37:
  .db $0F,$03,$0C,$18,$1E,$FF

arrow38:
  .db $0E,$03,$0C,$FF
arrow39:
  .db $0C,$00,$09,$FF
arrow40:
  .db $0E,$03,$0C,$15,$1B,$FF
arrow41:
  .db $0C,$0F,$1B,$FF
arrow42:
  .db $0C,$06,$15,$FF

arrow43:
  .db $00

arrow44:
  .db $00

arrow45:
  .db $00