;;;;;;;;;;;;;;;;;
set_cow_sprites:

  CLC
  LDA victim_y
  STA sprite_RAM_MS39
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
  ADC #$08
  STA sprite_RAM_MS40+3

  RTS


;;;;;;;;;;;;;;;;;;;
cow_spr_pal:

  LDA zombie
  BEQ .normal
.zombie:
  LDY victim_num              ;decided not to change the tiles for the cows like
  LDA zombie_pal_bank, y      ;I do for the humans when they're assimilated, so
  STA victim_pal              ;it only changes the palette and then moves on
  JMP .tile_load

.normal:
  LDY victim_num
  LDA victim_pal_bank, y
  STA victim_pal

.tile_load:
  LDA victim_num
  ASL A
  TAY
  LDA cow_tile_index, y
  STA ptr1
  LDA cow_tile_index+1, y
  STA ptr1+1
  JMP .anim_timing

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


;;;;;;;;;;;;;;;
bonus_scoring:
  LDA bonus_active
  BEQ .rts           ;bonus_active is 0, so normal level, no bonus points
  AND #$0F
  CMP #$0F           ;if #$0F, currently on cow level
  BEQ .cow_level

.campout:            ;otherwise campout level
  JSR AddScore
  JSR AddScore       ;jump back to AddScore twice to get 3x score
  JMP .clear

.cow_level:
  JSR AddScore       ;jump back to AddScore once to get 2x score

.clear:
  LDX #$00
.loop:     ;clear num_change slate so it can
  LDA #$00
  STA num_change, x
  INX
  CPX #$05
  BCC .loop

  LDA needdraw
  ORA #%00000010
  STA needdraw

.rts:
  RTS


;;;;;;;;;;;;;;;
bonus_timer:
  LDA bonus_active
  AND #$0F
  CMP #$0F           ;if #$0F, currently on cow level
  BEQ .cow_level

.campout:
  LDA #$01           ;gets compared to ones
  STA num_change+4
  LDA #$01           ;gets compared to tens
  STA num_change+3
  LDA #$00           ;gets compared to hundreds
  STA num_change+2
  LDA #$0F           
  STA temp1
  JMP .compare

.cow_level:
  LDA #$01           ;gets compared to ones
  STA num_change+4
  LDA #$06           ;gets compared to tens
  STA num_change+3
  LDA #$00           ;gets compared to hundreds
  STA num_change+2
  LDA #$F0
  STA temp1

.compare:
  LDA t_hundr
  CMP num_change+2
  BNE .reset
  LDA t_tens
  CMP num_change+3
  BNE .reset
  LDA t_ones
  CMP num_change+4
  BNE .reset

.bonus_level_complete: ;if we made it this far, time is up & level ends
  LDA #silence_song    ;silence channels before loading new song mid-stage
  STA current_song
  JSR sound_load
  LDA #sfx_efanfare
  STA current_song
  JSR sound_load

  LDA bonus_active
  AND temp1
  STA bonus_active

  LDA #$00             ;clear the time so it's not subtracted from player's score
  STA t_hundr          ;on the level-end screen, this only happens in bonus levels
  STA t_tens
  STA t_ones

  JSR victim_dissappear
  JSR set_victim_sprites_params

  LDA #$00               ;get ready to switch game state to level complete screen
  STA event_counter
  LDA #STATE_LVL_CLR
  STA gamestate

.reset:
  LDA #$00               ;clear the num_change variables just in case something
  STA num_change+2       ;else needs to use them.
  STA num_change+3
  STA num_change+4

.rts:
  RTS

;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;

cow_tile_index:
  .dw cow1,cow2,cow3

cow1:
  .db $6F,$70,$71,$72
cow2:
  .db $73,$74,$75,$76
cow3:
  .db $77,$78,$79,$7A