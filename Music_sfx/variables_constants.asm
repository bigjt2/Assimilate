;;;;;;;;;;;;;;;;;;;;;;;;;
;; Zero Page Variables
;; $0000-$00FF
;;;;;;;;;;;;;;;;;;;;;;;;

  .rsset $0000

rand_h           .rs 1  ; used for random generator
r_results        .rs 10 ; array of random numbers
r_reset          .rs 1  ; counter that's used to reset the random_gen
rand_l           .rs 1
rand_temp        .rs 1
r_marker         .rs 1  ; used to hopefully ensure the same value of r_results doesn't get used twice

gamestate        .rs 1  ; current gamestate, see constants below
level            .rs 1  ; current level
level_index      .rs 1  ; pointer variable used to pull next level in level_startups table
lives            .rs 1  ; player's current lives
CS_active        .rs 1  ; determines whether a cutscene is happening or not

buttons          .rs 1  ; player 1 gamepad buttons, one bit per button
buttons_old      .rs 1
buttons_new      .rs 1
sleeping         .rs 1  ; flag variable used for waiting on next NMI
counter          .rs 1  ; counter incremented each NMI, helps with animation, sprite handling, timing, etc.
anim_counter1    .rs 1  ; adjustable counter that can be used independently of main counter, for purposes of timing sprite animations
anim_counter2    .rs 1
event_counter    .rs 1  ; timer to govern switches in events, like dying or level change

xScroll          .rs 1  ; value to offset x value at $2005 VRAM address
yScroll          .rs 1  ; value to offset y value at $2005.  Only used for boss battles.
rightBufferLine  .rs 1  ; position off-screen right where new columns are written to nametable
leftBufferLine   .rs 1  ; position off-screen left where new columns are written ot nametable
rightScreenEdge  .rs 1  ; xScroll + $FF, to determine right edge of current viewing area
lastEdge         .rs 1  ; holds value of last rightScreenEdge, to determine if it's crossed from $FF to $00 or vice versa

leftright        .rs 1  ; flag variable storing movement direction, $00 = left, $01 = right
nametableNum     .rs 1  ; which nametable we are on: 1=$2000, 2=$2400
curr_Background  .rs 1  ; which background the camera is currently displaying
next_Background  .rs 1  ; which background & attribute table is currently being loaded into/from the buffer out of background.i
prev_Background  .rs 1  ; which background & attrib table is loaded if screen moves lef
frst_Background  .rs 1  ; far-left edge of playable area, changed with each level
finl_Background  .rs 1  ; far-right edge of playable area, can be changed with each new level

init_backgrounds .rs 1  ; variable used in init_PPU sub
initializeSet    .rs 1  ; variable telling dbuffer that initialization is running
bootup           .rs 1  ; only used at startup, since init_PPU has to act differently between beginning of game and state/level changes

soft_2000  .rs 1        ; temp variable for $2000
soft_2001  .rs 1        ; temp variable for $2001
top_2000   .rs 1        ; variable to switch top of screen for $2000, before sprite 0 code in NMI handler
last_frame .rs 1        ; stores value of xScroll's previous position in case of movement
last_col   .rs 1        ; stores the previous column status so NMI handler will update offscreen column if column_test shows current cap to be different

backgroundAddr .rs 2    ; pointer used for loading background tiles into RAM
metatile_ptr   .rs 2    ; pointer used for loading individual background tiles out of metatiles
attrAddr       .rs 2    ; pointer used for loading attribute bytes into RAM
ptr1           .rs 2    ; generic pointer
ptr2           .rs 2    ; generic pointer 2
loop_counter   .rs 1    ; counter to keep track of looping
metatile_indx  .rs 1    ; tells the metatile sub which metatile table to load from
CS_ptr         .rs 1    ; used in the cut scene subs

progress_bar   .rs 2    ;+0: $FF = reset, $00-$20 = incrementing, 
                        ;+1: $FD = erase pb graphics, $FE = don't erase, but also don't increment
progress_time  .rs 1
tool           .rs 1
assm_speed     .rs 1    ; depending on item, it could be 1x, 2x, or 3x
EMP_trigger    .rs 1    ; 0=no EMP, enemies are on screen.  1=EMP, no enemies for duration of effect

