sfx_Ossan_die:
    .byte $01           ;1 stream

    .byte SFX_2         ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte NOISE         ;which channel
    .byte $30           ;initial duty
    .byte ve_die_quiet ;volume envelope
    .word die_noise     ;pointer to stream
    .byte $96           ;tempo

die_noise:
    .byte derek1, $0F
    .byte volume_envelope, ve_die
    .byte derek2, $1F, $1E
    .byte derek2, $0C
    .byte endsound