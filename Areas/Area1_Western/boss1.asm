;For new boxx_.asm files, don't forget to add the moving target for planting
;victims in boss.asm.  It's under the lable boss_target_params.

;;;;;;;;;;;;;;;;;;
boss1_movement:

  LDA boss_paces
  CMP #$00
  BEQ .load_new
  JMP .continue

.load_new:
  LDY bs_mv_index
  LDA boss1_move_pattern, y
  STA boss_curr_mv
  INY
  LDA boss1_move_pattern, y
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
  LDA xScroll
  CLC
  ADC #$02
  STA xScroll
  LDA nametableNum
  ADC #$00
  STA nametableNum
  DEC boss_paces
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
  BMI .n2400
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


;;;;;;;;;;;;;;;;;;;;;;;
init_boss1_special_objects:
  LDA #$20               ;store the sprite map locations that will be
  STA tprop_SMap_pos1    ;dedicated to propellers through the battle.
  LDA #$24
  STA tprop_SMap_pos2
  LDA #$28
  STA fprop_SMap_pos1
  LDA #$2C
  STA fprop_SMap_pos2

  LDA #$30
  LDY #$00
.building_SMap_init_loop:
  STA bldg_SMap_pos, y
  CLC
  ADC #$04
  INY
  CPY #$10
  BCC .building_SMap_init_loop

  LDA #$00               ;store zeros to mark out the needed positions
  LDY #$00               ;in sprite map and oam.
.sprite_map_block_loop:
  STA SpriteMap, y
  INY
  INY
  INY
  INY
  CPY #$70
  BCC .sprite_map_block_loop

  STA top_prop_aframe
  STA fwd_prop_aframe

  LDA #ignore      ;block out this chunk oam since it will be permanently
  STA OAM          ;used while boss1 battle is going on.
  LDA #$1D         ;this allows object handler to ignore this chunk of oam.
  STA OAM+1

  LDA OAM_Free     ;subtract oam space and sprite space at end
  SEC
  SBC #$1C
  STA OAM_Free
  LDA SPR_Free
  SEC
  SBC #$14
  STA SPR_Free

  LDA #$A8           ;bottom cannon that shoots fireballs
  STA boss_coords
  LDA #$B8
  STA boss_coords+1

  LDA #$B8           ;top cannon that shoots missiles
  STA boss_coords+2
  LDA #$90
  STA boss_coords+3

  RTS


;;;;;;;;;;;;;;;;;;;;;
run_boss1_building:
  LDA boss_bldg_timer
  CMP #$08
  BCC .rts  ;if building time is #$0B, init
  CMP #$09
  BCS .run

.init:
  JSR boss1_bldg_init   ;doing subs just to avoid branch range errors. they won't
                        ;actually be universalized to save space.
.run:
  LDA building_x
  CMP #$02
  BCC .destroy
.move:
  DEC building_x
  DEC building_x

  LDX bldg_SMap_pos
.x_loop_outer:
  LDY #$00
  LDA building_x
.x_loop_inner:
  STA SpriteMap+3, x
  CLC
  ADC #$08
  INX
  INX
  INX
  INX
  INY
  CPY #$04
  BCC .x_loop_inner
  CPX #$70
  BCC .x_loop_outer

  LDX bldg_SMap_pos
  LDA building_y
.y_loop_outer:
  LDY #$00
.y_loop_inner:
  STA SpriteMap, x
  INX
  INX
  INX
  INX
  INY
  CPY #$04
  BCC .y_loop_inner
  CLC
  ADC #$08
  CPX #$70
  BCC .y_loop_outer
  JMP .rts

.destroy:
  LDA #$00
  STA boss_bldg_stat
  STA boss_bldg_timer

  LDA #$FA
  LDX bldg_SMap_pos
.destroy_loop:
  STA SpriteMap, x
  INX
  INX
  INX
  INX
  CPX #$70
  BCC .destroy_loop

.rts:
  RTS


;;;;;;;;;;;;;;;;;;
boss1_bldg_init:

  LDA boss_bldg_num
  CMP #$03
  BCC .continue
  LDA #$00
  STA boss_bldg_num
.continue:
  ASL A
  TAY
  LDA boss1_building_starts, y
  STA building_x
  INY
  LDA boss1_building_starts, y
  STA building_y

  LDA boss_bldg_num
  ASL A
  TAY
  LDA boss_building_patterns, y
  STA ptr2
  LDA boss_building_patterns+1, y
  STA ptr2+1

  LDY #$00
  LDX bldg_SMap_pos
.tile_loop:
  LDA [ptr2], y
  STA SpriteMap+1, x
  INX
  INX
  INX
  INX
  INY
  CPX #$70
  BCC .tile_loop

  LDX bldg_SMap_pos
  LDA [ptr2], y
