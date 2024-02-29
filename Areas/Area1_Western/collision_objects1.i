; [7,6,5,4] = x coord
; [3,2,1,0] = y coord
; string map : [left x coord][right x coord][top y coord]
; in the code, each coord will need to be ASL'd four times to get actual pixel amount

playfield0:  ;to equalize against background numbers
  .db $FF

playfield1:
  .db $FF

playfield2:
  .db $5B,$6B

  .db $AA,$BA

  .db $DB,$EB

  .db $FF

playfield3:
  .db $1B,$2B

  .db $3A,$4A

  .db $5C,$6C,$7C,$8C

  .db $BC,$CC

  .db $DB,$EB

  .db $FF

playfield4:
  .db $1A,$2A

  .db $3A,$4A,$5A,$6A

  .db $7B,$8B

  .db $9B,$AB

  .db $BB,$CB,$DB,$EB

  .db $FF

playfield5:
  .db $1A,$2A

  .db $3B,$4B

  .db $5D,$6D,$7D,$8D

  .db $9C,$AC

  .db $FF

playfield6:
  .db $6B,$7B

  .db $AC,$BC

  .db $CB,$DB,$EB

  .db $FF

playfield7:
  .db $2C,$3C,$4C,$5C
  
  .db $6B,$7B

  .db $8C,$9C

  .db $CA,$DA

  .db $FF

playfield8:
  .db $2B,$3B

  .db $4C,$5C

  .db $6C

  .db $7C,$8C

  .db $CB,$DB

  .db $FF

playfield9:
  .db $2C,$3C

  .db $4C,$5C,$6C

  .db $9C,$AC

  .db $FF

playfield10:
  .db $3C,$4C

  .db $7B,$8B

  .db $BC,$CC

  .db $FF


playfield11:
  .db $2C,$3C

  .db $4C,$5C

  .db $8C,$9C,$AC

  .db $DC,$EC

  .db $FF

playfield12:
  .db $1C,$2C,$3C

  .db $4C,$5C

  .db $9C,$AC

  .db $FF

playfield13:
  .db $1B,$2B

  .db $3B,$4B,$5B,$6B

  .db $7A,$8A

  .db $B9,$C9

  .db $DA,$EA

  .db $FF

playfield14:
  .db $1A,$2A

  .db $39,$49

  .db $5A,$6A,$7A,$8A

  .db $AB,$BB

  .db $D9,$E9

  .db $FF

playfield15:
  .db $19,$29

  .db $3C,$4C

  .db $6A,$7A

  .db $89,$99,$A9

  .db $B9,$C9

  .db $DA,$EA

  .db $FF

playfield16:
  .db $19,$29

  .db $3A,$4A,$5A,$6A

  .db $9A,$AA,$BA

  .db $CB,$DB

  .db $FF

playfield17:
  .db $FF

playfield18:
  .db $FF

;these numbers point to which value in bldg_RAM to assign arrow coords
;arrowxx value = playfieldxx entry number x 3.  Ex. $AA from playfield01 is entry 2 (counting from zero) so it is $06 in arrow01 
;first byte is halfway point, followed by all locations to test, last byte is terminator byte

arrow00:   ;to equalize with backgrounds
  .db $00
arrow01:
  .db $00
arrow02:
  .db $05,$00,$06,$0F,$FF
arrow03:
  .db $11,$00,$06,$0F,$FF
arrow04:
  .db $11,$03,$0C,$1B,$21,$FF
arrow05:
  .db $11,$03,$06,$0F,$18,$FF
arrow06:
  .db $05,$06,$0C,$FF
arrow07:
  .db $10,$06,$0C,$FF
arrow08:
  .db $10,$00,$06,$15,$FF
arrow09:
  .db $10,$03,$06,$12,$FF
arrow10:
  .db $07,$03,$0C,$FF
arrow11:
  .db $0B,$00,$09,$FF
arrow12:
  .db $0B,$00,$09,$12,$FF
arrow13:
  .db $0F,$00,$09,$15,$1B,$FF
arrow14:
  .db $0F,$03,$09,$FF
arrow15:
  .db $0F,$03,$06,$15,$21,$FF
arrow16:
  .db $0F,$09,$15,$1E,$FF
arrow17:
  .db $00
arrow18:
  .db $00