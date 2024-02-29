  .inesprg 8   ; 16x 16KB PRG code
  .ineschr 16  ; 16x  8KB CHR data
  .inesmap 1    ; mapper 1 = MMC1
  .inesmir %10  ; vertical mirroring (ignored here, set in init_MMC1 sub)


;;;INES BANK 0;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  .bank 0
  .org $8000


  ;;;; SONG DATA - BANK 1

  .include "Music_sfx\Songs_Sfx\song_silence.i"
  .include "Music_sfx\Songs_Sfx\song_title.i"
  .include "Music_sfx\Songs_Sfx\song_awesome.i"
  .include "Music_sfx\Songs_Sfx\song_boss.i"
  .include "Music_sfx\Songs_Sfx\song_endstg_fnfr.i"
  .include "Music_sfx\Songs_Sfx\song_moon.i"
  .include "Music_sfx\Songs_Sfx\song_soviet.i"
  .include "Music_sfx\Songs_Sfx\song_asia.i"
  .include "Music_sfx\Songs_Sfx\song_cows.i"
  .include "Music_sfx\Songs_Sfx\song_final_boss.i"
  .include "Music_sfx\Songs_Sfx\song_cutscene.i"
  .include "Music_sfx\Songs_Sfx\song_final_victory.i"
  .include "Music_sfx\Songs_Sfx\song_cricket.i"
  .include "Music_sfx\Songs_Sfx\song_asia_night.i"
  .include "Music_sfx\Songs_Sfx\song_cs_begin.i"
  .include "Music_sfx\Songs_Sfx\song_cs_boss.i"

  .include "Music_sfx\Songs_Sfx\sfx_endstg_fnfr.i"
  .include "Music_sfx\Songs_Sfx\sfx_EMP.i"
  .include "Music_sfx\Songs_Sfx\sfx_beam.i"
  .include "Music_sfx\Songs_Sfx\sfx_Ossan_die.i"
  .include "Music_sfx\Songs_Sfx\sfx_assimilate.i"
  .include "Music_sfx\Songs_Sfx\sfx_explosion.i"
  .include "Music_sfx\Songs_Sfx\sfx_1up.i"
  .include "Music_sfx\Songs_Sfx\sfx_klaser.i"


;;;;;;;;;;;;;
;-----

  .bank 1
  .org $A000

  ;;;; SONG DATA - BANK 2

  .include "Music_sfx\sound_opcodes.asm"
  .include "Music_sfx\note_table.i" ;period lookup table for notes
  .include "Music_sfx\note_length_table.i"
  .include "Music_sfx\vol_envelopes.i"


;;;INES BANK 1;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;----- 

  .bank 2
  .org $8000

  ;;;; WESTERN AREA - BANK 1

  .include "Areas\Area1_Western\collision_objects1.i"
  .include "Areas\Area1_Western\background1.i"
  .include "Areas\Area1_Western\metatiles1.i"
  .include "Areas\Area1_Western\level_starts1.asm"



;;;;;;;;;;;;;
;----- 
  
  .bank 3
  .org $A000

  .include "Areas\Area1_Western\boss1.asm"

  ;;;; Title Screen
  .include "Areas\metatiles_title.i"
  .include "title_screen.asm"

  ;;;; Bonus Stages
  .include "Areas\Bonus Stages\background5.i"
  .include "Areas\Bonus Stages\collision_objects5.i"
  .include "Areas\Bonus Stages\level_starts5.asm"
  .include "Areas\Bonus Stages\metatiles6.i"
  .include "Areas\Bonus Stages\bonus_subs.asm"


;;;INES BANK 2;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
;----- 

  .bank 4
  .org $8000

  ;;;; ASIA AREA - BANK 1

  .include "Areas\Area2_Asia\level_starts2.asm"
  .include "Areas\Area2_Asia\collision_objects2.i"
  .include "Areas\Area2_Asia\background2.i"
  .include "Areas\Area2_Asia\metatiles2.i"
  .include "Areas\Area2_Asia\metatiles3.i"


;;;;;;;;;;;;;
;----- 

  .bank 5
  .org $A000

  ;;;; ASIA AREA - BANK 2
  .include "Areas\Area2_Asia\boss2.asm"
  .include "Areas\Area2_Asia\laser.asm"


;;;INES BANK 3;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;----- 

  .bank 6
  .org $8000

  ;;;; SOVIET AREA - BANK 1

  .include "Areas\Area3_Soviet\background3.i"


;;;;;;;;;;;;;
;----- 

  .bank 7
  .org $A000

  ;;;; SOVIET AREA - BANK 2

  .include "Areas\Area3_Soviet\level_starts3.asm"
  .include "Areas\Area3_Soviet\collision_objects3.i"
  .include "Areas\Area3_Soviet\metatiles4.i"
  .include "Areas\Area3_Soviet\boss3.asm"
  .include "Areas\Area3_Soviet\hamcycle.asm"


;;;INES BANK 4;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;----- 

  .bank 8
  .org $8000

  ;;;; MOON AREA - BANK 1

  .include "Areas\Area4_Moon\background4.i"



;;;;;;;;;;;;;
;----- 

  .bank 9
  .org $A000

  ;;;; MOON AREA - BANK 2

  .include "Areas\Area4_Moon\level_starts4.asm"
  .include "Areas\Area4_Moon\collision_objects4.i"
  .include "Areas\Area4_Moon\metatiles5.i"
  .include "Areas\Area4_Moon\boss4.asm"
  .include "Areas\Area4_Moon\boss4_specobj.asm"
  .include "Areas\Area4_Moon\kogyaru_chase.asm"


;;;INES BANK 5;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;----- 

  .bank 10
  .org $8000

  ;;;; OBJECTS

  .include "Areas\objects\objects.asm"
  .include "Areas\objects\object_inits.asm"
  .include "Areas\objects\object_tables.i"
  .include "Areas\objects\kogyaru_obj.i"
  .include "Areas\objects\weapon.asm"

;;;;;;;;;;;;;
;----- 

  .bank 11
  .org $A000

  ;;;; OBJECTS

  .include "Areas\objects\missile.asm"
  .include "Areas\objects\fireball.asm"
  .include "Areas\objects\dragon.asm"
  .include "Areas\Bonus Stages\ateam_van.asm"
  .include "Areas\objects\mig.asm"
  .include "Areas\objects\icbm.asm"
  .include "Areas\objects\kogyaru.asm"
  .include "Areas\objects\victim_projectile.asm"
  .include "Areas\objects\sputnik.asm"
  .include "Areas\objects\meteor.asm"
  .include "Areas\objects\ring.asm"
  .include "Areas\objects\kogyaru_chs_ver.asm"


;;;INES BANK 6;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;----- 

  .bank 12
  .org $8000

  ;;;;  CUT SCENES

  .include "Cutscenes\cut_scene.asm"
  .include "Cutscenes\CS_starts.asm"
  .include "Cutscenes\CS_init.asm"
  .include "Cutscenes\CS_init_PPU.asm"
  .include "Cutscenes\CS_special_subs.asm"

  .include "Cutscenes\CS_background.i"

  ;;;; CREDITS

  .include "Cutscenes\credits.asm"



