;;;;;;;;;;;;;;;;;;
init_shuttle:

  LDA #$08
  STA building_x
  LDA #$C8
  STA building_y

  LDY #$00
  LDX shuttle_SMap_loc
.tile_loop:
  LDA shuttle_tiles, y
  STA SpriteMap+1, x
  INX
  INX
  INX
  INX
  INY
  CPY #$05
  BCC .tile_loop

  LDA #$03
  LDY #$00
  LDX shuttle_SMap_loc
.palette_loop:
  STA SpriteMap+2, x
  INX
  INX
  INX
  INX
  INY
  CPY #$05
  BCC .palette_loop

  LDA #$02
  STA boss_bldg_stat
  LDA #$09
  STA boss_bldg_timer

  RTS


;;;;;;;;;;;;;;;;;;;;;
run_shuttle:
  LDA boss_bldg_timer
  CMP #$08
  BCC .rts  ;if building time is #$0B, init
  CMP #$09
  BCS .run

.init:
  JSR init_shuttle      ;doing subs just to avoid branch range errors. they won't
                        ;actually be universalized to save space.
.run:
  LDA building_x
  CMP #$E0
  BCS .destroy
.move:
  INC building_x
  INC building_x

  LDY #$00
  LDX shuttle_SMap_loc
  LDA building_x
  STA SpriteMap+3, x
.x_loop:
  INX
  INX
  INX
  INX
  STA SpriteMap+3, x
  CLC
  ADC #$08
  INY
  CPY #$04              ;
  BCC .x_loop

  LDY #$00
  LDX shuttle_SMap_loc
  LDA building_y
  STA SpriteMap, x
  CLC                   ;
  ADC #$08
.y_loop:
  INX
  INX
  INX
  INX
  STA SpriteMap, x
  INY
  CPY #$04
  BCC .y_loop
  JMP .rts

.destroy:
  LDA #$00
  STA boss_bldg_stat
  STA boss_bldg_timer

  LDX shuttle_SMap_loc
  LDY #$00
  LDA #$FA
.destroy_loop:
  STA SpriteMap, x
  INX
  INX
  INX
  INX
  INY
  CPY #$05
  BCC .destroy_loop

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;;
init_kogy_sprite:

  LDA #$88
  STA kogy_map_y

  LDY kogy_SMap_loc
.y_loop:
  LDA #$FA
  STA SpriteMap, y
  STA SpriteMap+16, y
  INY
  INY
  INY
  INY
  CPY #$30
  BCC .y_loop

  LDX #$00
  LDY kogy_SMap_loc
.tile_loop:
  LDA boss_kogy_anim_tiles, x
  STA SpriteMap+1, y
  INY
  INY
  INY
  INY
  INX
  CPY #$40
  BCC .tile_loop

  LDA #$21
  LDY kogy_SMap_loc
.pal_loop:
  STA SpriteMap+2, y
  INY
  INY
  INY
  INY
  CPY #$40
  BCC .pal_loop

  LDA #$80             ;this will be the xcoord for the entire huge ship
  STA kogy_spritex
  LDA #$70             ;this is just the x coord of the kogy sprite's left edge
  LDY kogy_SMap_loc
.x_loop:
  STA SpriteMap+3, y
  STA SpriteMap+19, y
  CLC
  ADC #$08
  INY
  INY
  INY
  INY
  CPY #$30
  BCC .x_loop

  LDA #$80
  STA kogy_map_xLO
  LDA #117               ;I want it to match the ship's actual screen
  STA kogy_map_xHI

  RTS


;;;;;;;;;;;;;;;;;;;
run_kogy_sprite:

.visibility:
  LDA kogy_map_xLO
  SEC
  SBC #$0C
  STA sprite_x_offset    ;first tile's middle coord
  LDA kogy_map_xHI
  PHA                    ;push to stack to restore after the vis loop is done
  SBC #$00
  STA kogy_map_xHI       ;tile's map screen

  LDA #$00
  STA loop_counter

  LDX kogy_SMap_loc
.visibility_loop:
  JSR boss4_visibility_check
  BCS .onscreen

.offscreen:
  LDA #$FA
  STA SpriteMap, x
  STA SpriteMap+16, x
  JMP .visibility_loop_test

.onscreen:
  LDA kogy_map_y
  STA SpriteMap+16, x
  SEC
  SBC #$08
  STA SpriteMap, x

