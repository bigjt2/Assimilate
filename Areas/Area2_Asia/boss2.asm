;For new boxx_.asm files, don't forget to add the moving target for planting
;victims in boss.asm.  It's under the lable boss_target_params.

;;;;;;;;;;;;;;
boss2_NMI_seq:
  LDA gamestate      ;if dead, make sure to switch to the first frame on
  CMP #STATEDEAD     ;$2000 so the death message draws correctly.
  BEQ .first_frame

.not_dead:
  LDA boss2_anim_counter
  AND #$80
  BNE .second_frame

.first_frame:
  LDA soft_2000
  AND #$FC
  STA soft_2000

  LDA #$26
  STA bchr_bank
  JSR swap_CHR_bank1000

  JMP .end

.second_frame:
  LDA soft_2000
  ORA #$01
  STA soft_2000

  LDA #$27
  STA bchr_bank
  JSR swap_CHR_bank1000
  
.end:
  JSR boss2_mouth_update
  JMP NMI_recover


;;;;;;;;;;;;;;;;;;;;;
boss2_mouth_update:
  LDA boss2_mouth
  BEQ .rts  ;if 0, skip updates
  CMP #$FE  ;during init, all variables set to #$FE, and this screws this sub up
  BEQ .rts
  CMP #$01
  BEQ .open
;  CMP #$48
  CMP #$24
  BCS .close
  JMP .rts

.open:
  LDA #LOW(boss2_mouth_open)
  STA ptr1
  LDA #HIGH(boss2_mouth_open)
  STA ptr1+1
  JSR Load_Text

  LDA #$00
  STA target_stat

  LDA #$02         ;store 2 in variable so we only hit this update once
  STA boss2_mouth
  JMP .rts

.close:
  LDA #LOW(boss2_mouth_close)
  STA ptr1
  LDA #HIGH(boss2_mouth_close)
  STA ptr1+1
  JSR Load_Text

  LDA #$01
  STA target_stat

  LDA #$00         ;store 0 so we only hit this update once and then not
  STA boss2_mouth  ;again until boss2_mouth is set to 1 in laser_init sub.

.rts:
  RTS


;;;;;;;;;;;;;;;;;
boss2_animation:
  LDA boss2_mouth
  BEQ .inc_anim_counter
  INC boss2_mouth

.inc_anim_counter:
  LDA boss2_anim_counter
  AND #$7F               ;lowest seven bits are the frame counter
  CLC                    ;for animation
  ADC #$01
  STA temp1              ;save result in temp variable because I'm about to destroy it
  LDA boss2_anim_counter
  AND #$80               ;wipe counter's lowest seven bits to replace them with new value
  ORA temp1              ;ORA to protect the highest bit, which is the current nametable
  STA boss2_anim_counter

  LDA boss2_anim_counter
  AND #$7F
  CMP #$30
  BCC .laser_timer

.advance_frame:
  LDA boss2_anim_counter
  EOR #$80               ;reverse bits to reverse nametable in highest bit
  AND #$80               ;wipe out lowest seven bits, to reset to zero.
  STA boss2_anim_counter

.laser_timer:
  INC lasr_timer
  LDA lasr_status        ;on/off flag is bit 7
  BMI .onscreen_time     ;will trigger neg flag if set to 1
.offscreen_time:
  LDA lasr_timer
;  CMP #$30
  CMP #$04
  BCC .rts
  JMP .reset_ltimer
.onscreen_time:
  LDA lasr_timer
  CMP #$04
  BCC .rts

.reset_ltimer:
  LDA #$00
  STA lasr_timer

.time_laser_offscreen:
  LDA lasr_status
  BMI .grow_laser        ;on/off flag must be set to 1, so don't
  LDA lasr_status        ;time the offscreen time
  AND #$70
  CMP #$70
  BEQ .laser_on
  CLC                    ;simply adding #$10 is the same as adding 1
  ADC #$10               ;to bits 6-4
  STA lasr_status
  JMP .rts

.laser_on:
  JSR init_laser
  JMP .rts

.grow_laser:
  LDA lasr_status        ;same method as above for adding/inserting bits
  AND #$0F
  CMP #$08
  BCS .rts
  CLC                                             
  ADC #$01
  STA temp1
  LDA lasr_status
  AND #$F0
  ORA temp1              ;increase the length of the laser by one tile while
  STA lasr_status        ;preserving upper status bits

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;;;
init_boss2_special_objects:
  LDA #$00
  STA boss2_anim_counter

  LDA #$20
  LDY #$00
