;;;;;;;;;;;;;
CutScene_Manager:
  ;;CS_ptr is set previously in the CS_init sub
  ;;here is where i plan to put code for more advanced cutscenes
  ;;stuff will go here that needs to run after the init, like changing
  ;;text for long storyboards (if I decide to do that)

.start:
  LDA CS_Sup_flag     ;first check whether support subs need jumped to
  BEQ CS_Support_Sub_Return
  JMP [CS_Sup_Sub_Ptr]

CS_Support_Sub_Return:
  JSR Counter_Manager
.skip_test:
  LDA starthold
  BNE .dont_skip       ;if start hold flag is set, ignore the start button so player can't skip
  JSR ReadController   ;if player presses start, skip the cutscene
  LDA buttons_new
  AND #%00010000
  BEQ .dont_skip
  JMP CutSceneEnd

.dont_skip:
  LDA CS_extend_addr_HI
  BEQ .normal_ptr
.extended_ptr:
  LDA CS_extend_addr_LO
  STA ptr1
  LDA CS_extend_addr_HI
  STA ptr1+1
  JMP .pull_byte

.normal_ptr
  LDA level
  ASL A
  TAY
  LDA CutSceneEvents, y
  STA ptr1
  LDA CutSceneEvents+1, y
  STA ptr1+1

.pull_byte:
  LDY CS_ptr
  LDA [ptr1], y
  BPL .timing          ;if positive, it's a time unit

.subroutine:
  AND #$7F              ;get rid of the negative
  ASL A
  TAY
  LDA CS_Event_Jumptable, y
  STA ptr2
  LDA CS_Event_Jumptable+1, y
  STA ptr2+1           ;jump to sub, should have logic to know whether to
  JMP [ptr2]           ;continue or init

.timing:
  LDA event_counter
  CMP [ptr1], y
  BCC .return_to_gameloop
  INC CS_ptr           ;if event_counter equals current timing unit
  LDY CS_ptr           ;inc CS_ptr, next value on event table should be a sub
  JMP .pull_byte
.return_to_gameloop:
  JMP Cutscene_return


;;;;;;;;;;;;;;;;;;;;;;
;;Cut Scene Functions
;;;;;;;;;;;;;;;;;;;;;
CutSceneEnd:
  JSR blackout
  JSR vblankwait
  JSR vblankwait

  LDA gamestate
  CMP #STATE_CREDITS
  BNE .normal
.end_of_game:
  LDA #$00
  STA level_index
  LDA #STATE_LVL_CHG
  STA gamestate
  JMP Cutscene_return
.normal:
  INC level_index
  LDA #STATE_LVL_CHG
  STA gamestate
  JMP Cutscene_return


;;;;;;;;;;;;;;;;;;;
CutScene_LoadPic:
  LDA CS_pic_ptr
  BMI .init              ;negative can only mean it's set to $FF
  CMP #$0A
  BCC .continue
  JMP .done

.init:
  LDA #$00
  STA CS_pic_ptr
  STA CS_pic_row_clear
  LDA #onscreen_pic
  STA onscreen_flag      ;this is so onscreen drawing sub knows to branch to pic

  INC CS_ptr
  LDY CS_ptr
  LDA [ptr1], y          ;loading off CutSceneEvents
  ASL A
  TAY
  LDA Cutscene_Pic_Index, y
  STA CS_curr_pic_LO
  LDA Cutscene_Pic_Index+1, y
  STA CS_curr_pic_HI
  DEC CS_ptr             ;corrective for incrementing above, neccessary to pull the correct picture

.continue:
  LDA CS_pic_row_clear   ;if this is set, NMI didn't have a chance to draw
  BEQ .address           ;the previous row, so branch to end until it does
  JMP .return_to_engine

.address:
  LDX #$00               ;first two bytes are the addresses it needs to write to.
  LDA CS_pic_ptr
  ASL A                  ;two values off the upcomming table needed, so mult by 2
  TAY
  LDA onscreen_pic_addresses, y
  STA onscreen_buffer, x
  INY
  INX
  LDA onscreen_pic_addresses, y
  STA onscreen_buffer, x
  INX

.start_row:
  LDA CS_curr_pic_LO     ;transfer the address of the current pic table into
  STA ptr1               ;ptr1
  LDA CS_curr_pic_HI
  STA ptr1+1

  LDA CS_pic_ptr
  ASL A
  TAY
  LDA [ptr1], y
  STA ptr2
  INY                    ;ptr2 now becomes the actual row within the current
  LDA [ptr1], y          ;picture table
  STA ptr2+1 

.tiles:                  ;eighteen bytes after are the row of tiles.
  LDY #$00
.tiles_loop:
  LDA [ptr2], y
  CMP #pic_rpt
  BEQ .pic_rle
  STA onscreen_buffer, x
  INY
  INX
  CPX #$14               ;compare to 20, 2 address bytes, 18 tile bytes 
  BCC .tiles_loop
  JMP .tiles_done

.pic_rle:
  INY
  LDA [ptr2], y
  STA loop_counter
  INY
.pic_rle_loop:
  LDA [ptr2], y
  STA onscreen_buffer, x
  INX
  DEC loop_counter
  LDA loop_counter
  BNE .pic_rle_loop
  INY
  JMP .tiles_loop


.tiles_done:
  LDA needdraw          ;set needdraw bit 7 so NMI knows what to do.
  ORA #$80
  STA needdraw
  LDA #$01
  STA CS_pic_row_clear

  INC CS_pic_ptr        ;INC pic_ptr (current row of pic) and compare to $0A, 
  JMP .return_to_engine

.done:
  LDA #$FF
  STA CS_pic_ptr
  LDA #onscreen_nothing
  STA onscreen_flag
  LDA #$00
  STA CS_pic_row_clear

  INC CS_ptr            ;need to inc twice at end of this sub so it skips the
  INC CS_ptr            ;picture constant

.return_to_engine:
  JMP Cutscene_return



;;;;;;;;;;;;;
CS_LoadText:
;  .db loadtext,para_lv1_00

  LDA CS_pic_row_clear   ;in this sub, 0 means sub hasn't ran, 1 means there's
  BEQ .proceed           ;text waiting to load, 2 means text has loaded and we
  CMP #$01
  BEQ .return_to_engine  ;need to proceed onward into CutSceneEvents
  CMP #$02
  BEQ .done

.proceed:
  LDA #onscreen_text
  STA onscreen_flag
  
  INC CS_ptr
  LDY CS_ptr
  LDA [ptr1], y          ;loading off CutSceneEvents
  ASL A
  TAY
  LDX #$00

  LDA gamestate
  CMP #STATE_CREDITS
  BEQ .credits_text
.cutscene_text:
  LDA Cutscene_Texts, y
  STA onscreen_buffer, x
  LDA Cutscene_Texts+1, y
  STA onscreen_buffer+1, x
  JMP .set_flags
