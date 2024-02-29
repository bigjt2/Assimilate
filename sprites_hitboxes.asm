;;;;;;;;;;;;;;;;;;;;;;
;;Erase all onscreen
;;;;;;;;;;;;;;;;;;;;;;
erase_sprites:
  LDY #$00
  LDA #$FE
.loop:
  STA sprite_RAM, y
  INY
  CPY #$FB
  BCC .loop

  RTS


;;;;;;;;;;;;;;;;;;;;;;;;
;;  Ship Subs
;;;;;;;;;;;;;;;;;;;;;;;;
init_ship:

  LDA temp1
  STA ship_x
  STA ship_map_x

  LDA temp2
  STA ship_y

  LDA #$00
  STA ship_pal

  LDA curr_Background
  STA ship_screen_x  ;always start the ship in a position where it will be
                     ;well within the camera's buffer zone.
  RTS

;;;;;;;;;;;;;;;;;;;;;;;;

set_ship_boundingbox:
  ;this boundingbox is used to test collisions against buidlings, victims, & objects

.x_coords:         ;x coords are always the same, so no need to compare for
  LDA ship_x       ;changes in graphical animation
  SEC
  SBC #$0C
  STA ship_left
  CLC
  ADC #$03
  STA ship_left+1
  ADC #$11
  STA ship_right+1
  ADC #$03
  STA ship_right

.y_coords:
  LDA temp1           ;since Ossan moves slightly up and down as he hovers, temp1 is set in
  BNE .second_frame   ;set_ship_sprite_params to reflect the current frames, and then it jumps
                      ;to the appropriate y coord settings here.
.first_frame:
  LDA ship_y
  SEC
  SBC #$08
  STA ship_top+1
  CLC
  ADC #$01
  STA ship_top
  ADC #$09
  STA ship_bottom
  STA ship_bottom+1
  JMP .rts

.second_frame:
  LDA ship_y
  SEC
  SBC #$05
  STA ship_top+1
  CLC
  ADC #$01
  STA ship_top
  ADC #$07
  STA ship_bottom
  ADC #$02
  STA ship_bottom+1

.rts:
  RTS

;;;;;;;;;;;;;;;;;;;;;;;;

set_ship_obj_boundingbox:
  ;this boundingbox is used for various screen tests
  LDA ship_map_x
  SEC
  SBC #$0F   ;dec 15
  STA ship_map_lf+1
  LDA ship_screen_x
  SBC #$00
  STA ship_map_lf

  LDA ship_map_x
  CLC
  ADC #$0F   ;dec 15
  STA ship_map_rt+1
  LDA ship_screen_x
  ADC #$00
  STA ship_map_rt

  RTS

;;;;;;;;;;;;;;;;;;;;;;;;

set_ship_sprites_params:

  LDA ship_y       ;ship sprites y coords
  STA SpriteMap+16
  STA SpriteMap+20
  STA SpriteMap+24
  STA SpriteMap+28
  SEC
  SBC #$08
  STA SpriteMap
  STA SpriteMap+4
  STA SpriteMap+8
  STA SpriteMap+12

  LDA gamestate
  CMP #STATEDEAD
  BNE .reg_tiles
  JMP .load_tiles

.reg_tiles:
  LDA counter        ;ship's tiles w/ animation
  CMP #$10
  BCC .firstFrame
  CMP #$20
  BCC .secondFrame
  CMP #$2E
  BCC .firstFrame
  JMP .secondFrame

.firstFrame:
  LDY #$00
.frame1loop:
  LDA ship_tileset1, y  
  STA ship_tiles, y
  INY
  CPY #$08
  BCC .frame1loop
  JSR set_ship_boundingbox
  LDA #$00         ;set temp1 to 0, so obj_boundingbox 
  STA temp1        ;will set first frame's bb
  JSR set_ship_obj_boundingbox
  JMP .load_tiles

.secondFrame:
  LDY #$00
