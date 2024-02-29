sfx_endstg_fanfare:
    .byte $02           ;2 streams

    .byte SFX_1         ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte SQUARE_2      ;which channel
    .byte $F0           ;initial duty
    .byte ve_sfx_endfnfr   ;volume envelope
    .word efanfare_square2  ;pointer to stream
    .byte $FA           ;tempo

    .byte SFX_2         ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte TRIANGLE      ;which channel
    .byte $80           ;initial volume (on)
    .byte ve_sfx_endfnfr    ;volume envelope
    .word efanfare_triangle  ;pointer to stream
    .byte $FA           ;tempo

efanfare_square2:
    .byte d_sixteenth, D7,F7,A7,D8
    .byte endsound

efanfare_triangle:
    .byte d_sixteenth, C7,E7,G7,B7
    .byte continue_fanfare, $01
    .byte endsound