.credits_text:
  LDA Credits_Texts, y
  STA onscreen_buffer, x
  LDA Credits_Texts+1, y
  STA onscreen_buffer+1, x

.set_flags:
  LDA #$01
  STA CS_pic_row_clear

  LDA needdraw          ;set needdraw bit 7 so NMI knows what to do.
  ORA #$80
  STA needdraw

  DEC CS_ptr
  JMP .return_to_engine

.done:
  LDA #onscreen_nothing
  STA onscreen_flag
  LDA #$00
  STA CS_pic_row_clear

  INC CS_ptr
  INC CS_ptr
.return_to_engine:
  JMP Cutscene_return



;;;;;;;;;;;;;;;;;;;;;;
CutScene_AttrChange:
  ;;$23D2 top four attributes    -should be left to right
  ;;$23DA bottom four attributes
  INC CS_ptr
  LDY CS_ptr
  LDA [ptr1], y          ;loading off CutSceneEvents
  ASL A
  TAY
  LDA Cutscene_Pic_Attribute_Index, y
  STA ptr2
  LDA Cutscene_Pic_Attribute_Index+1, y
  STA ptr2+1
  INC CS_ptr             ;only run this sub once, unlike the picture loader
                         ;so increment the pointer instead
  LDY #$00
.buffer_loop:
  LDA [ptr2], y
  STA onscreen_buffer, y
  INY
  CPY #$08
  BCC .buffer_loop

  LDA needdraw
  ORA #$80
  STA needdraw
  LDA #onscreen_attr
  STA onscreen_flag

  JMP Cutscene_return



;;;;;;;;;;;;;;;;;;
CutScene_FadeIn:
;  .db $02, fadein,[paltable],bgpal_1,$0C,$30
;  CS_fadepal_max = $0C  ;  fade_timer = $30

  LDA fade_timer
  CMP #$FF
  BNE .timing

.init:
  LDA CS_ptr             ;back it up, will be easier than decrementing a whole
  STA temp1              ;bunch after init

  INC CS_ptr             ;first move past the palette table that will be used.
  INC CS_ptr
  LDY CS_ptr

  LDA [ptr1], y          ;loading off CutSceneEvents
  STA pal_change_lo

  INY
  LDA [ptr1], y
  STA CS_fadepal_max     ;number of colors to be loaded in this fade

  INY
  LDA [ptr1], y
  STA fade_timer

  LDA #$00
  STA fade_table_ptr
  LDY temp1
  STY CS_ptr
.timing:
  DEC fade_timer
  LDA fade_timer
  BEQ .new_pal
  JMP .return_to_engine

.new_pal:
  LDA CS_ptr             ;back up CS_ptr for the end of this sequence so that once
  STA temp1              ;exiting, CutScene_Manager will accureately send the game back here

.table_setup:
  INC CS_ptr
  LDY CS_ptr
  LDA [ptr1], y
  ASL A
  TAY
  LDA Fade_tables, y
  STA ptr2
  LDA Fade_tables+1, y
  STA ptr2+1

.load_pals:
  LDA fade_table_ptr     ;will create an offset on the fade table to make a
  CLC                    ;1-to-1 load store between table and correct PPU pal address
  ADC pal_change_lo
  TAY
  LDX #$00
.new_pal_loop:
  LDA [ptr2], y
  STA pal_RAM, x
  INY
  INX
  CPX CS_fadepal_max
  BCC .new_pal_loop
.loop_finish:
  LDA #$FF                ;store terminator in pal_RAM
  STA pal_RAM, x

.update_fade_table_ptr:
  LDA fade_table_ptr
  CLC
  ADC #$10
  STA fade_table_ptr
  TAY
.compare_to_table:
  LDA [ptr2], y           ;if next byte is a color instead of #FF
  CMP #$FF                ;don't finish the fade sequence
  BEQ .done
.reset_timer:
  LDA CS_ptr
  CLC
  ADC #$03
  TAY
  LDA [ptr1], y
  STA fade_timer
.restore_CS_ptr:
  LDA temp1
  STA CS_ptr
  JMP .set_needdraw  

.done:
  LDA #$FF
  STA fade_timer
  LDA CS_ptr
  CLC
  ADC #$04
  STA CS_ptr

.set_needdraw:
  LDA needdraw
  ORA #%01000000
  STA needdraw

.return_to_engine:
  JMP Cutscene_return



;;;;;;;;;;;;;;;;;;
CutScene_FadeOut:
;  .db fadeout, [paltable],bgpal_1,$0C,$24,$10,$30
;  CS_fadepal_max  ;  fadeout_beg_byte = $24
;  fadeout_dec = $10  ;  fade_timer = $30

  LDA fade_timer
  CMP #$FF
  BNE .timing

.init:
  LDA CS_ptr             ;back it up, will be easier than decrementing a whole
  STA temp1              ;bunch after init

  INC CS_ptr             ;first move past the palette table that will be used.
  INC CS_ptr
  LDY CS_ptr
  LDA [ptr1], y          ;loading off CutSceneEvents
  STA pal_change_lo
  INY
  LDA [ptr1], y
  STA CS_fadepal_max     ;number of colors to be decremented in this fade
  INY
  LDA [ptr1], y
  STA fadeout_beg_byte   ;tells engine where to beign subtracting on
  INY                    ;current fade table
  LDA [ptr1], y
  STA fadeout_dec        ;tells how much to decrement from each byte
  INY
  LDA [ptr1], y
  STA fade_timer

.prepare_palette:
  LDY temp1              ;original CS_ptr upon entering sub
  INY                    ;increment to retrieve current fade table
  LDA [ptr1], y
  ASL A
  TAY
  LDA Fade_tables, y
  STA ptr2
  LDA Fade_tables+1, y
  STA ptr2+1

  LDX #$00
  LDY fadeout_beg_byte
.prepare_loop:
  LDA [ptr2], y          ;loop sets up the beginning palette to fade down from
  STA pal_RAM, x
  INY
  INX
  CPX CS_fadepal_max
  BCC .prepare_loop
  LDA #$FF
  STA pal_RAM, x

  LDA temp1              ;restore CS_ptr
  STA CS_ptr

.timing:
  DEC fade_timer
  LDA fade_timer
  BEQ .new_dec
  JMP .return_to_engine

.new_dec:
  LDA #$00
  STA temp2              ;I use this as a flag to test whether all values are black or not
  LDY #$00
.decrement_loop:
  LDA pal_RAM, y
  CMP #$1D
  BEQ .continue
  CMP #$1E
  BEQ .continue
.subtract:
  SEC
  SBC fadeout_dec
  BPL .store
  LDA #$1E
.store:
  STA pal_RAM, y
  INC temp2             ;at least one value must have been altered, so test failed this round

