;For new boxx_.asm files, don't forget to add the moving target for planting
;victims in boss.asm.  It's under the lable boss_target_params.

;Sprite Map for MechaStalin special objects
;20-53 (13 tiles) chest star
;54-63 (4 tiles) hammer+cycle

;;;;;;;;;;;;;;
boss3_NMI_seq:


.end:
  JMP NMI_recover


;;;;;;;;;;;;;;;;;;;;;;;
init_boss3_special_objects:

  LDA #$00               ;store zeros to mark out the needed positions
  LDY #$00               ;in sprite map and oam.
.sprite_map_block_loop:
  STA SpriteMap, y
  INY
  INY
  INY
  INY
  CPY #$80         ;(Ossan=8, star=13, hammer+cyc=4, food can=4, eye=1, mouth=2) * 4
  BCC .sprite_map_block_loop

  LDA #ignore      ;block out this chunk oam since it will be permanently
  STA OAM          ;used while boss2 battle is going on.
  LDA #$0B         ;?????????????? this allows object handler to ignore this chunk of oam.
  STA OAM+1

  LDA OAM_Free     ;subtract oam space and sprite space at end
  SEC
  SBC #$0C         ;???????????
  STA OAM_Free
  LDA SPR_Free
  SEC
  SBC #$18         ;???????????
  STA SPR_Free

  JSR star_pal_load
  LDA #close_star
  STA temp1
  JSR star_sprites_load

  JSR init_stalin_eye
  JSR init_stalin_mouth

  LDA #$00
  STA hamcycle_timer
  STA hamcycle_anim
  LDA #$FF
  STA stalin_mouth_cntr

  LDA #$DA           ;eye that shoots fireballs
  STA boss_coords
  LDA #$5F
  STA boss_coords+1

  LDA #$C9           ;mouth that shoots missiles
  STA boss_coords+2  ;x coord
  LDA #$77
  STA boss_coords+3  ;y coord

  RTS


;;;;;;;;;;;;;;;;;;;;;
star_pal_load:
  LDA #$01
  LDX #$20
.loop:
  STA SpriteMap+2, x
  INX
  INX
  INX
  INX
  CPX #$54
  BCC .loop
  RTS


;;;;;;;;;;;;;;;;;;;;;
star_sprites_load:

  LDA temp1
  CMP #open_star
  BEQ .open

.closed:
  LDA #LOW(star_closed)
  STA ptr1
  LDA #HIGH(star_closed)
  STA ptr1+1
  JMP .load

.open:
  LDA #LOW(star_open)
  STA ptr1
  LDA #HIGH(star_open)
  STA ptr1+1

.load:
  LDY #$00
  LDX #$20
.load_loop:
  LDA [ptr1], y
  STA SpriteMap, x
  INY
  INX
  LDA [ptr1], y
  STA SpriteMap, x
  INY
  INX
  INX  ;skip palette
  LDA [ptr1], y
  SEC
  SBC xScroll
  STA SpriteMap, x
  INY
  INX
  CPX #$54
  BCC .load_loop
  RTS


;;;;;;;;;;;;;;;;;
init_stalin_eye:
  LDX #$74
  LDA #$5F
  STA SpriteMap, x
  LDA #$C3
  STA SpriteMap+1, x
  LDA #$02
  STA SpriteMap+2, x
  LDA #$D8
  STA SpriteMap+3, x
  RTS


;;;;;;;;;;;;;;;;;
run_stalin_eye:
  LDX #$74
  LDA #$D8
  SEC
  SBC xScroll
  STA SpriteMap+3, x
  RTS


;;;;;;;;;;;;;;;;;;;
init_stalin_mouth:
  LDX #$78
  LDA #$FA              ;move off-screen to init
  STA SpriteMap, x
  STA SpriteMap+4, x
  LDA #$C4
  STA SpriteMap+1, x
  LDA #$C5
  STA SpriteMap+5, x
  LDA #$03
  STA SpriteMap+2, x
  STA SpriteMap+6, x

  LDA #$CD
  SEC
  SBC xScroll
  STA SpriteMap+3, x
  CLC
  ADC #$08
  STA SpriteMap+7, x
  RTS


;;;;;;;;;;;;;;;;;;;
run_stalin_mouth:
  LDX #$78

  LDA stalin_mouth_cntr
  CMP #$FF
  BEQ .rts

  INC stalin_mouth_cntr
  LDA stalin_mouth_cntr
  CMP #$1A
  BCC .on_screen

