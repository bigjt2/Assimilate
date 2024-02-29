;;;;;;;;;;;;;;;;;;;;;;;;
init_item:
  LDA #$09
  STA OAM_SpcNeed
  JSR OAM_memtest
  BCC .sprite_test
  JMP .store_offset

.sprite_test:
  LDA #$04
  STA SPR_SpcNeed
  JSR SPR_memtest
  BCC .test_success  ;if either test fails
  JMP .store_offset  ;branch to store offset/don't spawn

.test_success:
  JSR mem_tests_successful

  JSR Item_SMap_setup  ;since the offset that holds the smap in items is different from enemies, this has to be different sub.
  LDX obj_run_offset

.init_item:

.store_obj_type:
  LDY obj_init_offset  ;it should be set to #fireball
  LDA [obj_ptr], y
  STA oam_type, x

.store_item_type:
  JSR item_type_setup

.x_coords:
  INY
  LDA [obj_ptr], y
  JSR obj_setup_x_coord

.y_coord:
  LDA #$40
  STA oam_yMapLO, x

.tiles_palette:    ;tiles for items will not be animated, so simply load
  LDA item_type, x ;in init and be done with it.
  ASL A            ;no... seriously John.  don't animate the fucking items!
  TAY              ;this note is here just to keep you from adding more bullshit to your list.
  LDA item_tiles, y
  STA ptr1
  LDA item_tiles+1, y
  STA ptr1+1

  LDY #$00
.push_loop:        ;transfers the four tile numbers and the palette
  LDA [ptr1], Y    ;to the stack
  PHA
  INY
  CPY #$05
  BCC .push_loop

  PLA              ;pull attribute of stack first
  LDY item_SMap_loc, x
  STA SpriteMap+2, y
  LDY item_SMap_loc+1, x
  STA SpriteMap+2, y
  LDY item_SMap_loc+2, x
  STA SpriteMap+2, y
  LDY item_SMap_loc+3, x
  STA SpriteMap+2, y

  PLA              ;now do the tiles
  LDY item_SMap_loc+3, x
  STA SpriteMap+1, y
  PLA
  LDY item_SMap_loc+2, x
  STA SpriteMap+1, y
  PLA
  LDY item_SMap_loc+1, x
  STA SpriteMap+1, y
  PLA
  LDY item_SMap_loc, x
  STA SpriteMap+1, y

.store_offset:
  LDA obj_init_offset
  CLC              ;since there's no general object setup with this init
  ADC #$03         ;you need to manually add the offset
  STA obj_init_offset

.rts:
  JMP OBJ_init_loop_return


;;;;;;;;;;;;;;;;;;
run_item:
  LDY obj_run_offset    ;offset should reflect where pointer is on $0700 OAM table

  LDA oam_type, y
  AND #$40         ;check for destroy flag in bit 6
  BEQ .y_screen_test
  JMP .destroy_item

.y_screen_test:
  LDA oam_yMapLO, y
  CMP #$E0
  BCC .movement
  JMP .destroy_item

.movement:
  LDA counter
  AND #$01
  BEQ .dont_skip
  JMP .increase_offset

.dont_skip:
  LDA oam_yMapLO, y
  CLC
  ADC #$01
  STA oam_yMapLO, y

.visibility:
  LDA #$00             ;in this sub, loop_counter variable is used to track the number
  STA loop_counter     ;of sprites in the object that need tested
  LDA oam_xMapHI, y
  PHA                  ;MUST back this up, it's very likely it will be incremented in the following code so I need a backup
  STY temp_y           ;temp_y is used to increment the offset for the SpriteMap RAM variables

.upper_row:
  JSR itm_vis_sequence

  PLA
  STA oam_xMapHI, y    ;make SURE whatever sub comes before this loads y with object offset
  PHA

.lower_row:
  JSR itm_vis_sequence