.continue:
  INY
  CPY CS_fadepal_max
  BCC .decrement_loop

.completion_test:
  LDA temp2             ;if temp2 is still 0, all values are now black, so finish
  BEQ .done

.reset_timer:
  LDA CS_ptr
  CLC
  ADC #$06
  TAY
  LDA [ptr1], y
  STA fade_timer
  JMP .set_needdraw

.done:
  LDA #$FF
  STA fade_timer
  LDA CS_ptr
  CLC
  ADC #$07
  STA CS_ptr
  JMP .return_to_engine   ;all the blacks would have loaded last palette, so we
                          ;can just return to the engine now.
.set_needdraw:
  LDA needdraw
  ORA #%01000000
  STA needdraw

.return_to_engine:
  JMP Cutscene_return



;;;;;;;;;;;;;;;;;
CS_Load_Song_Sfx:
  INC CS_ptr
  LDY CS_ptr
  LDA [ptr1], y 
  STA current_song
  JSR sound_load
  INC CS_ptr

.return_to_engine:
  JMP Cutscene_return


;;;;;;;;;;;;;;;;;;
CutScene_Bankswap:
  INC CS_ptr
  LDY CS_ptr
  LDA [ptr1], y
  STA bchr_bank
  JSR swap_CHR_bank1000
  INC CS_ptr
.return_to_engine:
  JMP Cutscene_return


;;;;;;;;;;;;;;;;;
CutScene_Extend:
  INC CS_ptr
  LDY CS_ptr
  LDA [ptr1], y
  ASL A
  TAY
  LDA CutSceneEvents_extend, y
  STA CS_extend_addr_LO
  INY
  LDA CutSceneEvents_extend, y
  STA CS_extend_addr_HI
  LDA #$00
  STA CS_ptr

.return_to_engine:
  JMP Cutscene_return


;;;;;;;;;;;;;;;;;;;;;;;;;;;
Set_basic_cutscene_pal:
  ;;input: temp1 - the color chosen for text

  LDA #bgpal_0
  STA pal_change_lo

  LDY #$00
  LDX #$00
.loop:
  LDA CS_pal_basic_txt, y
  STA pal_RAM, x
  INY
  INX
  CPX #$03
  BCC .loop
  LDA temp1
  STA pal_RAM, x
  INX
  LDA #$FF
  STA pal_RAM, x
  LDA needdraw
  ORA #%01000000
  STA needdraw

  RTS

;;;;;text color constants
txt_blue = $21
txt_red  = $25
txt_green = $2A
txt_yellow = $28
txt_white = $30
txt_brown = $17
txt_purple = $23


;;;;;;;;;;;;;;
CS_start_hold:

  LDY CS_ptr
  INY
  LDA [ptr1], y
  STA starthold
  INY
  STY CS_ptr

.return_to_engine:
  JMP Cutscene_return

s_hold_ON = $01
s_hold_OFF = $00


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
NMI_onscreen_load:
  LDA onscreen_flag
  CMP #onscreen_pic
  BNE .next
  JMP .pic_load
.next
  CMP #onscreen_text
  BNE .next1
  JMP .text_load
.next1
  CMP #onscreen_attr
  BNE .next2
  JMP .attr_load
.next2:
  JMP .reset_needdraw

;;;;;;;;;;
.pic_load
  LDX #$00
  LDA onscreen_buffer, x
  STA $2006
  INX
  LDA onscreen_buffer, x
  STA $2006
  INX
.pic_load_loop:
  LDA onscreen_buffer, x
  STA $2007
  INX
  CPX #$14
  BCC .pic_load_loop

  LDA #$00
  STA CS_pic_row_clear
  JMP .reset_needdraw

;;;;;;;;;;;;
.attr_load:
  LDA #$23
  STA $2006
  LDA #$D2
  STA $2006

  LDX #$00
.attr_loop1:
  LDA onscreen_buffer, x
  STA $2007
  INX
  CPX #$04
  BCC .attr_loop1

  LDA #$23
  STA $2006
  LDA #$DA
  STA $2006

.attr_loop2:
  LDA onscreen_buffer, x
  STA $2007
  INX
  CPX #$08
  BCC .attr_loop2

.attr_done:
  LDA #onscreen_nothing
  STA onscreen_flag
  JMP .reset_needdraw

;;;;;;;;;;;;
.text_load:

  JSR Load_Text
  LDA #$02
  STA CS_pic_row_clear


.reset_needdraw:
  LDA needdraw
  AND #$7F
  STA needdraw

.rts:
  RTS


;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;
CutSceneEvents:
  .dw CS_event_lv0,CS_event_lv1,CS_event_lv2,CS_event_lv3,CS_event_lv4,CS_event_boss1
  .dw CS_event_lv6,CS_event_lv7,CS_event_lv8,CS_event_lv9,CS_event_lv10,CS_event_boss2
  .dw CS_event_lv12,CS_event_lv13,CS_event_lv14,CS_event_lv15,CS_event_lv16,CS_event_boss3
  .dw CS_event_lv18,CS_event_lv19,CS_event_lv20,CS_event_lv21,CS_event_boss4,CS_event_finalboss
  .dw CS_event_cow,CS_event_campout
  .dw CS_event_ending, CS_event_credits

CutSceneEvents_extend:
  .dw CS_event_lv1b, CS_event_credits_2


CS_event_lv0:
  .db $00