.visibility_loop_test:
  INC loop_counter
  LDA loop_counter
  CMP #$04
  BCS .animation
  LDA sprite_x_offset
  CLC
  ADC #$08
  STA sprite_x_offset
  LDA kogy_map_xHI
  ADC #$00
  STA kogy_map_xHI
  INX
  INX
  INX
  INX
  JMP .visibility_loop

.animation:
  PLA
  STA kogy_map_xHI

  LDA kogy_anim_frame    ;this variable is managed seperately in the
  CMP #$0B               ;boss4_animation sub, so no need to increment
  BEQ .second            ;or reset it here.
  CMP #$17
  BEQ .first
  JMP .x_movement
.first:
  LDX #$00
  JMP .tile_load
.second
  LDX #$08

.tile_load:
  LDY kogy_SMap_loc
.tile_loop:
  LDA boss_kogy_anim_tiles, x
  STA SpriteMap+1, y
  INY
  INY
  INY
  INY
  INX
  CPY #$40
  BCC .tile_loop

.x_movement:
  LDA kogy_spritex
  SEC
  SBC xScroll
  SEC
  SBC #$10
  LDY kogy_SMap_loc
.x_loop:
  STA SpriteMap+3, y
  STA SpriteMap+19, y
  CLC
  ADC #$08
  INY
  INY
  INY
  INY
  CPY #$30
  BCC .x_loop

  RTS


;;;;;;;;;;;;;;;;
turn_klaser_on:
  LDA #$01
  STA klaser_stat
  DEC boss_paces

  LDA #klaserON_sfx
  STA current_song
  JSR sound_load

  RTS


;;;;;;;;;;;;;;;;;;
turn_klaser_off:
  LDA #$00
  STA klaser_stat
  DEC boss_paces

  LDA #$FA
  LDX klaser_SMap_loc
  STA SpriteMap, x
  STA SpriteMap+4, x
  STA SpriteMap+8, x
  STA SpriteMap+12, x

  LDA #klaserOFF_sfx
  STA current_song
  JSR sound_load

  RTS


;;;;;;;;;;;;
run_klaser:
  LDA klaser_death_count
  BEQ .stat_check
  JMP .death
.stat_check:
  LDA klaser_stat
  BNE .animation
  JMP .rts

.animation:
  LDA #$00
  STA loop_counter
  LDX klaser_SMap_loc

  LDA klaser_stat
  CMP #$02
  BEQ .second
  CMP #$03
  BEQ .third
  CMP #$04
  BEQ .fourth

.first:
  LDA #$02
  STA klaser_stat
  LDY #$00
  JMP .load_loop
.second:
  LDA #$03
  STA klaser_stat
  LDY #$10
  JMP .load_loop
.third:
  LDA #$04
  STA klaser_stat
  LDY #$20
  JMP .load_loop
.fourth:
  LDA #$01
  STA klaser_stat
  LDY #$30

.load_loop:
  LDA klaser_nums, y
  STA SpriteMap, x
  INY
  INX
  LDA klaser_nums, y
  STA SpriteMap, x
  INY
  INX
  LDA klaser_nums, y
  STA SpriteMap, x
  INY
  INX
  LDA klaser_nums, y
  SEC
  SBC xScroll
  STA SpriteMap, x
  INY
  INX
  INC loop_counter
  LDA loop_counter
  CMP #$04
  BCC .load_loop

.collision:
  LDA #$78
  SEC
  SBC xScroll
  STA temp1      ;laser's left
  CLC
  ADC #$10
  STA temp2      ;laser's right

  LDA ship_bottom
  CMP #$30
  BCC .rts

  LDA #$58
  CMP ship_top
  BCC .rts

  LDA ship_right
  CMP temp1
  BCC .rts

  LDA temp2
  CMP ship_left
  BCC .rts

.death:
  INC klaser_death_count   ;wierd, but this is neccessary due to the the lag between the collision
  LDA klaser_death_count   ;and when the laser's graphics actually appear on the screen.  I need
  CMP #$03                 ;engine to actually run a few frames so the player "sees" the laser that killed them
  BCS .no_its_really_dead  ;if right above kogyaru.
  JMP .rts
.no_its_really_dead:
  JSR ship_dies
;  LDA ship_pal
;  CMP #$03
;  BCC .inc
;.reset:
;  LDA #$00
;  STA ship_pal
;  JMP .rts
;.inc:
;  INC ship_pal

.rts:
  RTS