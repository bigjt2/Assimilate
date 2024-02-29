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
level_index_bak  .rs 1  ; needed for the campout level, so that the current level player WAS on is backed up
lives            .rs 1  ; player's current lives
select_level     .rs 1  ; highest bit is whether stage select is enabled, lowest 7 bits is current level selected by secret title stage select
combo_ptr        .rs 1  ; handles the current buttom combo selection for the stage select unlock

buttons          .rs 1  ; player 1 gamepad buttons, one bit per button
buttons_old      .rs 1
buttons_new      .rs 1
sleeping         .rs 1  ; flag variable used for waiting on next NMI
counter          .rs 1  ; counter incremented each NMI, helps with animation, sprite handling, timing, etc.
anim_counter1    .rs 1  ; adjustable counter that can be used independently of main counter, for purposes of timing sprite animations
anim_counter2    .rs 1
event_counter    .rs 1  ; timer to govern switches in events, like dying or level change

xScroll          .rs 1  ; value to offset x value at $2005 VRAM address
rightBufferLine  .rs 1  ; position off-screen right where new columns are written to nametable
leftBufferLine   .rs 1  ; position off-screen left where new columns are written ot nametable
rightScreenEdge  .rs 1  ; xScroll + $FF, to determine right edge of current viewing area
lastEdge         .rs 1  ; holds value of last rightScreenEdge, to determine if it's crossed from $FF to $00 or vice versa

camera_Left_x           .rs 1
camera_Left_ScreenNum   .rs 1
camera_Right_x          .rs 1
camera_Right_ScreenNum  .rs 1
bottom_border           .rs 1  ;the bottom of the playable screen

leftright        .rs 1  ; flag variable storing movement direction, $00 = left, $01 = right
nametableNum     .rs 1  ; which nametable we are on: 1=$2000, 2=$2400
curr_Background  .rs 1  ; which background the camera is currently displaying
next_Background  .rs 1  ; which background & attribute table is currently being loaded into/from the buffer out of background.i
prev_Background  .rs 1  ; which background & attrib table is loaded if screen moves lef
frst_Background  .rs 1  ; far-left edge of playable area, changed with each level
finl_Background  .rs 1  ; far-right edge of playable area, can be changed with each new level

init_backgrounds .rs 1  ; variable used in init_PPU sub
initializeSet    .rs 1  ; variable telling dbuffer that initialization is running
death_init_flag  .rs 1

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
obj_ptr        .rs 2    ; pointer used to navigate each level's object map
loop_counter   .rs 1    ; counter to keep track of looping
metatile_indx  .rs 1    ; tells the metatile sub which metatile table to load from
boss_ptr       .rs 2    ; used for boss battles so jump tabel goes to correct subs
ptr_bak        .rs 14   ; backs up the pointers when entering NMI/restores them when leaving NMI

progress_bar   .rs 2    ;+0: $FF = reset, $00-$20 = incrementing, 
                        ;+1: $FD = erase pb graphics, $FE = don't erase, but also don't increment
progress_time  .rs 1
tool           .rs 1
assm_speed     .rs 1    ; depending on item, it could be 1x, 2x, or 3x
EMP_trigger    .rs 1    ; 0=no EMP, enemies are on screen.  1=EMP, no enemies for duration of effect

prg_bank         .rs 1    ; current bank of PRG-RAM to load at $C000. See MRN's notes on numbering for reference.
schr_bank        .rs 1    ; current bank of sprite CHR-RAM loaded.  See MRN'S notes on numbering for reference.
bchr_bank        .rs 1    ; current bank of background CHR-RAM loaded.
prg_interrupt    .rs 1    ; 0=clear of NMI / 1=NMI has interrupted
bank_bak_se      .rs 1    ; keeps the current PRG-ROM bank when switching to go into the sound engine at end of NMI
bank_bak_pal     .rs 1    ; keeps the current PRG-ROM bank when switching for palettes
bank_bak_OBJ     .rs 1    ; keeps the current PRG-ROM bank when switching to ObjectHandler and the subs it runs
bank_bak_boss    .rs 1
gameloop_ran     .rs 1    ; 0=gameloop has not fully_executed, hold off on certain bankswaps, 1=gameloop has executed, allow certain bankswaps