.collision:
  LDY obj_run_offset   ;restore y to the obj_run_offset, otherwise all inderects will be using the temp_y
  PLA   ;here we must restore the original xMapHI in oam, in case it incremented
  STA oam_xMapHI, y

  LDX item_SMap_loc, y
  LDA SpriteMap, x     ;test whether first sprite is on-screen.
  CMP #$FA             ;if not, then entire object assumed to be off-screen, so skip collision test
  BEQ .increase_offset

  LDA #$0E
  STA obj_height
  STA obj_width
  LDA #$01
  STA temp1    ;temp1 is the amount to offset x to the right
  STA temp2    ;temp2 is the amount to offset y downward

  JSR obj_coords_to_bbox   ;will take x & y coord and create a bbox
  JSR collision_against_ship  ;will take bbox and test collision agains Ossan, set player_dead var if collision
  BCC .increase_offset

.start_effect:
  LDA #$00            ;I want the previous item's effect to be cancelled out,
  STA item_fx_timer   ;so store these vars and run these subs upon all items' collisions
  JSR reset_item_effect
  JSR effect_launcher

.destroy_item:
  JSR destroy_item

.increase_offset:
  LDA obj_run_offset
  CLC                 ;need to increase this so OAM will load in correct pos
  ADC #$09            ;for next object in $0700 memory
  STA obj_run_offset

  JMP OBJ_run_loop_return


;;;;;;;;;;;;;;;;;;
item_type_setup:
  TYA   ;push init offset to stack
  PHA
  TXA
  PHA

  INC r_marker       ;for this sub, I inc r_marker and do the reset test at the
  JSR r_marker_test  ;beginning, so it doesn't mess with the registers being restored later

  LDX r_marker
  LDA r_results, x
  LSR A
  LSR A   ;to speed this sub up, make the rotating index smaller
  LSR A
  TAX     ;this is the random number to compare

  LDA level
  ASL A
  TAY
  LDA level_item_map, y
  STA ptr1
  LDA level_item_map+1, y
  STA ptr1+1  

  LDY #$00
.item_num_loop:
  LDA [ptr1], y
  CMP #$FF
  BEQ .restart

  DEX
  CPX #$00
  BEQ .store

  INY          ;next entry in level_item_map
  JMP .item_num_loop

.restart:
  LDY #$00
  JMP .item_num_loop

.store:
  PLA
  TAX
  LDA [ptr1], y
  STA item_type, x
  PLA
  TAY

  RTS


;;;;;;;;;;;;;;;;;;;;;;
item_effect_time:
  LDA EMP_trigger
  BEQ .item_effects
  LDA event_counter
  CMP #$03           ;do the screen flashing effect for the first
  BCS .item_effects  ;three seconds after an EMP's been activated
  JSR background_flash  ;by jumping to the background_flash sub

.item_effects:
  LDA item_fx_timer
  CMP item_end
  BCS .reset_effect
  JMP .rts
.reset_effect:
  JSR reset_item_effect
.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;
reset_item_effect:
  LDA #$00
  STA assm_speed
  STA EMP_trigger
  JSR FillAssmSpeed

  RTS


;;;;;;;;;;;;;;;;
destroy_item:
  LDY obj_run_offset
  LDX item_SMap_loc, y
  JSR clear_sprite_tile
  LDX item_SMap_loc+1, y
  JSR clear_sprite_tile
  LDX item_SMap_loc+2, y
  JSR clear_sprite_tile
  LDX item_SMap_loc+3, y
  JSR clear_sprite_tile

  LDA SPR_Free
  CLC
  ADC #$04
  STA SPR_Free

  LDA #$FE
  STA oam_type, y
  STA oam_dir, y
  STA oam_xMapHI, y
  STA oam_xMapLO, y
  STA oam_yMapLO, y
  STA item_SMap_loc, y
  STA item_SMap_loc+1, y ;clear out the extra locations
  STA item_SMap_loc+2, y
  STA item_SMap_loc+3, y

  LDA OAM_Free
  CLC
  ADC #$09
  STA OAM_Free

  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;
;;Item Effects
;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;
effect_launcher:
  LDX obj_run_offset
  LDA item_type, x
  ASL A
  TAY
  LDA item_sub_jumptable, y
  STA ptr1
  LDA item_sub_jumptable+1, y
  STA ptr1+1

  JMP [ptr1]


;;;;;;;
ITM_None:
  RTS


;;;;;;;
ITM_2X:
  LDA #$01
  STA assm_speed
  JSR FillAssmSpeed
  LDA #$11
  STA item_end

  RTS


