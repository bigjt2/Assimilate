;1-Object Type
;2-movement type
;3-movement direction (no need to use if doing vertical movement, just store y delta as positive or negative)
;       (still enter right or left if using trajectory, because the animation subs require it)
;4-camera - start at left or right (or if starting at Ossan's x coord, write that here)
;       (if using boss coords during a boss fight, enter that here)
;5-starting x coord - relative to camera selected above (leave $00 is starting at Ossan's x coord)
;       (if using boss coords during boss fight, enter which set of boss coords here)
;6-starting y coord - (if starting at Ossan's y, write that here)
;7-x delta - (leave $00 if moving strait up or down)
;8-y delta - (enter high byte of obj destroy if moving strait left or right, or trajectory)
;9-y delta change, or "speed" - (high four bits get added to y delta's low byte, low four bits get added to it's high byte)
;        (enter low byte of destroy if moving horizontal or trajectory.)


;examples:

;  .db missile,wave_rt2lft,left,RgtCam,$08,$80,$00,$01,$08
;  .db missile,wave_lft2rt,right,LftCam,$00,$80,$00,$01,$00
;  .db fireball,mv_horiz,right,LftCam,$F0,st_ship_y,$01,$01,$10
;  .db fireball,mv_horiz,left,RgtCam,$10,st_ship_y,$02,$01,$0C
;  .db fireball,mv_vert,up,st_ship_x,$00,$DF,$00,$FE,$00
;  .db fireball,mv_angle,right,LftCam,$F0,$88,$04,$FE,$00
;  .db fireball,mv_parabola,right,LftCam,$F0,$DF,$03,$FC,$40
;  .db fireball,mv_parabola,left,RgtCam,$F0,$DF,$03,$FC,$40

;  .db item,RgtCam,$A0, end,end,end


;;;;;;;;;;;;;;;;;;;;;
;;Object Tables
;;;;;;;;;;;;;;;;;;;;;

level_object_index:
  .dw lvl0_obj
  .dw lvl1_obj,lvl2_obj,lvl3_obj,lvl4_obj,boss1_obj
  .dw lvl6_obj,lvl7_obj,lvl8_obj,lvl9_obj,lvl10_obj,boss2_obj
  .dw lvl12_obj,lvl13_obj,lvl14_obj,lvl15_obj,lvl16_obj,boss3_obj
  .dw lvl18_obj,lvl19_obj,lvl20_obj,lvl21_obj,boss4_obj,finl_boss_obj
  .dw cow_lvl,campout_lvl

lvl0_obj:
  .db EOD
lvl1_obj:
  .db end
  .db fireball,mv_parabola,right,LftCam,$1E,$DF,$02,$FC,$1A
  .db end_rpt, $03
  .db fireball,mv_parabola,left,RgtCam,$E2,$DF,$02,$FC,$1A
  .db end, item,LftCam,$28, end
  .db fireball,mv_parabola,right,LftCam,$1E,$DF,$02,$FB,$18
  .db end_rpt, $03
  .db fireball,mv_parabola,left,RgtCam,$E2,$DF,$02,$FB,$18
  .db end, item,RgtCam,$E8, end
  .db EOD
lvl2_obj:
  .db end_rpt,$03
  .db fireball,mv_parabola,left,RgtCam,$F0,$DF,$02,$FC,$0B, end
  .db fireball,mv_parabola,left,RgtCam,$A0,$DF,$02,$FC,$18
  .db end_rpt,$03
  .db item,LftCam,$48, end
  .db fireball,mv_parabola,right,LftCam,$40,$DF,$02,$FC,$18, end
  .db fireball,mv_parabola,right,LftCam,$10,$DF,$02,$FC,$18, end
  .db fireball,mv_parabola,right,LftCam,$50,$DF,$02,$FB,$18, next
  .db EOD
lvl3_obj:
  .db end_rpt,$03
  .db fireball,mv_parabola,right,LftCam,$04,$DF,$03,rand,$10, end
  .db fireball,mv_angle,left,RgtCam,$10,$88,$04,$FE,$00
  .db end, end
  .db item,RgtCam,$B0
  .db end, end
  .db fireball,mv_parabola,left,RgtCam,$FC,$DF,$03,rand,$10, end
  .db fireball,mv_angle,right,LftCam,$F0,$88,$04,$FE,$00, next
  .db EOD
lvl4_obj:
  .db end_rpt,$03
  .db missile,wave_lft2rt,right,LftCam,$F0,$80,$00,$00,$80, end
  .db missile,mv_horiz,left,RgtCam,$08,st_ship_y,$02,$00,80, end
  .db item,LftCam,$20
  .db end_rpt,$03
  .db missile,mv_horiz,right,LftCam,$F8,$80,$02,$00,$80, end
  .db missile,wave_rt2lft,left,RgtCam,$10,$58,$00,$00,$80
  .db end_rpt,$03
  .db missile,mv_horiz,left,RgtCam,$08,$40,$02,$00,$80, end
  .db missile,mv_horiz,left,RgtCam,$08,$68,$02,$00,$80, end
  .db missile,mv_horiz,left,RgtCam,$08,$90,$02,$00,$80, end
  .db item,RgtCam,$E0, next
  .db EOD


;  .db end_rpt,$03
;  .db missile,wave_lft2rt,right,LftCam,$F0,$80,$00,$01,$00, end
;  .db missile,mv_horiz,left,RgtCam,$08,st_ship_y,$02,$00,$F8, end
;  .db item,LftCam,$20
;  .db end_rpt,$03
;  .db missile,mv_horiz,right,LftCam,$F8,$80,$02,$00,$F8, end
;  .db missile,wave_rt2lft,left,RgtCam,$10,$58,$00,$01,$00
;  .db end_rpt,$03
;  .db missile,mv_horiz,left,RgtCam,$08,$40,$02,$01,$08, end
;  .db missile,mv_horiz,left,RgtCam,$08,$68,$02,$01,$08, end
;  .db missile,mv_horiz,left,RgtCam,$08,$90,$02,$01,$08, end
;  .db item,RgtCam,$E0, next
;  .db EOD
boss1_obj:
  .db end, end_rpt, $03
  .db fireball,mv_horiz,left,st_boss_coords,$00,$D0,$02,$00,$60, end
  .db fireball,mv_angle,left,st_boss_coords,$00,$D0,$02,$FE,$00, end
  .db fireball,mv_angle,left,st_boss_coords,$00,$D0,$02,$FC,$00, end
  .db item,LftCam,$20, end
  .db end_rpt, $17
  .db missile,bs1_mssl_traj,left,st_boss_coords,$01,$80,$00,$00,$60, end_rpt, $0A
  .db missile,wave_rt2lft,left,st_boss_coords,$01,$80,$00,$00,$60, end_rpt,$03, end
  .db EOD
lvl6_obj:
  .db end
  .db end_rpt, $13
  .db dragon,$30,$E0, end
  .db item,LftCam,$20, end_rpt, $11
  .db dragon,$30,$E0, end
  .db item,RgtCam,$D0, end
;  .db missile,mv_horiz,left,RgtCam,$10,$40,$03,$01,$0C, end_rpt, $03
;  .db missile,mv_horiz,right,LftCam,$F0,$60,$03,$01,$10, end_rpt, $03
;  .db missile,mv_horiz,left,RgtCam,$10,$80,$03,$01,$0C, end_rpt, $03
;  .db missile,mv_horiz,right,LftCam,$F0,$A0,$03,$01,$10, end_rpt, $03
;  .db missile,mv_horiz,left,RgtCam,$10,$C0,$03,$01,$0C, end_rpt, $03
;  .db item,LftCam,$20, end
;  .db missile,mv_horiz,right,LftCam,$F0,$E0,$03,$01,$10, next
;  .db missile,mv_horiz,left,RgtCam,$10,$50,$03,$01,$0C, end_rpt, $03
;  .db missile,mv_horiz,right,LftCam,$F0,$70,$03,$01,$10, end_rpt, $03
;  .db missile,mv_horiz,left,RgtCam,$10,$90,$03,$01,$0C, end_rpt, $03
;  .db missile,mv_horiz,right,LftCam,$F0,$B0,$03,$01,$10, end_rpt, $03
;  .db missile,mv_horiz,left,RgtCam,$10,$48,$03,$01,$0C, end_rpt, $03
;  .db item,RgtCam,$D0, end
  .db EOD
lvl7_obj:
  .db end
  .db missile,mv_horiz,left,RgtCam,$10,$40,$03,$01,$0C, end, end
  .db missile,mv_horiz,right,LftCam,$F0,$60,$03,$01,$10, end, end
  .db missile,mv_horiz,left,RgtCam,$10,$80,$03,$01,$0C, end, end
  .db missile,mv_horiz,right,LftCam,$F0,$A0,$03,$01,$10, end, end
  .db missile,mv_horiz,left,RgtCam,$10,$C0,$03,$01,$0C, end, end
  .db item,LftCam,$20, end
  .db missile,mv_horiz,right,LftCam,$F0,$E0,$03,$01,$10, next
  .db missile,mv_horiz,left,RgtCam,$10,$50,$03,$01,$0C, end, end
  .db missile,mv_horiz,right,LftCam,$F0,$70,$03,$01,$10, end, end
  .db missile,mv_horiz,left,RgtCam,$10,$90,$03,$01,$0C, end, end
  .db missile,mv_horiz,right,LftCam,$F0,$B0,$03,$01,$10, end, end
  .db missile,mv_horiz,left,RgtCam,$10,$48,$03,$01,$0C, end, end
  .db item,RgtCam,$D0, end
  .db dragon,$30,$E0, end
  .db EOD
lvl8_obj:
  .db end_rpt, $1E
  .db missile,mv_horiz,left,RgtCam,$10,$40,$02,$01,$0C, next
  .db missile,mv_horiz,left,RgtCam,$10,$60,$02,$01,$0C, end
  .db missile,mv_horiz,left,RgtCam,$10,$50,$02,$01,$0C, next
  .db missile,mv_horiz,left,RgtCam,$10,$70,$02,$01,$0C, end
  .db item,RgtCam,$C0,end
  .db end_rpt, $1F
  .db missile,mv_horiz,left,RgtCam,$10,$40,$02,$01,$0C, next
  .db missile,mv_horiz,left,RgtCam,$10,$60,$02,$01,$0C, end
  .db missile,mv_horiz,left,RgtCam,$10,$50,$02,$01,$0C, next
  .db missile,mv_horiz,left,RgtCam,$10,$70,$02,$01,$0C, end
  .db end_rpt, $22
  .db missile,mv_horiz,left,RgtCam,$10,$40,$02,$01,$0C, next
  .db missile,mv_horiz,left,RgtCam,$10,$60,$02,$01,$0C, end
  .db missile,mv_horiz,left,RgtCam,$10,$50,$02,$01,$0C, next
  .db missile,mv_horiz,left,RgtCam,$10,$70,$02,$01,$0C, end
  .db EOD
lvl9_obj:
  .db end_rpt, $04
  .db missile,mv_horiz,left,RgtCam,$10,$70,$02,$01,$0C, end
  .db missile,mv_horiz,left,RgtCam,$10,$58,$02,$01,$0C, end
  .db missile,mv_horiz,left,RgtCam,$10,$40,$02,$01,$0C, end
  .db end_rpt, $1E
  .db item,LftCam,$20, end
  .db missile,mv_horiz,left,RgtCam,$10,$58,$02,$01,$0C, end
  .db missile,mv_horiz,left,RgtCam,$10,$70,$02,$01,$0C, end
  .db missile,mv_horiz,left,RgtCam,$10,$88,$02,$01,$0C, end_rpt, $12
  .db item,RgtCam,$D0, end_rpt, $04
  .db dragon,$30,$E0, end
  .db EOD
lvl10_obj:
  .db end
  .db missile,mv_horiz,left,RgtCam,$10,$40,$03,$FE,$FE, end
  .db missile,mv_horiz,right,LftCam,$F0,$60,$03,$FE,$FE, end
  .db missile,mv_horiz,left,RgtCam,$10,$80,$02,$FE,$FE, end
  .db missile,mv_horiz,right,LftCam,$F0,$A0,$02,$FE,$FE, end
  .db missile,mv_horiz,left,RgtCam,$10,$C0,$03,$FE,$FE, end
  .db item,LftCam,$20, end
  .db missile,mv_horiz,right,LftCam,$F0,$E0,$03,$FE,$FE, next
  .db missile,mv_horiz,left,RgtCam,$10,$50,$02,$FE,$FE, end
  .db missile,mv_horiz,right,LftCam,$F0,$70,$02,$FE,$FE, end
  .db missile,mv_horiz,left,RgtCam,$10,$90,$03,$FE,$FE, end
  .db missile,mv_horiz,right,LftCam,$F0,$B0,$03,$FE,$FE, end
  .db missile,mv_horiz,left,RgtCam,$10,$48,$02,$FE,$FE, end
  .db item,RgtCam,$D0, end
  .db EOD
boss2_obj:
  .db end
  .db missile,mv_horiz,left,RgtCam,$10,$40,$02,$00,$78, end_rpt, $06
  .db missile,mv_horiz,right,LftCam,$F0,$60,$02,$00,$78, end_rpt, $08
  .db fireball,mv_parabola,left,RgtCam,$F0,$DF,$02,$FC,$0B, end_rpt, $0A
  .db fireball,mv_parabola,left,RgtCam,$A0,$DF,$02,$FC,$18, end_rpt, $09
  .db item,LftCam,$20, end_rpt, $09
  .db missile,mv_horiz,left,RgtCam,$10,$40,$02,$00,$78, end_rpt, $06
  .db missile,mv_horiz,right,LftCam,$F0,$60,$02,$00,$78, end_rpt, $08
  .db fireball,mv_parabola,left,RgtCam,$CC,$DF,$02,$FD,$0D, end_rpt, $0A
  .db fireball,mv_parabola,left,RgtCam,$20,$DF,$02,$FE,$04, end_rpt, $0A
  .db missile,mv_horiz,right,LftCam,$F0,$50,$02,$00,$78, end_rpt, $09
  .db EOD

;;ICBM's CAN ONLY HAVE MV_VERTICAL!!!
lvl12_obj:
   .db end

;missiles galore at top

  .db missile,mv_horiz,left,RgtCam,$00,$40,$03,$00,$78, end, end, end
  .db missile,mv_horiz,left,RgtCam,$00,$50,$03,$00,$78, end, end
  .db sputnik,mv_angle,left,RgtCam,$D4,$10,$01,$02,$00, end
  .db missile,mv_horiz,left,RgtCam,$00,$40,$02,$00,$78, end, end, end
  .db missile,mv_horiz,left,RgtCam,$00,$50,$02,$00,$78, end, end
  .db sputnik,mv_angle,right,LftCam,$2C,$10,$01,$02,$00, end
  .db missile,mv_horiz,left,RgtCam,$00,$40,$03,$00,$78, end, end, end
  .db missile,mv_horiz,left,RgtCam,$00,$50,$03,$00,$78, end, end
  .db item,RgtCam,$B8, end
  .db sputnik,mv_angle,left,RgtCam,$D4,$10,$01,$02,$00, end
  .db missile,mv_horiz,left,RgtCam,$00,$40,$02,$00,$78, end, end, end
  .db missile,mv_horiz,left,RgtCam,$00,$50,$02,$00,$78, end, end

  .db EOD
lvl13_obj:
  .db end
;REALLY HARD - perhaps experiment with different arches for the fireballs?
;fireballs arching high, migs in the middle
  .db fireball,mv_parabola,right,LftCam,$1E,$DF,$02,$FB,$18, end, end
  .db fireball,mv_parabola,left,RgtCam,$E2,$DF,$02,$FB,$18, end, end
  .db mig,mv_horiz,left,RgtCam,$10,$80,$02,$00,$90, end

  .db fireball,mv_parabola,right,LftCam,$1E,$DF,$02,$FB,$18, end, end
  .db fireball,mv_parabola,left,RgtCam,$E2,$DF,$02,$FB,$18, end, end
  .db item,LftCam,$28, end

  .db fireball,mv_parabola,right,LftCam,$1E,$DF,$02,$FB,$18, end, end
  .db fireball,mv_parabola,left,RgtCam,$E2,$DF,$02,$FB,$18, end, end
  .db mig,mv_horiz,left,RgtCam,$10,$90,$02,$00,$90, end

  .db fireball,mv_parabola,right,LftCam,$1E,$DF,$02,$FB,$18, end, end
  .db fireball,mv_parabola,left,RgtCam,$E2,$DF,$02,$FB,$18, end, end
  .db item,RgtCam,$D8, end

  .db EOD
lvl14_obj:
  .db end

;lots of missiles & icbm?
  .db missile,mv_horiz,left,RgtCam,$10,$40,$02,$FE,$FE, end
  .db missile,mv_horiz,right,LftCam,$F0,$60,$02,$FE,$FE, end
  .db missile,mv_horiz,left,RgtCam,$10,$80,$02,$FE,$FE, end
  .db missile,mv_horiz,right,LftCam,$F0,$A0,$02,$FE,$FE, end

  .db item,LftCam,$20, end

  .db missile,mv_horiz,left,RgtCam,$10,$50,$02,$FE,$FE, end
  .db missile,mv_horiz,right,LftCam,$F0,$70,$02,$FE,$FE, end
  .db missile,mv_horiz,left,RgtCam,$10,$90,$02,$FE,$FE, end

  .db missile,mv_horiz,left,RgtCam,$10,$48,$02,$FE,$FE, end_rpt, $08
  .db icbm,mv_vert,up,st_ship_x,$00,$9F,$00,$FE,$FE, end_rpt, $06
  .db item,RgtCam,$D0, end_rpt, $0B

  .db EOD
lvl15_obj:
  .db end

;icbm, and some fireballs
  .db fireball,mv_parabola,right,LftCam,$04,$DF,$03,rand,$10, end
  .db fireball,mv_parabola,left,RgtCam,$FC,$DF,$03,rand,$10, end_rpt, $03

  .db fireball,mv_parabola,right,LftCam,$04,$DF,$03,rand,$10, end
  .db fireball,mv_parabola,left,RgtCam,$FC,$DF,$03,rand,$10, end_rpt, $03

  .db fireball,mv_parabola,right,LftCam,$04,$DF,$03,rand,$10, end
  .db fireball,mv_parabola,left,RgtCam,$FC,$DF,$03,rand,$10, end_rpt, $03

  .db fireball,mv_parabola,right,LftCam,$04,$DF,$03,rand,$10, end
  .db fireball,mv_parabola,left,RgtCam,$FC,$DF,$03,rand,$10, end_rpt, $07

  .db icbm,mv_vert,up,st_ship_x,$00,$9F,$00,$FE,$FE, end_rpt, $08
  .db item,RgtCam,$C0, end_rpt, $08
  .db EOD

lvl16_obj:
  .db end
;mig in the middle. missiles at top, sputnik crashing past the middle.

  .db sputnik,mv_angle,left,RgtCam,$D0,$10,$02,$03,$1A, end_rpt, $04
  .db mig,mv_horiz,left,RgtCam,$10,$30,$02,$00,$90, end_rpt, $08
  .db sputnik,mv_angle,right,LftCam,$28,$10,$02,$03,$1A, end_rpt, $02
  .db item,LftCam,$48, end
  .db EOD

boss3_obj:
  .db end, end, end
  .db missile,mv_parabola,left,st_boss_coords,$01,$80,$02,$FE,$20, end_rpt, $05  ;lowes arc
  .db missile,mv_parabola,left,st_boss_coords,$01,$80,$03,$FD,$28, end_rpt, $05
  .db missile,mv_parabola,left,st_boss_coords,$01,$80,$03,$FD,$18, end_rpt, $10
  .db fireball,mv_angle,left,st_boss_coords,$00,$D0,$05,$FF,$00, end
  .db fireball,mv_horiz,left,st_boss_coords,$00,$D0,$05,$00,$00, end
  .db fireball,mv_angle,left,st_boss_coords,$00,$D0,$05,$01,$00, end
  .db fireball,mv_angle,left,st_boss_coords,$00,$D0,$04,$02,$00, end
  .db fireball,mv_angle,left,st_boss_coords,$00,$D0,$04,$03,$00, end_rpt, $14
  .db item,LftCam,$20, end
  .db EOD

lvl18_obj:
  .db end
; space ship going in wavey pattern at top.
; kogyaru?

  .db fireball,mv_parabola,right,LftCam,$1E,$DF,$02,$FB,$18, end, end
  .db fireball,mv_parabola,left,RgtCam,$E2,$DF,$02,$FB,$18, end, end
;  .db spc_ship,mv_horiz,left,RgtCam,$10,$80,$02,$00,$90, end
  .db spc_ship,wave_rt2lft,left,RgtCam,$10,$80,$02,$FE,$FE, end

  .db fireball,mv_parabola,right,LftCam,$1E,$DF,$02,$FB,$18, end, end
  .db fireball,mv_parabola,left,RgtCam,$E2,$DF,$02,$FB,$18, end, end
  .db item,LftCam,$28, end

;  .db spc_ship,mv_horiz,left,RgtCam,$10,$90,$02,$00,$90, end
  .db spc_ship,wave_lft2rt,right,LftCam,$F0,$90,$02,$FE,$FE, end
  .db fireball,mv_parabola,right,LftCam,$1E,$DF,$02,$FB,$18, end, end
  .db fireball,mv_parabola,left,RgtCam,$E2,$DF,$02,$FB,$18, end, end
  .db EOD

lvl19_obj:
  .db end
;kogyaru at top, missiles at upper portions of the screen

  .db kogyaru,$E0,$36, end

  .db missile,mv_parabola,left,RgtCam,$FC,$DF,$03,rand,$10, end, end
  .db fireball,mv_parabola,right,LftCam,$1E,$DF,$02,$FC,$1A, end, end
  .db fireball,mv_parabola,left,RgtCam,$E2,$DF,$02,$FC,$1A, end, end
  .db missile,mv_parabola,right,LftCam,$04,$DF,$03,rand,$10, end, end
  .db missile,lvl19_lft2rt,right,LftCam,$F0,$5C,$00,$00,$80, end, end
  .db missile,lvl19_rt2lft,left,RgtCam,$10,$5C,$00,$00,$80, end, end
  .db item,LftCam,$28, end

  .db fireball,mv_parabola,left,RgtCam,$E2,$DF,$02,$FC,$1A, end
  .db fireball,mv_parabola,right,LftCam,$1E,$DF,$02,$FC,$1A, end, end
  .db fireball,mv_parabola,left,RgtCam,$E2,$DF,$02,$FC,$1A, end, end
  .db missile,mv_parabola,right,LftCam,$04,$DF,$03,rand,$10, end, end
  .db item,RgtCam,$D8, end
  .db EOD

lvl20_obj:
  .db end
;kogyaru, and meteor shower!!!
  .db kogyaru,$E0,$36, end

  .db meteor,mv_angle,left,LftCam,$50,$10,$02,$02,$10, end 
  .db meteor,mv_angle,left,RgtCam,$90,$10,$01,$02,$10, end
  .db meteor,mv_angle,left,RgtCam,$E8,$10,$02,$03,$10, end_rpt, $03
  .db meteor,mv_angle,left,LftCam,$40,$10,$01,$03,$10, end
  .db meteor,mv_angle,left,RgtCam,$C0,$10,$02,$03,$10, end_rpt, $03

  .db meteor,mv_angle,right,LftCam,$F0,$10,$02,$02,$10, end
  .db meteor,mv_angle,right,LftCam,$18,$10,$01,$02,$10, end
  .db meteor,mv_angle,right,LftCam,$40,$10,$02,$02,$10, end_rpt, $03
  .db meteor,mv_angle,right,LftCam,$68,$10,$01,$02,$10, end
  .db meteor,mv_angle,right,RgtCam,$90,$10,$02,$02,$10, end_rpt, $03

;originally these two above plus the item

  .db meteor,mv_angle,left,RgtCam,$DA,$10,$02,$03,$10, end, end
  .db meteor,mv_angle,right,LftCam,$22,$10,$02,$03,$10, end_rpt, $04

  .db meteor,mv_angle,right,LftCam,$08,$10,$01,$02,$40, end, end
  .db meteor,mv_angle,right,LftCam,$38,$10,$01,$02,$40, end, end
  .db meteor,mv_angle,right,LftCam,$68,$10,$01,$02,$40, end, end
  .db meteor,mv_angle,right,RgtCam,$90,$10,$01,$02,$10, end_rpt, $03

  .db item,RgtCam,$D8, end
  .db EOD

lvl21_obj:
  .db end

;GRAND FINALE!  Kogyaru, ships in wavey patterns, missiles, fireballs, meteors...
;... THE WORKS!!!
  .db kogyaru,$E0,$36, end

  .db spc_ship,lvl21_lft2rt,right,LftCam,$90,$80,$00,$00,$80, end_rpt, $05

  .db fireball,mv_parabola,left,RgtCam,$10,$DF,$02,$FC,$0B, end
  .db fireball,mv_parabola,left,RgtCam,$F0,$DF,$02,$FC,$0B, end
  .db fireball,mv_parabola,left,RgtCam,$D0,$DF,$02,$FC,$0B, end
  .db fireball,mv_parabola,left,RgtCam,$B0,$DF,$02,$FC,$0B, end
  .db fireball,mv_parabola,left,RgtCam,$81,$DF,$02,$FC,$0B, end_rpt, $04

  .db missile,mv_parabola,right,LftCam,$04,$DF,$03,rand,$10, end_rpt, $04

  .db fireball,mv_parabola,right,LftCam,$00,$DF,$02,$FC,$0B, end
  .db fireball,mv_parabola,right,LftCam,$18,$DF,$02,$FC,$0B, end
  .db fireball,mv_parabola,right,LftCam,$30,$DF,$02,$FC,$0B, end
  .db fireball,mv_parabola,right,LftCam,$48,$DF,$02,$FC,$0B, end_rpt, $04

  .db missile,mv_parabola,left,RgtCam,$FC,$DF,$03,rand,$10, end_rpt, $04

  .db meteor,mv_angle,left,RgtCam,$B8,$10,$02,$03,$1A, end
  .db meteor,mv_angle,right,LftCam,$E8,$10,$02,$03,$1A, end
  .db meteor,mv_angle,right,LftCam,$48,$10,$02,$03,$1A, end
  .db meteor,mv_angle,left,RgtCam,$E8,$10,$02,$03,$1A, end
  .db meteor,mv_angle,right,RgtCam,$A8,$10,$02,$03,$1A, end

  .db spc_ship,lvl21_rt2lft,left,RgtCam,$70,$80,$00,$00,$80, end_rpt, $05

  .db missile,mv_parabola,right,LftCam,$04,$DF,$03,rand,$10, end_rpt, $04

  .db missile,mv_parabola,left,RgtCam,$FC,$DF,$03,rand,$10, end_rpt, $04

  .db meteor,mv_angle,left,RgtCam,$B8,$10,$02,$03,$1A, end, end
  .db meteor,mv_angle,right,LftCam,$E8,$10,$02,$03,$1A, end, end
  .db meteor,mv_angle,right,LftCam,$48,$10,$02,$03,$1A, end, end
  .db meteor,mv_angle,left,RgtCam,$E8,$10,$02,$03,$1A, end, end
  .db meteor,mv_angle,right,RgtCam,$A8,$10,$02,$03,$1A, end, end
  .db meteor,mv_angle,left,LftCam,$30,$10,$02,$03,$1A, end_rpt, $04
  .db EOD

boss4_obj:
  .db c_kogyaru,c_kog_path,left,RgtCam,$D0,$80,$00,$00,$80, end_rpt,$06
  .db meteor,mv_angle,right,LftCam,$E8,$10,$02,$03,$1A, end, end
  .db meteor,mv_angle,right,LftCam,$48,$10,$02,$03,$1A, end, end
  .db meteor,mv_angle,right,RgtCam,$88,$10,$02,$03,$1A, end, end
  .db end_rpt,$06
  .db meteor,mv_angle,left,RgtCam,$E8,$10,$02,$03,$1A, end, end
  .db meteor,mv_angle,left,RgtCam,$A8,$10,$02,$03,$1A, end, end
  .db meteor,mv_angle,left,LftCam,$78,$10,$02,$03,$1A, end, end
  .db end_rpt,$06
  .db meteor,mv_angle,right,LftCam,$F8,$10,$02,$03,$1A, end, end
  .db meteor,mv_angle,right,LftCam,$38,$10,$02,$03,$1A, end, end
  .db meteor,mv_angle,right,LftCam,$78,$10,$02,$03,$1A, end, end
  .db end_rpt,$06
  .db meteor,mv_angle,left,RgtCam,$E8,$10,$02,$03,$1A, end, end
  .db meteor,mv_angle,left,RgtCam,$A8,$10,$02,$03,$1A, end, end
  .db meteor,mv_angle,left,LftCam,$78,$10,$02,$03,$1A, end, end
  .db EOD

finl_boss_obj:
  .db end, end_rpt,$0A

  .db ring,ring_path,left,st_boss_coords,$01,$D0,$01,$01,$00, end_rpt,$06
  .db ring,ring_path,left,st_boss_coords,$00,$D0,$01,$01,$00, end, end

  .db fireball,mv_angle,left,st_boss_coords,$03,$DF,$02,$01,$0B, end_rpt,$05
  .db fireball,mv_angle,left,st_boss_coords,$02,$DF,$02,$01,$0B, end_rpt,$05
  .db fireball,mv_angle,right,st_boss_coords,$03,$DF,$02,$FE,$30, end, end
  .db fireball,mv_horiz,right,st_boss_coords,$02,$DF,$02,$01,$0B, end_rpt,$38

  .db fireball,mv_angle,right,st_boss_coords,$02,$DF,$01,$01,$40, end_rpt,$06
  .db fireball,mv_angle,right,st_boss_coords,$03,$DF,$01,$01,$80, end_rpt,$06

  .db ring,ring_path,left,st_boss_coords,$01,$D0,$01,$01,$00, end_rpt,$05
  .db ring,ring_path,left,st_boss_coords,$00,$D0,$01,$01,$00, end_rpt,$05

  .db fireball,mv_angle,right,st_boss_coords,$03,$DF,$02,$01,$0B, end_rpt,$06
  .db fireball,mv_angle,right,st_boss_coords,$02,$DF,$02,$01,$0B, end_rpt,$06
  .db fireball,mv_angle,left,st_boss_coords,$03,$DF,$02,$FE,$30, end, end
  .db fireball,mv_horiz,left,st_boss_coords,$02,$DF,$02,$01,$0B, end_rpt,$06

  .db w_victim,mv_parabola,left,st_boss_coords,$04,$DF,$04,$FE,$70, next
  .db w_victim,mv_parabola,left,st_boss_coords,$04,$DF,$03,$FE,$70, end
  .db w_victim,mv_parabola,left,st_boss_coords,$04,$DF,$02,$FE,$78, next
  .db w_victim,mv_parabola,left,st_boss_coords,$04,$DF,$01,$FE,$80, end

  .db w_victim,mv_parabola,right,st_boss_coords,$05,$DF,$04,$FE,$70, next
  .db w_victim,mv_parabola,right,st_boss_coords,$05,$DF,$03,$FE,$78, end
  .db w_victim,mv_parabola,right,st_boss_coords,$05,$DF,$02,$FE,$78, next
  .db w_victim,mv_parabola,right,st_boss_coords,$05,$DF,$01,$FE,$80, end

  .db EOD

cow_lvl:
  .db end, end_rpt, $0F
  .db item,LftCam,$40, end, end_rpt, $0F
  .db item,RgtCam,$C0, end
  .db EOD
campout_lvl:
  .db end, end_rpt, $09
  .db item,LftCam,$40, end, end_rpt, $05
  .db van,mv_horiz,left,RgtCam,$08,$D0,$02,$01,$00, end, end_rpt, $05
  .db item,RgtCam,$C0, end
  .db EOD

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Object_Init_Jumptable:
  .dw $0000, init_EOD, init_fireball, init_missile, init_dragon
  .dw init_van, init_mig, init_mig, init_icbm, init_kogyaru
  .dw init_weapon_victim, init_sputnik, init_meteor, init_ring
  .dw init_c_kogyaru, init_fireball

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Object_Run_Jumptable:
  .dw $0000, $1111, run_fireball, run_missile, run_dragon
  .dw run_van, run_mig, run_mig, run_icbm, run_kogyaru
  .dw run_weapon_victim, run_sputnik, run_meteor, run_ring
  .dw run_c_kogyaru, run_fireball

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
NonEn_Init_Jumptable:
  .dw init_item

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
NonEn_Run_Jumptable:
  .dw run_item

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
level_object_speeds:
  .db $00
  .db $09,$09,$09,$09,$32         ;Western Area
  .db $0A,$0A,$32,$32,$0A,$38     ;Asian Area
  .db $0C,$0C,$0C,$0C,$0C,$38     ;Soviet Area
  .db $0C,$0C,$0C,$0C,$0C,$30     ;Moon Area
  .db $09,$08                     ;Bonus Levels

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
movement_types:   ;jump table
  .dw angle, parabola, horizontal_mv, vertical_mv, trajectory

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
obj_rand_tables:
  .dw x_delta_table, y_delta_table, yd_speed_table

x_delta_table:
  .db $03,$02,$03,$02,$04,$03,$04,$FF

y_delta_table:
  .db $F9,$F9,$FA,$FD,$FA,$FA,$FB,$FB,$FC,$FC,$FF

yd_speed_table:
  .db $08,$10,$0A,$10,$08,$0D,$10,$04,$08,$0D,$1A,$FF

;;;;;;;;;;;
;CONSTANTS
;;;;;;;;;;;

;;Object Types
fireball  = $02
missile   = $03
dragon    = $04
van       = $05
mig       = $06
spc_ship  = $07
icbm      = $08
kogyaru   = $09
w_victim  = $0A
sputnik   = $0B
meteor    = $0C
ring      = $0D
c_kogyaru = $0E
fall_fb   = $0F


;;Non-Enemy Object Types
item = $80

;;Opcodes
end = $00     ;not really necessary for table, hardcoded into Object_Handler sub.
EOD = $01
end_rpt =$FB
ignore = $FC

next = $FF

;;Directions
left = $00
right = $01
up = $02
down =$03
LftCam = $00
RgtCam = $01


;;Movement Types
;basic
mv_angle = $00
mv_parabola = $01
mv_horiz = $02
mv_vert = $03

;;Misc.
rand = $79   ;signifies a number should be pulled from appropriate random table
rand_xd = $00
rand_yd = $01
rand_ydspd = $02

st_boss_coords = $2D  ;start at a predetermined set of coordinates established in current boss's init
st_ship_x = $2E  ;start object at ship's x position
st_ship_y = $2F  ;start object at ship's y position

;;;;;;;;;;;;;;;;;;;;;;;;
;;Trajectory Constants

wave_rt2lft = $80
wave_lft2rt = $81
bs1_mssl_traj = $82
lvl19_rt2lft = $83
lvl19_lft2rt = $84
lvl21_rt2lft = $85
lvl21_lft2rt = $86
c_kog_path   = $87
ring_path    = $88


;;;;;;;;;;;;;;;;;;;;;
;;Trajectory Tables
;;;;;;;;;;;;;;;;;;;;;

traj_tables_x:
  .dw wave_rt_to_lf_x, wave_lf_to_rt_x, boss1_mssl_x
  .dw lvl19_rt2lft_x, lvl19_lft2rt_x, lvl21_rt2lft_x, lvl21_lft2rt_x
  .dw c_kog_path_x, ring_path_x

traj_tables_y:
  .dw wave_rt_to_lf_y, wave_rt_to_lf_y, boss1_mssl_y
  .dw lvl19_rt2lft_y, lvl19_rt2lft_y, lvl21_rt2lft_y, lvl21_rt2lft_y
  .dw c_kog_path_y, ring_path_y

;;;;;;;;;;;;;;;;;;;;;;;;;
wave_rt_to_lf_x:
  .db $FE,$80
wave_rt_to_lf_y:
  .db $02,$02,$02,$02
  .db $04,$04,$04,$04
  .db $06,$06,$06,$06
  .db $02,$02,$02,$02
  .db $FE,$FE,$FE,$FE
  .db $FA,$FA,$FA,$FA
  .db $FC,$FC,$FC,$FC
  .db $FE,$FE,$FE,$FE,$80

;;;;;;;;;;;;;;;;;;;;;;;;;
wave_lf_to_rt_x:
  .db $02,$80
  ;;x direction changes, but y movement remains the same, so I just
  ;;use the same y table as wave_rt_to_lf to save space.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
boss1_mssl_x:
  .db $FE,$80
boss1_mssl_y:
  .db $FB,$FB,$FB,$FC,$FC,$FD,$FD,$FE,$FE,$FF,$FF
  .db $FF,$FF,$FE,$FF,$FF,$FE,$FF,$FE,$FD,$FD,$FD,$00,$81

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
lvl19_rt2lft_x:
  .db $FE,$80
lvl19_rt2lft_y:
  .db $FF,$FF,$FF,$FF
  .db $FD,$FD,$FD,$FD
  .db $FD,$FD,$FD,$FD
  .db $FF,$FF,$FF,$FF
  .db $01,$01,$01,$01
  .db $03,$03,$03,$03
  .db $03,$03,$03,$03
  .db $01,$01,$01,$01,$01,$80

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
lvl19_lft2rt_x:
  .db $02,$80
  ;;x direction changes, but y movement remains the same, so I just
  ;;use the same y table as wave_rt_to_lf to save space.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
lvl21_rt2lft_x:
  .db $FE,$80

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
lvl21_rt2lft_y:
  .db $FF,$FF,$FF,$FF
  .db $FD,$FD,$FD,$FD
  .db $F9,$F9,$F9,$F9
  .db $F9,$F9,$F9,$F9
  .db $FD,$FD,$FD,$FD
  .db $FF,$FF,$FF,$FF
  .db $01,$01,$01,$01
  .db $03,$03,$03,$03
  .db $07,$07,$07,$07
  .db $07,$07,$07,$07
  .db $03,$03,$03,$03
  .db $01,$01,$01,$01,$01,$80

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
lvl21_lft2rt_x:
  .db $02,$80
  ;;x direction changes, but y movement remains the same, so I just
  ;;use the same y table as wave_rt_to_lf to save space.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
c_kog_path_x:
  .db $FF,$FF,$FF,$FF
  .db $01,$01,$01,$01,$01
  .db $FF,$FF,$FF,$FF,$FF,$01,$01,$01,$01,$01,$FF,$FF,$FF,$FF,$FF,$01,$01,$01,$01,$01
  .db $FF,$FF,$FF,$FF,$FF,$01,$01,$01,$01,$01,$FF,$FF,$FF,$FF,$FF,$01,$01,$01,$01,$01
  .db $FF,$FF,$FF,$FF,$FF,$01,$01
  .db $FF,$FF,$FF,$01,$01,$01
  .db $01,$01,$01,$FF,$01
  .db $FF,$FF,$FF,$01,$01,$01,$FF,$FF,$FF,$01,$01,$01
  .db $FF,$FF,$FF,$FF,$FF,$01,$01
  .db $01,$01,$01,$FF,$01
  .db $80

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
c_kog_path_y:
  .db $01,$01,$01,$01,$01,$01,$01,$01
  .db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
  .db $80

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ring_path_x:
  .db $FF,$FE,$FE,$FE,$FE,$FE,$FE
  .db $FD,$FD,$FD,$FD,$FD,$FD,$FD,$FD
  .db $FD,$FD,$FD,$FD,$FD,$FD,$FD,$FD,$FD,$FD
  .db $FE,$FE,$FE,$FE,$FE,$FE,$FF,$FF

  .db $01,$01,$02,$02,$02,$02,$02,$02
  .db $03,$03,$03,$03,$03,$03,$03,$03,$03,$03
  .db $03,$03,$03,$03,$03,$03,$03,$03
  .db $02,$02,$02,$02,$02,$02,$01,$01
  .db $80

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ring_path_y:
  .db $FC,$FD,$FD,$FD,$FE,$FE,$FE,$FE,$FF,$FF,$FF,$FF,$FF
  .db $00,$00,$00,$00
  .db $01,$01,$01,$01,$01,$02,$02,$02,$02,$03,$03,$03,$04,$04,$04,$04
  .db $04,$04,$03,$03,$03,$02,$02,$02,$02,$01,$01,$01,$01,$01
  .db $00,$00,$00,$00
  .db $FF,$FF,$FF,$FF,$FE,$FE,$FE,$FE,$FD,$FD,$FD,$FC,$FC,$FC,$FC,$FC
  .db $80


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Memory Requirement Tables
;;;;;;;;;;;;;;;;;;;;;;;;;;;

enemy_mem_reqs:
  .db $00,$00
  .db fball_Mreq, missile_Mreq, dragon_Mreq, van_Mreq
  .db mig_Mreq, sship_Mreq, icbm_Mreq, kogyaru_Mreq
  .db wvict_Mreq, sputnik_Mreq, meteor_Mreq, ring_Mreq
  .db c_kogyaru_Mreq, fallball_Mreq

non_enemy_mem_reqs:
  .db item_Mreq


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Memory Requirements Constants

;;Enemies
fball_Mreq = $0C
missile_Mreq = $0F
dragon_Mreq = $11
van_Mreq = $12
mig_Mreq = $17
sship_Mreq = $17
icbm_Mreq = $24
kogyaru_Mreq = $13
wvict_Mreq = $0E
sputnik_Mreq = $12
meteor_Mreq = $13
ring_Mreq = $10
c_kogyaru_Mreq = $16
fallball_Mreq = $0C

;;Non-Enemies
item_Mreq = $09
;prop_Mreq = $xx