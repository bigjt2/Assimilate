;EVERY FRAME MUST EQUAL 256

song_test:
    .byte $04           ;4 streams
    
    .byte MUSIC_SQ1     ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte SQUARE_1      ;which channel
    .byte $70           ;initial duty (01)
    .byte ve_derek_long      ;volume envelope
    .word song1_square1 ;pointer to stream
    .byte $96           ;originally $82 since it was 130 in famitracker, sounded slower
    
    .byte MUSIC_SQ2     ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte SQUARE_2      ;which channel
    .byte $B0           ;initial duty (10)
    .byte ve_derek_sweep      ;volume envelope
    .word song1_square2 ;pointer to stream
    .byte $96           ;tempo  4c
    
    .byte MUSIC_TRI     ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte TRIANGLE      ;which channel
    .byte $80           ;initial volume (on)
    .byte ve_derek_long    ;volume envelope
    .word song1_tri     ;pointer to stream
    .byte $96           ;tempo

    .byte MUSIC_NOI
    .byte $01
    .byte NOISE
    .byte $30
    .byte ve_ddrum2
    .word song1_noise
    .byte $96
    
    
song1_square1:
    .byte set_loop1_counter, 2
.square1_loop:
    .byte set_note_offset, 12
    .byte derek1, C2,Eb2,G2,Eb2
    .byte loop1
    .word .square1_loop
    .byte loop
    .word song1_square1
    
    
song1_square2:
;frame1
    .byte set_note_offset, 12
    .byte derek1
    .byte Bb4
    .byte half
    .byte C5,Db5,C5,Bb4
    .byte derek1, F4
    .byte half
    .byte C5,Db5,C5,Bb4

;frame2
    .byte derek1
    .byte Bb3
    .byte half, C4,Db4,F4,Gb4
    .byte derek1, F4
    .byte half, F4,A4,C5,Db5

    .byte loop
    .word song1_square2

    
song1_tri:

;first frame
    .byte set_note_offset, 12
    .byte derek1, Bb2
    .byte whole, C3, Db3, F3, F3, A3, C4
;second frame
    ;SAME
    .byte loop
    .word song1_tri



;fami 0 1 2 3 4 5 6 7 8 9 A B C D E F
;prog F E D C B A 9 8 7 6 5 4 3 2 1 0
song1_noise:
    .byte volume_envelope, ve_ddrum1
    .byte half, $0E
    .byte volume_envelope, ve_ddrum2
    .byte half, $02
    .byte quarter, $05
    .byte eighth, $05, $03
    .byte quarter, $05, $03

    .byte half, $05
    .byte volume_envelope, ve_drum_sil   ;must use a silence envelope or it will play a drum sound on rests
    .byte half, rest, whole, rest

     .byte loop
     .word song1_noise