skip_sprite0     .rs 1
;pal_stat         .rs 1    ; 0=do nothing, 1=blackout, 2=load palettes
pal_change_lo    .rs 1    ; low byte of palette address
needdraw         .rs 1    ; multi-flag variable to telling PPU what to draw in NMI
                          ; bit 0 : 0 = don't draw column, 1 = draw column
                          ; bit 1 : 0 = don't update score, 1 = update score
                          ; bit 2 ; 0 = don't update timer/lives, 1 = update timer/lives
                          ; bit 3 ; 0 = don't update assm%, 1 = update assm%
                          ; bit 4 ; 0 = no $2400 update, 1 = draw tiles, attribs at bottom of $2400 menu
                          ; bit 5 : 0 = no $2400 update, 1 = restore original tiles, attrib at bottom of $2400 menu
                          ; bit 6 : 0 = palette doesn't change, 1 = palette change
                          ; bit 7 : 0 = no onscreen update, 1 = onscreen update needed (text or pic fragment)

sound_ptr       .rs 2   ; pointers for sound engine
sound_ptr2      .rs 2
current_song    .rs 1   ; index variable telling what song/sfx is loaded

curr_playfield    .rs 1 ;the visible area of the current playfield
camera_cent       .rs 1 ;center of the viewable screen
last_camera_cent  .rs 1 ;needed for the SwitchPlayfield sub
offset            .rs 1 ;used to determine how much to shift each object's x coords right or left
stop_movement     .rs 1 ;flag to determine if collision has happened: #$01 = stop down, #$02 = stop left, #$03 = stop right

item_fx_timer .rs 1 ;seperate timer to time the duration of an item's effect
item_end     .rs 1 ;when item_timer equals this, item's effect will wear off, if applicable

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

endscreen_load    .rs 1  ;multi-flag variable that stores which segment of the endscreen needs to load next NMI
anal_tally        .rs 1  ;as name implies, keeps track of how many consecutive time player has successfully planted victim after using anal probe
campout_unlock    .rs 1  ;if enough consecutive anal probes have been used, this will be non-zero and Level_Handler will jump to campout level
bonus_active      .rs 1  ;flag variable to help change behaviours of timing/sprites/end of level handling/etc. in bonus levels. $F0=campout active,$0F=cow active,$FF=both active, $00=bonus inactive

obj_counter       .rs 1  ;when this crosses from $FF to $00, offset will advance in level map
obj_speed         .rs 1  ;determines the speed at which new objects are loaded
obj_init_offset   .rs 1  ;used in object level map to determine which object to spawn
obj_run_offset    .rs 1  ;used to remember where pointer in OAM is during each frame
OAM_SpcNeed       .rs 1  ;space required in OAM for current object being init
SPR_SpcNeed       .rs 1  ;space required (in 4 byte tiles) in moveable sprite spots for current object being init
OAM_Free          .rs 1  ;current OAM free space
SPR_Free          .rs 1  ;current movable sprite free space (in 4 byte tiles)
SM_pointer        .rs 1  ;points to current position in $0500 Sprite Map
hold_object_init  .rs 1

temp1        .rs 1  ;temp variable for when my stack has something I need already
temp2        .rs 1
temp_y       .rs 1  ;temp variable to keep track of the y reg, so I don't have to keep xferring to accum, then xferring to stack, etc.
temp_x       .rs 1

;153 bytes used


;;;;;;;;;;;;;;;;;;
;;  Stack
;;  $0100-$01FF
;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;
;;  Sprite RAM
;;  $0200-$02FF
;;;;;;;;;;;;;;;;

sprite_RAM     = $0204

sprite_RAM_MS     = $0224   ;the sprites that are written to and shuffled
                            ;every frame, then transferred via DMA.

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
pal_RAM        = $0497 ;33 bytes - 32 bytes for colors, 1 byte for terminator
bldg_RAM       = $04B8 ;remaining bytes