.building_SMap_init_loop:
  STA bldg_SMap_pos, y
  CLC
  ADC #$04
  INY
  CPY #$10
  BCC .building_SMap_init_loop

  LDY #$00
.laser_SMap_init_loop:
  STA lasr_SMap_pos, y
  CLC
  ADC #$04
  INY
  CPY #$08
  BCC .laser_SMap_init_loop

  LDA #$00               ;store zeros to mark out the needed positions
  LDY #$00               ;in sprite map and oam.
.sprite_map_block_loop:
  STA SpriteMap, y
  INY
  INY
  INY
  INY
  CPY #$80               ;???????????????
  BCC .sprite_map_block_loop

  LDA #ignore      ;block out this chunk oam since it will be permanently
  STA OAM          ;used while boss2 battle is going on.
  LDA #$24         ;?????????????? this allows object handler to ignore this chunk of oam.
  STA OAM+1

  LDA OAM_Free     ;subtract oam space and sprite space at end
  SEC
  SBC #$24         ;???????????
  STA OAM_Free
  LDA SPR_Free
  SEC
  SBC #$18         ;???????????
  STA SPR_Free

.laser_graphics:
  LDA #$B0
  LDY #$00
.grfx_loop:
  LDX lasr_SMap_pos, y
  STA SpriteMap+1, x
  INY
  CPY #$08
  BCC .grfx_loop

.laser_init_pos:    ;move laser offscreen to start
  LDA #$F8
  LDY #$00
.las_init_loop:
  LDX lasr_SMap_pos, y
  STA SpriteMap, x
  INY
  CPY #$08
  BCC .las_init_loop

  LDA #$00
  STA bldg_explode_ctrl
  STA boss2_mouth

  RTS


;;;;;;;;;;;;;;;;;;;;;
run_boss2_building:
  LDA boss_bldg_timer
  CMP #$08
  BCC .rts  ;if building time is #$0B, init
  CMP #$09
  BCS .run

.init:
  JSR boss2_bldg_init   ;doing subs just to avoid branch range errors. they won't
                        ;actually be universalized to save space.
.run:
  LDA building_x
  CMP #$68
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
  CPX #$60
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
  CPX #$60
  BCC .y_loop_outer
  JMP .rts

.destroy:
  LDA #$00
  STA boss_bldg_stat
  STA boss_bldg_timer

  LDA #$80
  STA bldg_explode_ctrl

.rts:
  RTS


;;;;;;;;;;;;;;;;;;
boss2_bldg_init:

  LDA boss_bldg_num
  CMP #$03
  BCC .continue
  LDA #$00
  STA boss_bldg_num
.continue:
  ASL A
  TAY
  LDA boss2_building_starts, y
  STA building_x
  INY
  LDA boss2_building_starts, y
  STA building_y

  LDA boss_bldg_num
  ASL A
  TAY
  LDA boss2_building_patterns, y
  STA ptr2
  LDA boss2_building_patterns+1, y
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
  CPX #$60
  BCC .tile_loop

  LDX bldg_SMap_pos
  LDA [ptr2], y
.palette_loop:
  STA SpriteMap+2, x
  INX
  INX
  INX
  INX
  CPX #$60
  BCC .palette_loop

  INC boss_bldg_num
  LDA #$02
  STA boss_bldg_stat
  LDA #$09
  STA boss_bldg_timer

  RTS


;;;;;;;;;;;;;;;;;;;;
building_explosion:
  LDA bldg_explode_ctrl
  BMI .explosion
  JMP .rts

.explosion:
  LDA #$00
  STA loop_counter
  LDX bldg_SMap_pos

  LDA bldg_explode_ctrl
  AND #$7F
  CLC
  ADC #$01
  STA temp1
  LDA bldg_explode_ctrl
  AND #$80
  ORA temp1
  STA bldg_explode_ctrl

.first:
  CMP #$81
  BNE .second
  LDA #$00
  STA temp1
  LDA #$08
  STA temp2
  JMP .outer
.second:
  CMP #$91
  BNE .third
  LDA #$08
  STA temp1
  LDA #$10
  STA temp2
  JMP .outer
.third:
  CMP #$A1
  BNE .move_offscreen
  LDA #$10
  STA temp1
  LDA #$18
  STA temp2
  JMP .outer

