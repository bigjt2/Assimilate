;;;;;;;;;;;;;;;;;;;;;;;;
init_kogyaru:
  LDA dragon_present   ;skip spawn if kogyaru is already on screen
  BNE .store_offset

  LDA #$13
  STA OAM_SpcNeed
  JSR OAM_memtest
  BCS .store_offset

  LDA #$08
  STA SPR_SpcNeed
  JSR SPR_memtest
  BCS .store_offset

.test_success:
  JSR mem_tests_successful

  JSR SMap_setup
  LDX obj_run_offset

  LDA #$00
  STA kogyaru_anim, x
  STA kogy_ph_stat, x
  STA kogy_vicnum, x

.init_kogyaru:

.store_type:
  LDY obj_init_offset
  LDA [obj_ptr], y
  STA oam_type, x

.x_coords:
  INY
  LDA [obj_ptr], y
  STA oam_xMapLO, x

  LDA ship_screen_x
  STA oam_xMapHI, x

.y_coord:
  INY
  LDA [obj_ptr], y
  STA oam_yMapLO, x

  LDA #$00
  STA drgn_pause_timer ;I use these same variables
  LDA #$01             ;from the dragon to
  STA dragon_present   ;not waste space
  LDA #kogyaru_hold
  STA kogyaru_state, x

.store_offset:
  LDA obj_init_offset
  CLC
  ADC #$03  ;amount of spots to jump is much less than typical object
  STA obj_init_offset

.rts:
  JMP OBJ_init_loop_return


;;;;;;;;;;;;;;;;
run_kogyaru:
  LDY obj_run_offset    ;offset should reflect where pointer is on $0700 OAM table

  LDA oam_type, y
  AND #$40         ;check for destroy flag in bit 6
  BEQ .check_status
  JMP .destroy_kogyaru

.check_status:
  LDA kogyaru_state, y
  CMP #kogyaru_hold
  BEQ .holding
  CMP #kogyaru_seek
  BEQ .seeking
  CMP #kogyaru_abduct
  BEQ .abducting
  CMP #kogyaru_shoot
  BEQ .shooting
  JMP .moving

.holding:
  LDA drgn_pause_timer
  CMP #$04
  BCS .hold_done
  JMP .skip            ;will need to test collision regardless of movement
.hold_done:            ;and collision test is under movement label
  LDA #$00
  STA drgn_pause_timer
  LDA #kogyaru_seek
  STA kogyaru_state, y
  JMP .skip            ;for the sake of saving cycles, wait until next frame to seek

.seeking:
  LDA arrow_status
  CMP #$02
  BEQ .set_target
  JMP .skip
.set_target:
  JSR kogyaru_set_target
  LDA #kogyaru_chase
  STA kogyaru_state, y
  JMP .skip

.moving:
  JSR kogyaru_movement
  JMP .skip

.abducting:
  JSR kogyaru_adbuct
  LDY obj_run_offset
  JMP .skip

.shooting:
  JSR koyaru_shooting

.skip:
  LDA #$00   ;in this sub, loop_counter variable is used to track the number
  STA loop_counter   ;of sprites in the object that need tested

  LDA oam_xMapLO, y    ;start by transferring the current x coord of the object
  STA sprite_x_offset  ;to this variable, which will be used in the visibility testing.
  STY temp_y           ;temp_y is used to increment the offset for the SpriteMap RAM variables

  LDA oam_xMapHI, y
  PHA      ;MUST push this to the stack, it's very likely it will be incremented in the following code so I need a backup

.kogyaru_visibility
  JSR visibility_check
  BCS .onscreen

.offscreen:
  LDY temp_y
  LDA #$FA               ;Y COORDS
  LDX oam_SMap_loc, y
  STA SpriteMap, x
  STA SpriteMap+16, x
  JMP .visibility_loop_test