;;;;;;;;;;;;;
;----- 

  .bank 13
  .org $A000

  .include "Cutscenes\credits_metatiles.i"
  .include "Cutscenes\CS_graphics.i"
  .include "Cutscenes\CS_text.i"



;;;INES BANK 7;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;----- 

  .bank 14
  .org $C000

  .include "init_PPU.asm"

  .include "numbers.i"

  .include "Offscreen_buffer_tables.i"
  .include "dbuffer_subs.asm"
  .include "scroll_collision_subs.asm"
  .include "sprites_hitboxes.asm"

  .include "arrow_subs.asm"

  .include "scoring_timer.asm"



;;;;;;;;;;;;;;  
;----- 

  .bank 15
  .org $E000


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
IRQ:
  RTI


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;-----------------------------------------------------------------------
;               
;  NMI
;  HANDLER
;  ;if carry set, sub has ran. if clear, sub has not ran.
;----------------------------------------------------------------------
NMI:              ;$E001
  PHA             ;save registers in case of interrupt
  TXA
  PHA
  TYA
  PHA
  LDA prg_bank
  PHA

  LDA $2002         ;reset $2000.7, clear the vblank flag

  LDA gamestate     ;my increcibly sloppy fix to deal with the bug where the
  CMP #STATEMENU    ;menu jumps in the boss fights.  I don't know why it happens,
  BEQ NMI_main      ;i just know somthing about the banks switching is causing it.
                    ;this little fix takes care of it.

  JSR NMI_pointer_backup   ;backup ALL the pointers, just in case

  LDA boss_active   ;need a way to switch banks
  BEQ NMI_main
  JMP boss_NMI_write

NMI_recover:        ;restores the bank in case we had to jump to the current boss
  LDA bank_bak_boss ;bank during NMI
  STA prg_bank
  JSR swap_PRG_bank

NMI_main:
  LDA needdraw        ;give offscreen columns priority, should only activate
  AND #%00000001      ;if the engine is in playing mode
  BEQ .onscreen_graphics
  JMP .DrawColumns

.onscreen_graphics:
  LDA needdraw
  AND #%10000000
  BEQ .palettes
  JSR NMI_onscreen_load
  JMP .SpriteDMA

.palettes:
  JSR pal_change      ;palette changes take next priority
  BCC .state_dead      ;will exit with carry clear if not change happened
  JMP .SpriteDMA

.state_dead:
  LDA gamestate
  CMP #STATEDEAD
  BNE .state_end
  JSR death_draw
  JMP .SpriteDMA

.state_end:
  LDA gamestate
  CMP #STATE_LVL_CLR
  BNE .resetting
  JSR level_end_draw
  LDA boss_active
  BEQ .end_done
  JSR LoadAssmPerc   ;jump here so it updates the assm % one last time as ship flashes
  JSR LoadScoreUpdate   ;same for this sub, update score graphics\
.end_done:
  JMP .SpriteDMA

.resetting:          ;DO NOT GET RID OF THESE!!!
  LDA gamestate
  CMP #STATE_RESET
  BNE .game_over
  JMP .SpriteDMA

.game_over:
  LDA gamestate
  CMP #STATE_GAMEOVER
  BNE .level_change
  JMP .SpriteDMA

.level_change:
  LDA gamestate
  CMP #STATE_LVL_CHG
  BNE .title
  JMP .SpriteDMA

.title:
  LDA gamestate
  CMP #STATETITLE
  BNE .Start
  JSR Title_onscreen_drawing
  JMP .SpriteDMA   ;YES, ALL THESE!!!  NEVER!!!!

.Start
  LDA needdraw          ;it's too intensive to draw offscreen columns and status bar stuff
  AND #%00000001        ;give offscreen columns priority
  BNE .DrawColumns

.Assm_Speed_Drawing:    ;very short, so ran every frame if menu isn't up
  JSR LoadAssmSpeed

.Menu:                  ;these are hoggy. take up too much time to go
  JSR LoadMenu          ;along with sprite DMA
  BCS .skipDMA

.RestoreStatusBar:      ;hoggy.
  JSR UndoMenu
  BCS .skipDMA

.Assm_Perc_Drawing:
  JSR LoadAssmPerc
  BCS .SpriteDMA

.Timer_and_Lives_Drawing:
  JSR Load_Timer_Lives
  BCS .SpriteDMA

.Score_Drawing:
  JSR LoadScoreUpdate
  BCS .SpriteDMA

.ProgressBarTest:
  JSR NMI_ProgBar     ;this code moved to dbuffersubs to make NMI handler more clean and clear
  JMP .SpriteDMA

.DrawColumns:              ;;;;9 SCANLINES
  JSR load_offscreen_tiles
  JSR load_offscreen_attributes
  LDA needdraw        ;set bit 0 back to 0 so other parts of program can do their thing
  AND #%11111110
  STA needdraw
  JMP .SpriteDMA

.SpriteDMA:                ;;;;1.5 SCANLINES
  LDA #$00
  STA $2003       ; set the low byte (00) of the RAM address
  LDA #$02
  STA $4014       ; set the high byte (02) of the RAM address, start the transfer

  LDA gamestate    ;need to do the DMA if in title mode, otherwise sprites won't
  CMP #STATETITLE  ;clear out upon resetting from a level, but skip the status bar stuff
  BEQ .skip_sprite0

.skipDMA:
  LDA top_2000
  STA $2000
  LDA soft_2001
  STA $2001

  LDA #$00
  STA $2005
  STA $2005

  LDA skip_sprite0
  CMP #$01                      ;;;When rendering a column,
  BEQ .skip_sprite0             ;;;it reached this point at scanline 255
                                ;;;$E0EB
.Sprite0_testone:
  BIT $2002
  BVS .Sprite0_testone

  LDA gamestate
  CMP #STATEPLAYING
  BNE .Sprite0_testtwo
  LDA boss_active
  BNE .Sprite0_testtwo          ;;;$E0FA

  JSR RandomGen
  JSR Arrow_Handler
                                ;;;$E102
.Sprite0_testtwo:               ;;;Reaches here at scanline -1
  BIT $2002
  BVC .Sprite0_testtwo
                                ;;;$E107
.skip_sprite0:                  ;;;Reaches here at scanline 55

  LDA soft_2000
  STA $2000
  LDA soft_2001
  STA $2001

  LDA xScroll
  STA $2005
  LDA #$00
  STA $2005

.sound:
  LDA gameloop_ran
  BEQ .out_of_frame
  JSR sound_play_frame    ;controller sub for sound engine
;  JMP .nmi_exit

.out_of_frame:
;  LDA #$F0
.nmi_exit:        ;prepare to exit the NMI handler
  LDA #$00
  STA sleeping
  INC prg_interrupt

  INC counter

  JSR NMI_pointer_restore ;restore ALL the pointers

  PLA             ; restore registers/prg bank
  STA prg_bank
  PLA
  TAY
  PLA
  TAX
  PLA
                  ; $E10F
  RTI             ; return from interrupt


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;-----------------------------------------------------------------------
;               
;  RESET!!!!!
;  RESET !!!!!
;
;----------------------------------------------------------------------
RESET:
  SEI          ; disable IRQs
  CLD          ; disable decimal mode
  LDX #$40
  STX $4017    ; disable APU frame IRQ
  LDX #$FF
  TXS          ; Set up stack
  INX          ; now X = 0
  STX $2000    ; disable NMI
  STX $2001    ; disable rendering
  STX $4010    ; disable DMC IRQs

  JSR vblankwait ;1st wait for vblank.

  LDX #$00
