; [7,6,5,4] = x coord
; [3,2,1,0] = y coord
; string map : [left x coord][right x coord][top y coord]
; in the code, each coord will need to be ASL'd four times to get actual pixel amount


playfield104:
  .db $FF

playfield105:  ;cow level start
  .db $2B,$3A,$4A,$5A,$6A,$7A,$8B

  .db $C9,$D9

  .db $FF

playfield106:
  .db $1A,$29,$39,$49,$59,$69,$7A

  .db $B8,$C8,$D9,$E9

  .db $FF

playfield107:
  .db $48,$58,$69,$79

  .db $8C,$9C,$AC,$BC,$CD

  .db $FF

playfield108:  ;cow level end
  .db $1E,$2E

  .db $5A,$69,$79,$89,$99,$AA

  .db $C7,$D7,$E7

  .db $FF

playfield109:  ;campout level start
  .db $FF

playfield110:
  .db $FF

playfield111:  ;campout level end
  .db $FF

playfield112:
  .db $FF


;these numbers point to which value in bldg_RAM to assign arrow coords
;arrowxx value = playfieldxx entry number x 3.  Ex. $AA from playfield01 is entry 2 (counting from zero) so it is $06 in arrow01 
;first byte is halfway point, followed by all locations to test, last byte is terminator byte

arrow104:
  .db $03,$FF

arrow105:  ;cow level start
  .db $0F,$09,$FF

arrow106:
  .db $0F,$0C,$FF

arrow107:
  .db $09,$12,$FF

arrow108:  ;cow level end
  .db $09,$15,$FF

arrow109:  ;campout level start
  .db $03,$FF

arrow110:
  .db $03,$FF

arrow111:  ;campout level end
  .db $03,$FF

arrow112:
  .db $03,$FF