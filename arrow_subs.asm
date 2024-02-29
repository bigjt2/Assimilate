;;;;;;;;;;;;;;;;;;;;;;;;
;;  Arrow Subs
;;;;;;;;;;;;;;;;;;;;;;;;

Arrow_Handler:
  LDA bonus_active
  CMP #$F0
  BEQ .rts

  LDA arrow_status
  CMP #$00
  BEQ .victim
  CMP #$01
  BEQ .count_to_arrow
  CMP #$02
  BEQ .arrow_up

.count_to_arrow:
  LDA boss_active
  BEQ .no_boss
  LDA boss_bldg_stat
  CMP #$02
  BEQ .arrow_up
  JSR no_arrow
  JSR arrow_radar_off
  JMP .rts

.no_boss:
  JSR arrow_position
  JSR no_arrow
  JSR arrow_radar_off

  LDA arrow_freq
  AND #%11110000
  LSR A
  LSR A             ;I'm only LSRing three times here, to give a little more time.  So the lowest wait is 2.
  LSR A
  CMP arrow_timer   ;this variable is inc'd in Counter_Manager sub.x
  BCS .rts
 
  LDA #$00
  STA arrow_timer
  LDA #$02
  STA arrow_status

.arrow_up:
  JSR arrow_to_screen

  LDA arrow_freq
  AND #%00001111
  ASL A           ;everything multiplied by two, to give a bit longer waits, shortest wait would be 2
  CMP arrow_timer
  BCC .turn_it_off
  JMP .rts

.turn_it_off:
  JSR arrow_radar_off  ;obviously, not radar flashing for no arrow

  LDA #$FF
  STA arrow_pos
  STA arrow_pos+1
  LDA #$00
  STA arrow_timer
  LDA #$01
  STA arrow_status
  JMP .rts

.victim:
  JSR victim_capture

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;;;;
arrow_position:

  LDA arrow_pos
  CMP #$FF
  BEQ .playfield
  JMP .rts

.playfield:
  LDA finl_Background
  SEC
  SBC frst_Background
  STA temp1  ;this is the number of backgrounds in this level

  LDX r_marker
  LDA r_results, x
  LSR A
  LSR A   ;to speed this sub up, make the rotating index smaller
  LSR A
  LSR A
  STA temp2  ;this is the random number to compare

  LDY #$00
  LDX #$00
.playfield_loop:
  INX
  CPX temp2
  BCS .compare_to_last
  INY
  CPY temp1
  BCC .playfield_loop
  LDY #$00
  JMP .playfield_loop

.compare_to_last:
  TYA
  STA temp1
  LDA frst_Background
  CLC
  ADC temp1          ;if y=same playfield as before, subtract one and store
  CMP last_arpos     ;to avoid arrow appearing in same place twice
  BNE .store_playfield
  SEC
  SBC #$01
  CMP frst_Background
  BCS .store_playfield
  LDA finl_Background

.store_playfield:
  STA arrow_pos     ;store playfield in first byte of arrow_pos
  STA last_arpos

;;;

  INC r_marker
  JSR r_marker_test

.location:
  LDA arrow_pos
  ASL A
  TAY
  LDA arrow_locations, y
  STA ptr1
  LDA arrow_locations+1, y
  STA ptr1+1

  LDX r_marker
  LDA r_results, x
  LSR A
  LSR A            ;again, so this doesn't take so much time, shrink the number
  LSR A
  TAX
  LDY #$01         ;skip the byte in arrow index that describes haflway point
.location_loop:
  DEX
  CPX #$00
  BEQ .store_location
  LDA [ptr1], y
  CMP #$FF
  BEQ .reset_y
  INY
  JMP .location_loop
.reset_y:
  LDY #$01
  JMP .location_loop
.store_location:
  LDA [ptr1], y
  CMP #$FF        ;make sure $FF will not be the value stored in arrow_pos
  BNE .store
  DEY
.store:
  LDA [ptr1], y
  STA arrow_pos+1

  INC r_marker
  JSR r_marker_test

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;;;;
arrow_to_screen:

;  LDA #53         ;keep this in case you need to test a specific coord
;  STA arrow_pos
;  LDA #$03
;  STA arrow_pos+1

  LDA boss_active
  BEQ .no_boss
  JSR boss_arrow_loc_gen
  JMP .draw_arrow

.no_boss:
  LDA arrow_pos
  ASL A
  TAY
  LDA arrow_locations, y
  STA ptr1
  LDA arrow_locations+1, y
  STA ptr1+1

  LDA curr_playfield
  CMP arrow_pos
  BEQ .position_test
  JSR no_arrow
  JMP .rts