;;;;;;;;
ITM_3X:
  LDA #$02
  STA assm_speed
  JSR FillAssmSpeed
  LDA #$0D
  STA item_end

  RTS


;;;;;;;
ITM_EMP:
  LDA #$01
  STA EMP_trigger
  LDA #$00
  STA event_counter
  LDA #$08
  STA item_end

  JSR background_flash

  LDA #EMP_sfx
  STA current_song
  JSR sound_load

  LDY #$00
.destroy_loop:   ;destroys all current enemy objects loaded in OAM
  LDA OAM, y
  CMP #$FE       ;blank spot, keep checking
  BNE .compare_ignore
  INY
  JMP .continue_loop
.compare_ignore:
  CMP #ignore
  BEQ .handle_ignore_EMP
.next:
  BMI .nonEn     ;if over $80, not an enemy

.enemy:
.compare_dragon:
  CMP #dragon    ;dragons are invulnerable to mere EMPs because they're MAGICAL!!!
  BNE .compare_kogyaru
  LDA #$11
  STA temp1
  JMP .add_offset

.compare_kogyaru:
  CMP #kogyaru    ;kogyaru is invulnerable to mere EMPs because she's a lying, dishonest, SLUT!!!
  BNE .compare_icbm
  LDA #$13
  STA temp1
  JMP .add_offset

.compare_icbm:
  CMP #icbm       ;since the icbm's size in OAM changes frequently, the easiest thing to do is just not destroy it with an emp
  BNE .enemy_next ;otherwise the offset will store destroy bits on all sorts of random variables

  LDA icbm_phase, y
  CMP #ilaunch
  BNE .store0B
.store24:
  LDA oam_type, y
  ORA #$40       ;set destroy flag
  STA oam_type, y
  LDA #$24
  STA temp1
  JMP .add_offset
.store0B
  LDA #$14
  STA icbm_phase, y
  LDA #$0B
  STA temp1
  JMP .add_offset
  ;if there are other enemies invulnerable to the EMP later, add them here
.enemy_next:
  ORA #$40       ;set destroy flag
  STA OAM, y
  AND #$3F       ;mask out non-enemy and destroy flags
  TAX
  LDA enemy_mem_reqs, x
  STA temp1
  JMP .add_offset  
.nonEn:
  AND #$3F
  TAX
  LDA non_enemy_mem_reqs, x
  STA temp1
.add_offset:
  TYA      ;transfer and add
  CLC      ;y increment (offset increment)
  ADC temp1
  TAY
.continue_loop:
  CPY #$00
  BNE .destroy_loop
  JMP .rts

.handle_ignore_EMP:
  INY
  LDA OAM, y
  STA temp1     ;transfer number of bytes to skip to temp1 and add
  TYA
  CLC
  ADC temp1
  TAY
  JMP .destroy_loop
.rts:
  RTS


;;;;;;;
ITM_1UP:
  INC lives
  JSR ConvertLives

  LDA #oneUP_sfx
  STA current_song
  JSR sound_load

  LDA needdraw
  ORA #%00000100
  STA needdraw

  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Special Item Visibility Tests
;;;;;;;;;;;;;;;;;;;;;;;;
itm_vis_sequence:
  JSR itm_vis_reset_x
  JSR itm_vis_test
  JSR itm_vis_next
  JSR itm_vis_test
  JSR itm_vis_next
  RTS

;;;;;;;;;;;;;;;;
itm_vis_reset_x:
  LDY obj_run_offset
  LDA oam_xMapLO, y    ;start by transferring the current x coord of the object
  STA sprite_x_offset  ;to this variable, which will be used in the visibility testing.
  RTS

;;;;;;;;;;;;;;;;
itm_vis_test:
  JSR visibility_check
  BCS .onscreen

.offscreen:
  LDY temp_y
  LDA #$FA               ;Y COORDS
  LDX item_SMap_loc, y
  STA SpriteMap, x
  JMP .rts

.onscreen:
  LDY temp_y             ;temp_y keeps track of the SMap_loc
  LDX item_SMap_loc, y

  LDA sprite_x_offset    ;X COORDS
  SEC              
  SBC camera_Left_x
  STA SpriteMap+3, x

  LDA loop_counter
  CMP #$02
  BCS .lower_row