CS_event_lv1:
  .db $01,OSN_set_coords, $80,$18
  .db OSN_appear

  .db $02, CS_song_sfx, cut_beg_song
  .db OSN_set_targ, $80,$78

  .db $03, loadtext,para_lv1_00                    ;"THIS IS OSSAN."
  .db $04, fadein, fade_pal00, bgpal_0, $04,$10
  .db $07, fadeout, fade_pal00, bgpal_0, $04, $20, $10, $10
  .db loadtext,para_lv1_00_erase

  .db $08, OSN_set_targ, $58,$50

  .db attr_change,PIC_A_attr, loadpic,PIC_A        ;PIC=EARTH
  .db $0A, fadein, fade_pal00, bgpal_1, $0C, $20

  .db loadtext,para_lv1_01, loadtext,para_lv1_02   ;"HE HAS BEEN SENT..."
  .db $0D, fadein, fade_pal00, bgpal_0, $04,$10
  .db $11, fadeout, fade_pal00, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA, loadtext,L1_norm_eraseB

  .db $12, fadeout, fade_pal00, bgpal_2, $08, $24, $10, $20
  .db $13, attr_change,PIC_B_attr, loadpic,PIC_B   ;PIC=MISSILES
  .db loadtext,para_lv1_03, loadtext,para_lv1_04   ;"THEY MAY DO RIDICULOUS..."
  .db $14, fadein, fade_pal02, bgpal_2, $08, $20
  .db fadein, fade_pal00, bgpal_0, $04, $20

  .db OSN_set_targ, $50,$50, OSN_set_targ, $60,$50, OSN_set_targ, $50,$50
  .db OSN_set_targ, $58,$50, OSN_set_targ, $58,$28

  .db $1A, fadeout, fade_pal00, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA, loadtext,L1_norm_eraseB
  .db loadtext,para_lv1_05, loadtext,para_lv1_06   ;"AVOID THE MISSILES..."
  .db fadein, fade_pal00, bgpal_0, $04, $20

  .db OSN_set_targ, $A8,$28

  .db $22, fadeout, fade_pal00, bgpal_0, $04, $20, $10, $10  ;fade text
  .db $23, fadeout, fade_pal02, bgpal_2, $08, $20, $10, $20  ;fade missile pic
  .db loadtext,L1_norm_eraseA, loadtext,L1_norm_eraseB

  .db $24, attr_change,PIC_C_attr, loadpic,PIC_C    ;PIC=KOGYARU & QUES
  .db fadein, fade_pal01, bgpal_2, $04,$10
  .db $25, loadtext,para_lv1_07, loadtext,para_lv1_08  ;"HIS RIVAL KOGYARU..."
  .db fadein, fade_pal00, bgpal_0, $04,$10

  .db $2B, fadeout, fade_pal00, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA, loadtext,L1_norm_eraseB

  .db loadtext,para_lv1_09       ;"OR IS SHE??"
  .db $2C, fadein, fade_pal00, bgpal_0, $04,$10
  .db $2D, fadein, fade_pal01, bgpal_3, $04,$10
  .db $30, fadeout, fade_pal00, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA

  .db extend_page, $00   ;extends the event table to CS_event_lv1b below

CS_event_lv1b:
  .db $31, fadeout, fade_pal02, bgpal_2, $08, $20, $10, $20

  .db bank_swap,$19
  .db loadtext,para_lv1_12, loadtext,para_lv1_13
  .db attr_change,PIC_D_attr, loadpic,PIC_D       ;PIC=FAT AMERICAN KID

  .db $32, fadein, fade_pal00, bgpal_3, $04,$10
  .db $33, fadein, fade_pal00, bgpal_0, $04,$10
  .db $3A, fadeout, fade_pal00, bgpal_0, $04, $20, $10, $10

  .db loadtext,para_lv1_12, loadtext,para_lv1_13
  .db loadtext,L1_norm_eraseA, loadtext,L1_norm_eraseB

  .db loadtext,para_lv1_14           ;"LET US HOPE SO."
  .db $3B, fadein, fade_pal00, bgpal_0, $04,$10
  .db $3F, fadeout, fade_pal00, bgpal_0, $10, $20, $10, $20
  .db loadtext,L1_norm_eraseA

  .db loadtext,para_lv1_15           ;"BEGIN ASSIMILATION!!!"

  .db OSN_set_targ, $80,$78

  .db $41, CS_song_sfx, silence_song
  .db fadein, fade_pal00, bgpal_0, $04,$10

;  .db $50, fadeout, fade_pal00, bgpal_0, $04, $20, $10, $10
  .db $48, OSN_dissappear
  .db fadeout, fade_pal00, bgpal_0, $04, $00, $10, $01
  .db loadtext,para_lv1_00_erase

  .db attr_change,PIC_KILL_attr, loadpic,PIC_KILL
  .db loadtext,LV1_announceTXT
  .db $49, fadein, fade_pal00, bgpal_0, $04,$10
  .db $4D, fin

CS_event_lv2:
  .db $04,fin
CS_event_lv3:
  .db $04,fin
CS_event_lv4:
  .db $04,fin

CS_event_boss1:
  .db attr_change,PIC_E_attr, loadpic,PIC_E        ;PIC=BOSS 1

  .db $02, CS_song_sfx, cut_bos_song

  .db fadein, fade_pal03, bgpal_1, $0C, $20

  .db $03, loadtext,para_BS1_01                         ;"OH NO!"
  .db $04, fadein, fade_pal03, bgpal_0, $04,$10
  .db $08, fadeout, fade_pal03, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA

  .db loadtext,para_BS1_02, loadtext,para_BS1_03   ;"THOSE LAZY AMERICANS..."
  .db $0A, fadein, fade_pal03, bgpal_0, $04,$10
  .db $0E, fadeout, fade_pal03, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA, loadtext,L1_norm_eraseB

  .db $0F, loadtext,para_BS1_04, loadtext,para_BS1_05   ;"ZOMBIE APOCALYPSES..."
  .db $10, fadein, fade_pal03, bgpal_0, $04,$10
  .db $14, fadeout, fade_pal03, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA, loadtext,L1_norm_eraseB

  .db $15, loadtext,para_BS1_06, loadtext,para_BS1_07   ;"DO SOMETHING!!!"
  .db $16, fadein, fade_pal03, bgpal_0, $04,$10
  .db $1A, fadeout, fade_pal03, bgpal_0, $10, $20, $10, $20 ;fades entire pic/text
  .db loadtext,L1_norm_eraseA, loadtext,L1_norm_eraseB

  .db $1C, CS_song_sfx, silence_song
  .db attr_change,PIC_KILL_attr, loadpic,PIC_KILL
  .db loadtext,BossFight_announceTXT, loadtext,Boss1_announceTXT
  .db $1D, fadein, fade_pal03, bgpal_0, $04,$10

  .db $22,fin

CS_event_lv6:
  .db attr_change,PIC_F_attr, loadpic,PIC_F        ;PIC=BEAUTIFUL ASIA
  .db $02, CS_song_sfx, cut_beg_song
  .db fadein, fade_pal04, bgpal_1, $0C, $20

  .db $03, loadtext,para_LV6_01, loadtext,para_LV6_02   ;"THANKS TO YOUR CUNNING.."
  .db $04, fadein, fade_pal04, bgpal_0, $04,$10
  .db $08, fadeout, fade_pal04, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA, loadtext,L1_norm_eraseB

  .db $09, loadtext,para_LV6_03, loadtext,para_LV6_04   ;"WITH USA NOW DEFEATED.."
  .db $0A, fadein, fade_pal04, bgpal_0, $04,$10
  .db $0E, fadeout, fade_pal04, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA, loadtext,L1_norm_eraseB

  .db $0F, loadtext,para_LV6_05                         ;"GOING TO THE ORIENT!"
  .db $10, fadein, fade_pal04, bgpal_0, $04,$10
  .db $14, fadeout, fade_pal04, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA

  .db $15, loadtext,para_LV6_06, loadtext,para_LV6_07   ;"AH, THE ORIENT..."
  .db $16, fadein, fade_pal04, bgpal_0, $04,$10
  .db $1A, fadeout, fade_pal04, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA, loadtext,L1_norm_eraseB

  .db $1B, loadtext,para_LV6_08, loadtext,para_LV6_09   ;"AND HIGHLY INDCENT..."
  .db $1C, fadein, fade_pal04, bgpal_0, $04,$10
  .db $20, fadeout, fade_pal04, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA, loadtext,L1_norm_eraseB

  .db $21, loadtext,para_LV6_10                         ;"TANOSHINDE!!!"
  .db $22, fadein, fade_pal04, bgpal_0, $04,$10
  .db $26, fadeout, fade_pal04, bgpal_0, $10, $20, $10, $20 ;fades entire pic/text
  .db loadtext,L1_norm_eraseA

  .db $27, CS_song_sfx, silence_song
  .db attr_change,PIC_KILL_attr, loadpic,PIC_KILL
  .db loadtext,LV6_announceTXT
  .db $28, fadein, fade_pal04, bgpal_0, $04,$10

  .db $2D,fin