.position_test:
  LDA arrow_pos+1
  TAY
  LDA bldg_RAM, y
  STA arrow_loc
  INY
  INY
  LDA bldg_RAM, y
  STA arrow_loc+1

.first_and_last:         ;these tests need done so that arrow
  LDA curr_Background    ;doesn't get all figity on first and last screens
  CMP frst_Background
  BNE .next0

.first_bg_test:
  LDA arrow_loc
  CMP #$70               ;was originally #$60, needed it to be closer to #$80 so more buidings could be included
  BCC .draw_arrow

.next0:
  LDA curr_Background
  CMP finl_Background
  BNE .next1

.last_bg_test:
  LDA arrow_loc
  CMP #$90               ;was originally #$A0, changed for same reason as .first_bg_test
  BCS .draw_arrow

.next1:       ;these tests are done for everything in between
  LDA camera_cent
  CMP #$81
  BCS .right_half

.left_half:    ;ship is on left half of playfield
  LDY #$00
  LDA arrow_pos+1
  CMP [ptr1], y
  BCC .ship_view
  JSR no_arrow
  JMP .rts
.right_half:   ;ship is on right half of playfield
  LDY #$00
  LDA arrow_pos+1
  CMP [ptr1], y
  BCS .ship_view
  JSR no_arrow
  JMP .rts

.ship_view:
  SEC
  LDA ship_x
  SBC #$40
  CMP arrow_loc
  BCC .next2
  JSR no_arrow
  JMP .rts

.next2:
  CLC
  LDA ship_x
  ADC #$40
  CMP arrow_loc
  BCS .draw_arrow
  JSR no_arrow
  JMP .rts

.draw_arrow:

  JSR arrow_radar_off   ;if arrow is on the screen, no radar should be flashing

  SEC
  LDA arrow_loc+1       ;y coord
  SBC #$08
  STA sprite_RAM_MS45
  STA sprite_RAM_MS46

  LDA #$1C              ;tiles
  STA sprite_RAM_MS45+1
  LDA #$1D
  STA sprite_RAM_MS46+1

  LDA counter           ;palette
  CMP #$10
  BCC .firstpal
  CMP #$1F
  BCC .secondpal
  CMP #$2E
  BCC .firstpal
  JMP .secondpal
.firstpal:
  LDA #$01
  JMP .store_palette
.secondpal:
  LDA #$02
.store_palette:
  STA sprite_RAM_MS45+2
  STA sprite_RAM_MS46+2

  CLC
  LDA arrow_loc         ;x coord
  STA sprite_RAM_MS45+3
  ADC #$08
  STA sprite_RAM_MS46+3

.rts:
  RTS


;;;;;;;;;;;;;;;;;;
no_arrow:
  JSR arrow_radar_on    ;when no arrow is visible, radar needs to help

  LDY #$00
.loop:
  LDA #$FE
  STA sprite_RAM_MS45, y
  STA sprite_RAM_MS46, y
  INY
  CPY #$04
  BCC .loop

.rts:
  RTS


;;;;;;;;;;;;;;;;;;
arrow_radar_on:

  LDA boss_active
  BEQ .no_boss
  JMP .rts

.no_boss
  CLC
  LDA curr_playfield
  CMP arrow_pos
  BEQ .rts
  BCC .right_up
  ADC #$01
  BCS .left_up

.left_up:
  LDY #$00
  JMP .light_er_up
.right_up:
  LDY #$02

.light_er_up:
  LDA radar_graphics_index, y
  STA ptr1
  LDA radar_graphics_index+1, y
  STA ptr1+1

  LDY #$00
  LDX #$00
.on_loop:

  LDA [ptr1], y             ;y coord
  STA sprite_RAM_MS41, x
  INY

  LDA [ptr1], y             ;tile
  STA sprite_RAM_MS41+1, x
  INY

  LDA [ptr1], y             ;attr/palettes
  STA sprite_RAM_MS41+2, x
  INY

  LDA [ptr1], y             ;x coord
  STA sprite_RAM_MS41+3, x
  INY

  CLC
  TXA
  ADC #$04
  TAX
  CPY #$10
  BCC .on_loop

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;
arrow_radar_off:

  LDX #$00
.off_loop:

  LDA #$FE
  STA sprite_RAM_MS41, x
  INX
  CPX #$10
  BCC .off_loop

  RTS
