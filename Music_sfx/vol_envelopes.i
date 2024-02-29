;Duty Setting Notes:
;Remember that for this engine, bits 4 & 5 must always be set to 1
;so internal saw envelopes and length counters are disabled.

;Therefore, the four duty setings that make up the high four bits of each byte
;are as follows:

;00 = $3_
;01 = $7_
;02 = $B_
;03 = $F_


;;;;;;;;;;;;;;;;;;;;
volume_envelopes:
;test
    .word se_derek_long
    .word se_derek_sweep
    .word se_derekdrum1
    .word se_derekdrum2
    .word se_drum_silence
;awesome
    .word s2_square1_intro
    .word s2_main_square1
    .word s2_square2_intro
    .word s2_square2_tremolo
    .word s2_square2_tremolo2
    .word s2_sq2_lead1a
    .word s2_sq2_lead1b
    .word s2_sq2_lead2a
    .word s2_sq2_lead2b
    .word s2_sq2_lead2c
    .word s2_sq2_stucatto
    .word s2_triangle
    .word s2_noise
    .word s2_noise_short
;boss
    .word boss_sq1
    .word boss_sq2
    .word boss_tri
    .word boss_noi
;endstage
    .word endstage_sfx
    .word endstage_sng1
    .word endstage_sng2_tri
;EMP sfx
    .word EMP_noise_sfx1
    .word EMP_noise_sfx2
;beam sfx
    .word beam_square2_sfx
;explosion sfx
    .word die_noise_sfx
    .word die_silent_sfx
;moon
    .word moon_square1a
    .word moon_square1b
    .word moon_square2all
    .word moon_triangle_a
    .word moon_triangle_b
    .word moon_noise_short
    .word moon_noise_long
    .word moon_noise_silence
;soviet
    .word commie_square1
    .word commie_square2
    .word commie_triangle
    .word commie_noise_soft
    .word commie_noise_loud
;asian
    .word hentai_square1
    .word hentai_square2a
    .word hentai_square2b
    .word hentai_tri_a
    .word hentai_tri_b
    .word hentai_noise_a
    .word hentai_noise_b
;cow level
    .word bovine_squares
    .word bovine_triangle
    .word bovine_noise_a
    .word bovine_noise_b
;final boss
    .word armageddon_sq1
    .word armageddon_sq2a
    .word armageddon_sq2b
    .word armageddon_sq2c
    .word armageddon_sq2d
    .word armageddon_tri
;title
    .word opener_sq_05
    .word opener_sq_03
    .word opener_sq_04
    .word opener_sq_02
    .word opener_tri_01
    .word opener_tri_02
    .word opener_noise_00
    .word opener_noise_01
;cutscenes
    .word intermission_squares_1
    .word intermission_squares_2
    .word intermission_triangle
    .word intermission_noise1
    .word intermission_noise2
;final victory
    .word endstage_sng1b
;cricket
    .word chirp_chirp
    .word chirp_chirp_noise
;asia night
    .word anight_square1
;assimilate sfx
    .word ass_squares
;kogyaru laser sfx
    .word klaser_noise1
    .word klaser_noise2


;;;;;;;;;;;;;;;;;;;;;;;

;test - soon to be replaced with title music
ve_derek_long = $00
ve_derek_sweep = $01
ve_ddrum1 = $02
ve_ddrum2 = $03
ve_drum_sil = $04

;awesome song
ve_s2_sq1_intro     = $05
ve_s2_main_square1  = $06
ve_s2_sq2_intro     = $07
ve_s2_sq2_tremolo   = $08
ve_s2_sq2_tremolo2  = $09
ve_s2_sq2_lead1a    = $0A   ;first part of lead
ve_s2_sq2_lead1b    = $0B
ve_s2_sq2_lead2a    = $0C
ve_s2_sq2_lead2b    = $0D
ve_s2_sq2_lead2c    = $0E
ve_s2_sq2_stucatto  = $0F
ve_s2_triangle      = $10
ve_s2_noise         = $11
ve_s2_noise_short   = $12