CS_event_lv7:
  .db $04,fin
CS_event_lv8:
  .db $04,fin
CS_event_lv9:
  .db $04,fin
CS_event_lv10:
  .db $04,fin
CS_event_boss2:
  .db attr_change,PIC_A_attr, loadpic,PIC_G        ;PIC=GODZILLA
  .db $02, CS_song_sfx, cut_bos_song
  .db fadein, fade_pal05, bgpal_1, $0C, $20

  .db $03, loadtext,para_BS2_01                    ;"ANOTHER PROBLEM.."
  .db $04, fadein, fade_pal05, bgpal_0, $04,$10
  .db $08, fadeout, fade_pal05, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA

  .db $09, loadtext,para_BS2_02, loadtext,para_BS2_03   ;"A GREAT LIZARD.."
  .db $0A, fadein, fade_pal05, bgpal_0, $04,$10
  .db $0E, fadeout, fade_pal05, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA, loadtext,L1_norm_eraseB

  .db $0F, loadtext,para_BS2_04                    ;"FROM THE SEA..."
  .db $10, fadein, fade_pal05, bgpal_0, $04,$10
  .db $14, fadeout, fade_pal05, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA

  .db $15, loadtext,para_BS2_05                    ;"TEACH THAT GIANT.."
  .db $16, fadein, fade_pal05, bgpal_0, $04,$10
  .db $1A, fadeout, fade_pal05, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA

  .db $1B, loadtext,para_BS2_06, loadtext,para_BS2_07   ;"SHOW HIM YOU THE.."
  .db $1C, fadein, fade_pal05, bgpal_0, $04,$10
  .db $20, fadeout, fade_pal05, bgpal_0, $10, $20, $10, $20 ;fades entire pic/text
  .db loadtext,L1_norm_eraseA, loadtext,L1_norm_eraseB

  .db $21, CS_song_sfx, silence_song
  .db attr_change,PIC_KILL_attr, loadpic,PIC_KILL
  .db loadtext,BossFight_announceTXT, loadtext,Boss2_announceTXT
  .db $22, fadein, fade_pal05, bgpal_0, $04,$10

  .db $27,fin


CS_event_lv12:
  .db attr_change,PIC_B_attr, loadpic,PIC_H        ;PIC=SOVIET RUSSIA
  .db $02, CS_song_sfx, cut_beg_song
  .db fadein, fade_pal06, bgpal_1, $0C, $20

  .db $03, loadtext,para_LV12_01, loadtext, para_LV12_02    ;"BACK IN THE USSR!"
  .db $04, fadein, fade_pal06, bgpal_0, $04,$10
  .db $09, fadeout, fade_pal06, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA, loadtext,L1_norm_eraseB

  .db $0A, loadtext,para_LV12_03, loadtext,para_LV12_04      ;"THE PEOPLE NOT.."
  .db $0B, fadein, fade_pal06, bgpal_0, $04,$10
  .db $10, fadeout, fade_pal06, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA, loadtext,L1_norm_eraseB

  .db $11, loadtext,para_LV12_05, loadtext,para_LV12_06      ;"COMMUNISTS BELIEVE..."
  .db $12, fadein, fade_pal06, bgpal_0, $04,$10
  .db $17, fadeout, fade_pal06, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA, loadtext,L1_norm_eraseB

  .db $18, loadtext,para_LV12_07, loadtext,para_LV12_08      ;"WHEN EVERYONE..."
  .db $19, fadein, fade_pal06, bgpal_0, $04,$10
  .db $1E, fadeout, fade_pal06, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA, loadtext,L1_norm_eraseB

  .db $1F, loadtext,para_LV12_09, loadtext,para_LV12_10      ;"HA!! ONLY GAIGN.."
  .db $20, fadein, fade_pal06, bgpal_0, $04,$10
  .db $25, fadeout, fade_pal06, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA, loadtext,L1_norm_eraseB

  .db $26, loadtext,para_LV12_11, loadtext,para_LV12_12      ;"STICK SOME PROBES.."
  .db $27, fadein, fade_pal06, bgpal_0, $04,$10
  .db $2C, fadeout, fade_pal06, bgpal_0, $10, $20, $10, $20 ;fades entire pic/text
  .db loadtext,L1_norm_eraseA, loadtext,L1_norm_eraseB

  .db $2D, CS_song_sfx, silence_song
  .db attr_change,PIC_KILL_attr, loadpic,PIC_KILL
  .db loadtext,LV12_announceTXT
  .db $2E, fadein, fade_pal06, bgpal_0, $04,$10

  .db $32,fin


CS_event_lv13:
  .db $04,fin
CS_event_lv14:
  .db $04,fin
CS_event_lv15:
  .db $04,fin
CS_event_lv16:
  .db $04,fin