.palette_loop:
  STA SpriteMap+2, x
  INX
  INX
  INX
  INX
  CPX #$70
  BCC .palette_loop

  INC boss_bldg_num
  LDA #$02
  STA boss_bldg_stat
  LDA #$09
  STA boss_bldg_timer

  RTS


;;;;;;;;;;;;;;;;
boss1_fwdprop:
  INC fwd_prop_aframe
  LDA fwd_prop_aframe
  JSR prop_animation_start
  STA fwd_prop_aframe

.load_coords_frames
  LDA boss1_fwdprop_x, y
  STA fwd_prop_x
  LDA boss1_fwdprop_y, y
  STA fwd_prop_y

  TYA    ;now turing y into a pointer
  ASL A  ;so need to transfer and ASL
  TAY
  LDA boss1_fwdprop_tiles, y
  STA ptr1
  LDA boss1_fwdprop_tiles+1, y
  STA ptr1+1

.transfer_to_spritemap:
  LDY #$00
  LDX fprop_SMap_pos1
  LDA fwd_prop_y      ;y coords
  STA SpriteMap, x
  CLC
  ADC #$08
  STA SpriteMap+4, x
  LDA [ptr1], y       ;tiles
  STA SpriteMap+1, x
  INY
  LDA [ptr1], y
  STA SpriteMap+5, x
  LDA #$02            ;attributes
  STA SpriteMap+2, x
  STA SpriteMap+6, x
  LDA fwd_prop_x      ;x coords
  SEC
  SBC xScroll
  STA SpriteMap+3, x
  STA SpriteMap+7, x

  RTS


;;;;;;;;;;;;;;;;
boss1_topprop:
  INC top_prop_aframe
  LDA top_prop_aframe
  JSR prop_animation_start
  STA top_prop_aframe

.load_coords_frames
  LDA boss1_topprop_x, y
  STA top_prop_x
  LDA boss1_topprop_y, y
  STA top_prop_y

  TYA    ;now turing y into a pointer
  ASL A  ;so need to transfer and ASL
  TAY
  LDA boss1_topprop_tiles, y
  STA ptr1
  LDA boss1_topprop_tiles+1, y
  STA ptr1+1

.transfer_to_spritemap:
  LDY #$00
  LDX tprop_SMap_pos1
  LDA top_prop_y      ;y coords
  STA SpriteMap, x
  STA SpriteMap+4, x
  LDA [ptr1], y       ;tiles
  STA SpriteMap+1, x
  INY
  LDA [ptr1], y
  STA SpriteMap+5, x
  LDA #$02            ;attributes
  STA SpriteMap+2, x
  STA SpriteMap+6, x
  LDA top_prop_x      ;x coords
  SEC
  SBC xScroll
  STA SpriteMap+3, x
  CLC
  ADC #$08
  STA SpriteMap+7, x

  RTS


prop_animation_start:
                ;input: A: the current animation frame
.first_frame:   ;returns Y: the index to load frames and coords from the tables below
  CMP #$0A
  BCS .second_frame
  LDY #$00
  JMP .load_coords_frames
.second_frame:
  CMP #$14
  BCS .third_frame
  LDY #$01
  JMP .load_coords_frames
.third_frame:
  CMP #$1E
  BCS .fourth_frame
  LDY #$02
  JMP .load_coords_frames
.fourth_frame:
  CMP #$28
  BCS .fifth_frame
  LDY #$03
  JMP .load_coords_frames
.fifth_frame:
  CMP #$32
  BCS .sixth_frame
  LDY #$04
  JMP .load_coords_frames
.sixth_frame:
  CMP #$3C
  BCS .reset_frames
  LDY #$05
  JMP .load_coords_frames
.reset_frames:
  LDY #$00
  LDA #$00
.load_coords_frames:
  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;
boss1_collision_handler:
  JSR boss1_coll_boxes     ;sub sets up the boxes

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
  BCC .victim_collision_test1

  LDA cb2_bottom
  CMP ship_top
  BCC .victim_collision_test1

  LDA ship_right
  CMP cb2_left
  BCC .victim_collision_test1

  LDA cb2_right
  CMP ship_left
  BCC .victim_collision_test1

  JMP .kill_ship

.victim_collision_test1:
  LDA victim_stat  ;no need to test if victim is being planted or
  CMP #$04         ;already falling
  BCS .rts

  LDA cb2_bottom
  CMP victim_y    ;victim's top
  BCC .victim_collision_test2

  LDA victim_y    ;victim's bottom
  CLC
  ADC #$07
  CMP cb2_top
  BCC .victim_collision_test2

  LDA victim_x    ;victim's right
  CLC
  ADC #$07
  CMP cb2_left
  BCC .victim_collision_test2

  LDA cb2_right
  CMP victim_x    ;victim's left
  BCC .victim_collision_test2

  JMP .kill_victim