clrmem:
  LDA #$00
  STA $0000, x
  STA $0100, x
  STA $0300, x
  STA $0400, x
  STA $0500, x
  STA $0600, x
  STA $0700, x
  LDA #$FE
  STA $0200, x
  INX
  BNE clrmem

  JSR init_MMC1
  JSR sound_init

  LDA #$01
  STA prg_bank
  JSR swap_PRG_bank

  LDA #46
  STA bchr_bank
  JSR swap_CHR_bank1000

  JSR vblankwait ;2nd wait for vblank. PPU is ready Freddie!

  LDA #$00
  STA level_index
  STA level
  STA current_song
  JSR sound_load

  LDA #$01
  STA initializeSet
  STA lives            ;TEMP - I'm using lives as the graphical level index while I have the beta title/stage select screen

;;;;;;;;;;;;;;;
;;Bootup Init
;;;;;;;;;;;;
  JSR title_draw

  LDA #LOW(TitleText)  ;Draws the title text
  STA ptr1
  LDA #HIGH(TitleText)
  STA ptr1+1
  JSR Load_Text

  LDA #$00
  STA xScroll

  LDA needdraw
  ORA #%00001100   ;store appropriate activator bits in needdraw
  STA needdraw     ;so Load_Timer_Lives and Load_Assm_Perc will update lives and a% right on startup

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Set Normal $2000 & $2001   ;the following is done to prevent on-screen jitter when title screens turn on
;;;;;;;;;;;;;;;;;;;;;;;;;;;
  LDA #%10010000   ; enable NMI, sprites from Pattern Table 0, background from Pattern Table 1
  STA soft_2000
  STA $2000        ; actually write to $2000 reg so we turn NMI back on
  LDA #%00000110   ; disable sprites, disable background, no clipping on left side
  STA soft_2001

  JSR vblankwait   ; when NMI hits at end of this vblainkwait, it will clean up the scroll position without
                   ; turning on the screen, so player won't see scroll correcting
  LDA #%00011110   ; enable sprites, enable background, no clipping on left side
  STA soft_2001    ; store to the soft variable, so that the screen actually turns on at the next NMI, after scroll has been cleaned up

  JMP GameEngine

;;;;;;;;;;;;;;;;;;;;;;;;;
;;First-Subs
;;;;;;;;;;;;;;;;;;;;;;;;;
First_Subs:
  JSR init_ppu

  JSR set_ship_boundingbox
  JSR set_ship_sprites_params
  JSR Fill_Tool_Graphics
  JSR Load_Tool_Graphics

  JSR victim_dissappear  ;run this sub so you don't get a bunch of garbled crap in upright corner at startup.

  LDA needdraw
  ORA #%00001100   ;store appropriate activator bits in needdraw
  STA needdraw     ;so Load_Timer_Lives and Load_Assm_Perc will update lives and a% right on startup

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Initialize Universal Variables
;;;;;;;;;;;;;;;;;;;;;;;;;;;
  LDA #$00
  STA nametableNum
  STA xScroll
  STA r_marker
  STA progress_time
  STA victim_stat
  STA fnfr_advance

  LDA #$01
  STA leftright
  STA arrow_status
  STA gamestate

  LDA #$02
  STA ship_speed

  LDA #$00
  STA arrow_timer

;  LDA #$05     ;originally set these random gen variables here, but then
;  STA rand_h   ;the arrow would always be on the exact same building when
                ;player started the stage for the first time.
;  LDA #$1E     ;they've now been moved to the title_screen.asm file now.
;  STA r_reset

  LDA #$02
  STA camera_Left_x
  LDA #$FD
  STA camera_Right_x

  LDA curr_Background
  STA camera_Left_ScreenNum
  STA camera_Right_ScreenNum

  LDA #$FF
  STA last_col
  STA arrow_pos
  STA arrow_pos+1
  STA progress_bar
  STA progress_bar+1

  JSR AddScore

  JSR bank_backup_OBJ
  JSR init_objects
  JSR bank_restore_OBJ

  LDA boss_active
  BEQ .PPU_regs_setup
  JSR boss_init

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Set Normal $2000 & $2001
;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PPU_regs_setup:
  JSR vblankwait

  LDA #%10010000
  STA soft_2000
  LDA #%00011110
  STA soft_2001

  JSR vblankwait
  JSR vblankwait

  JSR Init_Palettes
  JSR vblankwait

  LDA #$00
  STA sleeping
  STA skip_sprite0

;;;;;;;;;;;;;;;;;;;;;;
;;End of Level Init
;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;
GameEngine:            ;this label replaced typical "Forever" label
  LDA #$01
  STA sleeping

GameEngine_loop
  LDA sleeping
  BNE GameEngine_loop

  LDA #$00
  STA gameloop_ran

  LDA gamestate
  CMP #STATETITLE
  BNE GameEngine_next0
  JSR Title_Screen

GameEngine_next0:
  LDA gamestate
  CMP #STATEPLAYING
  BNE GameEngine_next1
  JSR EnginePlaying
  JMP GameEngine_end

GameEngine_next1:
  LDA gamestate
  CMP #STATEMENU
  BNE GameEngine_next2
  JSR EngineMenu

GameEngine_next2:
  LDA gamestate
  CMP #STATEDEAD
  BNE GameEngine_next3
  JSR Death

GameEngine_next3:
  LDA gamestate
  CMP #STATE_LVL_CLR
  BNE GameEngine_next4
  JSR Level_Victory
  JMP GameEngine_end

GameEngine_next4:
  LDA gamestate
  CMP #STATE_RESET
  BNE GameEngine_next5
  JSR Reset_Pre_Manager

GameEngine_next5:
  LDA gamestate
  CMP #STATE_GAMEOVER
  BNE GameEngine_next6
  JSR pre_Game_Over

GameEngine_next6:
  LDA gamestate
  CMP #STATE_LVL_CHG
  BNE GameEngine_next7
  JMP Level_Handler

GameEngine_next7:
  LDA gamestate
  CMP #STATE_CUTSCENE
  BEQ Run_Cutscene
  CMP #STATE_CREDITS
  BEQ Run_Cutscene
  JMP GameEngine_end
Run_Cutscene:          ;both the CUTSCENE and CREDITS states utilize
  JMP CutScene_Manager ;the cutscene manager to run
Cutscene_return:
  JSR bank_backup_OBJ
  JSR SpriteMapTransfer
  JSR bank_restore_OBJ

GameEngine_end:
  LDA #$01
  STA gameloop_ran

;  LDA soft_2001        ;monochrome bit test
;  ORA #$01
;  STA $2001

  JMP GameEngine       ;return to GameEngine's initial loop, awaiting NMI


;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;
Reset_Pre_Manager:
  JSR Counter_Manager
  LDA event_counter
  CMP #$01
  BCC .init
  CMP #$03
  BEQ .start_reset
  JMP .rts

.init:
  LDA #$00
  STA current_song
  JSR sound_load

  LDA #$01
  STA skip_sprite0
  STA event_counter

  LDA #%00000110   ; disable sprites, disable background, no clipping on left side
  STA soft_2001
  JMP .rts

