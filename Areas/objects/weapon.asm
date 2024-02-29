;;;;;;;;;;;;;;;;
weapon_setup:
  LDA temp1              ;backup temp1 because I THINK it's used in mig or kogyaru somewhere after this sub
  PHA
  STX temp2              ;x will be the position from oam_memtest where fireball's attributes will be stored; stored in temp2 because it's destroyed a couple times
  LDY temp_x             ;y will be the current objects attributes, some of which form the fireball's starting attributes

.movement_type:
  LDA #mv_angle
  STA oam_MoveType, x

.starting_coords:     ;simply copies current coords from object launching fireball
  LDA oam_xMapHI, y   ;and makes them the starting coords of the fireball
  STA oam_xMapHI, x

  LDA oam_xMapLO, y
  CLC
  ADC weapon_xoffset
  STA oam_xMapLO, x

  LDA oam_yMapLO, y
  CLC
  ADC weapon_yoffset
  STA oam_yMapLO, x

.x_movement:
  LDA oam_xMapLO, y
  SEC
  SBC camera_Left_x
  STA temp1
  CMP ship_x
  BCC .to_left
.to_right:            ;OBJECT to the right of OSSAN - greater x
  LDA #left           ;weapon will shoot to the LEFT
  STA oam_dir, x

  LDA temp1
  SEC
  SBC ship_x
  LSR A
  LSR A
  JMP .store_x
.to_left:             ;OBJECT to the left of OSSAN - lesser x
  LDA #right          ;weapon will shoot to the RIGHT
  STA oam_dir, x

  LDA ship_x
  SEC
  SBC temp1
  LSR A
  LSR A
.store_x:
  TAY
  LDA weapon_x_movement, y
  STA oam_xDelta, x
  LDY temp_x

.y_movement:
  LDA ship_y
  CMP oam_yMapLO, y
  BCC .below
.above:               ;OBJECT above OSSAN - lesser y
  LDA ship_y
  SEC
  SBC oam_yMapLO, y
  CMP #$04
  BCC .store_y_lo
  LSR A
  LSR A
  JMP .store_y
.store_y_lo:
  TAY
  LDA #$00
  STA oam_yDeltaHI, x
  LDA weapon_y_movement_lo, y
  STA oam_yDeltaLO, x
  JMP .restore_variables
.store_y:
  TAY
  LDA weapon_y_movement, y
  STA oam_yDeltaHI, x
  LDA #$00
  STA oam_yDeltaLO, x
  JMP .horiz_test

.below:               ;OBJECT below OSSAN - greater y
  LDA oam_yMapLO, y
  SEC
  SBC ship_y
  CMP #$04
  BCC .store_y_lo_2scomp
  LSR A
  LSR A
  JMP .store_y_2scomp
.store_y_lo_2scomp:   ;two's compliment is required here because the object is
  TAY                 ;below and needs to shoot UP, therefore the yDelta needs
  LDA #$00            ;to be a negative number
  STA oam_yDeltaHI, x
  LDA weapon_y_movement_lo, y
  EOR #$FF
  CLC
  ADC #$01
  STA oam_yDeltaLO, x
  JMP .restore_variables
.store_y_2scomp:
  TAY
  LDA weapon_y_movement, y
  EOR #$FF
  CLC
  ADC #$01
  STA oam_yDeltaHI, x
  LDA #$00
  STA oam_yDeltaLO, x


.horiz_test:
  LDA oam_yDeltaHI, x
  BNE .restore_variables
  LDA #$03
  STA oam_xDelta, x

.restore_variables:
  LDY temp_x          ;restore obj offset held in y at start of sub
  PLA
  STA temp1           ;restore temp1
.rts:
  RTS

weapon_x_movement:
  .db $00,$00,$00,$01,$01,$01,$01,$01,$01,$01
  .db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02
  .db $03,$03,$03,$03,$03,$03,$03,$03,$03,$03
  .db $03,$03,$03,$03,$03,$03,$03,$03,$03,$03
  .db $03,$03,$03,$03,$03,$03,$03,$04,$04,$04
  .db $04,$04,$04,$04,$04,$04,$04,$04,$04,$04
  .db $04,$04,$04,$04

weapon_y_movement:
  .db $00,$00,$00,$01,$01,$01,$01,$01,$02,$02
  .db $02,$02,$02,$02,$02,$02,$02,$03,$03,$03
  .db $03,$03,$03,$03,$03,$03,$03,$03,$03,$03
  .db $03,$03,$03,$03,$03,$03,$03,$03,$03,$03
  .db $03,$03,$03,$03,$04,$04,$04,$04,$04,$04
  .db $04,$04,$04,$04,$04,$04,$04,$04,$04,$04
  .db $04

