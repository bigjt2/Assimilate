song_cows:
    .byte $04           ;4 streams
    
    .byte MUSIC_SQ1     ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte SQUARE_1      ;which channel
    .byte $30           ;initial duty (01)
    .byte ve_bovine_squares      ;volume envelope
    .word cows_square1  ;pointer to stream
    .byte $60           ;tempo, originaly $82 since it was 130 in famitracker, sounded slower

    .byte MUSIC_SQ2     ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte SQUARE_2      ;which channel
    .byte $B0           ;initial duty (10)
    .byte ve_bovine_squares     ;volume envelope
    .word cows_square2  ;pointer to stream
    .byte $60           ;tempo
    
    .byte MUSIC_TRI     ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte TRIANGLE      ;which channel
    .byte $80           ;initial volume (on)
    .byte ve_bovine_triangle    ;volume envelope
    .word cows_tri      ;pointer to stream
    .byte $60           ;tempo

    .byte MUSIC_NOI
    .byte $01
    .byte NOISE
    .byte $30
    .byte ve_bovine_noise_a
    .word cows_noise
    .byte $60


cows_square1:
    .byte set_note_offset, 12
;    .byte endsound

    .byte set_loop1_counter, 3
.sq1_frame0to2:
    .byte half,C3,G3,G3,D3,A3,A3,F3,A3,A3,E3,G3,G3
    .byte loop1
    .word .sq1_frame0to2

.sq1_frame3:
    .byte half,C3,G3,G3,D3,A3,A3,F3,A3,A3,F3,A3,A3
.sq1_frame4:
    .byte half,C3,E3,E3,C3,E3,E3,C3,E3,E3,C3,E3,E3

;    .byte endsound
    .byte loop
    .word cows_square1


cows_square2:
    .byte set_note_offset, 12
;    .byte endsound

    .byte set_loop1_counter, 3
.sq2_frame0to2:
    .byte half,E2,C3,C3,F2,D3,D3,A2,F3,F3,G2,E3,E3
    .byte loop1
    .word .sq2_frame0to2

.sq2_frame3:
    .byte half,E2,C3,C3,F2,D3,D3,A2,F3,F3,A2,F3,F3
.sq2_frame4:
    .byte half,E3,G3,G3,E3,G3,G3,E3,G3,G3,E3,G3,G3

;    .byte endsound
    .byte loop
    .word cows_square2


cows_tri:
    .byte set_note_offset, 12
;    .byte endsound

    .byte whole,C5
    .byte half,G5
    .byte whole,D5
    .byte d_whole,C5
    .byte half,A4
    .byte d_whole,G4

    .byte whole,C5
    .byte half,G5
    .byte whole,D5
    .byte d_whole,C5
    .byte half,A4
    .byte d_whole,C5

    .byte whole,G5
    .byte half,F5
    .byte whole,E5
    .byte half,D5
    .byte whole,C5
    .byte half,A4
    .byte d_whole,G4

    .byte whole,C5
    .byte half,G5
    .byte whole,D5
    .byte d_whole,C5,C5  ;wierd notelength, split from exporter
    .byte half,A4

    .byte d_whole,C5,C5,half,C5  ;wierd notelength, split from exporter
    .byte whole,rest
    .byte half,F5,E5,D5

;    .byte endsound
    .byte loop
    .word cows_tri


cows_noise:

;fami 0 1 2 3 4 5 6 7 8 9 A B C D E F 
;prog F E D C B A 9 8 7 6 5 4 3 2 1 0 <-this reverses yet again when dealing with Mode 1 noises.

;    .byte set_loop1_counter, 5
;.noise_loop:
    .byte volume_envelope, ve_bovine_noise_a
    .byte half,$0D
    .byte volume_envelope, ve_bovine_noise_b
    .byte quarter,$02,$07
    .byte half,$02
    .byte volume_envelope, ve_bovine_noise_a
    .byte half,$0D
    .byte volume_envelope, ve_bovine_noise_b
    .byte half,$02,$02
    .byte volume_envelope, ve_bovine_noise_a
    .byte half,$0D
    .byte volume_envelope, ve_bovine_noise_b
    .byte quarter,$02,$04
    .byte half,$02,$0D,$02,$02
;    .byte loop1
;    .word .noise_loop

;    .byte endsound
    .byte loop
    .word cows_noise