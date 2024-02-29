;;;;;;;;;;;;;;;;;;;;
volume_envelopes:
;song1
    .word se_derek_long
    .word se_derek_sweep
    .word se_derekdrum1
    .word se_derekdrum2
    .word se_drum_silence
;song2
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

    .word se_duty_test


;;;;;;;;;;;;;;;;;;;;;

;song1
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

;song2
s2_square1_intro:
    .byte $F3,$B3,$73,$34,$F4,$B4,$74,$34,$F5,$B5,$75,$35,$F5,$B6,$76,$36
    .byte $F6,$B6,$77,$37,$F7,$B7,$78,$38,$F8,$B8,$78,$38,$F9,$B9,$79,$39
    .byte $F9,$BA,$7A,$3A,$FA,$BB,$7B,$3B,$FB,$BB,$BB,$BC,$BC,$BC,$BC,$BC
    .byte $BC,$BD,$BD,$BD,$BD,$BD,$BD,$BE,$BE,$BE,$BE,$BE,$BE,$BE,$BF,$BF,$FF

s2_main_square1:
    .byte $39,$F9,$B9,$79,$B9,$B9,$FF

s2_square2_intro:
    .byte $F2, $F3, $F3, $F3, $F3, $F3, $F3, $F4, $F4, $F4, $F4, $F5, $F5, $F5, $F5, $F5
    .byte $F6, $F6, $F7, $F7, $F7, $F8, $F8, $F8, $B8, $78, $38, $78, $B8, $F9, $B9, $79 
    .byte $39, $79, $B9, $F9, $B9, $F9, $F9, $F8, $FF

s2_square2_tremolo:
    .byte $F2, $F5, $F7, $F8, $F2, $FF

s2_square2_tremolo2:
    .byte $F2, $F2, $F3, $F3, $F4, $F4, $F5, $F5, $F6, $F6, $F7, $F7
    .byte $F8, $F8, $F8, $F8, $F8, $F8, $F7, $F7, $F6, $F6, $F5, $F5
    .byte $F4, $F4, $F4, $F4, $F3, $F3, $F2, $F2, $FF

s2_sq2_lead1a:
    .byte $FE, $FF

s2_sq2_lead1b:
    .byte $FE, $7E, $3E, $7E, $BE, $FE, $BE, $7E, $BE, $FE, $BE, $7E, $BE, $3E, $FF

s2_sq2_lead2a:
    .byte $F3, $FF

s2_sq2_lead2b:
    .byte $F5, $FF

s2_sq2_lead2c:
    .byte $F6, $76, $36, $77, $B7, $F7, $B8, $78, $B8, $FA, $BA, $7A, $B9, $39
    .byte $39, $38, $FF

s2_sq2_stucatto:
    .byte $FE, $FC, $F1, $F0, $FF

s2_triangle:
    .byte $8F, $8F, $8F, $8F, $8F, $8F, $8F, $8F, $80, $FF

s2_noise:
    .byte $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0E, $0E, $0E, $00, $FF

s2_noise_short:
    .byte $0F, $0F, $0F, $0F, $0F, $0F, $00, $FF

se_duty_test:
    .byte $3E, $3E, $3E, $3E, $3E, $3E, $3E, $3E, $3E, $3E, $3E, $3E, $3E, $3E, $3E, $3E
    .byte $3E, $3E, $3E, $3E, $3E, $3E, $3E, $3E, $3E, $3E, $3E, $3E, $3E, $3E, $3E, $3E
    .byte $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E
    .byte $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E
    .byte $BE, $BE, $BE, $BE, $BE, $BE, $BE, $BE, $BE, $BE, $BE, $BE, $BE, $BE, $BE, $BE
    .byte $BE, $BE, $BE, $BE, $BE, $BE, $BE, $BE, $BE, $BE, $BE, $BE, $BE, $BE, $BE, $BE
    .byte $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE
    .byte $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FE, $FF

;;;;;;;;;;;;;;;;;;;;;;;

;song1
ve_derek_long = $00
ve_derek_sweep = $01
ve_ddrum1 = $02
ve_ddrum2 = $03
ve_drum_sil = $04

;song2
ve_s2_sq1_intro = $05
ve_s2_main_square1 = $06
ve_s2_sq2_intro = $07
ve_s2_sq2_tremolo = $08
ve_s2_sq2_tremolo2 = $09
ve_s2_sq2_lead1a = $0A   ;first part of lead
ve_s2_sq2_lead1b = $0B
ve_s2_sq2_lead2a = $0C
ve_s2_sq2_lead2b = $0D
ve_s2_sq2_lead2c = $0E
ve_s2_sq2_stucatto = $0F
ve_s2_triangle = $10
ve_s2_noise = $11
ve_s2_noise_short =$12
ve_duty_test = $13