.start_reset
  JMP RESET

.rts
  RTS

;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;
EnginePlaying:
  LDA boss_active
  BEQ .normal
  JSR boss_En_playing
  JMP .rts
.normal:
  JSR normal_En_playing

.rts:
  RTS

normal_En_playing:
  LDA needdraw
  AND #%00100000    ;if bit 5 is set, menu's bottom hasn't finished restoring
  BNE .rts

  LDA xScroll          ;saving previous scrolling/collision variables
  STA last_frame
  LDA rightScreenEdge
  STA lastEdge
  LDA camera_cent
  STA last_camera_cent

  JSR Get_CameraCent_Offset
  JSR SwitchPlayfield
  JSR Fill_bldg_RAM

  JSR ReadController
  JSR ButtonHandler

  JSR set_ship_sprites_params    ; set_ship_boundingbox & set_ship_obj_boundingbox are now handled in this sub
  JSR set_victim_sprites_params

  JSR setBufferLines
  JSR TestDirection
  JSR set_curr_next_prev_bg

  JSR Counter_Manager

  JSR item_effect_time

.background_handling:

  JSR column_test
  LDA needdraw
  AND #%00000001
  BEQ .play_handling

  JSR set_background_addresses
  JSR fill_offscreen_column         ;;;;;;19 SCANLINES
  JSR fill_offscreen_attributes

.play_handling:
  LDA gamestate
  CMP #STATE_LVL_CLR
  BEQ .rts

  JSR bank_backup_OBJ    ;backup current bank
  LDA counter            ;split up, runs object code on even frames
  AND #$01               ;and handles sprites on odd frames
  BNE .obj_sprite
  JSR Object_Handler     ;object code (inits, movement calcs, etc.)
  JMP .rst
.obj_sprite:
  JSR SpriteMapTransfer  ;sprite handling (shuffling, xfer from oam to DMA block, etc.)
.rst:
  JSR bank_restore_OBJ   ;restore the bank from object bank

.rts:
  RTS


boss_En_playing:
  LDA needdraw
  AND #%00100000    ;if bit 5 is set, menu's bottom hasn't finished restoring
  BNE .rts

  LDA xScroll          ;saving previous scrolling/collision variables
  STA last_frame
  LDA rightScreenEdge
  STA lastEdge
  LDA camera_cent
  STA last_camera_cent

  JSR RandomGen

  JSR Counter_Manager
  JSR set_victim_sprites_params

  JSR Fill_bldg_RAM

  JSR ReadController
  JSR Boss_ButtonHandler

  JSR set_ship_sprites_params    ; set_ship_boundingbox & set_ship_obj_boundingbox are now handled in this sub

  JSR Arrow_Handler

  JSR item_effect_time

.play_handling:
  LDA gamestate
  CMP #STATE_LVL_CLR
  BEQ .rts

  JSR bank_backup_OBJ    ;backup current bank
  LDA counter            ;split up, runs object code on even frames
  AND #$01               ;and handles sprites on odd frames
  BNE .obj_sprite
  JSR Object_Handler     ;object code (inits, movement calcs, etc.)
  JSR bank_restore_OBJ   ;restore the bank from object bank
  JMP .rts
.obj_sprite:
  JSR SpriteMapTransfer  ;sprite handling (shuffling, xfer from oam to DMA block, etc.)
  JSR bank_restore_OBJ
  JSR boss_handler       ;to keep the special objects in sync with reg objects, this needs to run ever other frame, too.
  JMP .rts               ;i have it with the sprite map xfer because that always takes fewer cycles.

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;;
ReadController:
  LDA buttons
  STA buttons_old

  LDA #$01
  STA $4016
  LDA #$00
  STA $4016
  LDX #$08
ReadControllerLoop:
  LDA $4016
  LSR A            ; bit0 -> Carry
  ROL buttons      ; bit0 <- Carry
  DEX
  BNE ReadControllerLoop

  LDA buttons_old
  EOR #$FF         ;flip the bits: 1=pressed last frame, 0=not pressed
  AND buttons      ;AND with this frame's buttons
  STA buttons_new  ;store result, only buttons pressed last frame and not pressed this frame will return 1

  RTS


;;;;;;;;;;;;;;;;;;;;;;;;;;
ButtonHandler:

.Start_test:
  LDA buttons_new
  AND #%00010000
  BEQ .A_test
.Start:
  LDA buttons
  AND #%00010000
  BEQ .A_test
  JSR Start
  JMP .rts
.A_test:
  LDA buttons_new
  AND #%10000000
  BEQ .B_test

.A_button:
  LDA buttons
  AND #%10000000
  BEQ .B_test
  JSR A_Button
  JMP .rts

.B_test:
  LDA buttons_old
  AND #%01000000     ;if B button pressed last frame...
  BEQ .B_Button
  LDA buttons
  AND #%01000000     ;...but not pressed this frame...
  BNE .B_Button
  JSR kill_beam      ;kill the beam

.B_Button:
  JSR DownCollisionTest  ;must not use beam/reposition ship, if on top of building, or you will get the odd "Ship sucked in/beam through floor/music engine freezing" sub.
  LDA stop_movement  ;if colliding agains a building top
  CMP #$01           ;don't allow use of beam
  BEQ .Up

  LDA victim_stat    ;if victim is onboard, don't allow beam
  CMP #$03
  BEQ .Up
  CMP #$04
  BEQ .Up
  CMP #$07           ;to give a bit of a buffer time after victim planted,
  BEQ .Up            ;don't allow beam

.next:
  LDA buttons
  AND #%01000000
  BEQ .Up
  JSR B_Button  
  JMP .rts
.Up:
  LDA buttons     ; player 1 - Up
  AND #%00001000  ; only look at bit 3
  BEQ .Down   ; branch to .Down if button is NOT pressed (0)
  JSR Up
  JMP .rts    ;the JMP .rts opcodes are to restrict diagonal movement
.Down:
  LDA buttons       ; player 1 - Down
  AND #%00000100  ; only look at bit 2
  BEQ .Left   ; branch to .Left if button is NOT pressed (0)

  JSR Down
  JMP .rts
.Left:
  LDA buttons       ; player 1 - Left
  AND #%00000010  ; only look at bit 1
  BEQ .Right   ; branch to .Right if button is NOT pressed (0)
  JSR Left
  JSR random_reset_test
  JMP .rts
.Right:
  LDA buttons       ; player 1 - Right
  AND #%00000001  ; only look at bit 0
;  BEQ .Select_test
  BEQ .rts
  JSR Right
  JSR random_reset_test
;  JMP .rts

;.Select_test:      ;for now I've only disabled this.  I may choose to use select
;  LDA buttons_new  ;during play later as a kind of quick-select
;  AND #%00100000
;  BEQ .rts
;.Select:
;  LDA buttons
;  AND #%00100000
;  BEQ .rts
;  JSR Select

.rts:
  RTS


;;;;;;;;;;;;;;
Start:
  LDA needdraw        ;if a column is being drawn when this sub changes gamestate
  AND #%00000001      ;the game freezes.  this is here to prevent that.
  BNE Start

  LDA #STATEMENU
  STA gamestate
  JSR Hide_Sprites

  LDA #$00
  STA menu_cursor

  LDA needdraw
  ORA #%00010000      ;set bit 4 so NMI draws, and EngineMenu sub stalls until drawn
  STA needdraw

  JMP GameEngine      ;don't RTS or PC will keep going and won't erase sprites


