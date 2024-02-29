
song_moon:
    .byte $04           ;4 streams
    
    .byte MUSIC_SQ1     ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte SQUARE_1      ;which channel
    .byte $30           ;initial duty (01)
    .byte ve_moon_sq1a      ;volume envelope
    .word moon_square1  ;pointer to stream
    .byte $BB           ;tempo, originaly $82 since it was 130 in famitracker, sounded slower

    .byte MUSIC_SQ2     ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte SQUARE_2      ;which channel
    .byte $B0           ;initial duty (10)
    .byte ve_moon_sq2      ;volume envelope
    .word moon_square2  ;pointer to stream
    .byte $BB           ;tempo
    
    .byte MUSIC_TRI     ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte TRIANGLE      ;which channel
    .byte $80           ;initial volume (on)
    .byte ve_moon_tri_a    ;volume envelope
    .word moon_tri      ;pointer to stream
    .byte $BB           ;tempo

    .byte MUSIC_NOI
    .byte $01
    .byte NOISE
    .byte $30
    .byte ve_moon_nse_sil
    .word moon_noise
    .byte $BB


moon_square1:
    .byte set_note_offset, 12

    .byte set_loop1_counter, 14
    .byte volume_envelope, ve_moon_sq1a
.sq1_frame_0to6
    .byte quarter,F3,A3,F4,F3,A3,G4,F4,C4,F3,A3,C4,F4,A4,G4,F4,C4
    .byte loop1
    .word .sq1_frame_0to6

    .byte set_loop1_counter, 3
    .byte volume_envelope, ve_moon_sq1b
.sq1_frame_7to9
    .byte d_half,F3,F3
    .byte quarter,C4
    .byte d_half,C4
    .byte half,C4,C4,C4
    .byte d_half,C4
    .byte derek2,F4
    .byte half,C4,A3,E3,D3
    .byte loop1
    .word .sq1_frame_7to9

.sq1_frame_A
    .byte d_half,A3
    .byte derek2,A3
    .byte d_half,A3
    .byte derek2,A3
    .byte d_half,G3
    .byte derek2,G3
    .byte d_half,G3
    .byte half,G3,C4
    .byte quarter,F4

    .byte set_loop1_counter, 8
    .byte volume_envelope, ve_moon_sq1a
.sq1_frame_BtoE
    .byte quarter,F3,A3,F4,F3,A3,G4,F4,C4,F3,A3,C4,F4,A4,G4,F4,C4
    .byte loop1
    .word .sq1_frame_BtoE

;    .byte endsound
    .byte loop
    .word moon_square1


moon_square2:
    .byte set_note_offset, 12

.sq2_frame_0:
    .byte duty_length, rest, rest

.sq2_frame_1:
    .byte d_half,F4
    .byte derek3,E4
    .byte half,A4,G4
    .byte d_half,F4,G4
    .byte half,A4
    .byte derek1,A4

.sq2_frame_2:
    .byte d_half,F4,G4
    .byte d_whole,A4
    .byte whole,G4
    .byte derek1,C5,F5

    .byte set_loop1_counter, 2
.sq2_frame_3to4:
    ;;FRAME 3
    .byte derek2,F4
    .byte quarter,E4,F4
    .byte d_half,C5
    .byte half,A4,G4,F4
    .byte d_quarter,G4,A4
    .byte derek3,F4,whole,F4   ;one note from the exporter, just an odd length

    ;;FRAME 4
    .byte derek2,F4
    .byte quarter,E4,F4
    .byte d_half,C5
    .byte half,A4,G4,F4
    .byte quarter,F4,E4,F4
    .byte half,C5
    .byte d_half,A4
    .byte derek1,G4
    .byte loop1
    .word .sq2_frame_3to4

    .byte set_loop1_counter, 3
    .byte volume_envelope, ve_moon_sq1b
.sq2_frame_7to9:
    .byte d_half,C4,C4
    .byte quarter,A3
    .byte d_half,G3
    .byte half,F3,G3,F3
    .byte d_half,A3
    .byte derek2,C4
    .byte half,G3,F3,G3,F3
    .byte loop1
    .word .sq2_frame_7to9

.sq2_frame_A:
    .byte d_half,C4
    .byte derek2,C4
    .byte d_half,C4
    .byte derek2,C4
    .byte d_half,E3
    .byte derek2,E3
    .byte quarter,C3,E3,F3
    .byte half,C4,E4
    .byte quarter,A4

    .byte set_loop1_counter, 2
    .byte volume_envelope, ve_moon_sq2