.outer:
  LDY temp1
.inner:
  LDA building_explode_frames, y
  STA SpriteMap+1, x
  INY
  INX
  INX
  INX
  INX
  CPY temp2
  BCC .inner
  INC loop_counter
  LDA loop_counter
  CMP #$02
  BCC .outer
  JMP .rts

.move_offscreen:
  CMP #$B1
  BCC .rts
  LDA #$FA
  LDX bldg_SMap_pos
.destroy_loop:
  STA SpriteMap, x
  INX
  INX
  INX
  INX
  CPX #$60
  BCC .destroy_loop
  LDA #$00
  STA bldg_explode_ctrl

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;
boss2_collision_handler:
  JSR boss2_coll_boxes     ;sub sets up the boxes

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
  LDA #$00
  STA boss2_anim_counter  ;for boss2 deaths, switch the high byte of anim counter so the death message draws correctly.
  JSR ship_dies

.rts:
  RTS

;;;;;;;;;;;;;;;;;;
boss2_coll_boxes:

  LDX #$00
.box1:
  LDA boss2_collision_boxes, x
  STA cb1_left
  INX
  LDA boss2_collision_boxes, x
  STA cb1_right
  INX
  LDA boss2_collision_boxes, x
  STA cb1_top
  INX
  LDA boss2_collision_boxes, x
  STA cb1_bottom

.box2:
  INX
  LDA boss2_collision_boxes, x
  STA cb2_left
  INX
  LDA boss2_collision_boxes, x
  STA cb2_right
  INX
  LDA boss2_collision_boxes, x
  STA cb2_top
  INX
  LDA boss2_collision_boxes, x
  STA cb2_bottom

.box3:
  INX
  LDA boss2_collision_boxes, x
  STA cb3_left
  INX
  LDA boss2_collision_boxes, x
  STA cb3_right
  INX
  LDA boss2_collision_boxes, x
  STA cb3_top
  INX
  LDA boss2_collision_boxes, x
  STA cb3_bottom

  RTS


;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;
boss2_building_starts:    ;x coord, y coord
  .db $E0,$CC,$E0,$CC,$E0,$CC

;;;;;;;;;;;;;
boss2_building_patterns:   ;first sixteen valuses are tiles, then the palette
  .dw b2_building1,b2_building2,b2_building3

b2_building1:
  .db $CC,$CD,$CE,$CF,$D0,$D1,$D2,$D3
  .db $D4,$D5,$D6,$D7,$D8,$D9,$DA,$DB,$03
b2_building2:
  .db $EC,$ED,$EE,$EF,$F0,$F1,$F2,$F3
  .db $F4,$F5,$F6,$F7,$F8,$F9,$FA,$FB,$00
b2_building3:
  .db $DC,$DD,$DE,$DF,$E0,$E1,$E2,$E3
  .db $E4,$E5,$E6,$E7,$E8,$E9,$EA,$EB,$03

;;;;;;;;;;;;;;;;;;;;;;;;;
building_explode_frames:
  .db $FE,$28,$29,$FE  ;first frame
  .db $FE,$2A,$2B,$FE
  .db $FE,$2C,$2D,$FE  ;second frame
  .db $FE,$2E,$2F,$FE
  .db $31,$32,$33,$34  ;third frame
  .db $35,$36,$37,$38

;;;;;;;;;;;;;;;;;;;;;;;;;
boss2_mouth_close:     ;these are for the mouth opening/closing background
  .db $01,$22,$0B      ;updates. they are formatted for the text update sub
  .db $07,$08,$09,$0A  ;because that's what runs them.
  .db $01,$22,$2B
  .db $0D,$0E,$0F,$10
  .db $01,$26,$0B
  .db $06,$07,$08,$FD
  .db $01,$26,$2B
  .db $0B,$0C,$0D,$0E
  .db $02

boss2_mouth_open:
  .db $01,$22,$0B
  .db $AB,$AC,$AD,$AE
  .db $01,$22,$2B
  .db $AF,$B0,$B1,$B2
  .db $01,$26,$0B
  .db $A1,$A2,$A3,$FD
  .db $01,$26,$2B
  .db $A4,$A5,$A6,$A7
  .db $02

;;;;;;;;;;;;;;;;;;
boss2_collision_boxes:
  .db $40, $68, $B0, $E0 ;bottom box left, right, top, bottom
  .db $48, $64, $9C, $A8 ;middle box left, right, top, bottom
  .db $54, $64, $7C, $9C ;head box left, right, top, bottom




