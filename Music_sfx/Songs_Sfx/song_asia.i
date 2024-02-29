song_asia:
    .byte $04           ;4 streams
    
    .byte MUSIC_SQ1     ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte SQUARE_1      ;which channel
    .byte $30           ;initial duty (01)
    .byte ve_hentai_sq1      ;volume envelope
    .word asia_square1  ;pointer to stream
    .byte $B0           ;tempo, originaly $82 since it was 130 in famitracker, sounded slower

    .byte MUSIC_SQ2     ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte SQUARE_2      ;which channel
    .byte $B0           ;initial duty (10)
    .byte ve_hentai_sq2a     ;volume envelope
    .word asia_square2  ;pointer to stream
    .byte $B0           ;tempo
    
    .byte MUSIC_TRI     ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte TRIANGLE      ;which channel
    .byte $80           ;initial volume (on)
    .byte ve_hentai_tria    ;volume envelope
    .word asia_tri      ;pointer to stream
    .byte $B0           ;tempo

    .byte MUSIC_NOI
    .byte $01
    .byte NOISE
    .byte $30
    .byte ve_hentai_noise_a
    .word asia_noise
    .byte $B0


asia_square1:
    .byte set_note_offset, 12
;    .byte endsound
;    .byte set_loop1_counter, 2

;.sq1_loop:
    .byte derek1,C3
    .byte whole,E3
    .byte half,D3,E3
    .byte whole,G3
    .byte half,A3,G3
    .byte whole,E3

    .byte half,D3,E3
    .byte whole,D3
    .byte half,E3,D3
    .byte whole,C3,G2
    .byte half,C3,E3,A3,G3
    .byte whole,E3,D3

    .byte derek1,C3
    .byte whole,E3
    .byte half,D3,E3
    .byte whole,G3
    .byte half,A3,G3
    .byte whole,E3
    .byte half,D3,E3

    .byte whole,G3
    .byte half,G3,C4
    .byte whole,E4,D4
    .byte half,C4,G3,E3,C3
    .byte whole,G2,E2

;    .byte loop1
;    .word  .sq1_loop

;    .byte endsound
    .byte loop
    .word asia_square1


asia_square2:
    .byte set_note_offset, 12
;    .byte endsound

    .byte volume_envelope, ve_hentai_sq2a
    ;;FRAME0
    .byte duty_length,C4,G3

    ;;FRAME1
    .byte duty_length,G3
    .byte derek1,C3,G3

    ;;FRAME2
    .byte duty_length,C4,G3

    ;;FRAME3
    .byte duty_length,E4
    .byte derek1,C4,G3

    .byte volume_envelope, ve_hentai_sq2b
    ;;FRAME4
    .byte derek1,C4
    .byte whole,G3
    .byte half,A3
    .byte d_whole,G3
    .byte half,E3,D3
    .byte whole,C3
    .byte half,G3,C3

    ;;FRAME5
    .byte whole,G3
    .byte half,D3,E3
    .byte whole,G3,C3
    .byte half,C4,G3,E3,C3
    .byte whole,G2,G3

    ;;FRAME6
    .byte derek1,C4
    .byte whole,G3
    .byte half,A3
    .byte d_whole,G3
    .byte half,G3,C4
    .byte whole,E4
    .byte half,G4,C5

    ;;FRAME7
    .byte whole,E5
    .byte half,C5,G4
    .byte whole,E4,D4
    .byte half,E4,C4,G3,E3
    .byte whole,C3,G2

;    .byte endsound
    .byte loop
    .word asia_square2


asia_tri:
    .byte set_note_offset, 12
;    .byte endsound

;    .byte set_loop1_counter, 2
;.tri_loop:
    .byte volume_envelope, ve_hentai_tria
    .byte d_whole,C3
    .byte volume_envelope, ve_hentai_trib
    .byte half,C3
    .byte volume_envelope, ve_hentai_tria
    .byte derek1,C3
    .byte d_whole,G2
    .byte volume_envelope, ve_hentai_trib
    .byte half,G2
    .byte volume_envelope, ve_hentai_tria
    .byte derek1,G2

    .byte d_whole,G2
    .byte volume_envelope, ve_hentai_trib
    .byte half,G2
    .byte volume_envelope, ve_hentai_tria
    .byte derek1,G2
    .byte d_whole,C3
    .byte volume_envelope, ve_hentai_trib
    .byte half,C3
    .byte volume_envelope, ve_hentai_tria
    .byte derek1,G2

    .byte d_whole,C3
    .byte volume_envelope, ve_hentai_trib
    .byte half,C3
    .byte volume_envelope, ve_hentai_tria
    .byte derek1,C3
    .byte d_whole,G2
    .byte volume_envelope, ve_hentai_trib
    .byte half,G2
    .byte volume_envelope, ve_hentai_tria
    .byte derek1,G2

    .byte d_whole,G2
    .byte volume_envelope, ve_hentai_trib
    .byte half,G2
    .byte volume_envelope, ve_hentai_tria
    .byte derek1,G2
    .byte d_whole,C3
    .byte volume_envelope, ve_hentai_trib
    .byte half,C3
    .byte volume_envelope, ve_hentai_tria
    .byte derek1,G2

;    .byte loop1
;    .word .tri_loop

;    .byte endsound
    .byte loop
    .word asia_tri


asia_noise:

;fami 0 1 2 3 4 5 6 7 8 9 A B C D E F 
;prog F E D C B A 9 8 7 6 5 4 3 2 1 0 <-this reverses yet again when dealing with Mode 1 noises.

;    .byte set_loop1_counter, 8
;.noise_loop:
    .byte volume_envelope, ve_hentai_noise_a
    .byte derek1,$0D
    .byte volume_envelope, ve_hentai_noise_b
    .byte whole,$0E
    .byte half,$0E,$0E
    .byte volume_envelope, ve_hentai_noise_a
    .byte derek1,$0D,$0D
;    .byte loop1
;    .word .noise_loop

;    .byte endsound
    .byte loop
    .word asia_noise