CS_event_boss3:
  .db attr_change,PIC_D_attr, loadpic,PIC_I        ;PIC=MECHA-STALIN FACE
  .db $02, CS_song_sfx, cut_bos_song
  .db MS_eyes_appear

  .db $03, loadtext,para_BS3_01                         ;"SOMETHING HORRIBLY EVIL"
  .db $04, fadein, fade_pal05, bgpal_0, $04,$10
  .db $08, fadeout, fade_pal05, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA

  .db $09, loadtext,para_BS3_02, loadtext,para_BS3_03   ;"THE COMMIES HAVE"
  .db $09, fadein, fade_pal05, bgpal_0, $10, $20        ;face fades in
  .db $0E, fadeout, fade_pal05, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA, loadtext,L1_norm_eraseB

  .db $0F, loadtext,para_BS3_04, loadtext,para_BS3_05   ;"THEY HAVE VIOLATED"
  .db $10, fadein, fade_pal05, bgpal_0, $04,$10
  .db $15, fadeout, fade_pal05, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA, loadtext,L1_norm_eraseB

  .db $16, loadtext,para_BS3_06, loadtext,para_BS3_07   ;"IF HUMILIATION"
  .db $17, fadein, fade_pal05, bgpal_0, $04,$10
  .db $1C, fadeout, fade_pal05, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA, loadtext,L1_norm_eraseB

  .db $1D, loadtext,para_BS3_08, loadtext,para_BS3_09   ;"BUT ITS NOT"
  .db $1E, fadein, fade_pal05, bgpal_0, $04,$10
  .db $23, fadeout, fade_pal05, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA, loadtext,L1_norm_eraseB

  .db $24, loadtext,para_BS3_10                         ;"GET READY TO FACE..."
  .db $25, fadein, fade_pal05, bgpal_0, $04,$10

  .db $29, MS_eyes_disappear
  .db fadeout, fade_pal05, bgpal_0, $10, $00, $10, $01
  .db loadtext,L1_norm_eraseA

  .db CS_song_sfx, silence_song

  .db $2A, attr_change,PIC_KILL_attr, loadpic,PIC_KILL
  .db loadtext,BossFight_announceTXT, loadtext,Boss3_announceTXT
  .db $2B, fadein, fade_pal05, bgpal_0, $04,$10

  .db $2F,fin


CS_event_lv18:
  .db attr_change,PIC_A_attr, loadpic,PIC_J        ;PIC=MOON
  .db $02, CS_song_sfx, cut_beg_song
  .db fadein, fade_pal07, bgpal_1, $0C, $20

  .db $03, loadtext,para_LV18_01, loadtext, para_LV18_02    ;"OSSAN TIRED OF..."
  .db $04, fadein, fade_pal07, bgpal_0, $04,$10
  .db $09, fadeout, fade_pal07, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA, loadtext,L1_norm_eraseB

  .db $0A, loadtext,para_LV18_03, loadtext, para_LV18_04    ;"HE NEEDS TO GET..."
  .db $0B, fadein, fade_pal07, bgpal_0, $04,$10
  .db $10, fadeout, fade_pal07, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA, loadtext,L1_norm_eraseB

  .db $11, loadtext,para_LV18_05, loadtext, para_LV18_06    ;"SO HE DECIDED..."
  .db $12, fadein, fade_pal07, bgpal_0, $04,$10
  .db $17, fadeout, fade_pal07, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA, loadtext,L1_norm_eraseB

  .db $18, loadtext,para_LV18_07, loadtext, para_LV18_08    ;"SO HE DECIDED..."
  .db $19, fadein, fade_pal07, bgpal_0, $04,$10
  .db $1E, fadeout, fade_pal07, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA, loadtext,L1_norm_eraseB

  .db $1F, loadtext,para_LV18_09                            ;"TRULY, YOU'VE DONE..."
  .db $20, fadein, fade_pal07, bgpal_0, $04,$10
  .db $24, fadeout, fade_pal07, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA

  .db $25, fadeout, fade_pal07, bgpal_2, $08, $24, $10, $20
  .db $26, bank_swap,$18 
  .db attr_change,PIC_C_attr, loadpic,PIC_C            ;PIC=KOGYARU & QUES
  .db fadein, fade_pal01, bgpal_2, $08,$10

  .db $27, loadtext,para_LV18_10, loadtext, para_LV18_11    ;"WATCH OUT, THOUGH,"
  .db $28, fadein, fade_pal07, bgpal_0, $04,$10
  .db $2D, fadeout, fade_pal07, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA, loadtext,L1_norm_eraseB

  .db $2E, loadtext,para_LV18_12                            ;"BECOMMING JEALOUS"
  .db $2F, fadein, fade_pal07, bgpal_0, $04,$10
  .db $33, fadeout, fade_pal07, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA

  .db $34, fadeout, fade_pal07, bgpal_1, $04, $24, $10, $20
  .db fadeout, fade_pal02, bgpal_2, $08, $28, $10, $20

  .db $35, CS_song_sfx, silence_song
  .db attr_change,PIC_KILL_attr, loadpic,PIC_KILL
  .db loadtext,LV18_announceTXT
  .db $36, fadein, fade_pal07, bgpal_0, $04,$10

  .db $3D,fin


CS_event_lv19:
  .db $04,fin
CS_event_lv20:
  .db $04,fin
CS_event_lv21:
  .db $04,fin
CS_event_boss4:
  .db attr_change,PIC_K_attr, loadpic,PIC_K        ;PIC=OSSAN CHASING KOGY
  .db $02, CS_song_sfx, cut_bos_song
  .db fadein, fade_pal08, bgpal_1, $0C, $20

  .db $03, loadtext,para_CHASE_01                        ;"OSSAN FINISH WITH"
  .db $04, fadein, fade_pal08, bgpal_0, $04,$10
  .db $08, fadeout, fade_pal08, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA

  .db $09, loadtext,para_CHASE_02, loadtext,para_CHASE_03    ;"RUN DOWN DINGBAT"
  .db $0A, fadein, fade_pal08, bgpal_0, $04,$10
  .db $0F, fadeout, fade_pal08, bgpal_0, $10, $20, $10, $10
  .db loadtext,L1_norm_eraseA, loadtext,L1_norm_eraseB

  .db $10, CS_song_sfx, silence_song
  .db attr_change,PIC_KILL_attr, loadpic,PIC_KILL
  .db loadtext,Boss4_announceTXT
  .db $11, fadein, fade_pal08, bgpal_0, $04,$10

  .db $16,fin