.onscreen:
  LDY temp_y
  LDX oam_SMap_loc, y

  LDY obj_run_offset
  LDA oam_yMapLO, y      ;Y COORDS
  STA SpriteMap, x
  CLC
  ADC #$08
  STA SpriteMap+16, x

  LDA sprite_x_offset    ;X COORDS
  SEC              
  SBC camera_Left_x
  STA SpriteMap+3, x
  STA SpriteMap+19, x

.visibility_loop_test:

  INC temp_y
  INC loop_counter
  LDA loop_counter
  CMP #$04            ;<--CHANGE for each new object use the number of sprites comprising
  BCS .tiles_pal      ;the object, do not subtract one for counting from zero

  LDA sprite_x_offset
  CLC                 ;increase sprite offset so next run through visibility_check will
  ADC #$08            ;calculate the next sprite to the right
  STA sprite_x_offset

  LDY obj_run_offset  ;be sure to restore y to the offset since I'm going back to using
                      ;the oam variables here and in the visibility_check sub after
  LDA oam_xMapHI, y
  ADC #$00            ;increment oam's screen number, if neccessary, otherwise real funky stuff will
  STA oam_xMapHI, y   ;happen with the visibility calculations, like objs appearing on screens where they shouldn't.
  JMP .kogyaru_visibility

.tiles_pal:
  LDY obj_run_offset   ;restore y to the obj_run_offset, otherwise all inderects will be using the temp_y
  PLA   ;here we must restore the original xMapHI in oam, in case it incremented
  STA oam_xMapHI, y

.animation:
  LDA #$00
  STA loop_counter

  LDX obj_run_offset
  INC kogyaru_anim, x        ;fucking INC can't work with y reg!!!
  LDA kogyaru_anim, x
  CMP #$08                   ;i don't want it wasting CPU cycles by loading all
  BEQ .second_frame          ;tiles every frame, so we only should branch on
  CMP #$10                   ;exact values.
  BEQ .first_frame
  JMP .collision_testing

.first_frame:
  LDA #$00
  STA kogyaru_anim, x
  TAX
  JMP .load_anim_tile_attr
.second_frame:
  LDX #$08

.load_anim_tile_attr:        ;position on the animation tables below.
  LDA oam_SMap_loc, y
  TAY
.tile_loop:
  LDA kogyaru_anim_tiles, x
  STA SpriteMap+1, y
  LDA #$01
  STA SpriteMap+2, y
  INY
  INY
  INY
  INY
  INX
  INC loop_counter
  LDA loop_counter
  CMP #$08
  BCC .tile_loop

.collision_testing:
  LDY obj_run_offset
  LDX oam_SMap_loc, y
  LDA SpriteMap, x     ;test whether first sprite is on-screen.
  CMP #$FA             ;if not, then entire object assumed to be off-screen, so skip collision test
  BEQ .increase_offset

  LDA #$04
  STA obj_height
  LDA #$36
  STA obj_width
  LDA #$02
  STA temp1    ;temp1 is the amount to offset x to the right
  LDA #$03
  STA temp2    ;temp2 is the amount to offset y downward

  JSR obj_coords_to_bbox   ;will take x & y coord and create a bbox
  JSR collision_against_ship  ;will take bbox and test collision agains Ossan, set player_dead var if collision
  BCC .increase_offset

.death:
;  JSR ship_dies

.destroy_kogyaru:
;  JSR destroy_kogyaru

.increase_offset:
  LDA obj_run_offset
  CLC                 ;need to increase this so OAM will load in correct pos
  ADC #$13            ;for next object in $0700 memory
  STA obj_run_offset

.rts:
  JMP OBJ_run_loop_return


;;;;;;;;;;;;;;;;;;;
destroy_kogyaru:
  LDY obj_run_offset
  STY temp_y
  LDA #$00
  STA loop_counter