;;;;;;;;;;;;;;
Select:
;  LDA tool
;  CMP #$03
;  BEQ .reset
;  INC tool
;  JMP .rts
;.reset:
;  LDA #$00
;  STA tool

.rts:
  RTS


;;;;;;;;;;;;;;
A_Button:
  LDA progress_bar+1
  CMP #$FF
  BEQ .rts

  LDA ship_x
  STA victim_x
  LDA ship_y
  STA victim_y
  LDA #$04
  STA victim_stat
  LDA #$FD
  STA progress_bar+1
  LDA #$FF
  STA progress_bar

  JSR victim_spr_pal

  JSR restore_ship_speed

.rts:
  RTS


;;;;;;;;;;;;;;
B_Button:

  LDA buttons_old
  AND #%01000000
  BNE .no_reset  ;if B was pressed last frame, don't reset beam varialbes

  JSR reposition_ship

  LDX #$00
  STX anim_counter1
  STX anim_counter2
  INX
  STX beam_length

  LDA #beam_sfx
  STA current_song
  JSR sound_load

.no_reset:
  JSR set_beam_max
                  
  INC anim_counter1
  INC anim_counter2
  LDA anim_counter1
  CMP #$05
  BCC .next0
  LDX #$00
  STX anim_counter1

.next0:
  LDA anim_counter2
  CMP #$10
  BCC .next1
  LDX #$00
  STX anim_counter2
  LDA beam_length
  CMP beam_max      ;THIS HARDCODED NUMBER will be changed dynamically to reflect top of building where arrow is pointing
  BCS .next1
  INC beam_length

.next1:
  JSR beam_em_up
  JSR beam_arrow_collisiontest

  RTS


;;;;;;;;;;;;;;
Up:
  
  LDA ship_y
  CMP #$40     ;dec 64, 8 pixels below bottom of status bar
  BCC ReadUpDone

  JSR DownCollisionTest  ;this should clear stop_direction for when ship moves up.

  SEC
  LDA ship_y
  SBC ship_speed
  STA ship_y

ReadUpDone:
  RTS


;;;;;;;;;;;;;;
Down:

  LDA ship_y
  CMP bottom_border
  BCS ReadDownDone

  JSR DownCollisionTest
  LDA stop_movement
  CMP #$01
  BEQ ReadDownDone

.next:
  CLC
  LDA ship_y
  ADC ship_speed
  STA ship_y

ReadDownDone:
  RTS


;;;;;;;;;;;;;;
Left:

  JSR LeftCollisionTest   ;this now has an extra check for the object ship
  LDA stop_movement       ;coordinates, to make sure they don't spill over
  CMP #$02                ;out of level's playfield
  BNE .left_next
  JMP ReadLeftDone

.left_next:
  LDA ship_map_x    ;you must alter the map coordinates whenever the
  SEC               ;left button reads, not just when the screen scrolls
  SBC ship_speed
  STA ship_map_x
  LDA ship_screen_x
  SBC #$00
  STA ship_screen_x

  LDA boss_active
  BNE .moveLeft

;move freely l and r if on 1st half of first screen don't scroll
;otherwise stay in middle and scroll

.ship_pos_test:
  LDA curr_playfield
  CMP frst_Background
  BNE .middleTest
  LDA xScroll
  CMP #$01
  BCC .moveLeft

.middleTest:
  LDA ship_x
  CMP #$80           ;dec 128, middle of the screen
  BEQ LeftScroll

.moveLeft:
  LDA ship_x
  CMP #$14           ;dec 20, to keep ship from leaving left edge
  BCS .moveLeft_next
  LDA #$12           ;do this so ship_map_x and ship x keep consistent coords
  STA ship_x
  STA ship_map_x
  JMP ReadLeftDone
.moveLeft_next:
  SEC
  LDA ship_x
  SBC ship_speed     ;needs changed if ship/scroll changes speed
  STA ship_x

  JMP ReadLeftDone

LeftScroll:
;this section sets a boundary at left edge of first background.
  LDA curr_Background
  CMP frst_Background
  BNE .next0         ;if not currently on first background for level, then allow left move
  LDA xScroll
  CMP #$01
  BCS .next0         ;if currently on bg 1 and xScroll is 0, don't allow left move
  JMP ReadLeftDone

.next0
  SEC
  LDA xScroll        ;needs changed if ship/scroll changes speed
  SBC ship_speed
  STA xScroll

  JSR CameraSubtr

  LDA last_frame
  CMP #$00
  BEQ .next1
  JMP ReadLeftDone
.next1
  LDA ship_speed
  TAX
                            ;if last xScroll was 00 and has now moved to FF
  LDA xScroll               ;we need to switch name tables going left
  CMP screen_changes, x     ;needs changed if ship/scroll changes speed
  BNE ReadLeftDone
  DEC curr_Background
  JMP SwitchScreen

ReadLeftDone:
  RTS

CameraSubtr:
  SEC
  LDA camera_Left_x
  SBC ship_speed
  STA camera_Left_x
  LDA camera_Left_ScreenNum
  SBC #$00
  STA camera_Left_ScreenNum

  SEC
  LDA camera_Right_x
  SBC ship_speed
  STA camera_Right_x
  LDA camera_Right_ScreenNum
  SBC #$00
  STA camera_Right_ScreenNum

  RTS


;;;;;;;;;;;;;;
Right:
  JSR RightCollisionTest   ;this now has an extra check for the object ship
  LDA stop_movement        ;coordinates, to make sure they don't spill over
  CMP #$03                 ;out of level's playfield
  BNE .right_next
  JMP ReadRightDone

.right_next:
  LDA ship_map_x    ;you must alter the map coordinates whenever the
  CLC               ;right button reads, not just when the screen scrolls
  ADC ship_speed
  STA ship_map_x
  LDA ship_screen_x
  ADC #$00
  STA ship_screen_x

  LDA boss_active
  BNE .moveRight

;move freely l and r if on 2nd half of last screen don's scroll
;otherwise stay in middle and scroll

.ship_pos_test:
  LDA curr_Background
  CMP finl_Background
  BCC .middleTest
  LDA ship_x
  CMP #$7F
  BCS .moveRight

.middleTest
  LDA ship_x
  CMP #$80           ;dec 128, middle of the screen
  BEQ RightScroll

.moveRight:
  LDA ship_x
  CMP #$ED           ;dec 240, to keep ship from leaving right edge
  BCC .moveRight_next
  LDA #$EE           ;do this so ship_map_x and ship x keep consistent coords
  STA ship_x
  STA ship_map_x
  JMP ReadRightDone
.moveRight_next:
  CLC
  LDA ship_x         ;needs changed if ship/scroll changes speed
  ADC ship_speed
  STA ship_x
  JMP ReadRightDone

RightScroll:
;this section sets a boundary at right edge of last background
  LDA curr_Background
  CMP finl_Background
  BNE .next0         ;if not currently on last background for level, then allow right move
  LDA xScroll
  CMP #$FE
  BCC .next0         ;if currently on bg 5 and xScroll is FF, don't allow right move
  JMP ReadRightDone