.off_screen:
  LDA #$FF
  STA stalin_mouth_cntr
  LDA #$FA
  STA SpriteMap, x
  STA SpriteMap+4, x
  JMP .x_coord
.on_screen:
  LDA #$77
  STA SpriteMap, x
  STA SpriteMap+4, x

.x_coord:
  LDA #$CD
  SEC
  SBC xScroll
  STA SpriteMap+3, x
  CLC
  ADC #$08
  STA SpriteMap+7, x

.rts:
  RTS

;;;;;;;;;;;;;;;;;;;;;
run_boss3_building:
  LDA boss_bldg_timer
  CMP #$08
  BCC .rts  ;if building time is #$0B, init
  CMP #$09
  BCS .run

.init:
  JSR boss3_bldg_init   ;doing subs just to avoid branch range errors. they won't
                        ;actually be universalized to save space.
.run:
  LDA #$88
  SEC                   ;adjust the permanent spot for when mechastalin scrolls
  SBC xScroll
  STA temp2

  LDA building_x
  CMP temp2
  BCS .destroy
.move:
  INC building_x

  LDX #$64
  LDA building_x
  CLC                   ;this is to align the sprite with the arrow
  ADC #$0A              ;without doing a bunch of re-writing in the arrow sub.
.x_loop:
  STA SpriteMap+3, x
  INX
  INX
  INX
  INX
  CPX #$74              ;go ahead and store x coord for victim tile, as well
  BCC .x_loop

  LDX #$64
  LDA building_y
  CLC                   ;add 8 once to offset, so there is room for the victim
  ADC #$08
.y_loop:
  STA SpriteMap, x
  INX
  INX
  INX
  INX
  CLC
  ADC #$08
  CPX #$70
  BCC .y_loop

  JSR victim_animation_tile
  JMP .rts

.destroy:
  LDA #$00
  STA boss_bldg_stat
  STA boss_bldg_timer

  LDA #$FA
  LDX #$64
.destroy_loop:
  STA SpriteMap, x
  INX
  INX
  INX
  INX
  CPX #$74
  BCC .destroy_loop

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;;
victim_animation_tile:  ;the top-most tile (as it appears on the screen) is the 
  LDA victim_stat       ;victim. it's actually the last of the food can's sprites in SMap, though.
  BNE .no_victim
  LDX #$70

  LDA building_y
  STA SpriteMap, x

  LDY victim_num
  LDA food_victim_pal, y
  STA SpriteMap+2, x  
  
  TYA
  ASL A                 ;table is four sets of two tiles, so this simply works
  TAY
  LDA counter
  CMP #$1E
  BCC .load_frame       ;on first frame, no changes neccessary
.second_frame:
  INY                   ;simply iny for second frame
.load_frame:
  LDA food_victim_tiles, y
  STA SpriteMap+1, x
  JMP .rts

.no_victim
  LDX #$70
  LDA #$FA
  STA SpriteMap, x
  LDA #$FE
  STA SpriteMap+1, x
  LDA #$00
  STA SpriteMap+2, x
.rts:
  RTS


;;;;;;;;;;;;;;;;;;
boss3_bldg_init:
  LDA #$08
  STA building_x
  LDA #$C8
  STA building_y

  LDY #$00
  LDX #$64
.tile_loop:
  LDA food_can_tiles, y
  STA SpriteMap+1, x
  INX
  INX
  INX
  INX
  INY
  CPX #$70
  BCC .tile_loop

  LDX #$64
  LDA #$02
.palette_loop:
  STA SpriteMap+2, x
  INX
  INX
  INX
  INX
  CPX #$70
  BCC .palette_loop

  LDA #$02
  STA boss_bldg_stat
  LDA #$09
  STA boss_bldg_timer

  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;
boss3_collision_handler:
  JSR boss3_coll_boxes     ;sub sets up the boxes

.collision_test1:
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
  LDA ship_bottom
  CMP cb3_top
  BCC .rts

  LDA cb3_bottom
  CMP ship_top
  BCC .rts

  LDA ship_right
  CMP cb3_left
  BCC .rts

  LDA cb3_right
  CMP ship_left
  BCC .rts

.kill_ship:
;  LDA ship_pal
;  CMP #$03
;  BEQ .reset
;  INC ship_pal
;  JMP .rts
;.reset:
;  LDA #$00
;  STA ship_pal
  JSR ship_dies