.clear_sprites_loop:
  LDY temp_y            ;temp_y gets constantly inc'd in this loop to create teh correct offset in SMap
  LDX oam_SMap_loc, y
  JSR clear_sprite_tile ;clears the four bytes beginning with oam_SMap_loc, y
  INC temp_y
  INC loop_counter      ;temp_y will start at a different value each time, so loop_counter
  LDA loop_counter      ;is used to keep track of looping instead.
  CMP #$08              ;CHANGE number depending on object's length
  BCC .clear_sprites_loop

  LDA SPR_Free
  CLC
  ADC #$08
  STA SPR_Free

  LDY obj_run_offset
  JSR clear_oam_chunk   ;since kogyaru uses additional sprites, must
  STA oam_SMap_loc+1, y ;clear out the extra locations
  STA oam_SMap_loc+2, y
  STA oam_SMap_loc+3, y
  STA oam_SMap_loc+4, y
  STA oam_SMap_loc+5, y
  STA oam_SMap_loc+6, y
  STA oam_SMap_loc+7, y
  STA kogy_vicnum, y

  LDA OAM_Free
  CLC
  ADC #$13
  STA OAM_Free

  LDA #$00
  STA dragon_present    ;clear kogyaru_present so another kogyaru can spawn. 

  RTS


;;;;;;;;;;;;;;;;;;;
kogyaru_movement:
  LDA kogy_ph_stat, y
  CMP #$69              ;i've decided this should be the symbol that means kog has a victim and is ready to throw it at
  BEQ .find_ossan       ;ossan.  it should have been set to this at the end of kogyaru_abduct sub.
.find_arrow:
  JSR kogmove1
  JMP .rts
.find_ossan:
  JSR kogmove2
.rts:
  RTS


;;;;;;;;;;;;;;;;;;;
kogmove2:               ;kogyaru's goal is to move within range of Ossan.

  LDA SpriteMap+7
  STA temp2             ;holds ossan's screen coord.

  LDY obj_run_offset
  INY                   ;INY to get the second Smap position, to hopefully be closer
  LDX oam_SMap_loc, y   ;to the middle.
  LDA SpriteMap+3, x
  STA temp1             ;holds kogyaru's screen coord.

  LDA SpriteMap, x
  CMP #$FA
  BEQ .offscreen_moving

.onscreen_moving:
  DEY                ;BE SURE to decrement y, since it was incremented above.
  LDA temp2
  CMP temp1
  BCC .on_ossanisless
.on_ossanismore:
  LDA temp1     ;kogyaru's coords
  CLC
  ADC #$60      ;112 pixels to right
  CMP temp2
  BCC .move_right   ;kogyaru needs to move right
  JMP .change_status    ;otherwise fire.
.on_ossanisless:
  LDA temp2     ;ossan's coords
  CLC
  ADC #$60
  CMP temp1
  BCC .move_left  ;kogyaru needs to move left
  JMP .change_status    ;otherwise in both instances kog is within range to fire.

.move_right:
  LDA oam_xMapLO, y
  CLC
  ADC #$03
  STA oam_xMapLO, y
  LDA oam_xMapHI, y
  ADC #$00
  STA oam_xMapHI, y
  JMP .rts

.move_left:
  LDA oam_xMapLO, y
  SEC
  SBC #$03
  STA oam_xMapLO, y
  LDA oam_xMapHI, y
  SBC #$00
  STA oam_xMapHI, y
  JMP .rts

.offscreen_moving:
  DEY                ;BE SURE to decrement y, since it was incremented above.
  LDA ship_screen_x
  CMP oam_xMapHI, y      ;first compare the screens in the high bytes
  BEQ .off_ossanissame
  BCC .off_ossanisless
.off_ossanismore:        ;if different, we can simply jump to the movement
  JMP .move_right        ;labels above.
.off_ossanisless:
  JMP .move_left
.off_ossanissame:        ;if konyaru and ossan's screens are equal, we need to
  LDA oam_xMapLO, y      ;compare thier x values in the low bytes
  CMP ship_map_x
  BCC .move_right
  JMP .move_left