.next0
  CLC
  LDA xScroll       ;needs changed if ship/scroll changes speed
  ADC ship_speed
  STA xScroll

  JSR CameraAdd

  LDA ship_speed
  TAX

  LDA last_frame
  CMP screen_changes, x      ;needs changed if ship/scroll changes speed
  BEQ .next1
  JMP ReadRightDone
.next1:                      ;if last xScroll was FF and has now moved to 00
  LDA xScroll                ;we need to switch name tables going right
  CMP #$00
  BNE ReadRightDone
  INC curr_Background 
  JMP SwitchScreen
  
ReadRightDone:
  RTS

CameraAdd:
  CLC
  LDA camera_Left_x
  ADC ship_speed
  STA camera_Left_x
  LDA camera_Left_ScreenNum
  ADC #$00
  STA camera_Left_ScreenNum

  CLC
  LDA camera_Right_x
  ADC ship_speed
  STA camera_Right_x
  LDA camera_Right_ScreenNum
  ADC #$00
  STA camera_Right_ScreenNum

  RTS


;;;;;;;;;;;;;;;
Load_Text:
  LDA onscreen_flag
  BEQ .outside_NMI

.inside_NMI:
  ;set ptr1 to the address located in stored in onscreen_buffer
  LDX #$00
  LDA onscreen_buffer, x
  STA ptr1
  LDA onscreen_buffer+1, x
  STA ptr1+1

.outside_NMI:
  LDY #$00
.loop:
  LDA [ptr1], y
  CMP #$01
  BNE .next
  JMP .address
.next:
  CMP #$02
  BNE .text
  JMP .rts

.text:
  STA $2007
  INY
  JMP .loop

.address:
  INY
  LDA [ptr1], y
  STA $2006
  INY
  LDA [ptr1], y
  STA $2006
  INY
  JMP .loop

.rts
  RTS


;;;;;;;;;;;;;;
SwitchScreen:
  LDX nametableNum
  BEQ .switchToOne ;nametableNum is 1, switch name table to $2400
                   ;if zero then...
  LDA soft_2000   ; enable NMI, sprites from Pattern Table 0, background from Pattern Table 1, name table $2000
  AND #$FE
  STA soft_2000    ;...switch it to $2000
  DEC nametableNum
  JMP .rts
.switchToOne:
  LDA soft_2000   ; enable NMI, sprites from Pattern Table 0, background from Pattern Table 1, name table $2400
  ORA #$01
  STA soft_2000
  INC nametableNum
.rts
  RTS

;;;;;;;;;;;;;
TestDirection:

;TestDirection tests whether screen is scrolling left or right, and then sets leftright variable
;to 0 for left or 1 for right.  That is then used throughout buffer code to determine
;whether to draw the next off-screen column to the left or right of visible area.

  LDA xScroll
  CMP last_frame
  BCC .setleft
.setright:
  LDA #$01
  STA leftright
  JMP .rts
.setleft:
  LDA #$00
  STA leftright
.rts:
  RTS


;;;;;;;;;;;;;
setBufferLines:

;setBufferLines takes current position of xScroll and adds six columns for the right buffer line,
;so that new column is always being drawn six columns in front of right edge of visible area.  Sub 
;then sets the left buffer line six columns behind left edge of visible area.
  CLC
  LDA xScroll
  ADC #$30
  STA rightBufferLine
  SEC
  SBC #$60
  STA leftBufferLine
  RTS


;;;;;;;;;;;;;
restore_ship_speed:
  LDA xScroll       ;tests xScroll for even or odd value, so that xScroll
  AND #%00000001    ;and lastframe variables line up with the screen_changes
  CMP #$00          ;values in numbers.i
  BEQ .set_speed
  DEC xScroll       ;if xScroll is 00, that's even and it will not need to be adjusted
  DEC ship_map_x

.set_speed:
  LDX #$02
  STX ship_speed

.set_position_x:    ;restore ship's horiz position to even, or on first
  LDA ship_x        ;and last screen it won't catch the middle points and
  AND #%00000001    ;won't scroll
  CMP #$00
  BEQ .set_position_y
  DEC ship_x
  DEC ship_map_x

.set_position_y:
  LDA ship_y        ;do the same thing for ship's vertical position, restoring an
  AND #%00000001    ;even value
  CMP #$00          ;seems to stick on building top collision otherwise
  BEQ .no_adjust
  DEC ship_y

.no_adjust:
  RTS


;;;;;;;;;;;;;;;;;;;
ship_dies:
;  LDA ship_pal
;  CMP #$03
;  BCS .palreset
;  INC ship_pal
;  JMP .rts

;.palreset:
;  LDA #$00
;  STA ship_pal

  LDA #$00        ;this sub MUST stay in permanent bank.
  STA event_counter
  LDA #STATEDEAD
  STA gamestate

;.rts:
  RTS


;;;;;;;;;;;;;
ProgressBar:

  LDA assm_speed      ;get current assimilation speed depending on item
  ASL A
  TAY
  LDA tool_power, y
  STA ptr1
  LDA tool_power+1, y
  STA ptr1+1

  LDA progress_bar
  STA progress_bar+1  ;second spot ofprogress_bar variable works like a last_ variable

  INC progress_time
  LDA tool
  TAY

  LDA progress_time
  CMP [ptr1], y       ;compare to appropriate tier of tool_power table
  BCS .increment
  JMP .rts

.increment:
  LDA #$00
  STA progress_time
  INC progress_bar

.rts
  RTS


;;;;;;;;;;;;;
RandomGen:

  LDX #$00
  TXA
  PHA

.rand_8:
  INC r_results

  ; See "linear-congruential random number generator" for more. 
  ; rand = (rand * 5 + 0x3611) & 0xffff; 
  ; return (rand >> 8) & 0xff; 
  LDA rand_h      ; multiply by 5 
  STA rand_temp
  LDA rand_l 
  ASL A           ; rand = rand * 4 + rand 
  ROL rand_temp
  ASL A 
  ROL rand_temp
  CLC 
  ADC rand_l 
  PHA 
  LDA rand_temp
  ADC rand_h 
  STA rand_h 
  PLA               ; rand = rand + 0x3611 
  CLC 
  ADC #$11 
  STA rand_l 
  LDA rand_h 
  ADC #$36 
  STA rand_h 

  PLA
  TAX
  LDA rand_h
  STA r_results, x
  INX
  CPX #$0A
  BEQ .rts
  TXA
  PHA
  JMP .rand_8

.rts:
  RTS


;;;;;;;;;;;;;
random_reset_test:
  LDA r_reset     ; used to reset the numerical sequence
  CMP #$1E        ; that random_gen spits out.
  BCC .rts
  LDA counter
  STA rand_h
  LDA #$00
  STA r_reset

.rts:
  RTS


;;;;;;;;;;;;;;;;;;
r_marker_test:
  LDA r_marker    ;sets a cap for r_marker
  CMP #$0A
  BCS .reset_r
  JMP .rts
.reset_r:
  LDA #$00
  STA r_marker
.rts:
  RTS