.frame2loop:
  LDA ship_tileset2, y  
  STA ship_tiles, y
  INY
  CPY #$08
  BCC .frame2loop
  JSR set_ship_boundingbox
  LDA #$01         ;set temp1 to 1, so obj_boundingbox 
  STA temp1        ;will set first frame's bb
  JSR set_ship_obj_boundingbox

.load_tiles:
  LDA ship_tiles
  STA SpriteMap+1

  LDA ship_tiles+1
  STA SpriteMap+5

  LDA ship_tiles+2
  STA SpriteMap+9

  LDA ship_tiles+3
  STA SpriteMap+13

  LDA ship_tiles+4
  STA SpriteMap+17

  LDA ship_tiles+5
  STA SpriteMap+21

  LDA ship_tiles+6
  STA SpriteMap+25

  LDA ship_tiles+7
  STA SpriteMap+29

.palette:
  LDA ship_pal      ;ship's palette
  STA SpriteMap+2
  STA SpriteMap+6
  STA SpriteMap+10
  STA SpriteMap+14
  STA SpriteMap+18
  STA SpriteMap+22
  STA SpriteMap+26
  STA SpriteMap+30

  SEC
  LDA ship_x         ;ship sprites x coords
  SBC #$10           ;decimal 16 - rather than use ship_left, I do this so that 
  STA SpriteMap+3    ;the collision object is slightly smaller than graphical
  STA SpriteMap+19   ;object
  CLC
  ADC #$08
  STA SpriteMap+7
  STA SpriteMap+23
  CLC
  ADC #$08
  STA SpriteMap+11
  STA SpriteMap+27
  CLC
  ADC #$08
  STA SpriteMap+15
  STA SpriteMap+31

  RTS


;;;;;;;;;;;;;;;;;;;;;;;;
;;  Victim Subs
;;;;;;;;;;;;;;;;;;;;;;;;


victim_capture:

  JSR no_arrow   ;erase the arrow

  LDA victim_stat
  CMP #$00
  BEQ .rts
  CMP #$01
  BNE .next0
  JSR victim_initiate
.next0:
  LDA victim_stat
  CMP #$02
  BNE .next1
  JSR victim_raise
.next1:
  LDA victim_stat
  CMP #$03
  BNE .next2
  JSR victim_onboard
.next2:
  LDA victim_stat
  CMP #$04
  BNE .next3
  JSR victim_falling    ;victim is falling to ground because player released b button while raising
.next3:
  LDA victim_stat
  CMP #$05
  BNE .next4
  JSR prep_planting   ;victim is being returned to building to help assimilate
                      ;if PC has come this far then victim_stat must be 5.
.next4:
  LDA victim_stat
  CMP #$06  
  BNE .next5
  JSR victim_planting
.next5:
  LDA victim_stat
  CMP #$07
  BNE .rts
  JSR post_planting    ;this sub is soley to give a buffer time so beam doesn't immediately pick up another victim from same arrow

.rts
  RTS


;;;;;;
victim_initiate:
  JSR victim_grpx_rotate

  SEC
  LDA arrow_loc+1
  SBC #$08
  STA victim_y
  LDA arrow_loc
  STA victim_x

  JSR victim_spr_pal

  LDA #$02
  STA victim_stat

  LDA beam_length    ;store this beam length in first beam_score address
  STA beam_score

  RTS


;;;;;;
victim_raise:
  JSR arrow_radar_off    ;do this or the radar arrows flash
  JSR victim_spr_pal     ;handles the loading of tiles, palettes, and animation

  LDA sprite_RAM_MS47    ;if this is #$FE, player has let go, time to fall
  CMP #$FE
  BNE .raise_next
  LDA #$04
  STA victim_stat
  JMP .rts

.raise_next:
  LDA ship_bottom
  CMP victim_y
  BCC .keep_moving
  LDA #$00
  STA arrow_timer
  LDA #$03
  STA victim_stat
  JSR kill_beam    ;kill beam graphics and sound
  JMP .rts