.change_status:
  LDA #kogyaru_shoot
  STA kogyaru_state, y

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;
kogmove1:               ;kogyaru's goal is to move toward the arrow.
  LDA kogy_xTarget+1, y
  CLC                   ;since kogyaru moves in segments of three and the targets are always going to be
  ADC #$04              ;even, I test for when it's between xTarget and temp2 to provide a "range" for her to land in.
  STA temp2             ;otherwise she might get stuck.

.x_movement:
  LDA oam_xMapHI, y
  CMP kogy_xTarget, y
  BCC .add_x
  BNE .sub_x
  LDA oam_xMapLO, y
  CMP kogy_xTarget+1, y
  BCC .add_x
  CMP temp2
  BCS .sub_x
  JMP .change_phase

.add_x:
  LDA oam_xMapLO, y
  CLC
  ADC #$03
  STA oam_xMapLO, y
  LDA oam_xMapHI, y
  ADC #$00
  STA oam_xMapHI, y
  JMP .rts

.sub_x:
  LDA oam_xMapLO, y
  SEC
  SBC #$03
  STA oam_xMapLO, y
  LDA oam_xMapHI, y
  SBC #$00
  STA oam_xMapHI, y
  JMP .rts

.change_phase:
  LDA arrow_status
  CMP #$02
  BNE .set_hold
.set_aduct:
  LDA #kogyaru_abduct
  STA kogyaru_state, y
  JMP .rts
;  JMP .reset_phase_status
.set_hold:
  LDA #kogyaru_hold
  STA kogyaru_state, y
;.reset_phase_status:
;  LDA #$00
;  STA kogy_ph_stat

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;
kogyaru_set_target:

.x_target:
  JSR pull_kogy_xtarg    ;x coord
  LDY obj_run_offset
  STA kogy_xTarget+1, y
  LDA arrow_pos          ;screen number
  STA kogy_xTarget, y

.test_direction
  LDA oam_xMapHI, y      ;kogyaru's screen < arrow's screen
  CMP arrow_pos
  BCC .target_to_right

.target_to_left:
  LDA #left
  STA oam_dir, y
  JMP .x_rounding

.target_to_right:
  LDA #right
  STA oam_dir, y

.x_rounding:   ;round the numbers to even
  LDA kogy_xTarget+1, y
  AND #$01
  CMP #$01
  BEQ .x_odd
  JMP .rts
.x_odd:
  LDA kogy_xTarget+1, y
  CLC
  ADC #$01
  STA kogy_xTarget+1, y

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;
pull_kogy_xtarg:
  LDA arrow_pos   ;screen number of current arrow
  SEC
  SBC #$4D        ;this is to offset the pointer. i don'thave the first 77 tables
  ASL A           ;listed because in the kogyaru obj file they are not neccessary and would be a waste of memory.
  TAY

  LDA kogyaru_arrow_pulls, y    ;special tables of replicated data derived off
  STA ptr1                      ;the object tables for Area 4
  LDA kogyaru_arrow_pulls+1, y
  STA ptr1+1

  LDA arrow_pos+1    ;current byte within the arrow target table. this number was set
  STA temp2          ;up to be a multiple of three, so it needs to be divided by three.
  JSR div3

  LDY temp2          ;temp2 is the quotient received from div3 sub.
  LDA [ptr1], y
  AND #$F0           ;highest four bits are x coord, hence the only thing we need
  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;
div3:
  LDA #$00
  LDY #$08
  ASL temp2
.l1:
  ROL A
  CMP #$03
  BCC .l2
  SBC #$03
.l2:
  ROL temp2
  DEY
  BNE .l1
  RTS


;;;;;;;;;;;;;;;;;;;;;
kogyaru_adbuct:
  LDA kogy_ph_stat, y
  BEQ .victim_init
  JMP .victim_raise