.victim_collision_test2:
  LDA cb3_bottom
  CMP victim_y    ;victim's top
  BCC .rts

  LDA victim_y    ;victim's bottom
  CLC
  ADC #$07
  CMP cb3_top
  BCC .rts

  LDA victim_x    ;victim's right
  CLC
  ADC #$07
  CMP cb3_left
  BCC .rts

  LDA cb3_right
  CMP victim_x    ;victim's left
  BCC .rts

.kill_victim:
  JSR kill_beam
  LDA #$04
  STA victim_stat
  JMP .rts

.kill_ship:
  JSR ship_dies

.rts:
  RTS


;;;;;;;;;;;;;;;;;;
boss1_coll_boxes:

  LDX #$00
.box1:
  LDA boss1_collision_boxes, x
  SEC
  SBC xScroll
  STA cb1_left
  CLC
  ADC #$38
  STA cb1_right
  INX
  LDA boss1_collision_boxes, x
  STA cb1_top
  CLC
  ADC #$20
  STA cb1_bottom

.box2:
  INX
  LDA boss1_collision_boxes, x
  SEC
  SBC xScroll
  STA cb2_left
  CLC
  ADC #$30
  STA cb2_right
  INX
  LDA boss1_collision_boxes, x
  STA cb2_top
  CLC
  ADC #$1C
  STA cb2_bottom

.box3:   ;only the victim collides with this one
  INX
  LDA boss1_collision_boxes, x
  SEC
  SBC xScroll
  STA cb3_left
  CLC
  ADC #$28
  STA cb3_right
  INX
  LDA boss1_collision_boxes, x
  STA cb3_top
  CLC
  ADC #$08
  STA cb3_bottom  

  RTS


;;;;;;;;;;;;;;
boss1_NMI_seq:
  ; no background animations for this boss, so just exit.
  JMP NMI_recover

;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;
boss1_move_pattern:
  .db bs_left,$08, bs_right,$08, bs_left,$08, bs_right,$08, bs_left,$08, bs_right,$08
  .db bs_left,$08, bs_right,$08, bs_left,$08, bs_right,$08, bs_left,$08, bs_right,$08
  .db bs_left,$08, bs_right,$08, bs_left,$08, bs_right,$08, bs_left,$08, bs_right,$08
  .db bs_left,$08, bs_right,$08, bs_left,$08, bs_right,$08, bs_left,$08, bs_right,$08
  .db bs_left,$08, bs_right,$08, bs_left,$08, bs_right,$08, bs_left,$08, bs_right,$08
  .db bs_left,$08, bs_right,$08, bs_left,$08, bs_right,$08, bs_left,$08, bs_right,$08
  .db bs_left,$08, bs_right,$08, bs_left,$08, bs_right,$08, bs_left,$08, bs_right,$08
  .db bs_left,$08, bs_right,$08, bs_left,$08, bs_right,$08, bs_left,$08, bs_right,$08
  .db bs_left,$08, bs_right,$08, bs_left,$08, bs_right,$08, bs_left,$08
  .db bs_pause,$10, kill_arrow,$01, bs_left,$38, bs_right,$40, rstr_arrow,$01, bs_reset

;;;;;;;;;;;;;;
boss1_building_starts:    ;x coord, y coord
  .db $E0,$CC,$E0,$CC,$E0,$CC

;;;;;;;;;;;;;
boss_building_patterns:   ;first sixteen valuses are tiles, then the palette
  .dw bbuilding1,bbuilding2,bbuilding3

bbuilding1:
  .db $CC,$CD,$CE,$CF,$D0,$D1,$D2,$D3
  .db $D4,$D5,$D6,$D7,$D8,$D9,$DA,$DB,$03
bbuilding2:
  .db $EC,$ED,$EE,$EF,$F0,$F1,$F2,$F3
  .db $F4,$F5,$F6,$F7,$F8,$F9,$FA,$FB,$00
bbuilding3:
  .db $DC,$DD,$DE,$DF,$E0,$E1,$E2,$E3
  .db $E4,$E5,$E6,$E7,$E8,$E9,$EA,$EB,$03

;;;;;;;;;;;;;;;;;;;;;;;;;;;
boss1_fwdprop_tiles:
  .dw fwdprop_frm1,fwdprop_frm2,fwdprop_frm3,fwdprop_frm4,fwdprop_frm5,fwdprop_frm6

fwdprop_frm1:
  .db $FE,$C4
fwdprop_frm2:
  .db $C5,$C6
fwdprop_frm3:
  .db $FE,$C7
fwdprop_frm4:
  .db $C8,$FE
fwdprop_frm5:
  .db $C9,$CA
fwdprop_frm6:
  .db $CB,$FE

boss1_fwdprop_x:
  .db $95,$A0,$A2,$A2,$9E,$96

boss1_fwdprop_y:
  .db $88,$87,$89,$A0,$A3,$A2

