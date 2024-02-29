song_cs_boss:
    .byte $01           ;1 stream

    .byte MUSIC_SQ1     ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte SQUARE_1      ;which channel
    .byte $B0           ;initial duty
    .byte ve_s2_triangle   ;volume envelope
    .word boss_square1  ;pointer to stream
    .byte $BB           ;tempo


csboss_square1:
    .byte set_loop1_counter, 2

.sq1_frame_01_45:
    .byte d_half, Eb1, Eb1   ;notes in the range I added to the note table won't
    .byte half, Eb1          ;fit correctly with the note offset because of where
    .byte d_half, Eb1, Eb1   ;they are.
    .byte half, Eb1          ;therefore, you can't use set_note_offset for them.
    .byte d_half, Gb1, Gb1   ;you have to manually enter recalculate them.
    .byte half, Gb1
    .byte d_half, Gb1, Gb1
    .byte half, Gb1

    .byte loop1
    .word .sq1_frame_01_45

    .byte set_loop1_counter, 2

.sq1_frame_23_67
    .byte d_half, B1, B1
    .byte half, B1
    .byte d_half, B1, B1
    .byte half, B1
    .byte d_half, Eb1, Eb1
    .byte half, Eb1
    .byte d_half, Eb1, Eb1
    .byte half, Eb1

    .byte loop1
    .word .sq1_frame_23_67

    .byte loop
    .word csboss_square1