.keep_moving:
  DEC victim_y 

.rts:
  RTS


;;;;;;
victim_onboard:
  LDA #$00         ;wipe out beam_length so beam isn't same current length next time
  STA beam_length  ;victim_stat returns to 0
  JSR arrow_radar_off

  LDX #$01
  STX ship_speed
  JSR victim_dissappear

  LDA progress_bar
  CMP #$14
  BEQ .finished_filling

.keep_counting:
  JSR ProgressBar
  JSR fill_progress_RAM
  JMP .rts

.finished_filling:
  LDA #$05
  STA victim_stat
  LDA #$01
  STA zombie

.rts
  RTS


;;;;;;
victim_falling:
  JSR arrow_radar_off    ;do this or the radar arrows flash
  JSR victim_spr_pal     ;handles the loading of tiles, palettes, and animation

  LDA victim_y
  CMP arrow_loc+1
  BCC .next0

  LDA #$00         ;originally JSRd to victim_splat here, but that was causing
  STA arrow_timer   ;problems because there wasn't enough time and if player hit B, they would start lifting victim from thin air
  LDA #$07
  STA victim_stat
  JSR victim_dissappear
  JMP .sub_score

.next0:
  LDA victim_x             ;destroy victim so it doesn't shift to
  CMP #$08                 ;opposite edge of screen
  BCS .next1
  LDA #$00         ;originally JSRd to victim_splat here, see above
  STA arrow_timer
  LDA #$07
  STA victim_stat
  JSR victim_dissappear
  JMP .sub_score

.next1:
  CMP #$F9
  BCC .next2
  LDA #$00         ;again, originally JSRd to victim_splat
  STA arrow_timer
  LDA #$07
  STA victim_stat
  JSR victim_dissappear
  JMP .sub_score

.next2
  LDA leftright            ;all this needs done so the victim
  CMP #$01                 ;falling scrolls with the camera
  BCS .fall_right
.fall_left:
  SEC
  LDA last_frame
  SBC xScroll
  STA offset
  CLC
  LDA victim_x
  ADC offset
  STA victim_x
  JMP .inc
.fall_right:
  SEC
  LDA xScroll
  SBC last_frame
  STA offset
  SEC
  LDA victim_x
  SBC offset
  STA victim_x
.inc:
  INC victim_y
  JMP .rts

.sub_score:
  LDA #$05
  STA num_change+4
  LDA #$02
  STA num_change+3
  JSR SubtractScore

.rts:
  RTS


;;;;;;;;
prep_planting:
  JSR fill_glowstat
  JSR arrow_to_screen   ;don't set arrow_stat to 2 without altering it. otherwise it won't loop to here.
.rts:
  RTS


;;;;;;;
victim_planting:

  LDA sprite_RAM_MS47    ;if this is #$FE, player has let go, time to fall
  CMP #$FE
  BNE .plant_next
  LDA #$04
  STA victim_stat
  JSR restore_ship_speed
  JMP .rts

.plant_next:
  JSR victim_spr_pal

  LDA boss_active       ;there's a special method to avoid bug where player can extend beam
  BEQ .normal           ;past arrow in boss battles

  JSR boss_beam_max     ;jumping here will set the beam max to be the arrow, rather than the ground
  LDA beam_max
  STA beam_length