CS_event_finalboss:
  .db attr_change,PIC_D_attr, loadpic,PIC_L        ;PIC=KOGY'S MEGASHIP
  .db OSN_set_coords, $80,$70
  .db $01, OSN_appear

  .db $02, loadtext,para_FINL_BTL_01                        ;"LOOKS LIKE YOU CAUGHT"
  .db $03, fadein, fade_pal07, bgpal_0, $04,$10
  .db $07, fadeout, fade_pal07, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA

  .db $08, CS_song_sfx, cut_bos_song
  .db fadein, fade_pal07, bgpal_2, $08, $20   ;Kogy megaship fading in

  .db $09, loadtext,para_FINL_BTL_02, loadtext,para_FINL_BTL_03    ;"BUT IT ALSO LOOKS..."
  .db $0A, fadein, fade_pal07, bgpal_0, $04,$10
  .db $0F, fadeout, fade_pal07, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA, loadtext,L1_norm_eraseB

  .db $10, OSN_set_targ, $80,$6C, OSN_set_targ, $80,$74
  .db OSN_set_targ, $80,$6C, OSN_set_targ, $80,$74, OSN_set_targ, $80,$70
  .db OSN_set_targ, $7C,$70, OSN_set_targ, $84,$70, OSN_set_targ, $80,$70

  .db $11, loadtext,para_FINL_BTL_04                        ;"...WE KNOW"
  .db $12, fadein, fade_pal07, bgpal_0, $04,$10
  .db $15, fadeout, fade_pal07, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA

  .db $16, loadtext,para_FINL_BTL_05, loadtext,para_FINL_BTL_06    ;"BUT THAT -NOT-..."
  .db $17, fadein, fade_pal07, bgpal_0, $04,$10
  .db $1C, fadeout, fade_pal07, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA, loadtext,L1_norm_eraseB

  .db $1D, loadtext,para_FINL_BTL_07, loadtext,para_FINL_BTL_08    ;"THIS TOY IS..."
  .db $1E, fadein, fade_pal07, bgpal_0, $04,$10
  .db $23, fadeout, fade_pal07, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA, loadtext,L1_norm_eraseB

  .db $24, loadtext,para_FINL_BTL_09                        ;"AND RIGHT NOW"
  .db $25, fadein, fade_pal07, bgpal_0, $04,$10
  .db $29, fadeout, fade_pal07, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA

  .db $2A, loadtext,para_FINL_BTL_10                        ;"THIS IS IT!!!"
  .db $2B, fadein, fade_pal07, bgpal_0, $04,$10
  .db $2F, fadeout, fade_pal07, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA

  .db $30, loadtext,para_FINL_BTL_11, loadtext,para_FINL_BTL_12    ;"IF YOU WANT TO LIVE..."
  .db $31, fadein, fade_pal07, bgpal_0, $04,$10
  .db $36, fadeout, fade_pal07, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA, loadtext,L1_norm_eraseB

  .db $37, loadtext,para_FINL_BTL_13                        ;"GOOD LUCK!"
  .db $38, fadein, fade_pal07, bgpal_0, $04,$10
  .db $3C, fadeout, fade_pal07, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA

  .db CS_song_sfx, silence_song
  .db OSN_dissappear
  .db fadeout, fade_pal07, bgpal_0, $10, $00, $10, $01

  .db $3D, attr_change,PIC_KILL_attr, loadpic,PIC_KILL
  .db loadtext,BossFight_announceTXT, loadtext,FinalBoss_announceTXT
  .db $3E, fadein, fade_pal07, bgpal_0, $04,$10

  .db $43,fin


CS_event_cow:
  .db $08,fin

CS_event_campout:
  .db $08,fin

CS_event_ending:
  .db attr_change,PIC_A_attr, loadpic,PIC_M        ;PIC=PARTY BALL
  .db $02, CS_song_sfx, credits_song
  .db fadein, fade_pal09, bgpal_1, $0C, $20

  .db $03, loadtext,para_END_01                        ;"VICTORY!!!"
  .db $04, fadein, fade_pal09, bgpal_0, $04,$10
  .db $08, fadeout, fade_pal09, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA

  .db $09, loadtext,para_END_02, loadtext,para_END_03      ;"CONGRATULATIONS.."
  .db $0A, fadein, fade_pal09, bgpal_0, $04,$10
  .db $0F, fadeout, fade_pal09, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA, loadtext,L1_norm_eraseB

  .db $10, loadtext,para_END_04                        ;"AND BESTED..."
  .db $11, fadein, fade_pal09, bgpal_0, $04,$10
  .db $15, fadeout, fade_pal09, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA

  .db $16, loadtext,para_END_05, loadtext,para_END_06      ;"NOT BAD FOR..."
  .db $17, fadein, fade_pal09, bgpal_0, $04,$10
  .db $1C, fadeout, fade_pal09, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA, loadtext,L1_norm_eraseB

  .db $1D, loadtext,para_END_07                        ;"ASSIMILATE MASTER!!!"
  .db $1E, fadein, fade_pal09, bgpal_0, $04,$10
  .db $22, fadeout, fade_pal09, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA

  .db $23, loadtext,para_END_08, loadtext,para_END_09      ;"PARENTS BUY SEQUEL.."
  .db $24, fadein, fade_pal09, bgpal_0, $04,$10
  .db $29, fadeout, fade_pal09, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA, loadtext,L1_norm_eraseB

  .db $2A, loadtext,para_END_10, loadtext,para_END_11      ;"SEQUEL BRING LUCK.."
  .db $2B, fadein, fade_pal09, bgpal_0, $04,$10
  .db $30, fadeout, fade_pal09, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA, loadtext,L1_norm_eraseB

  .db $31, fadeout, fade_pal09, bgpal_1, $0C, $20, $10, $20     ;party ball fades out

  .db attr_change,PIC_D_attr, loadpic,PIC_N        ;PIC=US MAP
  .db $32, fadein, fade_pal09, bgpal_1, $0C, $20

  .db $33, loadtext,para_END_12, loadtext,para_END_13      ;"BRING US JAPANESE.."
  .db $34, fadein, fade_pal09, bgpal_0, $04,$10
  .db $39, fadeout, fade_pal09, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA, loadtext,L1_norm_eraseB

  .db $3A, loadtext,para_END_14                        ;"EVERYONE WINNER!!"
  .db $3B, fadein, fade_pal09, bgpal_0, $04,$10
  .db $3F, fadeout, fade_pal09, bgpal_0, $04, $20, $10, $10
  .db loadtext,L1_norm_eraseA

  .db $40, loadtext,para_END_15                        ;"SAYOUNARA!!"
  .db $41, fadein, fade_pal09, bgpal_0, $04,$10
  .db $45, fadeout, fade_pal09, bgpal_0, $10, $20, $10, $10
  .db loadtext,L1_norm_eraseA

  .db $47, CS_song_sfx, silence_song
  .db $49,fin


CS_event_credits:
  .db start_hold, s_hold_ON
  .db OSN_set_coords, $10,$78
  .db $01, OSN_appear

  .db $02, OSN_set_targ, $80,$78

  .db $05, CS_song_sfx,title_song

  .db $06, loadtext,CR_text00                ;"A S S I M I L A T E"
  .db fadein, CRfade_pal00, bgpal_0, $04,$10
  .db OSN_set_targ,$40,$78, OSN_set_targ,$40,$58, OSN_set_targ,$C0,$58
;$0B
  .db fadeout, CRfade_pal00, bgpal_0, $04, $20, $10, $10
  .db loadtext,CR_eraseC
;$0D
  .db loadtext,CR_text01                ;"A NESSYLUM GAMES PRODUCTION"
  .db fadein, CRfade_pal00, bgpal_0, $04,$10
  .db OSN_set_targ,$C0,$98, OSN_set_targ,$80,$98, OSN_set_targ,$80,$78