;;;;;;;;;;;;;
Counter_Manager:

  LDA counter
  CMP #$3D
  BCC .rts

  LDA #$00
  STA counter
  INC r_reset
  INC event_counter

  LDA gamestate
  CMP #STATE_LVL_CLR  ;freeze the timer so end of level display is accurate
  BEQ .rts
  CMP #STATEMENU
  BEQ .rts            ;freeze time so it doesn't increment while player is in menu
  CMP #STATEDEAD
  BEQ .rts
  CMP #STATE_CUTSCENE
  BEQ .rts
  CMP #STATE_CREDITS
  BEQ .rts

  INC t_ones      ;increment time once per second if in playing state
  INC item_fx_timer
  INC arrow_timer
  INC boss_bldg_timer
  INC drgn_pause_timer

  JSR AddTimer

;  LDA gamestate
;  CMP #STATEPLAYING
;  BNE .rts
  LDA #bonus_time
  STA temp1
  JSR Bonus_Handler

.rts:
  RTS


;;;;;;;;;;;;;;;;;;;;
reset_block:         ;game_over, level_end depend on event_counter for their timing
  LDA event_counter  ;if event_counter continues to increment indefinitely,
  CMP #$F0           ;eventually it will wrap around and the these states will restart.
  BCC .rts
  LDA #$A0
  STA event_counter
.rts:
  RTS


;;;;;;;;;;;;;
vblankwait:
  BIT $2002
  BPL vblankwait
  RTS


;;;;;;;;;;;;;;;
init_MMC1:

  LDX #%00011110  ;bits 7-5, ignored
  ;bit 4 = 1, load 8K CHR ROM banks each time
  ;bit 3 = 1, load 16K PRG ROM banks each time
  ;bit 2 = 0, switch the cluster of two 8K banks (one 16K chunk) at location $8000
  ;bits 1&0 = 2, vertical mirroring

  JSR reset_MMC1_latch
  
  TXA
  JSR set_MMC1_Control

  LDA #$00     ;start on #$00 so the song swap banks are loaded on startup
  STA prg_bank
  LDA prg_bank
  AND #%00011111    ;for now, set WRAM bit to 1 so WRAM doesn't activate
  STA $E000
  LSR A
  STA $E000
  LSR A
  STA $E000
  LSR A
  STA $E000
  LSR A
  STA $E000

  LDA #32
  STA schr_bank
  JSR swap_CHR_bank0000
  LDA #34
  STA bchr_bank
  JSR swap_CHR_bank1000

  RTS


;;;;;;;;;;;;;;;;;
reset_MMC1_latch:
  LDA #$80     ;writing #$80 to $8000 resets MMC1 input counter
  STA $8000
  RTS


;;;;;;;;;;;;;;;;;
set_MMC1_Control:
  STA $8000
  LSR A
  STA $8000
  LSR A
  STA $8000
  LSR A
  STA $8000
  LSR A
  STA $8000

  RTS


;;;;;;;;;;;;;;;;;
swap_PRG_bank:

  LDA #$00          ;reset prg_interrupt to 0. at end of NMI, it is set to 1.
  STA prg_interrupt ;if prg_int is 1, that means NMI must have ran in the middle of this sub.

  LDA prg_bank
  ORA #%00010000    ;for now, set WRAM bit to 1 so WRAM doesn't activate

  STA $E000
  LSR A
  STA $E000
  LSR A
  STA $E000
  LSR A
  STA $E000
  LSR A
  STA $E000

  LDA prg_interrupt
  BEQ .rts
  JSR reset_MMC1_latch    ;reset the latch in case NMI cut into this sub earlier
  JMP swap_PRG_bank

.rts:
  RTS


;;;;;;;;;;;;;;;;;
swap_CHR_bank0000:
  LDA schr_bank

  STA $A000
  LSR A
  STA $A000
  LSR A
  STA $A000
  LSR A
  STA $A000
  LSR A
  STA $A000

  RTS

  
;;;;;;;;;;;;;;;;;
swap_CHR_bank1000:
  LDA bchr_bank

  STA $C000
  LSR A
  STA $C000
  LSR A
  STA $C000
  LSR A
  STA $C000
  LSR A
  STA $C000

  RTS


;;;;;;;;;;;;;;;;;
bank_backup_OBJ:
  LDA prg_bank
  STA bank_bak_OBJ       ;back up current level/boss data PRG swap bank
  LDA #$05                ;switch to swap bank where palettes are held in background1.i
  STA prg_bank
  JSR swap_PRG_bank

  RTS


;;;;;;;;;;;;;;;;;
bank_restore_OBJ:
  LDA bank_bak_OBJ
  STA prg_bank            ;restore current level/boss data swap bank
  JSR swap_PRG_bank

  RTS


;;;;;;;;;;;;;;;;;
bank_backup_pal:
  LDA prg_bank
  STA bank_bak_pal       ;back up current level/boss data PRG swap bank
  LDA #$01                ;switch to swap bank where palettes are held in background1.i
  STA prg_bank
  JSR swap_PRG_bank

  RTS


;;;;;;;;;;;;;;;;;
bank_restore_pal:
  LDA bank_bak_pal
  STA prg_bank            ;restore current level/boss data swap bank
  JSR swap_PRG_bank

  RTS

;;bank_backup_se and bank_restore_se are in the sound_engine.asm file.

NMI_pointer_backup:
  LDA backgroundAddr
  STA ptr_bak
  LDA backgroundAddr+1
  STA ptr_bak+1

  LDA metatile_ptr
  STA ptr_bak+2
  LDA metatile_ptr+1
  STA ptr_bak+3

  LDA attrAddr
  STA ptr_bak+4
  LDA attrAddr+1
  STA ptr_bak+5

  LDA ptr1
  STA ptr_bak+6
  LDA ptr1+1
  STA ptr_bak+7

  LDA ptr2
  STA ptr_bak+8
  LDA ptr2+1
  STA ptr_bak+9

  LDA obj_ptr
  STA ptr_bak+10
  LDA obj_ptr+1
  STA ptr_bak+11

  LDA boss_ptr
  STA ptr_bak+12
  LDA boss_ptr+1
  STA ptr_bak+13

  RTS

NMI_pointer_restore:
  LDA ptr_bak+12
  STA boss_ptr
  LDA ptr_bak+13
  STA boss_ptr+1

  LDA ptr_bak+10
  STA obj_ptr
  LDA ptr_bak+11
  STA obj_ptr+1

  LDA ptr_bak+8
  STA ptr2
  LDA ptr_bak+9
  STA ptr2+1

  LDA ptr_bak+6
  STA ptr1
  LDA ptr_bak+7
  STA ptr1+1

  LDA ptr_bak+4
  STA attrAddr
  LDA ptr_bak+5
  STA attrAddr+1

  LDA ptr_bak+2
  STA metatile_ptr
  LDA ptr_bak+3
  STA metatile_ptr+1

  LDA ptr_bak
  STA backgroundAddr
  LDA ptr_bak+1
  STA backgroundAddr+1

  RTS


;;;;;;;;;;;;;;;;;
Bonus_Handler:       ;the whole purpose of this sub is to avoid bank conflicts.
  LDA bonus_active
  BEQ .rts           ;bonus_active is 0, so normal level, so exit to avoid banking conflict.

  LDA temp1
  BMI .score

.time:
  JSR bonus_timer    ;test that ends the bonus level once timer reaches a certain point
  JMP .rts

