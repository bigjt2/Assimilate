song_soviet:
    .byte $04           ;4 streams
    
    .byte MUSIC_SQ1     ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte SQUARE_1      ;which channel
    .byte $30           ;initial duty (01)
    .byte ve_commie_sq1      ;volume envelope
    .word soviet_square1  ;pointer to stream
    .byte $B0           ;tempo, originaly $82 since it was 130 in famitracker, sounded slower

    .byte MUSIC_SQ2     ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte SQUARE_2      ;which channel
    .byte $B0           ;initial duty (10)
    .byte ve_commie_sq2     ;volume envelope
    .word soviet_square2  ;pointer to stream
    .byte $B0           ;tempo
    
    .byte MUSIC_TRI     ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte TRIANGLE      ;which channel
    .byte $80           ;initial volume (on)
    .byte ve_commie_tri    ;volume envelope
    .word soviet_tri      ;pointer to stream
    .byte $B0           ;tempo

    .byte MUSIC_NOI
    .byte $01
    .byte NOISE
    .byte $30
    .byte ve_commie_nse_loud
    .word soviet_noise
    .byte $B0


soviet_square1:
    .byte set_note_offset, 12

    .byte set_loop1_counter, 2
.square1_loop:
    .byte d_half,D3
    .byte quarter,Cs3
    .byte d_half,B2
    .byte quarter,Cs3,D3,Cs3,B2,D3
    .byte whole,Cs3
    .byte d_half,Cs3
    .byte quarter,B2
    .byte d_half,As2
    .byte quarter,Cs3,D3,Cs3,B2,As2
    .byte whole,B2

    .byte d_half,E3
    .byte quarter,G3
    .byte d_half,Fs3
    .byte quarter,D3,E3,E3,D3,Cs3
    .byte half,D3
    .byte d_half,B2
    .byte half,E3
    .byte quarter,Cs3
    .byte d_half,D3
    .byte quarter,Cs3,D3,Cs3,B2,As2
    .byte whole,B2

    .byte loop1
    .word .square1_loop

    .byte duty_length, rest, rest

;    .byte endsound
    .byte loop
    .word soviet_square1


soviet_square2:
    .byte set_note_offset, 12
;    .byte endsound

.sqaure2_frame_0to1:
    .byte duty_length, rest, rest, rest, rest

.sqaure2_frame_2to3:
    ;;FRAME 2
    .byte half,B4,B4,B4,B4,B4,B4,As4,As4,As4,As4,As4,As4,As4,As4,B4,B4

    ;;FRAME 3
    .byte half,E5,E5,D5,D5,Cs5,Cs5,B4,B4,As4,As4,As4,As4,As4,As4
    .byte whole,B4

    .byte duty_length, rest, rest

;    .byte endsound
    .byte loop
    .word soviet_square2


soviet_tri:
    .byte set_note_offset, 12

    .byte set_loop1_counter, 2
.triangle_frame_0to1:
    ;;FRAME 0
    .byte half,B2,Fs2,B2,Fs2,B2,D3,Cs3,Fs2,Cs3,Fs2,Cs3,Fs2,Cs3,E3,D3,Fs2

    ;;FRAME 1
    .byte half,E3,G3,Fs3,D3,E3,Cs3,D3,B2,As2,E3,D3,Cs3,As2,Cs3
    .byte whole,B2

    .byte loop1
    .word .triangle_frame_0to1

    .byte duty_length, rest, rest

;    .byte endsound
    .byte loop
    .word soviet_tri

soviet_noise:

;fami 0 1 2 3 4 5 6 7 8 9 A B C D E F 
;prog F E D C B A 9 8 7 6 5 4 3 2 1 0 <-this reverses yet again when dealing with Mode 1 noises.

    .byte volume_envelope, ve_commie_nse_loud
    .byte set_loop1_counter, 2
.noise_frame_0to1:
    .byte quarter,$0E,$00
    .byte eighth,$00,$02
    .byte half,$00,$00
    .byte quarter,$00,$0E
    .byte half,$00,$00,$00
    .byte quarter,$00,$0E,$00
    .byte eighth,$00,$02
    .byte half,$00,$00
    .byte quarter,$00,$0E
    .byte half,$00,$00
    .byte quarter,$00,$00,$00
    .byte loop1
    .word .noise_frame_0to1

    .byte volume_envelope, ve_commie_nse_soft
    .byte set_loop1_counter, 2
.noise_frame_2to3:
    .byte set_loop2_counter, 16
.noise_frame_2to3_inner:
    .byte quarter,$0E,$00
    .byte loop2
    .word .noise_frame_2to3_inner
    .byte loop1
    .word .noise_frame_2to3

    .byte volume_envelope, ve_commie_nse_loud
.noise_frame_4:
    .byte quarter,$0E,$00
    .byte eighth,$00,$02
    .byte half,$00,$00
    .byte quarter,$00,$0E
    .byte half,$00,$00,$00
    .byte quarter,$00,$0E,$00
    .byte eighth,$00,$02
    .byte half,$00,$00
    .byte quarter,$00,$0E
    .byte half,$00,$00
    .byte quarter,$00,$00,$00

;    .byte endsound
    .byte loop
    .word soviet_noise