;$11
  .db fadeout, CRfade_pal00, bgpal_0, $04, $20, $10, $10
  .db loadtext,CR_eraseB, loadtext,CR_eraseC

  .db new_bak, credits_city_mt, $01     ;first city fades up, starts scrolling
  .db autoSCR_ON
  .db fadein, CRfade_pal00, bgpal_1, $0C,$10

  .db $13, loadtext,CR_text02, loadtext,CR_text03   ;"GAME CONCEPT..JOHN WHITE"
  .db fadein, CRfade_pal00, bgpal_0, $04,$10
  .db $18, fadeout, CRfade_pal00, bgpal_0, $04, $20, $10, $10
  .db loadtext,CR_eraseA, loadtext,CR_eraseB, loadtext,CR_eraseC, loadtext,CR_eraseD

  .db $19, loadtext,CR_text04, loadtext,CR_text05   ;"MUSIC COMPOSED..COMPUTERIZATION"
  .db fadein, CRfade_pal00, bgpal_0, $04,$10
  .db $1E, fadeout, CRfade_pal00, bgpal_0, $04, $20, $10, $10
  .db loadtext,CR_eraseB, loadtext,CR_eraseC, loadtext,CR_eraseD

  .db $1F, loadtext,CR_text06, loadtext,CR_text07   ;"SOUND ENGINE...HJELM"
  .db fadein, CRfade_pal00, bgpal_0, $04,$10
  .db $24, fadeout, CRfade_pal00, bgpal_0, $04, $20, $10, $10
  .db loadtext,CR_eraseA, loadtext,CR_eraseB, loadtext,CR_eraseC, loadtext,CR_eraseD

  .db $25, fadeout, CRfade_pal00, bgpal_1, $0C, $24, $10, $10
  .db autoSCR_OFF                                   ;;;;;
  .db new_bak, credits_city_mt, $03                 ;second city fades up, starts scrolling
  .db autoSCR_ON                                    ;;;;;
  .db fadein, CRfade_pal00, bgpal_1, $0C,$10

  .db extend_page, $01   ;extends the event table to CS_event_credits_2 below

CS_event_credits_2:

  .db $29, loadtext,CR_text08, loadtext,CR_text09   ;"ARTWORK,SFX, WRITING"
  .db fadein, CRfade_pal00, bgpal_0, $04,$10
  .db $2E, fadeout, CRfade_pal00, bgpal_0, $04, $20, $10, $10
  .db loadtext,CR_eraseA, loadtext,CR_eraseB, loadtext,CR_eraseC, loadtext,CR_eraseD

  .db $2F, loadtext,CR_text10, loadtext,CR_text11   ;"BETA TESTERS (1)"
  .db fadein, CRfade_pal00, bgpal_0, $04,$10
  .db $34, fadeout, CRfade_pal00, bgpal_0, $04, $20, $10, $10
  .db loadtext,CR_eraseA, loadtext,CR_eraseB, loadtext,CR_eraseC, loadtext,CR_eraseD

  .db $35, loadtext,CR_text12, loadtext,CR_text13   ;"BETA TESTERS (2)"
  .db fadein, CRfade_pal00, bgpal_0, $04,$10
  .db $3A, fadeout, CRfade_pal00, bgpal_0, $04, $20, $10, $10
  .db loadtext,CR_eraseA, loadtext,CR_eraseB, loadtext,CR_eraseC, loadtext,CR_eraseD

  .db $3B, fadeout, CRfade_pal00, bgpal_1, $0C, $24, $10, $10
  .db autoSCR_OFF                                   ;;;;;
  .db new_bak, credits_city_mt, $05                 ;third city fades up, starts scrolling
  .db autoSCR_ON                                    ;;;;;
  .db fadein, CRfade_pal00, bgpal_1, $0C,$10

   ;"SPECIAL THANKS"
  .db $3F, loadtext,CR_text14, loadtext,CR_text15, loadtext,CR_text16, loadtext,CR_text23
  .db fadein, CRfade_pal00, bgpal_0, $04,$10
  .db $45, fadeout, CRfade_pal00, bgpal_0, $04, $20, $10, $10
  .db loadtext,CR_eraseA, loadtext,CR_eraseB, loadtext,CR_eraseC, loadtext,CR_eraseD

  .db $46, loadtext,CR_text17, loadtext,CR_text18   ;"THANKS PLAYER!!!"
  .db fadein, CRfade_pal00, bgpal_0, $04,$10
  .db $4C, fadeout, CRfade_pal00, bgpal_0, $04, $20, $10, $10
  .db loadtext,CR_eraseB, loadtext,CR_eraseC, loadtext,CR_eraseD

  .db $4D, loadtext,CR_text19, loadtext,CR_text20   ;"COPYRIGHT"
  .db fadein, CRfade_pal00, bgpal_0, $04,$10
  .db $52, fadeout, CRfade_pal00, bgpal_0, $04, $20, $10, $10
  .db loadtext,CR_eraseB, loadtext,CR_eraseC, loadtext,CR_eraseD

  .db $53, loadtext,CR_text21, loadtext,CR_text22   ;"PRESS START"
  .db fadein, CRfade_pal00, bgpal_0, $04,$10

  .db $56, start_hold, s_hold_OFF

  .db $7F, set_event_counter, $58    ;funcitons as a loop




;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Cut Scene Events Aliases
;;;;;;;;;;;;;;;;;;;;;;;;;;

fin = $80               ;ends the cutscene and moves on... very artsy.
loadpic = $81
loadtext = $82
fadein = $83
fadeout = $84
attr_change = $85
CS_song_sfx = $86
bank_swap   = $87
extend_page = $88

;special subs for Ossan moving in cutscene 1
OSN_set_coords = $89
OSN_appear = $8A
OSN_dissappear = $8B
OSN_set_targ = $8C

new_bak = $8D
autoSCR_ON = $8E
autoSCR_OFF = $8F

MS_eyes_appear = $90
MS_eyes_disappear = $91

start_hold   = $92
set_event_counter  = $93


CS_Sup_Sub_Ptr = $0700
CS_Sup_flag    = $0702   ;flags Cutscene manager to run support subs
Ossan_x_targ   = $0703
Ossan_y_targ   = $0704

CR_autoscroll_flag  = $0705

starthold   = $0706   ;flags whether to ignore the start button or not


credits_city_mt = $0B    ;metatile constants

;;;;;;;;;;;;;;;;;;;;;;;;
CS_Event_Jumptable:
  .dw CutSceneEnd, CutScene_LoadPic, CS_LoadText
  .dw CutScene_FadeIn, CutScene_FadeOut, CutScene_AttrChange
  .dw CS_Load_Song_Sfx, CutScene_Bankswap, CutScene_Extend

  .dw Ossan_setup_coords, Ossan_appear
  .dw Ossan_disappear, Ossan_move

  .dw Credits_LoadNew_BG,CR_autoscroll_ON,CR_autoscroll_OFF

  .dw MStalin_eyes_appear, MStalin_eyes_disappear

  .dw CS_start_hold, CR_set_event_counter