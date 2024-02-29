sfx_explosion:
    .byte $01           ;1 stream

    .byte SFX_2         ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte NOISE         ;which channel
    .byte $30           ;initial duty
    .byte ve_die        ;volume envelope
    .word expl_noise     ;pointer to stream
    .byte $96           ;tempo

expl_noise:
    .byte volume_envelope, ve_die
    .byte eighth, $0C
    .byte half, $1F
;    .byte half, $0C

;    .byte half, $1F, $1E
;    .byte half, $0C
    .byte endsound