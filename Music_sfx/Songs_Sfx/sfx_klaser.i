sfx_klaser_on:
    .byte $01           ;1 stream

    .byte MUSIC_NOI     ;channel - even though this is a sfx, I keep it on a music channel since noise is unused in final battle and this way it doesn't get interrupted.
    .byte $01           ;status byte (stream enabled)
    .byte NOISE         ;which channel
    .byte $30           ;initial volume (on)
    .byte ve_klaser_noise1    ;volume envelope
    .word klaser_ON_noi      ;pointer to stream
    .byte $B0

klaser_ON_noi:
    .byte set_note_offset, 12
    .byte volume_envelope,ve_klaser_noise1
    .byte quarter, $1B
    .byte volume_envelope,ve_klaser_noise2
    .byte quarter, $1B
    .byte loop
    .word klaser_ON_noi

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


sfx_klaser_off:
    .byte $01           ;1 stream

    .byte MUSIC_NOI
    .byte $01           ;status byte (stream enabled)
    .byte NOISE         ;which channel
    .byte $30           ;initial volume (on)
    .byte ve_klaser_noise1    ;volume envelope
    .word klaser_OFF_noi      ;pointer to stream
    .byte $B0

klaser_OFF_noi:
    .byte endsound