;boss music
ve_boss_sq1         = $13
ve_boss_sq2         = $14
ve_boss_tri         = $15
ve_boss_noi         = $16

;endstage fanfare
ve_sfx_endfnfr      = $17
ve_endfnfr_sq1      = $18
ve_endfnfr_sq2tri   = $19

;EMP noise
ve_sfx_EMPnoise1    = $1A
ve_sfx_EMPnoise2    = $1B

;beam
ve_beam             = $1C

;explosion
ve_die              = $1D
ve_die_quiet        = $1E

;moon
ve_moon_sq1a        = $1F
ve_moon_sq1b        = $20
ve_moon_sq2         = $21
ve_moon_tri_a       = $22
ve_moon_tri_b       = $23
ve_moon_nse_shrt    = $24
ve_moon_nse_long    = $25
ve_moon_nse_sil     = $26

;soviet
ve_commie_sq1       = $27
ve_commie_sq2       = $28
ve_commie_tri       = $29
ve_commie_nse_soft  = $2A
ve_commie_nse_loud  = $2B

;asian
ve_hentai_sq1       = $2C
ve_hentai_sq2a      = $2D
ve_hentai_sq2b      = $2E
ve_hentai_tria      = $2F
ve_hentai_trib      = $30
ve_hentai_noise_a   = $31
ve_hentai_noise_b   = $32

;cow level
ve_bovine_squares   = $33
ve_bovine_triangle  = $34
ve_bovine_noise_a   = $35
ve_bovine_noise_b   = $36

;final battle
ve_armageddon_sq1   = $37
ve_armageddon_sq2a  = $38
ve_armageddon_sq2b  = $39
ve_armageddon_sq2c  = $3A
ve_armageddon_sq2d  = $3B
ve_armageddon_tri   = $3C

;title
ve_opener_sq_05     = $3D
ve_opener_sq_03     = $3E
ve_opener_sq_04     = $3F
ve_opener_sq_02     = $40
ve_opener_tri_01    = $41
ve_opener_tri_02    = $42
ve_opener_noise_00  = $43
ve_opener_noise_01  = $44

;cutscenes
ve_intermission_squares_1  = $45
ve_intermission_squares_2  = $46
ve_intermission_triangle   = $47
ve_intermission_noise1     = $48
ve_intermission_noise2     = $49

;final victory
ve_endfnfr_sq1b            = $4A

;cricket
ve_cricket                 = $4B
ve_cricket_noi             = $4C

;asia night
ve_anight_sq               = $4D

;assimilate sfx
ve_ass_squares            = $4E

;kogyaru laser sfx
ve_klaser_noise1          = $4F
ve_klaser_noise2          = $50


;;;;;;;;;;;;;;;;;;;;;

;Test song
se_derek_long:
    .byte $31,$31,$32,$32,$33,$33,$34,$34,$35,$35,$36,$36,$37,$37,$38,$38
    .byte $39,$39,$3A,$3A,$3B,$3B,$3C,$3C,$3D,$3D,$3E,$3E,$3F,$3F,$3F
    .byte $3F,$3F,$3F,$3E,$3E,$3D,$3D,$3C,$3C,$3B,$3B,$3A,$3A,$39,$39
    .byte $38,$38,$37,$37,$36,$36,$35,$35,$34,$34,$33,$33,$32,$32,$31,$31,$30,$30
    .byte $FF
    
se_derek_sweep:
    .byte $BE,$BE,$BE,$FD,$FD,$FD,$BC,$BC,$BC,$FB,$FB,$FB
    .byte $BA,$BA,$BA,$F9,$F9,$F9,$B8,$B8,$B8,$F7,$F7,$F7
    .byte $B6,$B6,$B6,$F5,$F5,$F5,$B4,$B4,$B4,$F3,$F3,$F3
    .byte $B2,$B2,$B2,$F1,$F1,$F1,$F0,$F0
    .byte $FF