;;;;;;;;;;;;;;;;;;;;;;;;;;;
boss1_topprop_tiles:
  .dw topprop_frm1,topprop_frm2,topprop_frm3,topprop_frm4,topprop_frm5,topprop_frm6

topprop_frm1:
  .db $C0,$C1
topprop_frm2:
  .db $BF,$FE
topprop_frm3:
  .db $C2,$C3
topprop_frm4:
  .db $C0,$C1
topprop_frm5:
  .db $BF,$FE
topprop_frm6:
  .db $C2,$C3

boss1_topprop_x:
  .db $CD,$DB,$E0,$CD,$DB,$E0

boss1_topprop_y:
  .db $80,$80,$80,$80,$80,$80

;;;;;;;;;;;;;;;;;;
boss1_collision_boxes:
  .db $B8, $80 ;first box left and top
  .db $9C, $90 ;second box left and top
  .db $D0, $90 ;third box left and top







;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;
;;BOSS 1 DEATH


;;;;;;;;;;;;;;;;;;;;   ;;CHANGE bossx
boss1_end_handler:
  JSR set_ship_sprites_params

  LDA event_counter
  CMP #$02          ;skip the first tick on event counter so level_end has a chance to
  BCC .rts          ;update the score and assm%
  BEQ .init
  JMP .explosion

.init:
  JSR boss1_clear_SpriteMap
  JSR clear_explosion_RAM
  LDA #silence_song
  STA current_song
  JSR sound_load
  LDA #$03
  STA event_counter
  JMP .rts
.explosion:
  JSR boss1_explode
  LDA event_counter
  CMP #$06
  BCC .rts
.fade:
  JSR boss1_fade
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
boss1_fade:
  LDA boss_fade_timer
  CMP #$D4              ;CHANGE for other bosses, always make this one or
  BEQ .rts              ;two ticks above the final fade time

  INC boss_fade_timer
  LDY #00
.fade_loop:
  LDA boss1_fade_times, y
  CMP boss_fade_timer
  BEQ .next_fade
  CMP #$FF
  BEQ .rts
  INY
  JMP .fade_loop

.next_fade:
  LDA #bgpal_2
  STA pal_change_lo

  TYA    ;transfer y and multiply by 4 to get
  ASL A  ;it to match the table setup below.
  ASL A
  TAY

  LDX #$00
.next_fade_loop:
  LDA boss1_fade_palettes, y
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


boss1_fade_times:
  .db $01,$1E,$3C,$5A
  .db $78,$96,$B4,$D2,$FF

boss1_fade_palettes:
;  .db $1D,$08,$18,$38   ;starting pal
  .db $1D,$00,$10,$30
  .db $1D,$1E,$10,$30
  .db $1D,$1E,$08,$28
  .db $1D,$1E,$00,$20

  .db $1D,$1E,$1E,$18
  .db $1D,$1E,$1E,$10
  .db $1D,$1E,$1E,$08
  .db $1D,$1E,$1E,$1E


;;;;;;;;;;;;;;;;
boss1_explode:
  LDY boss_expl_ptr
  LDA boss1_explode_times, y
  CMP #$FF                     ;pointer is on terminator byte, so stop creating
  BEQ .run_explosions          ;new explosions and wait for boss_end_done to be set

  INC boss_expl_timer
.init_loop:
  LDY boss_expl_ptr
  LDA boss_expl_timer
  CMP boss1_explode_times, y
  BNE .run_explosions
.create:
  JSR boss1_setup_explosion
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
  JSR boss1_expl_anim

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


boss1_explode_times:
  .db $10,$48,$60,$78,$90,  $A0,$B0,$C0,$D0,$E0,$F0,$00,$10,$20,$30,$40,$50,$60,$FF
boss1_explode_xcoords:
  .db $C0,$B0,$D0,$A8,$C8,  $B0,$D8,$C0,$C0,$B0,$D0,$A8,$C8,$B0,$C0,$B0,$E0,$A8,$FF
boss1_explode_ycoords:
  .db $A0,$B0,$90,$A0,$90,  $80,$A0,$80,$A0,$B0,$90,$A0,$90,$B0,$A0,$B0,$90,$A0,$FF


;;;;;;;;;;;;;;;;;;;;;;;;
boss1_clear_SpriteMap:
  LDY #SMap_clearEXPTship
  LDA #$FE
.loop:
  STA SpriteMap, y
  INY
  CPY #$B7
  BCC .loop
  RTS


;;;;;;;;;;;;;;;;;;;;;;;;
boss1_setup_explosion:
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

  LDA boss1_explode_xcoords, x    ;X COORDS
  SEC
  SBC xScroll
  STA explosion_RAM+2, y
  LDA boss1_explode_ycoords, x    ;Y COORDS
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
boss1_expl_anim:
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