weapon_y_movement_lo:
  .db $00,$20,$40,$80


;;;;;;;;;;;;;;;;OLD
;weapon_setup:
;  STX temp2              ;x will be the position from oam_memtest where fireball's attributes will be stored; stored in temp2 because it's destroyed a couple times
;  LDY temp_x             ;y will be the current objects attributes, some of which form the fireball's starting attributes

;.movement_type:
;  LDA #mv_angle
;  STA oam_MoveType, x

;.starting_coords:     ;simply copies current coords from object launching fireball
;  LDA oam_xMapHI, y   ;and makes them the starting coords of the fireball
;  STA oam_xMapHI, x
;  LDA oam_yMapLO, y
;  STA oam_yMapLO, x

;.obj_start:           ;adjust the starting point of the projectile depending
;  LDA oam_dir, y      ;on object's direction, so it looks as though it is shooting
;  BEQ .leftstart      ;out of the front of the object
;.rightstart:
;  LDA oam_xMapLO, y
;  CLC
;  ADC #$20
;  STA oam_xMapLO, x
;  JMP .x_target
;.leftstart:
;  LDA oam_xMapLO, y
;  STA oam_xMapLO, x

;.x_target:
;.set_direction:         ;tried to get by with fancy math, but in the end i had
;  SEC                   ;to surrender and right this tedious portion of the sub
;  LDA oam_xMapLO, y     ;as too much depended on knowing what direction the
;  SBC camera_Left_x     ;projectile was heading.
;  CMP ship_x
;  BCS .set_dir_left
;.set_dir_right:
;  LDA #right
;  STA oam_dir, x
;  CLC
;  LDA ship_left
;  ADC camera_Left_x
;  SEC                   ;to be entirely honest i'm not sure what all's going on
;  SBC #$10              ;here anymore.  i just fucked around with numbers until
;  SEC                   ;i got a result that didn't make me totally want to
;  SBC oam_xMapLO, y     ;shoot myself.
;  STA temp1
;  JMP .divide_x
;.set_dir_left:
;  LDA #left
;  STA oam_dir, x
;  SEC
;  LDA oam_xMapLO, y
;  SBC camera_Left_x
;  SEC
;  SBC ship_right
;  STA temp1

;.divide_x:
;  LDA #$05
;  STA loop_counter
;.div_x_loop:
;  LSR temp1        ;divide high byte
;  DEC loop_counter
;  LDA loop_counter
;  BNE .div_x_loop
;.store_x_delta:
;  LDA temp1
;  BEQ .x_min       ;don't allow xdelta to be zero, or fireball won't move left/right
;  CMP #$05
;  BCS .x_min
;  STA oam_xDelta, x
;  JMP .y_target
;.x_min:
;  LDA #$01         ;make sure xdelta is at least one.
;  STA oam_xDelta, x
;  JMP .y_target
;.x_max:
;  LDA #$05
;  STA oam_xDelta, x

;.y_target:
;  LDA #$00
;  STA temp1    ;serves as high byte
;  STA temp2    ;serves as low byte
;.y_difference:
;  LDA oam_yMapLO, y
;  CMP ship_bottom
;  BCS .y_diff_below
;.y_diff_above:
;  SEC                  ;object is above ship, so less y
;  LDA ship_bottom
;  SBC oam_yMapLO, y
;  STA temp1
;  JMP .divide_y
;.y_diff_below:
;  SEC                  ;object is below ship, so greater y
;  LDA oam_yMapLO, y
;  SBC ship_bottom
;  STA temp1
;.divide_y:
;  LDA #$04   ;$05
;  STA loop_counter
;.div_y_loop:
;  LSR temp1            ;divide high byte
;  ROR temp2            ;rotate carry into low byte
;  DEC loop_counter
;  LDA loop_counter
;  BNE .div_y_loop
;.store_y_delta:
;  LDA oam_yMapLO, y   ;as yDeltaHI is basically treated as a sign
;  CMP ship_bottom
;  BCS .below
;.above:
;  LDA temp1
;  BEQ .reset_x
;  JMP .store
;.below:
;  LDA temp1           ;do two's compliment to create a negative number
;  BEQ .reset_x
;  EOR #$FF
;  CLC
;  ADC #$01
;.store:
;  STA oam_yDeltaHI, x ;i've decided to allow the ydelta to be zero, so that
;  LDA temp2           ;sometimes the fireball shoots strait ahead.
;  STA oam_yDeltaLO, x
;  JMP .rts
;.reset_x:
;  LDA #$03            ;if y_delta is zero, fireball will move straight right or left
;  STA oam_xDelta, x   ;this is to prevent it from moving slow as hell.
;  LDA temp1
;  JMP .store
;
;.rts:
;  RTS