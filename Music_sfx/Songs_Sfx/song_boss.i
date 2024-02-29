
song_boss:
    .byte $04           ;4 streams

    .byte MUSIC_SQ1     ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte SQUARE_1      ;which channel
    .byte $B0           ;initial duty
    .byte ve_boss_sq1   ;volume envelope
    .word boss_square1  ;pointer to stream
    .byte $BB           ;tempo

    .byte MUSIC_SQ2     ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte SQUARE_2      ;which channel
    .byte $F0           ;initial duty
    .byte ve_boss_sq2   ;volume envelope
    .word boss_square2  ;pointer to stream
    .byte $BB           ;tempo

    .byte MUSIC_TRI     ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte TRIANGLE      ;which channel
    .byte $80           ;initial volume (on)
    .byte ve_boss_tri    ;volume envelope
    .word boss_triangle  ;pointer to stream
    .byte $BB           ;tempo
    
    .byte MUSIC_NOI
    .byte $01
    .byte NOISE
    .byte $30
    .byte ve_boss_noi
    .word boss_noise
    .byte $BB


boss_square1:
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
    .word boss_square1


boss_square2:
    .byte set_loop1_counter, 2

.sq2_frame_01_45:
    .byte d_half, Fs3, Fs3
    .byte half, Fs3
    .byte d_half, Fs3, Fs3
    .byte half, Fs3
    .byte d_half, As3, As3
    .byte half, As3
    .byte d_half, As3, As3
    .byte half, As3

    .byte loop1
    .word .sq2_frame_01_45

    .byte set_loop1_counter, 2

.sq2_frame_23_67:
    .byte d_half, Ds3, Ds3
    .byte half, Ds3
    .byte d_half, Ds3, Ds3
    .byte half, Ds3
    .byte d_half, Fs3, Fs3
    .byte half, Fs3
    .byte d_half, Fs3, Fs3
    .byte half, Fs3

    .byte loop1
    .word .sq2_frame_23_67

    .byte loop
    .word boss_square2


boss_triangle:
    .byte set_note_offset, 12

.tri_frame_0:
    .byte derek1, Ds4, F4, Fs4, rest

.tri_frame_1:
    .byte derek1, Ds4, F4, Cs4, rest

.tri_frame_2:
    .byte derek1, Ds4, F4, Fs4, rest

.tri_frame_3:
    .byte derek1, As4, rest, rest, rest

.tri_frame_4:
    .byte half, Ds4
    .byte quarter, As4
    .byte half, Gs4, Fs4, Gs4, Fs4, F4
    .byte d_half, Ds4
    .byte half, Cs4
    .byte quarter, F4
    .byte half, Fs4, Gs4
    .byte derek2, As4
    .byte quarter, Gs4
    .byte d_half, Fs4

.tri_frame_5:
    .byte half, Ds4
    .byte quarter, F4
    .byte half, Fs4, Gs4, Cs5, As4, Gs4
    .byte d_half, Fs4
    .byte whole, Cs4
    .byte derek1, As3
    .byte whole, rest

.tri_frame_6:
    .byte half, Ds4
    .byte quarter, As4
    .byte half, Gs4, Fs4, Gs4, Fs4, F4
    .byte d_half, Ds4
    .byte half, Ds4
    .byte quarter, F4
    .byte half, Fs4, Gs4
    .byte derek2, As4
    .byte quarter, Gs4
    .byte d_half, Fs4

.tri_frame_7:
    .byte half, Ds4
    .byte quarter, As4
    .byte half, Gs4, Fs4
    .byte d_half, Ds4
    .byte half, As4, Gs4, Fs4
    .byte derek1, Ds4, rest

    .byte loop
    .word boss_triangle


boss_noise:

    .byte set_loop1_counter, 4

.noi_frame0123:
    .byte half, $0F
    .byte quarter, $02, $0F
    .byte half, $0F, $02, $0F
    .byte quarter, $02, $0F
    .byte half, $0F, $02, $0F
    .byte quarter, $02, $0F
    .byte half, $0F, $02, $0F
    .byte quarter, $02, $0F
    .byte half, $0F, $02

    .byte loop1
    .word .noi_frame0123

    .byte set_loop1_counter, 4

.noi_frame4567:
    .byte set_loop2_counter, 4
.latter_loop:
    .byte quarter, $0F, $00, $02, $0F, $0F, $00, $02, $00
    .byte loop2
    .word .latter_loop

    .byte loop1
    .word .noi_frame4567

    .byte loop
    .word boss_noise