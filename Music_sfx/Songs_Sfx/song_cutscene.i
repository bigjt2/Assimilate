song_cutscene:
    .byte $04           ;4 streams
    
    .byte MUSIC_SQ1     ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte SQUARE_1      ;which channel
    .byte $30           ;initial duty (01)
    .byte ve_intermission_squares_1      ;volume envelope
    .word cutscene_square1  ;pointer to stream
    .byte $A0           ;tempo, originaly $82 since it was 130 in famitracker, sounded slower

    .byte MUSIC_SQ2     ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte SQUARE_2      ;which channel
    .byte $B0           ;initial duty (10)
    .byte ve_intermission_squares_1    ;volume envelope
    .word cutscene_square2  ;pointer to stream
    .byte $A0           ;tempo
    
    .byte MUSIC_TRI     ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte TRIANGLE      ;which channel
    .byte $80           ;initial volume (on)
    .byte ve_intermission_triangle    ;volume envelope
    .word cutscene_tri      ;pointer to stream
    .byte $A0           ;tempo

    .byte MUSIC_NOI
    .byte $01
    .byte NOISE
    .byte $30
    .byte ve_intermission_noise1
    .word cutscene_noise
    .byte $A0


cutscene_square1:
    .byte set_note_offset, 12
;    .byte endsound

    .byte set_loop1_counter,2
.square1_loop:
    .byte volume_envelope, ve_intermission_squares_1
    .byte derek1,B2,As2
    .byte duty_length,Fs2

    .byte derek1,B2,Cs3,E3,Ds3

    .byte derek1,B2,As2,Fs2,Fs2

    .byte duty_length,Fs2,As2
    .byte loop1
    .word .square1_loop

;    .byte endsound

    .byte loop
    .word cutscene_square1


cutscene_square2:
    .byte set_note_offset, 12
;    .byte endsound

    .byte volume_envelope, ve_intermission_squares_1
    .byte derek1,Ds3,Cs3
    .byte duty_length,As2

    .byte derek1,Ds3,Fs3,B3,B3

    .byte derek1,Ds3,Cs3,B2,As2

    .byte duty_length,B2,Fs2

    .byte whole,Ds3
    .byte volume_envelope, ve_intermission_squares_2
    .byte half,Fs3,Ds3
    .byte volume_envelope, ve_intermission_squares_1
    .byte whole,Cs3
    .byte volume_envelope, ve_intermission_squares_2
    .byte half,Cs3,B2
    .byte volume_envelope, ve_intermission_squares_1
    .byte whole,As2
    .byte volume_envelope, ve_intermission_squares_2
    .byte half,As2,B2,Fs3,Ds3,Cs3,B2

    .byte volume_envelope, ve_intermission_squares_1
    .byte whole,Ds3
    .byte volume_envelope, ve_intermission_squares_2
    .byte half,Fs3,Ds3
    .byte volume_envelope, ve_intermission_squares_1
    .byte whole,Fs3
    .byte volume_envelope, ve_intermission_squares_2
    .byte half,Cs3,B2
    .byte volume_envelope, ve_intermission_squares_1
    .byte whole,B3
    .byte volume_envelope, ve_intermission_squares_2
    .byte half,Cs3,B2
    .byte volume_envelope, ve_intermission_squares_1
    .byte derek1,B3

    .byte whole,Ds3
    .byte volume_envelope, ve_intermission_squares_2
    .byte half,Fs3,Ds3
    .byte volume_envelope, ve_intermission_squares_1
    .byte whole,Cs3
    .byte volume_envelope, ve_intermission_squares_2
    .byte half,Cs3,B2
    .byte volume_envelope, ve_intermission_squares_1
    .byte whole,B2
    .byte volume_envelope, ve_intermission_squares_2
    .byte half,Cs3,B2
    .byte volume_envelope, ve_intermission_squares_1
    .byte whole,As2
    .byte volume_envelope, ve_intermission_squares_2
    .byte half,As2,B2

    .byte volume_envelope, ve_intermission_squares_1
    .byte d_whole,B2
    .byte volume_envelope, ve_intermission_squares_2
    .byte half,Cs3
    .byte whole,Ds3,Fs3
    .byte volume_envelope, ve_intermission_squares_1
    .byte d_whole,Fs2
    .byte volume_envelope, ve_intermission_squares_2
    .byte half,B2,Fs3,Ds3,Cs3,B2

;    .byte endsound

    .byte loop
    .word cutscene_square2


cutscene_tri:
    .byte set_note_offset, 12
;    .byte endsound

    .byte set_loop1_counter,2
.triangle_loop:
    .byte volume_envelope, ve_intermission_triangle
    .byte whole,rest
    .byte half,B3,Cs4,Ds4,Fs4,B4,As4
    .byte duty_length,Fs4

    .byte whole,rest
    .byte half,B3,Cs4,Ds4,Fs4,B4,As4,Fs4,Ds4,Cs4,B3
    .byte derek1,Fs3

    .byte whole,rest
    .byte half,B3,Cs4,Ds4,Fs4,B4,As4,Fs4,Ds4,Cs4,B3,Gs4,Ds4,Cs4,B3

    .byte half,Fs4,Ds4,Cs4,B3,Gs3,B3,Cs4,Ds4
    .byte duty_length,Cs4
    .byte loop1
    .word .triangle_loop

;    .byte endsound
    .byte loop
    .word cutscene_tri


cutscene_noise:

;fami 0 1 2 3 4 5 6 7 8 9 A B C D E F 
;prog F E D C B A 9 8 7 6 5 4 3 2 1 0 <-this reverses yet again when dealing with Mode 1 noises.
;    .byte endsound

    .byte set_loop1_counter,8
.noise_loop:
    .byte volume_envelope, ve_intermission_noise1
    .byte whole,15
    .byte volume_envelope, ve_intermission_noise2
    .byte half,4,13
    .byte volume_envelope, ve_intermission_noise1
    .byte half,15,15
    .byte volume_envelope, ve_intermission_noise2
    .byte whole,4
    .byte volume_envelope, ve_intermission_noise1
    .byte whole,15
    .byte volume_envelope, ve_intermission_noise2
    .byte half,4,13
    .byte volume_envelope, ve_intermission_noise1
    .byte half,15,15,2,4
    .byte loop1
    .word .noise_loop

;    .byte endsound

    .byte loop
    .word cutscene_noise