prg_bank         .rs 1    ; current bank of PRG-RAM to load at $C000. See MRN's notes on numbering for reference.
schr_bank        .rs 1    ; current bank of sprite CHR-RAM loaded.  See MRN'S notes on numbering for reference.
bchr_bank        .rs 1    ; current bank of background CHR-RAM loaded.
bank_bak_se      .rs 1    ; keeps the current PRG-RAM bank when switching to go into the sound engine at end of NMI
bank_bak_pal     .rs 1    ; keeps the current PRG-RAM bank when switching for palettes
enemy_bank       .rs 1    ; used to direct PC toward appropriate address of current PRG bank for misc. enemy subs

skip_sprite0     .rs 1
needdraw         .rs 1    ; multi-flag variable to telling PPU what to draw in NMI
                          ; bits 7 currently undefined
                          ; bit 0 : 0 = don't draw column, 1 = draw column
                          ; bit 1 : 0 = don't update score, 1 = update score
                          ; bit 2 ; 0 = don't update timer/lives, 1 = update timer/lives
                          ; bit 3 ; 0 = don't update assm%, 1 = update assm%
                          ; bit 4 ; 0 = no $2400 update, 1 = draw tiles, attribs at bottom of $2400 menu
                          ; bit 5 : 0 = no $2400 update, 1 = restore original tiles, attrib at bottom of $2400 menu
                          ; bit 6 : 0 = screen not flashing, 1 = screen is flashing

sound_ptr       .rs 2   ; pointers for sound engine
sound_ptr2      .rs 2
current_song    .rs 1   ; index variable telling what song/sfx is loaded

curr_playfield    .rs 1 ;the visible area of the current playfield
camera_cent       .rs 1 ;center of the viewable screen
last_camera_cent  .rs 1 ;needed for the SwitchPlayfield sub
offset            .rs 1 ;used to determine how much to shift each object's x coords right or left
stop_movement     .rs 1 ;flag to determine if collision has happened: #$01 = stop down, #$02 = stop left, #$03 = stop right

s_ones   .rs 1  ;score
s_tens   .rs 1
s_hundr  .rs 1
s_thous  .rs 1
s_tthou  .rs 1
s_bkup   .rs 5  ;score saved at beginning of each level in case player decides to restart current level

t_ones   .rs 1  ;timer
t_tens   .rs 1
t_hundr  .rs 1
t_thous  .rs 1

a_ones   .rs 1  ;assimilation percentage
a_tens   .rs 1
a_hundr  .rs 1

l_ones   .rs 1  ;lives
l_tens   .rs 1

num_change  .rs 5   ;t_thou,thous,hundr,tens,ones

;104 bytes used


;;;;;;;;;;;;;;;;;;
;;  Stack
;;  $0100-$01FF
;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;
;;  Sprite RAM
;;  $0200-$02FF
;;;;;;;;;;;;;;;;

sprite_RAM     = $0204
;used for missiles/fireballs/etc (shuffling)
sprite_RAM_MS1    = $0224   ;(M)ovable (S)pots for sprite handling
sprite_RAM_MS2    = $0228
sprite_RAM_MS3    = $022C
sprite_RAM_MS4    = $0230
sprite_RAM_MS5    = $0234
sprite_RAM_MS6    = $0238
sprite_RAM_MS7    = $023C
sprite_RAM_MS8    = $0240
sprite_RAM_MS9    = $0244
sprite_RAM_MS10   = $0248
sprite_RAM_MS11   = $024C
sprite_RAM_MS12   = $0250
sprite_RAM_MS13   = $0254
sprite_RAM_MS14   = $0258
sprite_RAM_MS15   = $025C
sprite_RAM_MS16   = $0260
sprite_RAM_MS17   = $0264
sprite_RAM_MS18   = $0268
sprite_RAM_MS19   = $026C
sprite_RAM_MS20   = $0270
sprite_RAM_MS21   = $0274
sprite_RAM_MS22   = $0278

;currently unused
sprite_RAM_MS23   = $027C
sprite_RAM_MS24   = $0280
sprite_RAM_MS25   = $0284
sprite_RAM_MS26   = $0288
sprite_RAM_MS27   = $028C
sprite_RAM_MS28   = $0290
sprite_RAM_MS29   = $0294
sprite_RAM_MS30   = $0298
sprite_RAM_MS31   = $029C
sprite_RAM_MS32   = $02A0
sprite_RAM_MS33   = $02A4
sprite_RAM_MS34   = $02A8
sprite_RAM_MS35   = $02AC
sprite_RAM_MS36   = $02B0
sprite_RAM_MS37   = $02B4
sprite_RAM_MS38   = $02B8