se_derekdrum1:
    .byte $0F,$0F,$0F,$0F,$8F,$8F,$8F,$8F,$FF

se_derekdrum2:
    .byte $0F,$0F,$0F,$0F,$0E,$0E,$0D,$0C,$0B,$09,$07,$05,$01,$FF

se_drum_silence:
    .byte $00, $FF


;Awesome Song
s2_square1_intro:
    .byte $F1,$B1,$71,$31,$F1,$B1,$71,$31,$F1,$B1,$71,$32,$F2,$B2,$72,$32
    .byte $F2,$B2,$72,$32,$F2,$B2,$72,$33,$F3,$B3,$73,$33,$F3,$B3,$73,$33
    .byte $F3,$B3,$73,$34,$F4,$B4,$74,$34,$F4,$B4,$B4,$B4,$B4,$B5,$B5,$B5
    .byte $B5,$B5,$B5,$B5,$B5,$B5,$B5,$B6,$B6,$B6,$B6,$B6,$B6,$B6,$B6,$B6,$FF

s2_main_square1:
    .byte $35,$F5,$B5,$75,$B5,$B5,$FF

s2_square2_intro:
    .byte $F2, $F2, $F2, $F2, $F2, $F2, $F2, $F3, $F3, $F3, $F3, $F4, $F4, $F4, $F4, $F4
    .byte $F4, $F4, $F4, $F4, $F4, $F5, $F5, $F5, $B5, $75, $35, $75, $B5, $F6, $B6, $76 
    .byte $36, $76, $B6, $F6, $B6, $F6, $F6, $F5, $FF

s2_square2_tremolo:
    .byte $F2, $F3, $F4, $F5, $F2, $FF

s2_square2_tremolo2:
    .byte $F2, $F0, $F1, $F1, $F2, $F2, $F3, $F3, $F4, $F4, $F4, $F4
    .byte $F5, $F5, $F5, $F5, $F5, $F5, $F4, $F4, $F4, $F4, $F3, $F3
    .byte $F3, $F2, $F2, $F2, $F2, $F1, $F1, $F1, $FF

s2_sq2_lead1a:
    .byte $F5, $FF

s2_sq2_lead1b:
    .byte $F5, $75, $35, $75, $B5, $F5, $B5, $75, $B5, $F5, $B5, $75, $B5, $35, $FF

s2_sq2_lead2a:
    .byte $F3, $FF

s2_sq2_lead2b:
    .byte $F5, $FF

s2_sq2_lead2c:
    .byte $F2, $73, $33, $73, $B4, $F4, $B4, $75, $B5, $F6, $B6, $76, $B6, $36
    .byte $36, $35, $FF

s2_sq2_stucatto:
    .byte $F5, $F4, $F1, $F0, $FF

s2_triangle:
    .byte $8F, $8F, $8F, $8F, $8F, $8F, $8F, $8F, $80, $FF

s2_noise:
    .byte $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $08, $07, $07, $07, $00, $FF

s2_noise_short:
    .byte $08, $08, $08, $08, $08, $08, $00, $FF


;Boss song
boss_sq1:
    .byte $BB, $BB, $BB, $BB, $BB, $BB, $BB, $BB, $BB, $BB, $BB, $BB, $BB, $BB, $BB, $BB
    .byte $BB, $BB, $BB, $BB, $BB, $BB, $BB, $BB, $B0, $FF

boss_sq2:
    .byte $FA, $FA, $FA, $FA, $FA, $FA, $FA, $FA, $FA, $FA, $FA, $FA, $FA, $FA, $FA, $FA
    .byte $FA, $F0, $FF

boss_tri:
    .byte $8F, $8F, $8F, $8F, $8F, $8F, $8F, $8F, $8F, $8F, $8F, $8F
    .byte $8F, $8F, $8F, $8F, $8F, $8F, $8F, $8F, $8F, $8F, $8F, $8F
    .byte $8F, $8F, $8F, $8F, $8F, $8F, $8F, $8F, $8F, $8F, $8F, $8F
    .byte $8F, $8F, $8F, $8F, $8F, $8F, $8F, $8F, $8F, $8F, $8F, $80, $FF

