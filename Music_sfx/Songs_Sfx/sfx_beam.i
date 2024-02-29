sfx_beam:
    .byte $01           ;1 streams

    .byte SFX_1         ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte SQUARE_2      ;which channel
    .byte $F0           ;initial duty
    .byte ve_beam       ;volume envelope
    .word beam_square2  ;pointer to stream
    .byte $90           ;tempo

beam_square2:
    .byte eighth, F1, E1, F1, E1
    .byte endsound
;    .byte loop
;    .word beam_square2

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

sfx_killbeam:
    .byte $01           ;2 streams

    .byte SFX_1         ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte SQUARE_2      ;which channel
    .byte $F0           ;initial duty
    .byte ve_beam       ;volume envelope
    .word beamkill_square2  ;pointer to stream
    .byte $FA           ;tempo

beamkill_square2:
    .byte endsound