;used for victim
sprite_RAM_MS39   = $02BC
sprite_RAM_MS40   = $02C0

;used for arrow radar at top
sprite_RAM_MS41   = $02C4
sprite_RAM_MS42   = $02C8
sprite_RAM_MS43   = $02CC
sprite_RAM_MS44   = $02D0

;used for arrow
sprite_RAM_MS45   = $02D4
sprite_RAM_MS46   = $02D8

;used for beam graphics
sprite_RAM_MS47   = $02DC
sprite_RAM_MS48   = $02E0
sprite_RAM_MS49   = $02E4
sprite_RAM_MS50   = $02E8
sprite_RAM_MS51   = $02EC
sprite_RAM_MS52   = $02F0
sprite_RAM_MS53   = $02F4
sprite_RAM_MS54   = $02F8
sprite_RAM_MS55   = $02FC


;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Sound Engine Variables
;;  $0300-$03FF
;;;;;;;;;;;;;;;;;;;;;;


;;For ease of using the sound engine between beta testing the full Assimilate
;;program and just testing the individual songs in Music_sfx.nes, I have kept
;;these variables listed in the sound_engine.asm file.


;;123 bytes used


;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Background Buffer
;;  $0400-$04FF
;;;;;;;;;;;;;;;;;;;;;;

bg_RAM         = $0400 ;113 bytes
pb_glow_atr    = $0471 ;5 bytes
progress_RAM   = $0476 ;4 bytes
tool_grpx_RAM  = $047A ;25 bytes
assm_x_RAM     = $0493 ;4 bytes
flash_pal_RAM  = $0497 ;16 bytes
bldg_RAM       = $04A7 ;remaining bytes


;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Sprite Variables - Misc.
;;  $0500-$05FF
;;;;;;;;;;;;;;;;;;;;;

  .rsset $0500

somewhere .rs 1 ;variable to test which values are being stored. get rid of it at completion.

sprite_handler  .rs 1

ship_x      .rs 1
ship_y      .rs 1
ship_pal    .rs 1
ship_tiles  .rs 8
ship_top    .rs 1
ship_bottom .rs 1
ship_left   .rs 1
ship_right  .rs 1
ship_speed  .rs 1

traj_type .rs 1    ;identifies which enemy to calculate trajectory for
traj_x    .rs 1    ;trajectory of change in x for the current enemy
traj_y    .rs 1    ;trajectory of change in y for the current enemy

victim_y    .rs 1
victim_tile .rs 2  ;the two tiles making up current victim graphic
victim_pal  .rs 1  ;for rising/falling 
victim_x    .rs 1
victim_stat .rs 1  ;1=init 2=raising 3=on board 4=falling 0=offscreen
victim_num  .rs 1  ;the current set of tiles for the victim sprite
victim_max  .rs 1  ;the maximum number of victim graphics in current level
zombie      .rs 1  ;0=victim is still normal, 1=victim is now assimilated

fireballs_y     .rs 6
fireballs_tile  .rs 6
fireballs_x     .rs 6
fireball_mark   .rs 1 ;index counter used to (top 4 bits) keep track of r_results for fireballs subs
onscreen_fb     .rs 1 ;multi-bit flag variable keeping track of which fireballs are onscreen
fireball_change .rs 1 ;use if you want to use a random change in fireball x or y instead of a preset

missile_y       .rs 1
missile_tile    .rs 4
missile_x       .rs 1
missile_count   .rs 1 ;0 = no missle, 1 = missile is onscreen, don't launch more
missile_mark    .rs 1 ;random number used in some stages to determine when missile appears
fire_pallette   .rs 1 ;missile's fire color
wm_traj_index_x .rs 1 ;index to store current frame of wave missile's x trajectory
wm_traj_index_y .rs 1 ;index to store current frame of wave missile's y trajectory

beam_length  .rs 1 ;counts how many beam tiles have been drawn on screen, determines length
beam_max     .rs 1 ;the maximum length the beam can grow
beam_score   .rs 2 ;first address is length from victim raising, second address is length from victim planting, used to calculate score for raising/planting
beam_pal     .rs 1 ;palette for beam, can be changed each level.