.upper_row:
  LDY obj_run_offset
  LDA oam_yMapLO, y      ;Y COORDS
  STA SpriteMap, x
  JMP .rts
.lower_row:
  LDY obj_run_offset
  LDA oam_yMapLO, y      ;Y COORDS
  CLC
  ADC #$08
  STA SpriteMap, x
.rts:
  RTS

;;;;;;;;;;;;;;;;
itm_vis_next:
  INC temp_y
  INC loop_counter
  LDA sprite_x_offset
  CLC                 ;increase sprite offset so next run through visibility_check will
  ADC #$08            ;calculate the next sprite to the right
  STA sprite_x_offset

  LDY obj_run_offset
  LDA oam_xMapHI, y
  ADC #$00            ;increment oam's screen number, if neccessary, otherwise real funky stuff will
  STA oam_xMapHI, y   ;happen with the visibility calculations, like objs appearing on screens where they shouldn't.
.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;;
;;Item Tables
;;;;;;;;;;;;;;;;;;;;;;
item_sub_jumptable:
  .dw ITM_None, ITM_2X, ITM_3X, ITM_EMP, ITM_1UP

item_tiles:     ;first four values are tile nums, fifth is palette
  .dw ITM_None_tile, ITM_2X_tile, ITM_3X_tile, ITM_EMP_tile, ITM_1UP_tile
ITM_None_tile:
  .db $FE,$FE,$FE,$FE,$00
ITM_2X_tile:
  .db $39,$3A,$3B,$3C,$03
ITM_3X_tile:
  .db $3D,$3E,$3F,$40,$03
ITM_EMP_tile:
  .db $41,$42,$43,$44,$00
ITM_1UP_tile:
  .db $63,$64,$65,$66,$00

level_item_map
  .dw lv0_items,lv1_items,lv2_items,lv3_items,lv4_items,bs1_items
  .dw lv6_items,lv7_items,lv8_items,lv9_items,lv10_items,bs2_items
  .dw lv12_items,lv13_items,lv14_items,lv15_items,lv16_items,bs3_items
  .dw lv18_items,lv19_items,lv20_items,lv21_items,bs4_items,fnl_bs_items
  .dw cow_items, campout_items

lv0_items:
  .db $00
lv1_items:
  .db $01,$02,$03,$01,$02,$03,$FF
lv2_items:
  .db $01,$02,$03,$01,$02,$03,$FF
lv3_items:
  .db $01,$01,$03,$00,$01,$02,$03,$FF
lv4_items:
  .db $01,$01,$03,$01,$02,$03,$FF
bs1_items:
  .db $00,$01,$00,$03,$00,$02,$00,$FF

lv6_items:
  .db $01,$00,$02,$00,$01,$00,$02,$FF
lv7_items:
  .db $00,$03,$00,$01,$00,$02,$00,$01,$00,$FF
lv8_items:
  .db $00,$03,$00,$01,$00,$02,$00,$01,$00,$FF
lv9_items:
  .db $01,$01,$00,$01,$02,$03,$FF
lv10_items:
  .db $01,$01,$00,$01,$02,$03,$FF
bs2_items:
  .db $00,$01,$00,$03,$00,$02,$00,$FF

lv12_items:
  .db $01,$01,$00,$01,$02,$00,$03,$FF
lv13_items:
  .db $01,$03,$03,$01,$02,$00,$03,$FF
lv14_items:
  .db $01,$01,$00,$01,$02,$00,$03,$FF
lv15_items:
  .db $01,$01,$00,$01,$02,$00,$03,$FF
lv16_items:
  .db $01,$01,$00,$01,$02,$00,$03,$FF
bs3_items:
  .db $00,$01,$00,$00,$02,$00,$00,$FF

lv18_items:
  .db $01,$01,$00,$01,$02,$00,$03,$FF
lv19_items:
  .db $01,$01,$00,$01,$02,$00,$03,$FF
lv20_items:
  .db $01,$02,$00,$01,$02,$FF
lv21_items:
  .db $00,$FF
bs4_items:
  .db $00,$FF
fnl_bs_items:
  .db $00,$FF

cow_items:
  .db $04,$00,$FF
campout_items:
  .db $04,$00,$00,$00,$FF