boss_noi:
    .byte $0C, $0C, $0C, $0C, $0C, $0C, $08, $08, $08, $08, $08, $08, $00, $FF


;Endstage Fanfare
endstage_sfx:
   .byte $FE, $BE, $7E, $3E

endstage_sng1:
   .byte $BB, $BB, $BA, $BA, $BA, $BA, $BA, $BA, $BA, $BA, $BA, $BA
   .byte $BA, $BA, $B0, $FF

endstage_sng2_tri:
   .byte $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE
   .byte $FE, $FE, $F0, $FF

endstage_sng1b:
   .byte $3B, $3B, $3A, $3A, $3A, $3A, $3A, $3A, $3A, $3A, $3A, $3A
   .byte $3A, $3A, $30, $FF


;EMP Noise
EMP_noise_sfx1:
  .byte $00, $01, $01, $01, $01, $01, $01, $02, $02, $02, $02, $02, $02
  .byte $03, $03, $03, $03, $03, $03, $FF

EMP_noise_sfx2:
  .byte $03, $FF


;Beam Sound
beam_square2_sfx:
  .byte $F7, $FF


;Explosiong Sound
die_noise_sfx:
  .byte $09, $FF

die_silent_sfx:
  .byte $00, $FF


;Moon
moon_square1a:
  .byte $36, $36, $36, $36, $36, $36, $34, $32, $FF
moon_square1b:
  .byte $B7,$B7,$B7,$B7, $F7,$F7,$F7,$F7, $F5,$F5,$F5,$F5,$F0, $FF

moon_square2all:
  .byte $B6,$FF

moon_triangle_a:
   .byte $FE,$FF

moon_triangle_b:
   .byte $8E,$8E,$8E,$8E,$8E,$8E,$8E,$80,$FF

moon_noise_short:
   .byte $08,$08,$08,$08,$00,$FF
moon_noise_long:
   .byte $06,$06,$06,$06,$06,$06,$06,$00,$FF
moon_noise_silence:
   .byte $00,$FF


;Soviet
commie_square1:
  .byte $B6,$B6,$B6,$B6,$76,$76,$76,$76
  .byte $76,$76,$76,$76,$76,$76,$70,$FF

commie_square2:
  .byte $B3,$B3,$B3,$B3,$B3,$B3,$B3,$B3
  .byte $B3,$B3,$B3,$B3,$B3,$B3,$B0,$FF

commie_triangle:
  .byte $8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F
  .byte $8F,$8F,$8F,$8F,$8F,$8F,$80,$FF

commie_noise_soft:
  .byte $07,$07,$07,$07,$00,$FF

commie_noise_loud:
  .byte $0D,$0D,$0D,$0D,$00,$FF


;Asian
hentai_square1:
  .byte $F6,$F6,$F6,$F6,$F6,$F6
  .byte $36,$36,$36,$36,$36,$36,$FF

hentai_square2a:
  .byte $36,$36,$36,$36,$36,$36,$F6,$F6,$F6,$F6,$F6,$F6,$F6,$F6,$F6,$F6,$F6,$F6,$F6
  .byte $F5,$F5,$F5,$F5,$F5,$F5,$F5,$F5,$F5,$F5,$F5,$F5,$F5,$F5,$F5,$F5,$F5,$F5,$F5
  .byte $F5,$F5,$F5,$F5,$F5,$F5,$F5,$F5,$F5,$F5,$F5,$F5,$F5,$F5,$F5,$F5,$F5,$F5,$F5,$F5,$F5,$F5
  .byte $F3,$F3,$F3,$F3,$F3,$F3,$F3,$F3,$F3,$F3,$F3,$F3,$F3,$F3,$F3,$F3,$F3,$F3,$F3,$F3,$F3,$F3
  .byte $F3,$F3,$F3,$F3,$F3,$F3,$F0,$FF

