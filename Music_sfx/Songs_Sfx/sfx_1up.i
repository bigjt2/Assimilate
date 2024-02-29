sfx_1UP:
    .byte $02           ;2 stream

    .byte SFX_1     ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte TRIANGLE      ;which channel
    .byte $80           ;initial volume (on)
    .byte ve_boss_tri    ;volume envelope
    .word oneUP_tri      ;pointer to stream
    .byte $B0

    .byte SFX_2         ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte SQUARE_2      ;which channel
    .byte $30           ;initial duty
    .byte ve_ass_squares   ;volume envelope
    .word oneUP_sq2     ;pointer to stream
    .byte $B0           ;tempo

oneUP_tri:
    .byte set_note_offset, 12
    .byte quarter, Ds5
    .byte d_whole, Fs5
    .byte quarter, rest
    .byte endsound

oneUP_sq2:
    .byte set_note_offset, 12
    .byte quarter, Ds5
    .byte d_whole, Fs5
    .byte quarter, rest
    .byte endsound