.victim_init:
  JSR victim_grpx_rotate
  LDA victim_num
  STA kogy_vicnum, y    ;this will be transferred to the weapon victim's variables shortly 
  LDA arrow_loc+1
  SEC
  SBC #$08              ;the arrow coords become the victim's starting coords
  STA victim_y
  LDA arrow_loc
  STA victim_x
  JSR kvictim_visibility  ;visbility test

  LDY obj_run_offset
  LDA #$01
  STA kogy_ph_stat, y

  LDA #$00              ;this section is pulled from the beam collision sub and
  STA arrow_timer
  LDA #$01
  STA arrow_status      ;victim_splat.  it's meant to do all the things neccessary
  LDA #$00
  STA victim_stat
  STA zombie            ;to reset the arrow and also advance the victim graphics
  LDA #$FF
  STA arrow_pos
  STA arrow_pos+1       ;without adjusting the player's score or assimilation.
  JMP .rts

.victim_raise:
  LDA victim_y
  CMP oam_yMapLO, y     ;kogyaru's mid y coord
  BCS .keep_raising
  JMP .change_status
.keep_raising:
  SEC
  SBC #$02
  STA victim_y
  JSR kvictim_visibility
  JMP .rts

.change_status:
  LDA #kogyaru_chase
  STA kogyaru_state, y
  JSR victim_dissappear
  LDA #$69
  STA kogy_ph_stat, y


.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;
kvictim_visibility:
  LDA oam_xMapLO, y    ;start by adjusting and transferring the current x coord
  CLC                  ;of the object to sprite_x_offset, since that is what's
  ADC #$08             ;used in the visibility test.
  STA sprite_x_offset  ;x_offset here is 8 pixels to right of object's left edge

.kogyaru_visibility
  JSR visibility_check ;no need to loop, of course.  only one set of x coords.
  BCS .onscreen

.offscreen:
  LDA #$FE             ;in this one, don't adjust the y_coords because the victim
  STA victim_tile      ;code is way older and handles y coords differently than the object handler.
  STA victim_tile+1    ;simply blank out the tiles.
  JMP .rts

.onscreen:
  JSR victim_spr_pal   ;if onscreen, simply jumpt to this sub as it will load the tiles
  LDA sprite_x_offset  ;and palettes back in.
  SEC                  ;also adjust the offset with the camera to make up for the
  SBC camera_Left_x    ;player possibly scrolling (not a problem when Ossan abducts, obviously.)
  STA victim_x

.rts:
  RTS


;;;;;;;;;;;;;;;;;;
koyaru_shooting:
  LDA #$10
  STA weapon_xoffset
  LDA #$08
  STA weapon_yoffset
  JSR init_weapon_victim

.chase_test:           ;variables below will overwrite some of chase kogyaru's variables,
  LDY obj_run_offset   ;so skip them on chase level.
  LDA oam_type, y
  CMP #c_kogyaru
  BEQ .rts
 
  LDA #kogyaru_hold
  STA kogyaru_state, y
  LDA #$00
  STA kogy_ph_stat, y
  STA drgn_pause_timer

.rts
  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;
kogyaru_anim_tiles:

  .db $8C,$8D, $8E,$8F, $90,$91, $92,$93  ;first frame
  .db $94,$95, $96,$97, $98,$99, $9A,$9B  ;second frame

;  .db $01,$02, $03,$04, $05,$06, $07,$08  ;first frame
;  .db $14,$15, $16,$17, $18,$19, $1A,$1B  ;second frame


;;;;;;;;;;;;
kogyaru_hold       = $01  ;pausing in mid-flight
kogyaru_seek       = $02  ;calculationg target
kogyaru_chase      = $03  ;moving to current target
kogyaru_abduct     = $04  ;pulling the victim up
kogyaru_shoot      = $05  ;shooting the victim at Ossan