arrow_pos    .rs 2 ;first byte is what playfield the arrow is on, second byte is the number that points to coordinates in bldg_RAM
arrow_loc    .rs 2 ;numbers pulled from bldg_RAM, first byte gives arrow's x coord, second byte gives arrow's y coord.
arrow_timer  .rs 1
arrow_freq   .rs 1 ;changed every level, first four bits dictate how fast arrow pops up, second four dicate how long it is visible
arrow_status .rs 1 ;flag variable: 0=no arrow, victim in motion/being assimilated 1=no arrow, counting 2=arrow on screen, counting
last_arpos   .rs 1 ;holds the last playfield arrow appeared on

menu_cursor  .rs 3 ;position of the menu's cursor; 1st byte is position (0-2), 2nd byte is y coord, 3rd is x coord

item_num     .rs 1
item_y       .rs 1
item_tile    .rs 4
item_pal     .rs 1
item_x       .rs 1
item_present .rs 1 ;flag variable: 0=no item on screen 1=item on screen
item_timer   .rs 1 ;inc once per second in Counter_Manager sub
item_fx_timer .rs 1 ;seperate timer to time the duration of an item's effect
item_mark    .rs 1 ;when item_timer equals this, item will appear.  can be changed each level
item_end     .rs 1 ;when item_timer equals this, item's effect will wear off, if applicable

;76 bytes used


;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Boss Sprite Data
;;  $0600-$06FF
;;;;;;;;;;;;;;;;;;;;;

  .rsset $0600

boss_active      .rs 1 ;some parts of code behave differently during boss battles. this flag determines whether one is happening
boss_bldg_num    .rs 1 ;current bldg being loaded
boss_bldg_x      .rs 1 ;x coord of sprite where arrow will appear
boss_bldg_y      .rs 1 ;y coord of sprite where arrow will appear
boss_bldg_stat   .rs 1 ;0=offscreen no init, 1=init, 2=onscreen no init
boss_scrll_spd   .rs 1 ;speed at which buildings scroll during boss fight
boss_aframe      .rs 1 ;stores current animation frame num for bosses
boss_paces       .rs 1 ;stores current number of paces for boss to move before pausing/changing direction
boss_curr_mv     .rs 1 ;stores current movement type for boss
bs_mv_index      .rs 1 ;index for boss_move_pattern tables

cb1_top          .rs 1 ;collision boxes for bosses
cb1_bottom       .rs 1
cb1_right        .rs 1
cb1_left         .rs 1

cb2_top          .rs 1
cb2_bottom       .rs 1
cb2_right        .rs 1
cb2_left         .rs 1

cb3_top          .rs 1
cb3_bottom       .rs 1
cb3_right        .rs 1
cb3_left         .rs 1

target_x         .rs 1 ;x coord of target where arrow appears after victim assimilated during boss fight
target_y         .rs 1 ;y coord of target
target_stat      .rs 1 ;

bs1_mssl_index_y  .rs 1
bs1_mssl_index_x  .rs 1
bs1_cannon        .rs 1 ;0=left cannon, 1=right cannon

bs_left      = $00   ;move boss left by incrementing xScroll
bs_right     = $01   ;move boss right by decrementing xScroll
bs_pause     = $02   ;hold boss's horiz position by leaving xScroll unchanged
bs_reset     = $03   ;resets bs_mv_index
kill_arrow   = $04   ;temporarily destroys arrow so player can't plant
rstr_arrow   = $05   ;turns arrow back on


;;;;;;;;;;;;;;;;;;;;;
;;  MISC. CONSTANTS
;;;;;;;;;;;;;;;

;; State Constants

STATETITLE     = $00
STATEPLAYING   = $01
STATEMENU      = $02
STATEDEAD      = $03
STATE_LVL_CLR  = $04
STATE_RESET    = $05  ;the black screen before resetting
STATE_GAMEOVER = $06
STATE_LVL_CHG  = $07

;; Trajectory Constants

WAVE_MISSILE_LV4  = $00
BOSS1_MISSILE     = $01


;; Cut Scene Events Aliases

end = $00  ;ends the cutscene and moves on
something_else  =  $01  ;placeholder for me to remember the structure
;fade_textdown?
;fade_textup?