.sq2_frame_BtoE:
    ;;FRAME 3
    .byte derek2,F4
    .byte quarter,E4,F4
    .byte d_half,C5
    .byte half,A4,G4,F4
    .byte d_quarter,G4,A4
    .byte derek3,F4,whole,F4   ;one note from the exporter, just an odd length

    ;;FRAME 4
    .byte derek2,F4
    .byte quarter,E4,F4
    .byte d_half,C5
    .byte half,A4,G4,F4
    .byte quarter,F4,E4,F4
    .byte half,C5
    .byte d_half,A4
    .byte derek1,G4
    .byte loop1
    .word .sq2_frame_BtoE

    .byte loop
    .word moon_square2


moon_tri:
    .byte set_note_offset, 12

.tri_frame_0:
    .byte duty_length, rest, rest

    .byte set_loop1_counter, 2
    .byte volume_envelope, ve_moon_tri_a
.tri_frame_1to2:
    .byte d_half,F4,C4
    .byte d_whole,F3
    .byte whole,F4
    .byte d_half,D4,A3
    .byte derek1,D3,half,rest  ;wierd notelength in exporter, split up
    .byte loop1
    .word .tri_frame_1to2

    .byte set_loop1_counter, 2
    .byte volume_envelope, ve_moon_tri_b
.tri_frame_3to6:
    .byte quarter,F4,F4,F4,F4,F4,F4,F4,F4,C4,C4,C4,C4,C4,C4,C4,C4,D4,D4,D4,D4,D4,D4,D4,D4,C4,C4,C4,C4,C4,C4,C4,C4
    .byte quarter,As3,As3,As3,As3,As3,As3,As3,As3,G3,G3,G3,G3,G3,G3,G3,G3,C4,C4,C4,C4,C4,C4,C4,C4,E4,E4,E4,E4,E4,E4,E4,E4
    .byte loop1
    .word .tri_frame_3to6

    .byte set_loop1_counter, 4
.tri_frame_7toA:
    .byte d_half,A3
    .byte derek2,A3
    .byte d_half,As3
    .byte derek2,As3
    .byte d_half,C4
    .byte derek2,C4
    .byte d_half,C4
    .byte derek2,C4
    .byte loop1
    .word .tri_frame_7toA

    .byte set_loop1_counter, 2
.tri_frame_BtoE:
    .byte quarter,F4,F4,F4,F4,F4,F4,F4,F4,C4,C4,C4,C4,C4,C4,C4,C4,D4,D4,D4,D4,D4,D4,D4,D4,C4,C4,C4,C4,C4,C4,C4,C4
    .byte quarter,As3,As3,As3,As3,As3,As3,As3,As3,G3,G3,G3,G3,G3,G3,G3,G3,C4,C4,C4,C4,C4,C4,C4,C4,E4,E4,E4,E4,E4,E4,E4,E4
    .byte loop1
    .word .tri_frame_BtoE

    .byte loop
    .word moon_tri

moon_noise:

;fami 0 1 2 3 4 5 6 7 8 9 A B C D E F 
;prog F E D C B A 9 8 7 6 5 4 3 2 1 0 <-this reverses yet again when dealing with Mode 1 noises.

    .byte set_loop1_counter, 2
    .byte volume_envelope, ve_moon_nse_sil
.noise_frame_0to1:
    .byte duty_length, $01,$01
    .byte loop1
    .word .noise_frame_0to1

.noise_frame_2:
    .byte volume_envelope, ve_moon_nse_sil
    .byte duty_length,$01, derek1,$01, whole,$01
    .byte volume_envelope, ve_moon_nse_long
    .byte quarter,$1C,$0B,$0B,$0B

    .byte set_loop1_counter, 12
.noise_frame_3toE:
    .byte set_loop2_counter, 8
.noise_frame_3toE_inner:
    .byte volume_envelope, ve_moon_nse_long
    .byte quarter,$1C
    .byte volume_envelope, ve_moon_nse_shrt
    .byte quarter,$02
    .byte volume_envelope, ve_moon_nse_long
    .byte quarter,$05
    .byte volume_envelope, ve_moon_nse_shrt
    .byte quarter,$02
    .byte loop2
    .word .noise_frame_3toE_inner
    .byte loop1
    .word .noise_frame_3toE

    .byte loop
    .word moon_noise