hentai_square2b:
  .byte $35,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5
  .byte $35,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5
  .byte $35,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5
  .byte $35,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5
  .byte $35,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5
  .byte $35,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$B0,$FF

hentai_tri_a:
  .byte $8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F
  .byte $8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F
  .byte $8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F
  .byte $8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F,$80,$FF

hentai_tri_b:
  .byte $8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F,$80,$FF

hentai_noise_a:
  .byte $07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07,$07
  .byte $06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06
  .byte $05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05,$05
  .byte $05,$05,$05,$05,$05,$05,$05,$04,$04,$04,$04,$04
  .byte $04,$04,$04,$04,$00,$FF

hentai_noise_b:
  .byte $08,$08,$08,$08,$08,$08,$00,$FF


;Cow Level
bovine_squares:
  .byte $77,$77,$77,$77, $B7,$B7,$B7,$B7,$B7,$B7,$B7,$B6,$B0,$FF

bovine_triangle:
  .byte $8F,$FF

bovine_noise_a:
  .byte $0A,$0A,$0A,$0A,$0A,$0A,$0A,$00,$FF

bovine_noise_b:
  .byte $08,$08,$08,$08,$00,$FF


;Final Boss
armageddon_sq1:
  .byte $75,$FF

armageddon_sq2a:
  .byte $B7,$B7,$B7,$B7,$77,$77,$77,$77,$70,$FF

armageddon_sq2b:
  .byte $37,$37,$37,$37,$77,$77,$77,$77
  .byte $B7,$B7,$B7,$B7,$F7,$F7,$F7,$F7,$F0,$FF

armageddon_sq2c:
  .byte $F6,$F6,$F6,$F6,$F6,$F6,$F6,$F6
  .byte $B6,$B6,$B6,$B6,$B6,$B6,$B6,$B6
  .byte $76,$76,$76,$76,$76,$76,$76,$76
  .byte $36,$36,$36,$36
  .byte $B6,$B6,$B6,$B6
  .byte $76,$76,$76,$76
  .byte $36,$36,$36,$36
  .byte $B6,$B6,$B6,$B6
  .byte $F6,$F6,$F6,$F6
  .byte $36,$36,$36,$36
  .byte $B6,$B6,$B6,$B6
  .byte $76,$76,$76,$76,$70,$FF

armageddon_sq2d:
  .byte $F6,$F6,$F6,$F6,$F6,$F6,$F6,$F6
  .byte $B6,$B6,$B6,$B6,$B6,$B6,$B6,$B6
  .byte $76,$76,$76,$76,$76,$76,$76,$76
  .byte $30,$30,$30,$30,$36,$36,$36,$36
  .byte $70,$70,$70,$70,$76,$76,$76,$76
  .byte $B0,$B0,$B0,$B0,$B6,$B6,$B6,$B6
  .byte $F0,$F0,$F0,$F0,$36,$36,$36,$36
  .byte $B0,$B0,$B0,$B0,$FF

armageddon_tri:
  .byte $8C,$8C,$8C,$8C,$8C,$8C,$8C,$8C
  .byte $8C,$8C,$8C,$8C,$8C,$8C,$8C,$8C
  .byte $8C,$8C,$8C,$8C,$8C,$8C,$8C,$8C
  .byte $8C,$8C,$8C,$8C,$8C,$8C,$8C,$8C
  .byte $8C,$8C,$8C,$8C,$8C,$8C,$8C,$8C
  .byte $8C,$8C,$8C,$8C,$8C,$8C,$8C,$80,$FF


;Title
opener_sq_05:
  .byte $B5,$B5,$B5,$B5,$B5,$B5,$B5,$B5,$F5,$F5
  .byte $F5,$F5,$F5,$F5,$F5,$F5,$F5,$F5,$F5,$F5,$F0,$FF