.rts:
  RTS

;;;;;;;;;;;;;;;;;;
boss3_coll_boxes:

  LDX #$00
.box1:
  LDA boss3_collision_boxes, x
  SEC
  SBC xScroll
  STA cb1_left
  INX
  LDA boss3_collision_boxes, x
  STA cb1_right
  INX
  LDA boss3_collision_boxes, x
  STA cb1_top
  INX
  LDA boss3_collision_boxes, x
  STA cb1_bottom

.box2:
  INX
  LDA boss3_collision_boxes, x
  SEC
  SBC xScroll
  STA cb2_left
  INX
  LDA boss3_collision_boxes, x
  STA cb2_right
  INX
  LDA boss3_collision_boxes, x
  STA cb2_top
  INX
  LDA boss3_collision_boxes, x
  STA cb2_bottom

.box3:
  INX
  LDA boss3_collision_boxes, x
  SEC
  SBC xScroll
  STA cb3_left
  INX
  LDA boss3_collision_boxes, x
  STA cb3_right
  INX
  LDA boss3_collision_boxes, x
  STA cb3_top
  INX
  LDA boss3_collision_boxes, x
  STA cb3_bottom

  RTS


;;;;;;;;;;;;;;;;;;
boss3_movement:

  LDA boss_paces
  CMP #$00
  BEQ .load_new
  JMP .continue

.load_new:
  LDY bs_mv_index
  LDA boss3_move_pattern, y
  STA boss_curr_mv
  INY
  LDA boss3_move_pattern, y
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
  JMP .arrow_on

.left:
  INC xScroll
  DEC boss_paces
  JSR star_sprites_load
  JMP .rts

.right:
  DEC xScroll
  DEC boss_paces
  JMP .rts

.pause:
  DEC boss_paces
  JMP .rts

.reset:
  LDA #$00
  STA xScroll
  STA bs_mv_index
  STA boss_paces
  JMP boss3_movement

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

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;
boss3_move_pattern:
  .db bs_pause,$FF, bs_pause,$3F, bs_left,$10
  .db bs_pause,$FF, bs_pause,$3F, bs_left,$10
  .db bs_pause,$FF, bs_pause,$3F, bs_left,$10
  .db bs_pause,$FF, bs_pause,$3F, bs_left,$10
  .db bs_pause,$FF, bs_pause,$3F, bs_left,$10
  .db bs_pause,$FF, bs_pause,$3F, bs_left,$10
  .db bs_pause,$FF, bs_pause,$3F, bs_left,$10
  .db bs_pause,$FF, bs_pause,$3F, bs_left,$10
  .db bs_pause,$FF, bs_pause,$3F, bs_left,$10
  .db bs_pause,$FF, bs_pause,$3F, bs_left,$10
  .db bs_pause,$FF, bs_pause,$3F, bs_left,$10
  .db bs_pause,$FF, bs_pause,$3F, bs_left,$10
  .db bs_pause,$FF, bs_pause,$3F, bs_left,$10
  .db bs_pause,$FF, bs_pause,$3F, bs_left,$10
  .db bs_reset

;;;;;;;;;;;;;;;;
food_can_tiles:
  .db $C0,$C1,$C2

food_victim_tiles:
  .db $24,$49, $53,$55, $57,$59, $09,$45

food_victim_pal:
  .db $01,$02,$01,$02

  ;y coord, tile, x coord   pal=02
star_closed:
  .db $94,$94,$CC,  $94,$95,$D4
  .db $9C,$96,$C4,  $9C,$97,$CC,  $9C,$98,$D4,  $9C,$99,$DC
  .db $A4,$9A,$C4,  $A4,$9B,$CC,  $A4,$9C,$D4
  .db $AC,$9D,$C4,  $AC,$9E,$CC,  $AC,$9F,$D4,  $AC,$A0,$DC

star_open:
  .db $94,$A9,$CD,  $94,$95,$D7
  .db $9C,$AA,$C5,  $9C,$AB,$CD,  $9C,$98,$D7,  $9C,$99,$DE
  .db $A4,$AC,$C5,  $A4,$AD,$CD,  $A4,$9C,$D7
  .db $AC,$AE,$C5,  $AC,$AF,$CD,  $AC,$9F,$D7,  $AC,$A0,$DE