bgpal_0 = $00
bgpal_1 = $04
bgpal_2 = $08
bgpal_3 = $0C
sppal_0 = $10
sppal_1 = $14
sppal_2 = $18
sppal_3 = $1C


;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Sprite Variables - Misc.
;;  $0500-$05FF
;;;;;;;;;;;;;;;;;;;;;

  .rsset $0500

SpriteMap  .rs 184   ;38 spots in Sprite RAM that can be shuffled, four bytes each .
                     ;46 spots
ship_x      .rs 1    ;this merely tests for the scroll
ship_y      .rs 1
ship_pal    .rs 1
ship_tiles  .rs 8
ship_top    .rs 1
ship_bottom .rs 2   ;the low bytes represent the bbox that runs along the ship's x-axis,
ship_left   .rs 2   ;the high bytes represetnt the bbox that runs along the ship's y-axis.
ship_right  .rs 2
ship_speed  .rs 2

ship_map_x  .rs 1   ;this is what object collision is tested against
ship_screen_x .rs 1 ;bounding box for high left & right gets set from this
ship_map_lf .rs 2   ;low byte is coord, high byte is screen
ship_map_rt .rs 2

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
victim_pal_bank  .rs 4  ;4 byte bank storing the palettes for each victim, set at beginning of each level
zombie_pal_bank  .rs 4  ;4 byte bank storing the palettes for each victim, set at beginning of each level

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

sprite_x_offset   .rs 1   ;used for visibility testing, to continually update the x position of each sprite in multi-sprite objects

;246 bytes used

SMap_clearall       = $00
SMap_clearEXPTship  = $20


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Boss / Special Enemy / General Object Sprite Data / Cutscene Data
;;  $0600-$06FF
;;;;;;;;;;;;;;;;;;;;;

  .rsset $0600

boss_num         .rs 1 ;which boss is currently active
boss_active      .rs 1 ;some parts of code behave differently during boss battles. this flag determines whether one is happening
boss_paces       .rs 1 ;stores current number of paces for boss to move before pausing/changing direction
boss_curr_mv     .rs 1 ;stores current movement type for boss
bs_mv_index      .rs 1 ;index for boss_move_pattern tables

boss_bldg_num    .rs 1 ;current bldg being loaded
boss_bldg_timer  .rs 1 ;counter to manage spawning buildings
boss_bldg_stat   .rs 1 ;0=offscreen no init, 1=init, 2=onscreen no init

boss_coords      .rs 12 ;first coord is x, second coord is y
boss_SCRcoords   .rs 6  ;screen number that x coord is currently located
;add more space here as needed, every two bytes is another x and y

;BE SURE to set boss_end_done to 0 at beginning of every boss battle in level_starts
boss_end_done   .rs 1  ;flag to signal when the boss ending razzmidaz is done
boss_expl_timer  .rs 1  ;times the start times of expolsions.
boss_expl_ptr    .rs 1  ;keeps track of which explosion coords to start
explosion_RAM    .rs 16 ;timer, SMap pos, x coord, y coord
boss_fade_timer  .rs 1  ;times the fade out effect for bosses

cb1_top          .rs 1 ;collision boxes for bosses
cb1_bottom       .rs 1
cb1_right        .rs 1
cb1_left         .rs 1
cb1_SCRright     .rs 2 ;screen coords of left & right. only used in final boss
cb1_SCRleft      .rs 2 ;HI byte is screen coord, LO byte is x coord
cb1_skip         .rs 1 ;also only used in final boss. flag variabe to test whether or not to test this box. used to save cycles.

cb2_top          .rs 1
cb2_bottom       .rs 1
cb2_right        .rs 1
cb2_left         .rs 1
cb2_SCRright     .rs 2
cb2_SCRleft      .rs 2
cb2_skip         .rs 1

cb3_top          .rs 1
cb3_bottom       .rs 1
cb3_right        .rs 1
cb3_left         .rs 1
cb3_SCRright     .rs 2
cb3_SCRleft      .rs 2
cb3_skip         .rs 1