;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;
;;BOSS 2 DEATH


;;;;;;;;;;;;;;;;;;;;   ;;CHANGE bossx
boss2_end_handler:
  JSR set_ship_sprites_params

  LDA event_counter
  CMP #$02          ;skip the first tick on event counter so level_end has a chance to
  BCC .rts          ;update the score and assm%
  BEQ .init
  JMP .explosion

.init:
  JSR boss2_clear_SpriteMap
  JSR clear_explosion_RAM
  LDA #silence_song
  STA current_song
  JSR sound_load
  LDA #$03
  STA event_counter
  JMP .rts
.explosion:
  JSR boss2_explode
  LDA event_counter
  CMP #$06
  BCC .rts
.fade:
  JSR boss2_fade
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
boss2_fade:
  LDA boss_fade_timer
  CMP #$7A              ;CHANGE for other bosses, always make this one or
  BEQ .rts              ;two ticks above the final fade time

  INC boss_fade_timer
  LDY #00
.fade_loop:
  LDA boss2_fade_times, y
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
  ASL A
  TAY

  LDX #$00
.next_fade_loop:
  LDA boss2_fade_palettes, y
  STA pal_RAM, x
  INY
  INX
  CPX #$10
  BCC .next_fade_loop
  LDA #$FF
  STA pal_RAM, x
  LDA needdraw
  ORA #%01000000
  STA needdraw

.rts:
  RTS


boss2_fade_times:
  .db $01,$1E,$3C,$5A
  .db $78,$FF

boss2_fade_palettes:
;  .db $1D,$21,$0B,$20, $1D,$21,$0B,$01, $1D,$01,$12,$21, $1D,$12,$20,$01   ;starting pal
  .db $1D,$21,$0B,$20, $1D,$19,$03,$2D, $1D,$2D,$0A,$19, $1D,$0A,$18,$2D
  .db $1D,$21,$0B,$20, $1D,$11,$2D,$1E, $1D,$1E,$02,$11, $1D,$02,$10,$1E
  .db $1D,$21,$0B,$20, $1D,$09,$1E,$1E, $1D,$1E,$2D,$09, $1D,$2D,$08,$1E
  .db $1D,$21,$0B,$20, $1D,$01,$1E,$1E, $1D,$1E,$1E,$01, $1D,$1E,$2D,$1E
  .db $1D,$21,$0B,$20, $1D,$1E,$1E,$1E, $1D,$1E,$1E,$1E, $1D,$1E,$1E,$1E

;;;;;;;;;;;;;;;;
boss2_explode:
  LDY boss_expl_ptr
  LDA boss2_explode_times, y
  CMP #$FF                     ;pointer is on terminator byte, so stop creating
  BEQ .run_explosions          ;new explosions and wait for boss_end_done to be set

  INC boss_expl_timer
.init_loop:
  LDY boss_expl_ptr
  LDA boss_expl_timer
  CMP boss2_explode_times, y
  BNE .run_explosions
.create:
  JSR boss2_setup_explosion
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
  JSR boss2_expl_anim

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
;C0

boss2_explode_times:
  .db $10,$48,$60,$78,$90,  $A0,$B0,$C0,$D0,$E0,$F0,$00,$10,$20,$30,$40,$50,$60,$FF
boss2_explode_xcoords:
  .db $60,$50,$70,$48,$68,  $50,$78,$40,$60,$50,$70,$48,$68,$50,$60,$50,$80,$48,$FF
boss2_explode_ycoords:
  .db $A0,$B0,$90,$A0,$D0,  $80,$A0,$E0,$A0,$B0,$90,$D0,$90,$B0,$A0,$B0,$90,$A0,$FF


;;;;;;;;;;;;;;;;;;;;;;;;
boss2_clear_SpriteMap:
  LDY #SMap_clearEXPTship
  LDA #$FE
.loop:
  STA SpriteMap, y
  INY
  CPY #$B7
  BCC .loop
  RTS


;;;;;;;;;;;;;;;;;;;;;;;;
boss2_setup_explosion:
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

  LDA boss2_explode_xcoords, x    ;X COORDS
  SEC
  SBC xScroll
  STA explosion_RAM+2, y
  LDA boss2_explode_ycoords, x    ;Y COORDS
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
boss2_expl_anim:
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