.score:
  JSR bonus_scoring    ;test at beginning of sub, if in bonus levels, it will re-add the assimilation points to double or triple

.rts:
  RTS


;;;;;;;;;;;;;;;;;
Level_Handler:    
  ;every time code jumps to level handler, it looks at current level_index,
  ;increments it, and then begins the load process of whatever comes next on the list.
  ;no need to include level 0 in the list because it goes to the "level end" screen
  ;via a command in the level_victory sub.

;  JSR erase_sprites
;  JSR vblankwait
;  JSR vblankwait

.MMC1_control:
  LDA level_index
  ASL A
  TAY
  LDA bank_map, y
  STA ptr1
  LDA bank_map+1, y
  STA ptr1+1

  LDY #$00
  LDA [ptr1], y
  STA prg_bank
  JSR swap_PRG_bank
  INY
  LDA [ptr1], y
  STA schr_bank
  JSR swap_CHR_bank0000
  INY
  LDA [ptr1], y
  STA bchr_bank
  JSR swap_CHR_bank1000

.Level_start:
  LDA level_index
  ASL A
  TAY
  LDA level_startups, y
  STA ptr1
  LDA level_startups+1, y
  STA ptr1+1

  JMP [ptr1]


;;;;;;;;;;;;;;;;;;
;;GAME STATES
;;;;;;;;;;;;;;;;;

			   ;game states not in this asm file, title screen is in PRG1
  .include "menu.asm"
  .include "death.asm"
  .include "level_end.asm"
  .include "game_over.asm"
  .include "items.asm"
  .include "boss.asm"

  .include "variables_constants.asm"


;;;;;;;;;;;;;;;;;;
;;SOUND ENGINE
;;;;;;;;;;;;;;;;;

  .org $FC90   ;I've kept these at one non-fluctuating address to hopefull avoid
               ;that annoying "bloop" bug I was getting.  Watch out for overflow
               ;errors if you make any more adjustments to the sound engine.
               ;You'll also need to move the address back when you start adding
               ;more level_startups headers.

beta_stamp:
  .db $00,$00,$00,$00,$00

  .include "Music_sfx\sound_engine.asm"


;;;;;;;;;;;;;;;;;;;;;;
;;LEVEL START INDEXES
;;;;;;;;;;;;;;;;;;;;;;

;;KEEP THESE HERE, not in numbers.i
level_startups:
  .dw CS_Level1,Level_1_Begin, CS_Level2,Level_2_Begin, CS_Level3,Level_3_Begin
  .dw CS_Level4,Level_4_Begin, CS_Boss1,Boss_1_Begin
  .dw CS_Cow_Level,Cow_Level_Begin

  .dw CS_Level6,Level_6_Begin, CS_Level7,Level_7_Begin, CS_Level8,Level_8_Begin
  .dw CS_Level9,Level_9_Begin, CS_Level10,Level_10_Begin, CS_Boss2,Boss_2_Begin
  .dw CS_Cow_Level,Cow_Level_Begin

  .dw CS_Level12,Level_12_Begin, CS_Level13,Level_13_Begin, CS_Level14,Level_14_Begin
  .dw CS_Level15,Level_15_Begin, CS_Level16,Level_16_Begin, CS_Boss3,Boss_3_Begin
  .dw CS_Cow_Level,Cow_Level_Begin

  .dw CS_Level18,Level_18_Begin, CS_Level19,Level_19_Begin, CS_Level20,Level_20_Begin
  .dw CS_Level21,Level_21_Begin, CS_Boss4,Boss_4_Begin, CS_BossFinal,Boss_Final_Begin
  .dw CS_Campout_Level,Campout_Level_Begin

  .dw CS_Ending, Init_Credits

  .dw End_Reset

;;;;;;;;;;;;;;;;
;;VECTORS
;;;;;;;;;;;;;;;;

  .org $FFFA     ;first of the three vectors starts here
  .dw NMI        ;when an NMI happens (once per frame if enabled) the 
                   ;processor will jump to the label NMI:
  .dw RESET      ;when the processor first turns on or is reset, it will jump
                   ;to the label RESET:
  .dw 0          ;external interrupt IRQ is not used in this tutorial


;;;;;;;;;;;;;;  
;----- 

  .bank 16
  .org $C000
  .incbin "Areas\Area1_Western\assimilate_spr_wst.chr"
  .incbin "Areas\Area2_Asia\assimilate_spr_asa.chr"
;0,1

;;;;;;;;;;;;;;  
;----- 

  .bank 17
  .org $E000
  .incbin "Areas\Area1_Western\assimilate_bg1.chr"
;2,3

;;;;;;;;;;;;;;  
;----- 

  .bank 18
  .org $C000
  .incbin "Areas\Area2_Asia\assimilate_bg2.chr"
;4;5

;;;;;;;;;;;;;;  
;----- 

  .bank 19
  .org $E000
  .incbin "Areas\Area2_Asia\assimilate_bg3.chr"
;6,7

;;;;;;;;;;;;;;  
;----- 

  .bank 20
  .org $C000
  .incbin "Areas\Area3_Soviet\assimilate_bg4.chr"
;8,9

;;;;;;;;;;;;;;  
;----- 

  .bank 21
  .org $E000
  .incbin "Areas\Area4_Moon\assimilate_bg5.chr"
;A,B

;;;;;;;;;;;;;;  
;----- 

  .bank 22
  .org $C000
  .incbin "Areas\Bonus Stages\assimilate_bg_bonus.chr"
;C,D

;;;;;;;;;;;;;;  
;----- 

  .bank 23
  .org $E000
  .incbin "Areas\splash_title.chr"
  .incbin "Areas\Bonus Stages\assimilate_spr_bns.chr"  ;BONUS LEVEL sprites
;E,F

;;;;;;;;;;;;;;  
;----- 

  .bank 24
  .org $C000
  .incbin "Areas\Area3_Soviet\assimilate_spr_sov.chr"  ;SOVIET LEVEL sprites
  .incbin "Areas\Area4_Moon\assimilate_spr_mon.chr"  ;;PUT THE moon sprites here when ready
;10,11

;;;;;;;;;;;;;;  
;----- 

  .bank 25
  .org $E000
  .incbin "Areas\Area3_Soviet\assimilate_bg6.chr"
;12,13

;;;;;;;;;;;;;;  
;----- 

  .bank 26
  .org $C000
  .incbin "Areas\Area4_Moon\assimilate_bg7.chr"
;14,15

;;;;;;;;;;;;;;  
;----- 

  .bank 27
  .org $E000
  .incbin "Areas\Area4_Moon\assimilate_bg8.chr"
;16,17

;;;;;;;;;;;;;;  
;----- 

  .bank 28
  .org $C000
  .incbin "Cutscenes\cutscene1.chr"
;18,19

;;;;;;;;;;;;;;  
;----- 

  .bank 29
  .org $E000
  .incbin "Cutscenes\cutscene2.chr"
;1A,1B

;;;;;;;;;;;;;;  
;----- 

  .bank 30
  .org $C000
  .incbin "Cutscenes\cutscene3.chr"
;1C,1D

;;;;;;;;;;;;;;  
;----- 

  .bank 31
  .org $E000
  .incbin "Areas\Area4_Moon\assimilate_bg5.chr"

   ;this is the last actual bank.
   ;be sure to keep at least 8K in it.