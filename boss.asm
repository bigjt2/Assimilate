boss_handler:
  JMP [boss_ptr]

boss_init:  ;input A: the boss constant
  LDA boss_num
  ASL A
  TAY
  LDA boss_init_subs, y
  STA ptr2
  LDA boss_init_subs+1, y
  STA ptr2+1
  JMP [ptr2]

boss_end_sequence:
  LDA boss_num
  ASL A
  TAY
  LDA boss_end_subs, y
  STA ptr2
  LDA boss_end_subs+1, y
  STA ptr2+1
  JMP [ptr2]


boss1_init:
  JSR init_boss1_special_objects
  RTS

boss1_subs:
  JSR boss1_movement
  JSR boss1_fwdprop
  JSR boss1_topprop
  JSR run_boss1_building
  JSR target_update
  JSR boss1_collision_handler
  RTS

boss1_end:
  JSR boss1_end_handler
  RTS


boss2_init:
  JSR init_boss2_special_objects
  JSR init_laser
  RTS

boss2_subs:
  JSR run_laser
  JSR run_boss2_building
  JSR building_explosion
  JSR boss2_animation
  JSR target_update
  JSR boss2_collision_handler
  RTS

boss2_end:
  JSR boss2_end_handler
  RTS


boss3_init:
  JSR init_boss3_special_objects
  RTS

boss3_subs:
  JSR boss3_movement
  JSR run_boss3_building
  JSR target_update
  JSR hamcycle_handler
  JSR run_stalin_mouth
  JSR run_stalin_eye
  JSR boss3_collision_handler
  RTS

boss3_end:
  JSR boss3_end_handler
  RTS


boss4_init:
  JSR init_boss4_special_objects
  JSR init_kogy_sprite
  RTS

boss4_subs:
  JSR boss4_movement
  JSR boss4_animation
  JSR run_kogy_sprite
  JSR run_klaser
  JSR run_shuttle
  JSR target_update
  JSR boss4_collision_handler
  RTS

boss4_end:
  JSR boss4_end_handler
  RTS


kogy_chase_init:
  JSR kogy_chase_init_special_obj
  RTS

kogy_chase_subs:
  JSR kogy_chase_autoscroll
  JSR kogy_chase_ossan_pos
  RTS


boss_init_subs:
  .dw boss1_init, boss2_init
  .dw boss3_init, boss4_init
  .dw kogy_chase_init

boss_subs:
  .dw boss1_subs, boss2_subs
  .dw boss3_subs, boss4_subs
  .dw kogy_chase_subs

boss_end_subs:
  .dw boss1_end, boss2_end
  .dw boss3_end, boss4_end


;;;;;;;;;;;;;;;;;;;;
Boss_ButtonHandler:
  LDA boss_num
  CMP #kogy_chase
  BNE .normal
  JSR chase_ButtonHandler
  JMP .rts
.normal:
  JSR ButtonHandler
.rts:
  RTS


;;;;;;;;;;;;;;
boss_arrow_loc_gen:

  LDA progress_bar
  CMP #$14
  BNE .building_target

.boss_target:
  LDA target_stat    ;sometimes I want to turn the arrow off during boss battles
  BEQ .arrow_on

.arrow_off:
  LDA #$FE
  STA arrow_loc
  STA arrow_loc+1
  JMP .rts

.arrow_on:
  LDA target_x
  SEC
  SBC #$08
  STA arrow_loc
  LDA target_y
  STA arrow_loc+1
  JMP .rts

.building_target:
  LDA building_x
  CLC
  ADC #$08
  STA arrow_loc

  LDA building_y
  SEC
  SBC #$08
  STA arrow_loc+1

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;;;
target_update:
  LDA boss_num
  ASL A
  TAY
  LDA boss_target_params, y
  STA ptr1
  LDA boss_target_params+1, y
  STA ptr1+1

  LDY #$00
  LDA [ptr1], y
  STA target_y
  INY
  LDA [ptr1], y
  SEC
  SBC xScroll
  STA target_x

.rts:
  RTS

;;;;;;;;;;;;;;;;;;;;;;
boss_target_params:
  .dw boss1_target_param,boss2_target_param
  .dw boss3_target_param,boss4_target_param

boss1_target_param:    ;y coord, x coord
  .db $80,$B8
boss2_target_param:
  .db $78,$68
boss3_target_param:
  .db $BC,$B8
boss4_target_param:
  .db $60,$80

;;;;;;;;;;;;;;;;;;
boss_beam_max:

  LDA arrow_loc+1   ;if this is #$FE, no arrow. automatically store ground to
  CMP #$FE          ;ensure music engine doesn't crash and beam doesn't go
  BNE .next         ;through the ceiling.
  JMP .store_ground

.next:
  LDA ship_bottom
  CMP arrow_loc+1
  BCC .store_arrow   ;if ship is below arrow, store ground as max
  JMP .store_ground

.store_arrow:
  LDA arrow_loc+1
  CLC
  ADC #$08
  SEC               ;this is the actual top of the building, where the arrow is
  SBC ship_bottom
  LSR A
  LSR A
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


;;;;;;;;;;;;;;;;;;;;;;;;;;
boss_NMI_write:

  LDA gamestate         ;going through with this sub interferes with the
  CMP #STATE_LVL_CLR    ;init_PPU code to switch to the level_end screen,
  BNE .continue         ;so skip.
  JMP NMI_main

.continue:
  LDA prg_bank
  STA bank_bak_boss

  LDA level_index   ;first swap to bank holding current boss data
  ASL A
  TAY
  LDA bank_map, y
  STA ptr1
  LDA bank_map+1, y
  STA ptr1+1
  LDY #$00
  LDA [ptr1], y
  STA prg_bank
  JSR swap_PRG_bank   ;very redundant code, but I have the room for it so what the hell

  LDA boss_num
  ASL A
  TAY
  LDA boss_NMI_sequences, y
  STA ptr1
  LDA boss_NMI_sequences+1, y
  STA ptr1+1

  JMP [ptr1]

boss_NMI_sequences:
  .dw boss1_NMI_seq, boss2_NMI_seq
  .dw boss3_NMI_seq, boss4_NMI_seq
  .dw kogy_chase_NMI


;;;;;;;;;;;;;;;;;;;;;;
clear_explosion_RAM:
  LDY #$00
  LDA #$FE
.loop:
  STA explosion_RAM, y
  INY
  CPY #$10
  BCC .loop
  RTS  