.normal:
  LDA beam_length       ;store this beam length in second beam_score address
  STA beam_score+1

  LDA victim_y
  CLC                   ;this is an added measure to give the player some slack on when the victim "plants."
  ADC #$10              ;too many people playing the demo kept dropping the victim right when it was about 8-16 pixes above the
  CMP arrow_loc+1       ;building because they thought it was planted.
  BCC .keep_moving
  LDA #$00              ;do this before going into post_planting sub so it can loop correctly
  STA arrow_timer

  LDA tool            ;need to multiply x 2 since each entry on tool_assm table is two bytes
  ASL A                 ;first byte is for a_tens, second is for a_ones
  TAY
  LDA tool_assm, y
  STA num_change+3
  LDA tool_assm+1, y
  STA num_change+4
  JSR Assimilation      ;up the assimilation percentage
  JSR anal_test         ;keep track of #times anal probe has been used to unlock campout level

  LDA tool
  ASL A
  TAY
  LDA tool_points, y
  STA num_change+3
  LDA tool_points+1, y
  STA num_change+4
  JSR AddScore         ;increase points for tool used
  LDA #bonus_score
  STA temp1
  JSR Bonus_Handler

  LDX #$00
.beam_score_loop:
  TXA
  PHA                  ;must push as jumping to AddScore will wipe out our X reg otherwise
  LDA beam_score, x
  ASL A
  TAY
  LDA beam_scoring, y
  STA num_change+2
  LDA beam_scoring+1, y
  STA num_change+3
  JSR AddScore
  LDA #bonus_score
  STA temp1
  JSR Bonus_Handler
  PLA                  ;pull from x reg above stack
  TAX
  INX
  CPX #$02
  BCC .beam_score_loop   ;increase points based on how high ship was when victim was raised and planted

  JSR victim_dissappear
  JSR restore_ship_speed

  LDA #$07         ;load in post-planting state
  STA victim_stat
  JSR kill_beam    ;kill beam graphics and sound
  JMP .rts

.keep_moving:
  INC victim_y 

.rts:
  RTS


;;;;;;
post_planting:
  LDA #$00         ;wipe out beam_length so beam isn't same current length next time
  STA beam_length  ;victim_stat returns to 0

  JSR arrow_radar_off
  LDA arrow_timer
  CMP #$03
  BCC .rts
  LDA #$00
  STA ship_pal
  JSR victim_splat

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;
victim_splat:
  JSR victim_dissappear

  LDA #$00
  STA arrow_timer
  LDA #$01
  STA arrow_status

  LDA #$00
  STA victim_stat
  STA zombie

  LDA #$FF
  STA arrow_pos
  STA arrow_pos+1

  RTS


;;;;;;;;;;;;;;;;;;;
victim_spr_pal:

  LDA bonus_active
  CMP #$0F
  BNE .not_cow
  JSR cow_spr_pal
  JMP .rts

.not_cow:
  LDA zombie
  BEQ .normal
  JMP .zombie

.normal:
  LDY victim_num
  LDA victim_pal_bank, y
  STA victim_pal

  LDA victim_num
  ASL A
  TAY
  LDA victim_tile_index, y
  STA ptr1
  LDA victim_tile_index+1, y
  STA ptr1+1
  JMP .anim_timing

.zombie:
  LDY victim_num
  LDA zombie_pal_bank, y
  STA victim_pal

  LDA victim_num
  ASL A
  TAY
  LDA zomb_tile_index, y
  STA ptr1
  LDA zomb_tile_index+1, y
  STA ptr1+1

.anim_timing:
  LDA counter
  CMP #$1E
  BCS .second_frame
.first_frame:
  LDY #$00
  JMP .store
.second_frame:
  LDY #$02

.store:
  LDA [ptr1], y
  STA victim_tile
  INY
  LDA [ptr1], y
  STA victim_tile+1

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;;;;
victim_grpx_rotate:
  LDA victim_num
  CMP victim_max
  BEQ .reset
  INC victim_num
  JMP .rts
.reset:
  LDA #$00
  STA victim_num
.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;;;;
victim_dissappear:
  LDA #$FE
  STA victim_y
  STA victim_x
  STA victim_tile
  STA victim_tile+1
  STA victim_pal

  RTS


;;;;;;;;;;;;;;;;;;;;;;;;
set_victim_sprites_params:
  LDA bonus_active
  CMP #$0F
  BNE .normal
  JSR set_cow_sprites
  JMP .rts

