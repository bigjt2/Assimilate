sfx_assimilate:
    .byte $02           ;1 stream

    .byte SFX_1         ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte SQUARE_1      ;which channel
    .byte $30           ;initial duty
    .byte ve_ass_squares   ;volume envelope
    .word ass_square1  ;pointer to stream
    .byte $D0           ;tempo

    .byte SFX_2         ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte SQUARE_2      ;which channel
    .byte $30           ;initial duty
    .byte ve_ass_squares   ;volume envelope
    .word ass_square2  ;pointer to stream
    .byte $D0           ;tempo

ass_square1:
    .byte set_note_offset, 12
    .byte quarter, F3,G3,A3,B3
    .byte eighth, rest
    .byte endsound

ass_square2:
    .byte set_note_offset, 12
    .byte eighth, rest
    .byte quarter, A2,B2,Cs3,Ds3
;    .byte quarter, Ds3,Ds3,Ds3,Ds3
    .byte endsound