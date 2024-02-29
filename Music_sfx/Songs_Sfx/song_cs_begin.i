song_cs_begin:
    .byte $01           ;1 stream

    .byte MUSIC_TRI     ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte TRIANGLE      ;which channel
    .byte $80           ;initial volume (on)
    .byte ve_s2_triangle    ;volume envelope
    .word csbegin_tri     ;pointer to stream
    .byte $B0           ;tempo


csbegin_tri:
    .byte set_note_offset, 12
    .byte set_loop1_counter, 2

.triangle_loop1:
    .byte d_half, C2
    .byte quarter, C2
    .byte whole, C2
    .byte d_half, C2
    .byte quarter, C2
    .byte half, D2, E2
    .byte d_half, C2
    .byte quarter, C2
    .byte whole, C2
    .byte d_half, B1
    .byte quarter, G1
    .byte half, G2, E2

    .byte loop1
    .word .triangle_loop1

    .byte set_loop1_counter, 4
.triangle_loop2:
    .byte d_half, C2
    .byte quarter, C2
    .byte whole, C2
    .byte d_half, C2
    .byte quarter, C2
    .byte half, D2, E2
    .byte d_half, C2
    .byte quarter, C2
    .byte whole, C2
    .byte d_half, B1
    .byte quarter, G1
    .byte half, G2, E2

    .byte loop1
    .word .triangle_loop2

    .byte loop
    .word csbegin_tri