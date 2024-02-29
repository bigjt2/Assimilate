song_cricket:
    .byte $02           ;2 streams

    .byte MUSIC_SQ2     ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte SQUARE_2      ;which channel
    .byte $30           ;initial duty (10)
    .byte ve_cricket    ;volume envelope
    .word cricket_sqr2  ;pointer to stream
    .byte $BB           ;tempo

    .byte MUSIC_NOI
    .byte $01
    .byte NOISE
    .byte $30
    .byte ve_cricket_noi
    .word cricket_noise
    .byte $BB


cricket_sqr2:
;    .byte endsound

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
    .byte derek1, rest
    .byte half, F6,F6,F6,F6,F6,F6,F6,F6,F6
    .byte d_whole, rest

    .byte loop
    .word cricket_sqr2

    .byte endsound


cricket_noise:

;fami 0 1 2 3 4 5 6 7 8 9 A B C D E F 
;prog F E D C B A 9 8 7 6 5 4 3 2 1 0 <-this reverses yet again when dealing with Mode 1 noises.

;    .byte endsound

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
    .byte volume_envelope, ve_moon_nse_sil
    .byte derek1, $00
    .byte volume_envelope, ve_cricket_noi
    .byte half, $10,$10,$10,$10,$10,$10,$10,$10,$10
    .byte volume_envelope, ve_moon_nse_sil
    .byte d_whole, $00

    .byte loop
    .word cricket_noise

    .byte endsound