.normal:
  CLC
  LDA victim_y
  STA sprite_RAM_MS39
  ADC #$08
  STA sprite_RAM_MS40

  LDA victim_tile       ;top tile
  STA sprite_RAM_MS39+1
  LDA victim_tile+1     ;bottom tile
  STA sprite_RAM_MS40+1

  LDA victim_pal          
  STA sprite_RAM_MS39+2
  STA sprite_RAM_MS40+2

  LDA victim_x
  STA sprite_RAM_MS39+3
  STA sprite_RAM_MS40+3

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;;;;
;;  Beam Subs
;;;;;;;;;;;;;;;;;;;;;;;;

beam_em_up:

  LDA anim_counter1
  CMP #$02
  BCS .lower_tiles

  LDX #$00
  LDY #$00
  LDA ship_bottom
.upper_tiles_loop:
  STA sprite_RAM_MS47, y
  CLC
  ADC #$10
  INY
  INY
  INY
  INY
  INX
  CPX beam_length
  BCC .upper_tiles_loop
  JMP .tile
.lower_tiles:
  LDX #$00
  LDY #$00
  LDA ship_bottom
  CLC
  ADC #$08
.lower_tiles_loop:
  STA sprite_RAM_MS47, y
  CLC
  ADC #$10
  INY
  INY
  INY
  INY
  INX
  CPX beam_length
  BCC .lower_tiles_loop

.tile:           ;tiles -- drrr!
  LDX #$00
  LDY #$00
  LDA anim_counter1
  CMP #$02
  BCS .tile_0C
.tile_0B:
  LDA #$0B
  STA sprite_RAM_MS47+1, y
  INY
  INY
  INY
  INY
  INX
  CPX beam_length
  BCC .tile_0B
  JMP .palette
.tile_0C:
  LDA #$0C
  STA sprite_RAM_MS47+1, y
  INY
  INY
  INY
  INY
  INX
  CPX beam_length
  BCC .tile_0C

.palette:
  LDX #$00
  LDY #$00
.palette_loop:
  LDA beam_pal
  STA sprite_RAM_MS47+2, y
  INY
  INY
  INY
  INY
  INX
  CPX beam_length
  BCC .palette_loop

.x_coord:        ;x_coord  -- drrr!

  LDX #$00
  LDY #$00
  SEC
  LDA ship_x
  SBC #$04

.x_loop:
  STA sprite_RAM_MS47+3, y
  INY
  INY
  INY
  INY
  INX
  CPX beam_length
  BCC .x_loop

  RTS


;;;;;;;;;;;;;;;;;;;;;;;
kill_beam:

  LDY #$00
  STY beam_length
.loop:
  LDA #$FE
  STA sprite_RAM_MS47, y
  INY
  CPY #$24
  BCC .loop

  RTS


;;;;;;;;;;;;;;;;;;;;;;;
set_beam_max:

  LDA boss_active
  BEQ .normal

  JSR boss_beam_max     ;different routine for boss battles, since there were
  JMP .rts              ;quite a few things that needed changed in this instance

.normal:
  LDX #$00
.loop:
  LDA bldg_RAM, x   ;if no building is below ship, then store the ground as max
  CMP #$FF
  BEQ .store_ground

  SEC
  LDA ship_x
  SBC #$03
  CMP bldg_RAM+1, x
  BCC .next0
  JMP .repeat      ;load next set of building coords for testing

.next0:
  CLC
  LDA ship_x
  ADC #$03
  CMP bldg_RAM, x
  BCS .store_roof  ;if PC makes it here, ship is above a roof, and needs stored as max

.repeat:
  INX
  INX
  INX
  JMP .loop
.store_roof:
  SEC
  LDA bldg_RAM+2, x
;  SBC ship_bottom     ;ship_bottom is now a fluctuating number because I adjust for
  SBC ship_y           ;animation, so use the more permanent ship_y instead and adjust down 8 pixels
  CLC
  ADC #$08
  LSR A                ;because of the way beam subs are set up, beam_max
  LSR A                ;must be a whole number, between 1 and approx 7
  LSR A
  LSR A
  STA beam_max
  JMP .rts