opener_sq_03:
  .byte $73,$73,$73,$73,$73,$73,$73,$73,$74,$74
  .byte $74,$74,$74,$74,$74,$74,$75,$75,$75,$75
  .byte $75,$75,$75,$75,$76,$76,$76,$76,$76,$76
  .byte $76,$76,$77,$77,$77,$77,$70,$70,$70,$70
  .byte $B7,$B7,$B7,$B7,$F0,$F0,$F0,$F0,$37,$37
  .byte $37,$37,$B0,$B0,$B0,$B0,$37,$37,$37,$37,$30,$FF

opener_sq_04:
  .byte $B3,$B3,$B3,$B3,$B0,$B0,$B0,$B0,$B3,$B3
  .byte $B3,$B3,$B0,$B0,$B0,$B0,$B3,$B3,$B3,$B3
  .byte $B0,$B0,$B0,$B0,$B3,$B3,$B3,$B3,$B0,$B0
  .byte $B0,$B0,$B3,$B3,$B3,$B3,$B0,$B0,$B0,$B0,$B0,$FF

opener_sq_02:
  .byte $B4,$B4,$B4,$B4,$B4,$B4,$B4,$B4,$F4,$F4
  .byte $F4,$F4,$F4,$F4,$F4,$F4,$F4,$F4,$F4,$F4,$F0,$FF

opener_tri_01:
  .byte $8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F
  .byte $8F,$8F,$8F,$8F,$8F,$8F,$80,$FF

opener_tri_02:
  .byte $8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F
  .byte $8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F,$80,$FF

opener_noise_00:
  .byte $08,$08,$08,$08,$05,$05,$05,$05,$00,$FF

opener_noise_01:
  .byte $06,$06,$06,$06,$04,$04,$04,$04,$03,$03
  .byte $03,$03,$02,$02,$02,$02,$00,$FF


;Cutscenes
intermission_squares_1:
  .byte $F1,$F1,$F1,$F1,$F2,$F2,$F2,$F2,$F3,$F3
  .byte $F3,$F3,$F4,$F4,$F4,$F4,$F5,$F5,$F5,$F5
  .byte $F6,$F6,$F6,$F6,$F7,$F7,$F7,$F7,$F8,$F8
  .byte $F8,$F8,$F8,$F8,$F8,$F8,$F8,$F8,$F8,$FF
               ;$F9
intermission_squares_2:
  .byte $75,$75,$75,$75,$77,$77,$77,$77,$FF

intermission_triangle:
  .byte $8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F
  .byte $8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F
  .byte $8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F
  .byte $8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F
  .byte $8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F
  .byte $8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F,$8F,$80,$FF

intermission_noise1:
  .byte $0F,$0F,$0F,$0F,$0C,$0C,$0C,$0C,$05,$05
  .byte $05,$05,$00,$FF

intermission_noise2:
  .byte $0B,$0B,$0B,$0B,$09,$09,$09,$09,$07,$07
  .byte $07,$07,$05,$05,$05,$05,$03,$03,$03,$03,$00,$FF


;Cricket sound
chirp_chirp:
  .byte $30,$32,$34,$35,$33,$37,$32,$35
  .byte $38,$37,$33,$35,$37,$34,$32,$30,$FF

chirp_chirp_noise:
  .byte $00,$04,$08,$09,$07,$0B,$06,$09
  .byte $0C,$0B,$07,$09,$0B,$08,$04,$00,$FF


;Asia Night
anight_square1:
  .byte $F0,$F0,$F1,$F3,$F4,$F4,$F4,$F4,$F4,$F4,$F4,$F4,$F0,$FF
;  .byte $30,$30,$31,$33,$34,$34,$34,$34,$34,$34,$34,$34,$30,$FF


;Assimilate SFX
ass_squares:
  .byte $F5,$75,$B5,$F5,$F5,$75,$B5,$F5,$FF


;Kogyaru Laser SFX
klaser_noise1:
  .byte $09,$FF
klaser_noise2:
  .byte $07,$FF