cb4_top          .rs 1
cb4_bottom       .rs 1
cb4_right        .rs 1
cb4_left         .rs 1
cb4_SCRright     .rs 2
cb4_SCRleft      .rs 2
cb4_skip         .rs 1

target_x         .rs 1 ;x coord of target where arrow appears after victim assimilated during boss fight
target_y         .rs 1 ;y coord of target
target_stat      .rs 1 ;


;;Misc

kogy_map_y       .rs 1 ;really shouldn't be here, but I didn't want to fuck around with the object handler for this one thing

CS_ptr           .rs 1    ; used in the cut scene subs
CS_pic_ptr       .rs 1
CS_pic_row_clear .rs 1
CS_curr_pic_LO   .rs 1
CS_curr_pic_HI   .rs 1
CS_fadepal_max   .rs 1

CS_extend_addr_HI   .rs 1    ; used in case there are more than 256 bytes in a cutscene's table.
CS_extend_addr_LO   .rs 1
fade_table_ptr   .rs 1
fade_timer       .rs 1
fadeout_beg_byte .rs 1
fadeout_dec      .rs 1
onscreen_flag    .rs 1
onscreen_buffer  .rs 20

onscreen_nothing = $00
onscreen_pic     = $01
onscreen_text    = $02
onscreen_attr    = $03


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Object General Sprite Variables

obj_height   .rs 1
obj_width    .rs 1
obj_left     .rs 1
obj_right    .rs 1
obj_top      .rs 1
obj_bottom   .rs 1
obj_lscreen  .rs 1
obj_rscreen  .rs 1


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Special Enemy Sprite Variables

dragon_present    .rs 1   ;used to keep dragon from re-spawning in Asian stages
drgn_pause_timer  .rs 1   ;times the dragon's pause

weapon_xoffset    .rs 1   ;shifts the beginning x coord of object's weapon inward from left
weapon_yoffset    .rs 1   ;shifts the beginning y coord of object's weapon downward from top

;;;;;;;;;;;;;;;;
;;Boss Constants

bs_left      = $00   ;move boss left by incrementing xScroll
bs_right     = $01   ;move boss right by decrementing xScroll
bs_pause     = $02   ;hold boss's horiz position by leaving xScroll unchanged
bs_reset     = $03   ;resets bs_mv_index
kill_arrow   = $04   ;temporarily destroys arrow so player can't plant
rstr_arrow   = $05   ;turns arrow back on
klaser_on    = $06   ;turn kogyaru's vertical laser on
klaser_off   = $07   ;turns kogyaru's vertical laser off.

bs_up        = $08   ;these four are only used at the very end of the game to
bs_down      = $09   ;control the kogy sprite's retreating animation, and work by
sprite_front = $0A   ;adjusting the sprite's parameters rather than xScroll
bs_dbl_right = $0B

boss1        = $00
boss2        = $01
boss3        = $02
boss4        = $03
kogy_chase   = $04

close_star   = $04
open_star    = $05

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Object Attribute Memory
;;  $0700-$07FF
;;;;;;;;;;;;;;;;;;;;;

  .rsset $0700

OAM         = $0700
oam_type      .rs 1
oam_dir       .rs 1
oam_xMapHI    .rs 1  ;screen num
oam_xMapLO    .rs 1  ;screen coord
oam_yMapLO    .rs 1  ;screen coord
oam_MoveType  .rs 1
oam_xDelta    .rs 1
oam_yDeltaHI  .rs 1
oam_yDeltaLO  .rs 1
oam_yDeltaSPD .rs 1  ;bits 3-0: number applied to yDeltaHI
                     ;bits 7-4: number LSR'd twice, then applied to yDeltaLO
oam_SMap_loc  .rs 1

;hobj_destroy = $0708 ;set from timer, keeps the time for which horizontal object should be destroyed
traj_index_y = $0706
traj_index_x = $0707


fireb_anim   = $070B
missile_anim = $070E

dragon_state = $0705 ;see constants in dragon.asm
drgn_xTarget = $0706 ;two bytes
drgn_yTarget = $0708
dragon_anim  = $0709