;;;;;;;;;;;;;;;;;;
boss3_collision_boxes:
  .db $D8, $E8, $40, $60 ;top of head box left, right, top, bottom
  .db $C8, $E8, $50, $F8 ;main body box left, right, top, bottom
  .db $B0, $E8, $C0, $F8 ;bottom mouth box left, right, top, bottom






;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;
;;BOSS 3 DEATH


;;;;;;;;;;;;;;;;;;;;   ;;CHANGE bossx
boss3_end_handler:
  JSR set_ship_sprites_params

  LDA event_counter
  CMP #$02          ;skip the first tick on event counter so level_end has a chance to
  BCC .rts          ;update the score and assm%
  BEQ .init
  JMP .explosion

.init:
  JSR boss3_clear_SpriteMap
  JSR clear_explosion_RAM
  LDA #silence_song
  STA current_song
  JSR sound_load
  LDA #$03
  STA event_counter
  JMP .rts
.explosion:
  JSR boss3_explode
  LDA event_counter
  CMP #$06
  BCC .rts
.fade:
  JSR boss3_fade
  LDA event_counter
  CMP #$0C
  BEQ .finish
  JMP .rts
.finish:
  LDA #$01
  STA boss_end_done
  LDA #song_efanfare
  STA current_song
  JSR sound_load
.rts:
  RTS


;;;;;;;;;;;;
boss3_fade:
  LDA boss_fade_timer
  CMP #$D4              ;CHANGE for other bosses, always make this one or
  BEQ .rts              ;two ticks above the final fade time

  INC boss_fade_timer
  LDY #00
.fade_loop:
  LDA boss3_fade_times, y
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
  TAY

  LDX #$00
.next_fade_loop:
  LDA boss3_fade_palettes, y
  STA pal_RAM, x
  INY
  INX
  CPX #$04
  BCC .next_fade_loop
  LDA #$FF
  STA pal_RAM, x
  LDA needdraw
  ORA #%01000000
  STA needdraw

.rts:
  RTS


boss3_fade_times:
  .db $01,$1E,$3C,$5A
  .db $78,$96,$B4,$D2,$FF

boss3_fade_palettes:
;  .db $1D,$32,$0C,$00   ;starting pal
  .db $1D,$32,$0C,$00
  .db $1D,$2D,$0C,$2D
  .db $1D,$22,$04,$1E
  .db $1D,$12,$04,$1E

  .db $1D,$02,$00,$1E
  .db $1D,$01,$00,$1E
  .db $1D,$00,$2D,$1E
  .db $1D,$1E,$1E,$1E


;;;;;;;;;;;;;;;;
boss3_explode:
  LDY boss_expl_ptr
  LDA boss3_explode_times, y
  CMP #$FF                     ;pointer is on terminator byte, so stop creating
  BEQ .run_explosions          ;new explosions and wait for boss_end_done to be set

  INC boss_expl_timer
.init_loop:
  LDY boss_expl_ptr
  LDA boss_expl_timer
  CMP boss3_explode_times, y
  BNE .run_explosions
.create:
  JSR boss3_setup_explosion
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
  JSR boss3_expl_anim

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


boss3_explode_times:
  .db $10,$48,$60,$78,$90,  $A0,$B0,$C0,$D0,$E0,$F0,$00,$10,$20,$30,$40,$50,$60,$FF
boss3_explode_xcoords:
  .db $D0,$C8,$E0,$D0,$D8,  $C8,$E8,$D0,$C8,$D0,$E0,$F0,$D8,$D4,$D0,$CC,$F0,$F0,$FF
boss3_explode_ycoords:
  .db $A0,$D8,$60,$B0,$78,  $80,$C0,$68,$B0,$70,$C8,$A0,$90,$D8,$A0,$B0,$90,$60,$FF


;;;;;;;;;;;;;;;;;;;;;;;;
boss3_clear_SpriteMap:
  LDY #SMap_clearEXPTship
  LDA #$FE
.loop:
  STA SpriteMap, y
  INY
  CPY #$B7
  BCC .loop
  RTS


;;;;;;;;;;;;;;;;;;;;;;;;
boss3_setup_explosion:
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

  LDA boss3_explode_xcoords, x    ;X COORDS
  SEC
  SBC xScroll
  STA explosion_RAM+2, y
  LDA boss3_explode_ycoords, x    ;Y COORDS
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
boss3_expl_anim:
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
