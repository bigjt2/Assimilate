;For new boxx_.asm files, don't forget to add the moving target for planting
;victims in boss.asm.  It's under the lable boss_target_params.


;Kogyaru Features
;X boosters and light on top flash (use background chr-bank swapping. if that doesn't work forget it. DO NOT use sprites).
;X moves back and forth with kogy sprite in middle. dissapears off screen sometimes
;x she shoots victims at Ossan just like normal Kogyaru
;x occasionally shoots a laser beam strait up, out of the light thingily. this is also where the victim needs to be dropped.
;x glowing rings come out of shoulder circles. fireballs come out of tentacles (or some other projectile?)
;x Ossan gets his victims from the space shuttle
;x collision needs to match the scroll and only apply when graphics are onscreen

;;;;;;;;;;;;;;;;;;;;;;;
init_boss4_special_objects:

  LDA #$20
  STA kogy_SMap_loc
  LDA #$40
  STA klaser_SMap_loc
  LDA #$50
  STA shuttle_SMap_loc

  LDA #$00               ;store zeros to mark out the needed positions
  LDY #$20               ;in sprite map and oam.
.sprite_map_block_loop:
  STA SpriteMap, y
  INY
  INY
  INY
  INY
  CPY #$64               ;CHANGE when you add more sprites
  BCC .sprite_map_block_loop

  LDA #ignore      ;block out this chunk oam since it will be permanently
  STA OAM          ;used while boss4 battle is going on.
  LDA #$0D         ;this allows object handler to ignore this chunk of oam.
  STA OAM+1

  LDA OAM_Free     ;subtract oam space and sprite space at end
  SEC
  SBC #$0C
  STA OAM_Free
  LDA SPR_Free
  SEC
  SBC #$11
  STA SPR_Free

  LDA #$00
  STA kogy_anim_frame
  STA klaser_stat
  STA klaser_death_count
  STA fb_kogy_vicnum

;                    --00--
  LDA #$50           ;left shoulder for rings
  STA boss_coords
  LDA #$66
  STA boss_coords+1
;                    --01--
  LDA #$A0           ;right shoulder for rings 
  STA boss_coords+2
  LDA #$66
  STA boss_coords+3
;                    --02--
  LDA #$68           ;left tentacle for fireballs
  STA boss_coords+4
  LDA #$C8
  STA boss_coords+5
;                    --03--
  LDA #$88           ;right tentacle for fireballs
  STA boss_coords+6
  LDA #$C8
  STA boss_coords+7
;                    --04--
  LDA #$60           ;left shoulder vent that fires victims
  STA boss_coords+8
  LDA #$56
  STA boss_coords+9
;                    --05--
  LDA #$98           ;right shoulder vent that fires victims
  STA boss_coords+10
  LDA #$56
  STA boss_coords+11

  LDA #117           ;screen numbers of boss coord objects
  STA boss_SCRcoords
  STA boss_SCRcoords+1
  STA boss_SCRcoords+2
  STA boss_SCRcoords+3
  STA boss_SCRcoords+4
  STA boss_SCRcoords+5

  STA cb1_SCRright
  STA cb1_SCRleft
  STA cb2_SCRright
  STA cb2_SCRleft
  STA cb3_SCRright
  STA cb3_SCRleft
  STA cb4_SCRright
  STA cb4_SCRleft

  JSR set_cb_top_bottom

  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;
boss4_visibility_check:

  LDA kogy_map_xHI
  CMP #$74
  BEQ .left_test
  JMP .offscreen

.left_test:
  LDA sprite_x_offset
  CMP #$04
  BCC .offscreen

.right_test:
  LDA sprite_x_offset  ;this is corrective code to help alleviate the bug where
  CMP #$FE             ;sprites would briefly show up on the right edge
  BCS .offscreen       ;of the screen despite exiting the left.

.onscreen:
  SEC
  JMP .rts
.offscreen:
  CLC
.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;
boss4_collision_handler:
  JSR boss4_coll_boxes     ;sub sets up the boxes

.collision_test1:
  LDA cb1_skip
  BNE .collision_test2

  LDA ship_bottom
  CMP cb1_top
  BCC .collision_test2

  LDA cb1_bottom
  CMP ship_top
  BCC .collision_test2

  LDA ship_right
  CMP cb1_left
  BCC .collision_test2

  LDA cb1_right
  CMP ship_left
  BCC .collision_test2

  JMP .kill_ship


.collision_test2:
  LDA cb2_skip
  BNE .collision_test3

  LDA ship_bottom
  CMP cb2_top
  BCC .collision_test3

  LDA cb2_bottom
  CMP ship_top
  BCC .collision_test3

  LDA ship_right
  CMP cb2_left
  BCC .collision_test3

  LDA cb2_right
  CMP ship_left
  BCC .collision_test3

  JMP .kill_ship


.collision_test3:
  LDA cb3_skip
  BNE .collision_test4

  LDA ship_bottom
  CMP cb3_top
  BCC .collision_test4

  LDA cb3_bottom
  CMP ship_top
  BCC .collision_test4

  LDA ship_right
  CMP cb3_left
  BCC .collision_test4

  LDA cb3_right
  CMP ship_left
  BCC .collision_test4

  JMP .kill_ship


.collision_test4:
  LDA cb4_skip
  BNE .rts

  LDA ship_bottom
  CMP cb4_top
  BCC .rts

  LDA cb4_bottom
  CMP ship_top
  BCC .rts

  LDA ship_right
  CMP cb4_left
  BCC .rts

  LDA cb4_right
  CMP ship_left
  BCC .rts

.kill_ship:
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


;;;;;;;;;;;;;;;;;;
boss4_coll_boxes:

.box1:
  LDA cb1_SCRright
  CMP ship_screen_x
  BEQ .box1_clearskip
  LDA cb1_SCRleft
  CMP ship_screen_x
  BEQ .box1_clearskip
  LDA #$01            ;if it's this far, neither screen coord matches player's
  STA cb1_skip        ;screen and cb is off-screen, so don't bother testing
  JMP .box2

.box1_clearskip:
  LDA #$00
  STA cb1_skip
.left1:
  LDA cb1_SCRleft
  CMP ship_screen_x
  BEQ .normal_left1
  LDA #$00
  STA cb1_left
  JMP .right1
.normal_left1:
  LDA cb1_SCRleft+1
  STA cb1_left

.right1:
  LDA cb1_SCRright
  CMP ship_screen_x
  BEQ .normal_right1
  LDA #$FF
  STA cb1_right
  JMP .box2
.normal_right1:
  LDA cb1_SCRright+1
  STA cb1_right


.box2:
  LDA cb2_SCRright
  CMP ship_screen_x
  BEQ .box2_clearskip
  LDA cb2_SCRleft
  CMP ship_screen_x
  BEQ .box2_clearskip
  LDA #$01            ;if it's this far, neither screen coord matches player's
  STA cb2_skip        ;screen and cb is off-screen, so don't bother testing
  JMP .box3

.box2_clearskip:
  LDA #$00
  STA cb2_skip
.left2:
  LDA cb2_SCRleft
  CMP ship_screen_x
  BEQ .normal_left2
  LDA #$00
  STA cb2_left
  JMP .right2
.normal_left2:
  LDA cb2_SCRleft+1
  STA cb2_left

.right2:
  LDA cb2_SCRright
  CMP ship_screen_x
  BEQ .normal_right2
  LDA #$FF
  STA cb2_right
  JMP .box3
.normal_right2:
  LDA cb2_SCRright+1
  STA cb2_right


.box3:
  LDA cb3_SCRright
  CMP ship_screen_x
  BEQ .box3_clearskip
  LDA cb3_SCRleft
  CMP ship_screen_x
  BEQ .box3_clearskip
  LDA #$01            ;if it's this far, neither screen coord matches player's
  STA cb3_skip        ;screen and cb is off-screen, so don't bother testing
  JMP .box4

.box3_clearskip:
  LDA #$00
  STA cb3_skip
.left3:
  LDA cb3_SCRleft
  CMP ship_screen_x
  BEQ .normal_left3
  LDA #$00
  STA cb3_left
  JMP .right3
.normal_left3:
  LDA cb3_SCRleft+1
  STA cb3_left

.right3:
  LDA cb3_SCRright
  CMP ship_screen_x
  BEQ .normal_right3
  LDA #$FF
  STA cb3_right
  JMP .box4
.normal_right3:
  LDA cb3_SCRright+1
  STA cb3_right


.box4:
  LDA cb4_SCRright
  CMP ship_screen_x
  BEQ .box4_clearskip
  LDA cb4_SCRleft
  CMP ship_screen_x
  BEQ .box4_clearskip
  LDA #$01            ;if it's this far, neither screen coord matches player's
  STA cb4_skip        ;screen and cb is off-screen, so don't bother testing
  JMP .rts

.box4_clearskip:
  LDA #$00
  STA cb4_skip
.left4:
  LDA cb4_SCRleft
  CMP ship_screen_x
  BEQ .normal_left4
  LDA #$00
  STA cb4_left
  JMP .right4
.normal_left4:
  LDA cb4_SCRleft+1
  STA cb4_left

.right4:
  LDA cb4_SCRright
  CMP ship_screen_x
  BEQ .normal_right4
  LDA #$FF
  STA cb4_right
  JMP .rts
.normal_right4:
  LDA cb4_SCRright+1
  STA cb4_right


.rts:
  RTS


;;;;;;;;;;;;;;;;;;
boss4_movement:
  LDA boss_paces
  CMP #$00
  BEQ .load_new
  JMP .continue

.load_new:
  LDY bs_mv_index
  LDA boss4_move_pattern, y
  STA boss_curr_mv
  INY
  LDA boss4_move_pattern, y
  STA boss_paces
  INC bs_mv_index
  INC bs_mv_index
 
.continue:
  LDA boss_curr_mv

  CMP #bs_left
  BNE .continue0
  JMP .left
.continue0:
  CMP #bs_right
  BNE .continue1
  JMP .right
.continue1:
  CMP #bs_pause
  BNE .continue2
  JMP .pause
.continue2:
  CMP #bs_reset
  BNE .continue3
  JMP .reset
.continue3:
  CMP #kill_arrow
  BNE .continue4
  JMP .arrow_off
.continue4:
  CMP #rstr_arrow
  BNE .continue5
  JMP .arrow_on
.continue5:
  CMP #klaser_on
  BNE .continue6
  JSR turn_klaser_on
  JMP .rts
.continue6:
  JSR turn_klaser_off
  JMP .rts

.left:
  LDA xScroll
  CLC
  ADC #$02
  STA xScroll
  LDA nametableNum
  ADC #$00
  STA nametableNum
  DEC boss_paces
  JSR kogy_map_left
  JMP .switch_test

.right:
  LDA xScroll
  SEC
  SBC #$02
  STA xScroll
  LDA nametableNum
  SBC #$00
  STA nametableNum
  DEC boss_paces
  JSR kogy_map_right
  JMP .switch_test
  JMP .rts

.pause:
  DEC boss_paces
  JMP .rts

.reset:
  LDA #$00
  STA xScroll
  STA nametableNum
  STA bs_mv_index
  STA boss_paces
  JMP .switch_test

.arrow_off:
  LDA #$01
  STA target_stat
  DEC boss_paces
  JMP .rts

.arrow_on:
  LDA #$00
  STA target_stat
  DEC boss_paces
  JMP .rts

.switch_test:
  LDA nametableNum
  BNE .n2400
.n2000:
  LDA soft_2000
  AND #$FE
  STA soft_2000
  JMP .rts
.n2400:
  LDA soft_2000
  AND #$FE
  ORA #$01
  STA soft_2000

.rts:
  RTS


kogy_map_left:
  LDA kogy_map_xLO
  SEC
  SBC #$02
  STA temp1
  STA kogy_map_xLO
  LDA kogy_map_xHI
  SBC #$00
  STA kogy_map_xHI
  STA temp2

  JSR collision_box_movement

  LDY #$00
  LDX #$00
.left_coords_loop:
  LDA boss_coords, y
  SEC
  SBC #$02
  STA boss_coords, y
  LDA boss_SCRcoords, x
  SBC #$00
  STA boss_SCRcoords, x
  INY
  INY
  INX
  CPX #$06
  BCC .left_coords_loop
.rts:
  RTS


kogy_map_right:
  LDA kogy_map_xLO
  CLC
  ADC #$02
  STA temp1
  STA kogy_map_xLO
  LDA kogy_map_xHI
  ADC #$00
  STA kogy_map_xHI
  STA temp2

  JSR collision_box_movement

  LDY #$00
  LDX #$00
.right_coords_loop:
  LDA boss_coords, y
  CLC
  ADC #$02
  STA boss_coords, y
  LDA boss_SCRcoords, x
  ADC #$00
  STA boss_SCRcoords, x
  INY
  INY
  INX
  CPX #$06
  BCC .right_coords_loop
.rts:
  RTS


collision_box_movement:
  LDX #$00
  LDY #$00
.cbmove_loop:
  LDA temp1
  SEC
  SBC boss4_collision_boxes, x
  STA cb1_SCRleft+1, y
  LDA temp2
  SBC #$00
  STA cb1_SCRleft, y
  INX
  LDA cb1_SCRleft+1, y
  CLC
  ADC boss4_collision_boxes, x
  STA cb1_SCRright+1, y
  LDA cb1_SCRleft, y
  ADC #$00
  STA cb1_SCRright, y

  TYA
  CLC
  ADC #$09
  TAY
  INX
  CPX #$06
  BCC .cbmove_loop

.last_box:     ;since I'm a fucking hillbilly and haven't figured out how to do
  LDA temp1    ;sign extension yet, this will have to do for the last box, which
  CLC          ;starts to the right of the kogyaru object's midpoint instead of it's left
  ADC boss4_collision_boxes, x
  STA cb1_SCRleft+1, y
  LDA temp2
  ADC #$00
  STA cb1_SCRleft, y
  INX
  LDA cb1_SCRleft+1, y
  CLC
  ADC boss4_collision_boxes, x
  STA cb1_SCRright+1, y
  LDA cb1_SCRleft, y
  ADC #$00
  STA cb1_SCRright, y

  RTS


;;;;;;;;;;;;;;;;;
boss4_animation:
  INC kogy_anim_frame
  LDA kogy_anim_frame
  CMP #$01
  BEQ .first
  CMP #$06
  BEQ .second
  CMP #$0C
  BEQ .third
  CMP #$12
  BEQ .fourth
  CMP #$18
  BEQ .reset
  JMP .rts

.reset:
  LDA #$00
  STA kogy_anim_frame
  JMP .rts

.first:
  LDY #$00
  JMP .swap
.second:
  LDY #$01
  JMP .swap
.third:
  LDY #$02
  JMP .swap
.fourth:
  LDY #$03

.swap:
  LDA kogy_bgbanks, y
  STA bchr_bank
  JSR swap_CHR_bank1000

.rts:
  RTS


;;;;;;;;;;;;;;
boss4_NMI_seq:
  ; no background animations for this boss, so just exit.
  JMP NMI_recover


;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;
boss4_collision_boxes:
  .db $3A, $70 ;first box - shoulder cannons to top of boosters, l2r thru entire body 
  .db $38, $6C ;second box - covers twin boosters at bottom
  .db $2A, $18 ;third box
  .db $0A, $18 ;fourth box
  ;this one is quite different from the others due to the boss object moving
  ;off screen.  the first byte is NOT the simple x coord of the collision box
  ;to be adjusted by the scroll.  it is the distance from the boss object's
  ;central x coordinate instead. the second byte is the amount to add to the
  ;derived cbx_left to get the cbx_right

set_cb_top_bottom:
  LDA #$70
  STA cb1_top
  LDA #$9C
  STA cb1_bottom

  LDA #$A0
  STA cb2_top
  LDA #$A8
  STA cb2_bottom

  LDA #$58
  STA cb3_top
  STA cb4_top
  LDA #$C0
  STA cb3_bottom
  STA cb4_bottom

  RTS

;;;;;;;;;;;;;;;;;;;;;;;
boss_kogy_anim_tiles:            ;these are the sprite tiles for the ship in the middle
  .db $8C,$8D, $8E,$8F, $90,$91, $92,$93  ;first frame
  .db $94,$95, $96,$97, $98,$99, $9A,$9B  ;second frame


;;;;;;;;;;;;;;;
klaser_nums:
  .db $40,$9C,$01,$78, $40,$9C,$41,$80
  .db $50,$9C,$01,$78, $50,$9C,$41,$80

  .db $38,$9C,$01,$78, $38,$9C,$41,$80
  .db $48,$9C,$01,$78, $48,$9C,$41,$80

  .db $40,$9D,$01,$78, $40,$9D,$41,$80
  .db $50,$9D,$01,$78, $50,$9D,$41,$80

  .db $38,$9D,$01,$78, $38,$9D,$41,$80
  .db $48,$9D,$01,$78, $48,$9D,$41,$80


;;;;;;;;;;;;;;;;;
shuttle_tiles:
  .db $A0,$A1,$A2,$A3,$A4


;;;;;;;;;;;;;;;
kogy_bgbanks:
  .db $14,$15,$16,$17

  ;from right edge to right screen border = $44
  ;from left screen border to right screen border = $78
  ;from left edge to left screen border = $30
;;;;;;;;;;;;;;;;;;;;;;;
boss4_move_pattern:

  .db kill_arrow,$01, bs_left,$44
  .db klaser_on,$01, rstr_arrow,$01, bs_left,$78
  .db klaser_off,$01, kill_arrow,$01, bs_left,$30
  .db bs_right,$30, rstr_arrow,$01
  .db bs_right,$60, bs_left,$48, bs_right,$48, bs_pause,$10
  .db klaser_on,$01, kill_arrow,$01, bs_pause, $10
  .db bs_left,$60, bs_right,$78, klaser_off,$01
  .db bs_right,$44, bs_left,$44, rstr_arrow,$01, bs_left,$78
  .db bs_pause,$10, klaser_on,$01, kill_arrow,$01, bs_pause,$10
  .db bs_right,$78, bs_pause,$10, klaser_off,$01, rstr_arrow,$01
  .db bs_left,$60, bs_right,$48, bs_left,$48, bs_right,$48
  .db bs_left,$24, bs_pause,$30
  .db kill_arrow,$01, klaser_on,$01, bs_left,$24, bs_right,$48
  .db bs_left,$48, bs_right,$60, klaser_off,$01, bs_right,$44, bs_pause,$18
  .db bs_reset

  ;;at a certain point when kogyaru is close to the left or right edge of the screen,
  ;;kill the arrow.  i don't want to have to write a whole other complex sub for 
  ;;making the arrow dissapear when the mothership is offscreen.







;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;
;;BOSS 4 DEATH


;;;;;;;;;;;;;;;;;;;;   ;;CHANGE bossx
boss4_end_handler:
  JSR set_ship_sprites_params
  JSR end_kogy_sprite_actions
  JSR end_kogy_anim_engine
  JSR run_kogy_sprite

  LDA event_counter
  CMP #$02          ;skip the first tick on event counter so level_end has a chance to
  BCC .rts          ;update the score and assm%
  BEQ .init             
  JMP .explosion

.init:
  JSR boss4_clear_SpriteMap
  JSR clear_explosion_RAM

  LDA #$00
  STA boss_paces
  STA bs_mv_index

  LDA #silence_song
  STA current_song
  JSR sound_load

  LDA #$03
  STA event_counter
  JMP .rts

.explosion:
  JSR boss4_explode
  LDA event_counter
  CMP #$06
  BCC .rts
.fade:
  JSR boss4_fade
  LDA event_counter
  CMP #$0E         ;0B is when Kogyaru panics and runs off
  BCS .Ossan_victory
  JMP .rts
.Ossan_victory:
  JSR Ossan_victory_lap
  JMP .rts
.rts:
  RTS


;;;;;;;;;;;;
boss4_fade:
  LDA boss_fade_timer
  CMP #$B6              ;CHANGE for other bosses, always make this one or
  BEQ .rts              ;two ticks above the final fade time

  INC boss_fade_timer
  LDY #00
.fade_loop:
  LDA boss4_fade_times, y
  CMP boss_fade_timer
  BEQ .next_fade
  CMP #$FF
  BEQ .rts
  INY
  JMP .fade_loop

.next_fade:
  LDA #bgpal_0
  STA pal_change_lo

  TYA    ;transfer y and multiply by 4 to get
  ASL A  ;it to match the table setup below.
  ASL A
  ASL A
  TAY

  LDX #$00
.next_fade_loop:
  LDA boss4_fade_palettes, y
  STA pal_RAM, x
  INY
  INX
  CPX #$08
  BCC .next_fade_loop
  LDA #$FF
  STA pal_RAM, x
  LDA needdraw
  ORA #%01000000
  STA needdraw

.rts:
  RTS


boss4_fade_times:
  .db $01,$3C,$78,$B4,$FF

boss4_fade_palettes:
;  .db $1D,$1C,$06,$04, $1D,$09,$21,$04   ;starting pal
  .db $1D,$0C,$05,$03, $1D,$07,$11,$03
  .db $1D,$02,$05,$01, $1D,$03,$01,$01
  .db $1D,$00,$02,$2D, $1D,$00,$2D,$2D
  .db $1D,$1E,$1E,$1E, $1D,$1E,$1E,$1E


;;;;;;;;;;;;;;;;
boss4_explode:
  LDY boss_expl_ptr
  LDA boss4_explode_times, y
  CMP #$FF                     ;pointer is on terminator byte, so stop creating
  BEQ .run_explosions          ;new explosions and wait for boss_end_done to be set

  INC boss_expl_timer
.init_loop:
  LDY boss_expl_ptr
  LDA boss_expl_timer
  CMP boss4_explode_times, y
  BNE .run_explosions
.create:
  JSR boss4_setup_explosion
  INC boss_expl_ptr

.run_explosions:
  LDY #$00
.run_loop:
  LDA explosion_RAM, y
  CMP #$FE
  BEQ .next

.explosion_animations:
  LDA explosion_RAM, y
  CLC                          ;can't increment the y register
  ADC #$01
  STA explosion_RAM, y
  JSR boss4_expl_anim

.next:
  INY
  INY
  INY
  INY
  CPY #$10
  BCC .run_loop


.kill_expolsions:
  LDY #$00
.kill_loop:
  LDA explosion_RAM, y
  CMP #$30
  BNE .next1

.destroy:
  LDA explosion_RAM+1, y     ;pull sprite map position
  TAX
  CLC
  ADC #$20                   ;store position for loop to end
  STA temp2
  LDA #$FE
.destroy_SMap_loop:
  STA SpriteMap, x
  INX
  CPX temp2
  BCC .destroy_SMap_loop
.destroy_explosion_RAM:
  STA explosion_RAM, y
  STA explosion_RAM+1, y
  STA explosion_RAM+2, y
  STA explosion_RAM+3, y

.next1:
  INY
  INY
  INY
  INY
  CPY #$10
  BCC .kill_loop
  
.rts:
  RTS


boss4_explode_times:
  .db $10,$48,$60,$78,$90,  $A0,$B0,$C0,$D0,$E0,$F0,$00,$10,$20,$30,$40,$50,$60,$FF
boss4_explode_xcoords:
  .db $80,$70,$90,$68,$88,  $70,$80,$90,$80,$70,$90,$68,$88,$70,$80,$70,$A0,$68,$FF
boss4_explode_ycoords:
  .db $A0,$B0,$90,$A0,$90,  $80,$A0,$80,$A0,$B0,$90,$A0,$90,$B0,$A0,$B0,$90,$A0,$FF


;;;;;;;;;;;;;;;;;;;;;;;;
boss4_clear_SpriteMap:
  LDY #$40
  LDA #$FE
.loop:
  STA SpriteMap, y
  INY
  CPY #$B7
  BCC .loop
  RTS


;;;;;;;;;;;;;;;;;;;;;;;;
boss4_setup_explosion:
  LDY #$00
.loop:
  LDA explosion_RAM, y
  CMP #$FE
  BEQ .setup
.next:
  INY
  INY
  INY
  INY
  CPY #$10
  BCC .loop
  JMP .rts        ;oops, I done fucked up and guess we're skipping this expl if this happens.
.setup:
  STY temp1       ;need to destroy y for the .store label, so back it up
  LDY #$20        ;offset to after Ossan's position
.sprites:
  LDA SpriteMap, y
  CMP #$FE
  BEQ .store
  TYA
  CLC
  ADC #$20
  CMP #$A0
  BCS .rts        ;oops, guess I done fucked up here instead of up there
  TAY
  JMP .sprites

.store:
  LDX boss_expl_ptr

  TYA             ;transfer SMap position from y to accum
  LDY temp1       ;restore y, which will be the store position in explosion_RAM
  STA explosion_RAM+1, y          ;SMAP_POS

  LDA boss4_explode_xcoords, x    ;X COORDS
  SEC
  SBC xScroll
  STA explosion_RAM+2, y
  LDA boss4_explode_ycoords, x    ;Y COORDS
  STA explosion_RAM+3, y

  LDA #$00                        ;TIMER
  STA explosion_RAM, y

.setup_sprite_xy:
  LDX explosion_RAM+1, y
  TXA
  CLC
  ADC #$10         ;this will be the loop max to compare below. there are #$20
  STA temp2        ;spots, but since I store two sets each loop I only need it compared to #$10.

.x_coords:
  LDA explosion_RAM+2, y
  SEC
  SBC #$10
.x_coord_loop:
  STA SpriteMap+3, x
  STA SpriteMap+19, x
  CLC
  ADC #$08
  INX
  INX
  INX
  INX
  CPX temp2
  BCC .x_coord_loop

.reset_loop:
  LDX explosion_RAM+1, y
  TXA
  CLC
  ADC #$10         ;this will be the loop max to compare below. there are #$20
  STA temp2        ;spots, but since I store two sets each loop I only need it compared to #$10.

.y_coord_loop:
  LDA explosion_RAM+3, y
  STA SpriteMap+16, x
  SEC
  SBC #$08
  STA SpriteMap, x
  INX
  INX
  INX
  INX
  CPX temp2
  BCC .y_coord_loop

  LDA #explode_sfx
  STA current_song
  JSR sound_load

.rts:
  RTS


;;;;;;;;;;;;;;;;;;
boss4_expl_anim:
  STY temp1
  LDA explosion_RAM, y
  CMP #$01
  BEQ .first_frame
  CMP #$10
  BEQ .second_frame
  CMP #$20
  BEQ .third_frame
  JMP .rts

.first_frame:
  LDX explosion_RAM+1, y
  LDY #$00
.first_loop:
  LDA ship_expl_1, y      ;;TILE
  STA SpriteMap+1, x
  LDA #$02                ;;PALETTE
  STA SpriteMap+2, x
  INX
  INX
  INX
  INX
  INY
  CPY #$08
  BCC .first_loop
  JMP .rts

.second_frame:
  LDX explosion_RAM+1, y
  LDY #$00
.second_loop:
  LDA ship_expl_2, y      ;;TILE
  STA SpriteMap+1, x
  LDA #$02                ;;PALETTE
  STA SpriteMap+2, x
  INX
  INX
  INX
  INX
  INY
  CPY #$08
  BCC .second_loop
  JMP .rts

.third_frame:
  LDX explosion_RAM+1, y
  LDY #$00
.third_loop:
  LDA ship_expl_3, y      ;;TILE
  STA SpriteMap+1, x
  LDA #$02                ;;PALETTE
  STA SpriteMap+2, x
  INX
  INX
  INX
  INX
  INY
  CPY #$08
  BCC .third_loop
  JMP .rts

.rts:
  LDY temp1
  RTS


;;;;;;;;;;;;;;;;;;;;;;
end_kogy_anim_engine:
  INC kogy_anim_frame
  LDA kogy_anim_frame
  CMP #$18
  BEQ .reset
  JMP .rts
.reset:
  LDA #$00
  STA kogy_anim_frame
.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;
end_kogy_sprite_actions:
  LDA event_counter
  CMP #$03            ;this test insures that init has ran and boss_paces
  BCS .slowdown       ;has been reset
  JMP .rts

.slowdown:
;  LDA counter        ;not sure if I want this yet or not
;  AND #$01
;  BEQ .start
;  JMP .rts

.start:
  LDA boss_paces
  CMP #$00
  BEQ .load_new
  JMP .continue

.load_new:
  LDY bs_mv_index
  LDA endsprite_move_pattern, y
  STA boss_curr_mv
  INY
  LDA endsprite_move_pattern, y
  STA boss_paces
  INC bs_mv_index
  INC bs_mv_index
 
.continue:
  LDA boss_curr_mv

  CMP #bs_left
  BNE .continue0
  JMP .left
.continue0:
  CMP #bs_right
  BNE .continue1
  LDA #$01
  STA temp1
  JMP .right
.continue1:
  CMP #bs_pause
  BNE .continue2
  JMP .pause
.continue2:
  CMP #bs_up
  BNE .continue3
  JMP .up
.continue3:
  CMP #bs_down
  BNE .continue4
  JMP .down
.continue4:
  CMP #bs_dbl_right
  BNE .continue5
  LDA #$02
  STA temp1
  JMP .right
.continue5:
  JMP .sprite_forward


.left:
  LDA kogy_spritex
  SEC
  SBC #$01
  STA kogy_spritex

  LDA kogy_map_xLO
  SEC
  SBC #$01
  STA kogy_map_xLO
  LDA kogy_map_xHI
  SBC #$00
  STA kogy_map_xHI

  DEC boss_paces
  JMP .rts

.right:
  LDA kogy_spritex
  CLC
  ADC temp1
  STA kogy_spritex

  LDA kogy_map_xLO
  CLC
  ADC temp1
  STA kogy_map_xLO
  LDA kogy_map_xHI
  ADC #$00
  STA kogy_map_xHI

  DEC boss_paces
  JMP .rts

.up:
  LDA kogy_map_y
  SEC
  SBC #$01
  STA kogy_map_y
  DEC boss_paces
  JMP .rts

.down:
  LDA kogy_map_y
  CLC
  ADC #$01
  STA kogy_map_y
  DEC boss_paces
  JMP .rts

.sprite_forward:
  JSR kogy_sprite_forward
  DEC boss_paces
  JMP .rts

.pause:
  DEC boss_paces

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;;;
kogy_sprite_forward:
  LDA #$01
  LDY kogy_SMap_loc
.pal_loop:
  STA SpriteMap+2, y
  INY
  INY
  INY
  INY
  CPY #$40
  BCC .pal_loop
  RTS


;;;;;;;;;;;;;;;;;;;;;;;;
endsprite_move_pattern:
  .db bs_pause,$48
  .db bs_up,$0F, bs_down,$0F
  .db bs_left,$08, bs_right,$10, bs_left,$10, bs_right,$10, bs_left,$10, bs_right,$08
  .db bs_pause,$40, sprite_front,$01, bs_up,$14
  .db bs_pause,$D8
  .db bs_right,$05, bs_left,$0A, bs_right,$0A, bs_left,$0A, bs_right,$0A, bs_left,$04
  .db bs_pause,$18
  .db bs_dbl_right,$80, bs_pause,$F0,bs_pause,$F0,bs_pause,$F0,bs_pause,$F0,bs_pause,$F0,bs_pause,$F0
  .db bs_pause,$F0,bs_pause,$F0,bs_pause,$F0,bs_pause,$F0,bs_pause,$F0,bs_pause,$F0

;;;;;;;;;;;;;;;;;;;;;;;;
Ossan_victory_lap:
  LDA event_counter
  CMP #$21
  BCS .wait

.move_ship:
  LDA ship_x
  CMP #$80
  BEQ .x_done
  BCC .x_add
  JMP .x_sub
.x_add:
  INC ship_x
  JMP .rts
.x_sub:
  DEC ship_x
  JMP .rts

.x_done:
  LDA ship_y
  CMP #$84
  BEQ .movement_done
  BCC .y_add
  JMP .y_sub
.y_add:
  INC ship_y
  JMP .rts
.y_sub:
  DEC ship_y
  JMP .rts

.movement_done:
  LDA #gamewon_song
  STA current_song
  JSR sound_load
  LDA #$21
  STA event_counter

.wait:
  LDA event_counter
  CMP #$31
  BCC .rts
  LDA #$01
  STA boss_end_done

  LDA #$35
  STA level_index
;  LDA #STATE_LVL_CHG
;  STA gamestate
;  JMP GameEngine_end

.rts:
  RTS