van_anim     = $0707

mig_fire     = $0716

icbm_phase   = $0708  ;$0705
icbm_anim    = $0709  ;$0726
icbm_timer   = $0709

kogyaru_state = $0705 ;see constants in kogyaru.asm
kogy_xTarget  = $0706 ;two bytes
kogy_ph_stat  = $0708 ;special status flag used in certain phases, like adbuction
kogyaru_anim  = $0709
kogy_vicnum   = $0712

c_kogy_timer  = $0713
c_kogy_anim   = $0715

wvictim_num   = $070D
wvictim_anim  = $070C

meteor_anim   = $0712

ring_anim     = $070E
ring_counter  = $070F

item_type     = $0701
item_SMap_loc = $0705


;;;;;;;;;;;;;;;;;;;;;;;;
;;boss objects constants

;remember $0700 & $0701 are what set the ignore chunk.

;;universal;;
building_x      = $0702
building_y      = $0703
bldg_SMap_pos   = $0704   ;16 bytes

;;boss 1;;
top_prop_x      = $0714
top_prop_y      = $0715
top_prop_aframe = $0716
tprop_SMap_pos1 = $0717
tprop_SMap_pos2 = $0718

fwd_prop_x      = $0719
fwd_prop_y      = $071A
fwd_prop_aframe = $071B
fprop_SMap_pos1 = $071C
fprop_SMap_pos2 = $071D

;;boss 2;;
boss2_anim_counter = $0714  ;highest bit = current frame, low 7 bits = counter
bldg_explode_ctrl  = $0715  ;highest bit = activation bit, low 7 bits = counter
lasr_SMap_pos      = $0716  ;8 bytes
lasr_x             = $071E
lasr_y             = $071F
lasr_width         = $0720
lasr_height        = $0721
lasr_timer         = $0722
boss2_mouth        = $0723  ;status byte of the boss's mouth animation
lasr_status        = $0724  ;bit 7 = on/off flag, bit 6-4 offscreen timer (0-6 seconds)
                            ;bit 3 = stop growing flag, low 3 bits = length (0-7 tiles)
;;boss 3;;
hamcycle_x         = $0704
hamcycle_y         = $0705
hamdelta_x         = $0706
hamdelta_y         = $0707
hamvert            = $0708  ;vertical direction
hamcycle_timer     = $0709  ;controls when the hammer & cycle spawns
hamcycle_anim      = $070A  ;animation timer
stalin_mouth_cntr  = $070B  ;flag to determine if ms's mouth is open and counter to control how long it's open

;;boss 4;;
kogy_anim_frame    = $0704
kogy_SMap_loc      = $0705
kogy_spritex       = $0706
kogy_map_xLO       = $0707
kogy_map_xHI       = $0708
klaser_stat        = $0709
klaser_death_count = $070A
klaser_SMap_loc    = $070B
shuttle_SMap_loc   = $070C
fb_kogy_vicnum     = $070D

;;kogy_chase
ossan_chase        = $0702  ;this is ossan's horizontal progress accross the chase
                            ;screen. HI byte determines his horiz screen position


;;THERE'S NO MORE RAM, YOU SON OF A BITCH!!!  DID YOU HERE ME?!!?!
;;STOP CRAMMING YOUR BULLSHIT USELESS NUMBERS THAT YOU HALF-THINK ABOUT
;;IN THIS SPACE!!!  'CAUSE WE'RE ALL OUT OF RAM, NO THANKS TO YOUR
;;FAT, LOUTISH ASS THAT JUST LEAVES STUFF LAYING AROUND WITHOUT A CARE
;;IN THE WORLD FOR ANYONE ELSE!!!  WELL IT'S GONE NOW!!!  ALL 


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
STATE_CUTSCENE = $08
STATE_CREDITS  = $09

;; Trajectory Constants

WAVE_MISSILE_LV4  = $00
BOSS1_MISSILE     = $01

;; Bonus hanlder constants

bonus_score     = $80
bonus_time      = $00