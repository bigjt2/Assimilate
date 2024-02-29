;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SwitchPlayfield:

  LDA boss_active
  BNE .rts

  LDA leftright
  CMP #$01
  BCS .IncPlayfield

.DecPlayfield:
  LDA last_camera_cent
  CMP #$00
  BNE .rts
  LDA ship_speed
  TAX

  LDA camera_cent
  CMP screen_changes, x    ;needs changed if ship/scroll changes speed
  BNE .rts
  DEC curr_playfield
  JMP .rts

.IncPlayfield:
  LDA ship_speed
  TAX

  LDA last_camera_cent
  CMP screen_changes, x    ;needs changed if ship/scroll changes speed
  BNE .rts
  LDA camera_cent
  CMP #$00
  BNE .rts
  INC curr_playfield

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Get_CameraCent_Offset:

  CLC
  LDA xScroll
  ADC #$80
  STA camera_cent

  LDA leftright
  CMP #$01
  BCS .right_offset

.left_offset:
  SEC
  LDA #$80
  SBC camera_cent
  STA offset
  JMP .rts

.right_offset:

  LDA xScroll    ;camera_cent - $80 will always equal xScroll
  STA offset

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;
Fill_bldg_RAM:

  LDA curr_playfield
  ASL A
  TAY

  LDA collision_object_index, y
  STA ptr1
  LDA collision_object_index+1, y
  STA ptr1+1

  LDY #$00
  LDX #$00

  LDA leftright
  CMP #$01
  BCS .right_loop

.left_loop:
  LDA [ptr1], y
  CMP #$FF
  BNE .leftnext
  LDA #$FF
  STA bldg_RAM, x     ;store terminator byte so collision testing code knows to stop
  JMP .rts

.leftnext:
  CLC
  AND #%11110000      ;xcoords, first left edge of object, no need to multiply by 16,
                      ;param being contained in bits 7-4 is the same as being shifted left four times, hence already doubled four times 
  ADC offset          ;going left, add offset

  STA bldg_RAM, x
  INX
  CLC
  ADC #$0F
  STA bldg_RAM, x   ;add 15 for right edge of object
  INX

  LDA [ptr1], y
  AND #%00001111
  ASL A
  ASL A
  ASL A
  ASL A
  STA bldg_RAM, x   ;top edge of object
  INX

  INY
  JMP .left_loop

.right_loop:
  LDA [ptr1], y
  CMP #$FF
  BNE .rightnext
  LDA #$FF
  STA bldg_RAM, x     ;store terminator byte so collision testing code knows to stop
  JMP .rts

.rightnext:
  SEC
  AND #%11110000      ;xcoords, first left edge of object, again, no need to multiply
  SBC offset          ;going right, subtract the offset

  STA bldg_RAM, x
  INX
  CLC
  ADC #$0F
  STA bldg_RAM, x   ;add 15 for right edge of object
  INX

  LDA [ptr1], y
  AND #%00001111
  ASL A
  ASL A
  ASL A
  ASL A
  STA bldg_RAM, x   ;top edge of object
  INX

  INY
  JMP .right_loop

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
DownCollisionTest:
  LDA ship_y
  CLC
  ADC #$08
  STA temp1

  LDX #$00
.Redo:
  LDA bldg_RAM, x
  CMP #$FF
  BEQ .Clear

  LDY #$00

  LDA bldg_RAM+2, x  ;compared against current building's top
  CMP temp1
;  CMP ship_bottom
  BCS .DownNext2

  SEC
  LDA bldg_RAM+1, x  ;compared against current building's right
  SBC #$01
  CMP ship_left
  BCC .DownNext1
  INY

.DownNext1:
  CLC
  LDA bldg_RAM, x    ;compared against current building's left
  ADC #$02
  CMP ship_right
  BCS .DownNext2
  INY

.DownNext2:
  CPY #$02
  BEQ .StopDown
  INX
  INX
  INX
  JMP .Redo
.StopDown:
  LDA #$01
  STA stop_movement
  JMP DownCollisionDone
.Clear:
  LDA #$00
  STA stop_movement
DownCollisionDone
  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LeftCollisionTest:  ;;005D is stop_movement
  LDA ship_map_lf
  CMP frst_Background  ;finl_Background
  BNE .building_collision
  LDA ship_map_lf+1
  CMP #$02
  BCS .building_collision
  JMP .StopLeft

.building_collision:
  LDA ship_x
  SEC
  SBC #$0F
  STA temp1

  LDX #$00
.Redo:
  LDA bldg_RAM, x
  CMP #$FF
  BEQ .Clear

  LDY #$00

  LDA bldg_RAM+1, x   ;compared against building's right
  CMP temp1
;  CMP ship_left
  BCC .LeftNext2

  CLC
  LDA bldg_RAM+2, x   ;compared against building's top
  ADC #$01
  CMP ship_bottom
  BCS .LeftNext1
  INY

.LeftNext1:
  LDA bldg_RAM+1, x   ;compared against building's right
  CMP ship_right
  BCC .LeftNext2
  LDY #$00

.LeftNext2:
  CPY #$01
  BEQ .StopLeft
  INX
  INX
  INX
  JMP .Redo
.StopLeft:
  LDA #$02
  STA stop_movement
  JMP LeftCollisionDone
.Clear:
  LDA #$00
  STA stop_movement
LeftCollisionDone:
  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
RightCollisionTest:
  LDA ship_map_rt
  CMP finl_Background
  BNE .building_collision
  LDA ship_map_rt+1
  CMP #$FF
  BCC .building_collision
  JMP .StopRight

.building_collision:
  LDX #$00
.Redo:
  LDA bldg_RAM, x
  CMP #$FF
  BEQ .Clear

  LDY #$00

  LDA bldg_RAM, x    ;compared against building's left
  CMP ship_right
  BCS .RightNext2

  CLC
  LDA bldg_RAM+2, x  ;compared against building's top
  ADC #$01
  CMP ship_bottom
  BCS .RightNext1
  INY

.RightNext1:
  LDA bldg_RAM, x   ;compared against building's left
  CMP ship_left
  BCS .RightNext2
  LDY #$00

.RightNext2:
  CPY #$01
  BEQ .StopRight
  INX
  INX
  INX
  JMP .Redo
.StopRight:
  LDA #$03
  STA stop_movement
  JMP RightCollisionDone
.Clear:
  LDA #$00
  STA stop_movement
RightCollisionDone:
  RTS