song_asia_night:
    .byte $03           ;3 streams

    .byte MUSIC_SQ1     ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte SQUARE_1      ;which channel
    .byte $30           ;initial duty (10)
    .byte ve_anight_sq  ;volume envelope
    .word anight_sqr1   ;pointer to stream
    .byte $BB           ;tempo

    .byte MUSIC_SQ2     ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte SQUARE_2      ;which channel
    .byte $30           ;initial duty (10)
    .byte ve_cricket    ;volume envelope
    .word anight_sqr2  ;pointer to stream
    .byte $BB           ;tempo

    .byte MUSIC_NOI
    .byte $01
    .byte NOISE
    .byte $30
    .byte ve_cricket_noi
    .word anight_noise
    .byte $BB


anight_sqr1:

    .byte set_note_offset, 32

    .byte set_loop1_counter, 8
.silence_intro:
    .byte duty_length, rest
    .byte loop1
    .word .silence_intro

.sq1_loop:
    .byte derek1,C3
    .byte whole,E3
    .byte half,D3,E3
    .byte whole,G3
    .byte half,A3,G3
    .byte whole,E3

    .byte half,D3,E3
    .byte whole,D3
    .byte half,E3,D3
    .byte whole,C3,G2
    .byte half,C3,E3,A3,G3
    .byte whole,E3,D3

    .byte derek1,C3
    .byte whole,E3
    .byte half,D3,E3
    .byte whole,G3
    .byte half,A3,G3
    .byte whole,E3
    .byte half,D3,E3

    .byte whole,G3
    .byte half,G3,C4
    .byte whole,E4,D4
    .byte half,C4,G3,E3,C3
    .byte whole,G2,E2

    .byte loop
    .word .sq1_loop

;    .byte endsound


anight_sqr2:

    ;frame1
    .byte set_note_offset, 12
    .byte half, F6,F6,F6,F6
    .byte whole, rest
    .byte half, F6,F6
    .byte whole, rest
    .byte half, F6,F6,F6,F6
    .byte whole, rest

    ;frame2
    .byte half, F6,F6,F6,F6,F6,F6
    .byte whole, rest
    .byte half, F6,F6,F6,F6,F6
    .byte eighth, F6, rest
    .byte half, rest

    ;frame3
    .byte half, F6,F6,F6,F6
    .byte whole, rest
    .byte half, F6,F6
    .byte whole, rest
    .byte half, F6,F6,F6,F6
    .byte whole, rest

    ;frame4
    .byte derek1, rest
    .byte half, F6,F6,F6,F6,F6,F6,F6,F6,F6
    .byte d_whole, rest

    .byte loop
    .word anight_sqr2

;    .byte endsound


anight_noise:

;fami 0 1 2 3 4 5 6 7 8 9 A B C D E F 
;prog F E D C B A 9 8 7 6 5 4 3 2 1 0 <-this reverses yet again when dealing with Mode 1 noises.

    ;;;;frame1
    .byte volume_envelope, ve_cricket_noi
    .byte half, $10,$10,$10,$10
    .byte volume_envelope, ve_moon_nse_sil
    .byte whole, $00

    .byte volume_envelope, ve_cricket_noi
    .byte half, $10,$10
    .byte volume_envelope, ve_moon_nse_sil
    .byte whole, $00

    .byte volume_envelope, ve_cricket_noi
    .byte half, $10,$10,$10,$10
    .byte volume_envelope, ve_moon_nse_sil
    .byte whole, $00

    ;;;;frame2
    .byte volume_envelope, ve_cricket_noi
    .byte half, $10,$10,$10,$10,$10,$10
    .byte volume_envelope, ve_moon_nse_sil
    .byte whole, $00

    .byte volume_envelope, ve_cricket_noi
    .byte half, $10,$10,$10,$10,$10
    .byte eighth, $10

    .byte volume_envelope, ve_moon_nse_sil
    .byte eighth, $00
    .byte half, $00

    ;;;;frame3
    .byte volume_envelope, ve_cricket_noi
    .byte half, $10,$10,$10,$10
    .byte volume_envelope, ve_moon_nse_sil
    .byte whole, $00

    .byte volume_envelope, ve_cricket_noi
    .byte half, $10,$10
    .byte volume_envelope, ve_moon_nse_sil
    .byte whole, $00

    .byte volume_envelope, ve_cricket_noi
    .byte half, $10,$10,$10,$10
    .byte volume_envelope, ve_moon_nse_sil
    .byte whole, $00

    ;;;;frame4
    .byte volume_envelope, ve_moon_nse_sil
    .byte derek1, $00
    .byte volume_envelope, ve_cricket_noi
    .byte half, $10,$10,$10,$10,$10,$10,$10,$10,$10
    .byte volume_envelope, ve_moon_nse_sil
    .byte d_whole, $00

    .byte loop
    .word anight_noise

;    .byte endsound