.store_ground:
  SEC  
  LDA #$E0
  SBC ship_bottom
  LSR A
  LSR A
  LSR A
  LSR A
  STA beam_max

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;;;
reposition_ship:

  LDA ship_bottom
  TAY
  SEC
  LDA Offscreen_buffer_lo_table, y
  ROL A
  ROL A
  ROL A
  STA ship_y

  RTS


;;;;;;;;;;;;;;;;;;;;;;;
beam_arrow_collisiontest:
                 
  LDA victim_stat
  CMP #$02
  BNE .arrow_vis_test
  JMP .rts
.arrow_vis_test:
  LDA sprite_RAM_MS45+1
  CMP #$FE             ;if arrow is not visible, it's off-screen, so no need
  BNE .boss_test       ;to test.
  JMP .rts

.boss_test:
  LDA boss_active      ;during boss battles, Ossan will always be in current
  BEQ .playfield_test  ;playfield, so no need to test
  LDA ship_y           ;since the boss could also be ABOVE Ossan, we need to
  CMP arrow_loc+1      ;test the y positions as well.
  BCC .next1
  JMP .rts

.playfield_test:
  LDA curr_playfield
  CMP arrow_pos
  BEQ .next1
  JMP .rts

.next1:
  LDY #$00
.loop:
  LDA sprite_RAM_MS47, y
  CMP #$FE
  BNE .collision_test
  CLC
  TYA
  ADC #$04
  TAY
  CPY #$24
  BNE .loop
  JMP .rts

.collision_test:
  CLC
  LDA sprite_RAM_MS47+3, y
  ADC #$08                  ;beam's right
  CMP arrow_loc             ;arrow's left
  BCC .no_collision

  CLC
  LDA arrow_loc             ;arrow's right
  ADC #$10
  CMP sprite_RAM_MS47+3, y  ;beam's left
  BCC .no_collision

  SEC
  LDA arrow_loc+1           ;arrow's y position
  SBC #$10
  CMP sprite_RAM_MS47, y    ;beam's y position
  BCS .no_collision

.collision:
  LDA victim_stat
  CMP #$05
  BEQ .start_planting
  CMP #$06     ;if victim_stat is 6 or 7, don't do collision test
  BCS .rts

  LDA #$00
  STA arrow_timer
  STA arrow_status

  LDA #$01
  STA victim_stat
  JMP .rts

.no_collision:
  CLC
  TYA
  ADC #$04     ;add 5 to make up for decrementing one above
  TAY
  CPY #$24
  BNE .loop
  JMP .rts

.start_planting:
  JSR no_arrow          ;vanish arrow, reset and erase progress bar
  LDA #$FD
  STA progress_bar+1
  LDA #$FF
  STA progress_bar

  LDA #$06
  STA victim_stat
  LDA ship_x
  STA victim_x
  LDA ship_y
  STA victim_y

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;;;;
;;  Menu Cursor Sprite
;;;;;;;;;;;;;;;;;;;;;;;;

Set_MenCurs_Sprite:
  LDA menu_cursor
  ASL A
  TAY
  LDA menu_cursor_pos, y
  STA menu_cursor+1
  INY
  LDA menu_cursor_pos, y
  STA menu_cursor+2


  LDA menu_cursor+1
  STA sprite_RAM_MS    ;y coord
  LDA #$1E
  STA sprite_RAM_MS+1  ;tile
  LDA menu_cursor+2
  STA sprite_RAM_MS+3  ;x coord

  LDA counter
  CMP #$1F
  BCC .first
.second:
  LDA #$01
  STA sprite_RAM_MS+2  ;attrib
  JMP .rts
.first:
  LDA #$00
  STA sprite_RAM_MS+2  ;attrib

.rts:
  RTS