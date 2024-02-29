song_title:
    .byte $04           ;4 streams
    
    .byte MUSIC_SQ1     ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte SQUARE_1      ;which channel
    .byte $30           ;initial duty (01)
    .byte ve_opener_sq_05      ;volume envelope
    .word title_square1  ;pointer to stream
    .byte $A0           ;tempo, originaly $82 since it was 130 in famitracker, sounded slower

    .byte MUSIC_SQ2     ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte SQUARE_2      ;which channel
    .byte $B0           ;initial duty (10)
    .byte ve_opener_sq_03    ;volume envelope
    .word title_square2  ;pointer to stream
    .byte $A0           ;tempo
    
    .byte MUSIC_TRI     ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte TRIANGLE      ;which channel
    .byte $80           ;initial volume (on)
    .byte ve_opener_tri_01    ;volume envelope
    .word title_tri      ;pointer to stream
    .byte $A0           ;tempo

    .byte MUSIC_NOI
    .byte $01
    .byte NOISE
    .byte $30
    .byte ve_opener_noise_00
    .word title_noise
    .byte $A0


title_square1:
    .byte set_note_offset, 12
;    .byte endsound

    .byte volume_envelope, ve_opener_sq_05
    .byte set_loop1_counter, 2
.sq1_frame0to1:
    .byte duty_length, rest, rest
;    .byte whole,A1,A2
;    .byte quarter,D2
;    .byte half,Cs2,A2
;    .byte d_half,Gs2
;    .byte whole,A1,A2
;    .byte quarter,D2
;    .byte half,Cs2,A2
;    .byte d_half,Gs2
    .byte loop1
    .word .sq1_frame0to1

    .byte volume_envelope, ve_opener_sq_03
    .byte set_loop1_counter, 3
.sq1_frame2to4:
    .byte d_half,G3
    .byte derek1,A3
    .byte half,D5
    .byte d_half,Cs5,A3
    .byte derek3,E3, whole,rest
    .byte loop1
    .word .sq1_frame2to4

    .byte d_half,G3
    .byte derek1,A3
    .byte quarter,D5
    .byte d_half,Cs5
    .byte whole,E5
    .byte volume_envelope, ve_opener_sq_04
    .byte derek3,E5, whole,rest

;    .byte endsound

    .byte loop
    .word title_square1


title_square2:
    .byte set_note_offset, 12
;    .byte endsound

    .byte set_loop1_counter, 2
.sq2_frame0to1:
    .byte volume_envelope, ve_opener_sq_03
    .byte whole,E4,E4
    .byte volume_envelope, ve_opener_sq_04
    .byte whole,Fs4,Cs4
    .byte half,E4,Cs4,B3,A3
    .byte whole,E3,A3
    .byte loop1
    .word .sq2_frame0to1

    .byte volume_envelope, ve_opener_sq_02
    .byte set_loop1_counter, 2
 .sq2_frame2to3:
    .byte quarter,G4,D4,A4,Fs4,G4,D4,A4,Fs4
    .byte quarter,G4,D4,A4,Fs4,G4,D4,A4,Fs4
    .byte quarter,E4,A3,G4,Fs4,E4,A3,G4,A3
    .byte quarter,E4,A3,G4,Fs4,D4,Cs4,B3,A3  
    .byte loop1
    .word .sq2_frame2to3

    .byte volume_envelope, ve_opener_sq_03
    .byte quarter,D4
    .byte volume_envelope, ve_opener_sq_02
    .byte quarter,D4,A4
    .byte volume_envelope, ve_opener_sq_03
    .byte quarter,Fs4
    .byte volume_envelope, ve_opener_sq_02
    .byte quarter,G4,D4,A4,Fs4,G4,D4,A4
    .byte volume_envelope, ve_opener_sq_03
    .byte quarter,G4
    .byte volume_envelope, ve_opener_sq_02
    .byte quarter,G4
    .byte volume_envelope, ve_opener_sq_03
    .byte quarter,Fs4
    .byte volume_envelope, ve_opener_sq_02
    .byte quarter,A4,Fs4
    .byte volume_envelope, ve_opener_sq_03
    .byte quarter,E4
    .byte volume_envelope, ve_opener_sq_02
    .byte quarter,A3,G4
    .byte volume_envelope, ve_opener_sq_03
    .byte quarter,Cs4
    .byte volume_envelope, ve_opener_sq_02
    .byte quarter,E4,A3,G4,A3,E4,A3,G4,Fs4,D4,Cs4,B3,A3

    .byte volume_envelope, ve_opener_sq_03
    .byte d_half,D4
    .byte derek1,E4
    .byte half,B4
    .byte d_half,D5
    .byte whole,Cs5
    .byte volume_envelope, ve_opener_sq_04
    .byte derek1,Cs5, whole,rest

;    .byte endsound

    .byte loop
    .word title_square2


title_tri:
    ;;NOTE: All D9 notes in this stream were originally composed by Derek
    ;;as G1.  Due to how high G1 is on the note table, adding an offset of 12
    ;;sends the sound engine off the charts and generates a bloop.  I simply
    ;;re-calculated and used D9 instead of constantly shifting the note offset.

    .byte set_note_offset, 12
;    .byte endsound

    .byte volume_envelope, ve_opener_tri_01
    .byte set_loop1_counter, 2
.tri_frame_0to1:
    .byte whole,A1,A2
    .byte quarter,A1
    .byte half,B1,Cs2
    .byte d_half,A2
    .byte whole,A1,A2
    .byte quarter,A2
    .byte half,Gs2,E2
    .byte d_half,Cs2
    .byte loop1
    .word .tri_frame_0to1

    .byte set_loop1_counter, 2
.tri_frame_2to3:
    .byte volume_envelope, ve_opener_tri_02
    .byte quarter,D9,D2,D9,D2,D9,D2,D9,D2,D9,D2,D9,D2,D9,D2,D9,D2,D9,E2
    .byte volume_envelope, ve_opener_tri_01
    .byte quarter,G2,Fs2,E2,A1,D9,A1
    .byte volume_envelope, ve_opener_tri_02
    .byte quarter,D9,E2
    .byte volume_envelope, ve_opener_tri_01
    .byte quarter,G2,Fs2,E2,A1,D9,A1
    .byte loop1
    .word .tri_frame_2to3

    .byte set_loop1_counter, 2
.tri_frame_4to5:
    .byte d_half,D9
    .byte derek2,D9
    .byte d_half,D9
    .byte derek2,D9
    .byte d_half,A1
    .byte derek2,A1
    .byte d_half,A1
    .byte derek2,A1
    .byte loop1
    .word .tri_frame_4to5

;    .byte endsound
    .byte loop
    .word title_tri


title_noise:

;fami 0 1 2 3 4 5 6 7 8 9 A B C D E F 
;prog F E D C B A 9 8 7 6 5 4 3 2 1 0 <-this reverses yet again when dealing with Mode 1 noises.
;    .byte endsound

    .byte volume_envelope, ve_opener_noise_00
    .byte whole,$0F
    .byte volume_envelope, ve_opener_noise_01
    .byte whole,$04
    .byte volume_envelope, ve_opener_noise_00
    .byte d_quarter,$0F,$0F
    .byte half,$0F
    .byte quarter,$0F
    .byte volume_envelope, ve_opener_noise_01
    .byte half,$04
    .byte volume_envelope, ve_opener_noise_00
    .byte whole,$0F
    .byte volume_envelope, ve_opener_noise_01
    .byte whole,$04
    .byte volume_envelope, ve_opener_noise_00
    .byte d_quarter,$0F,$0F
    .byte half,$0F
    .byte quarter,$0F
    .byte volume_envelope, ve_opener_noise_01
    .byte half,$04

    .byte volume_envelope, ve_opener_noise_00
    .byte whole,$0F
    .byte volume_envelope, ve_opener_noise_01
    .byte whole,$04
    .byte volume_envelope, ve_opener_noise_00
    .byte d_quarter,$0F,$0F
    .byte half,$0F
    .byte quarter,$0F
    .byte volume_envelope, ve_opener_noise_01
    .byte half,$04
    .byte volume_envelope, ve_opener_noise_00
    .byte whole,$0F
    .byte volume_envelope, ve_opener_noise_01
    .byte whole,$04
    .byte volume_envelope, ve_opener_noise_00
    .byte quarter,$0F,$0F,$0F,$0F
    .byte volume_envelope, ve_opener_noise_01
    .byte quarter,$04,$04,$04,$04

    .byte set_loop1_counter, 3
.noise_frame_2to4:
    .byte half,$0F
    .byte volume_envelope, ve_opener_noise_00
    .byte quarter,$04,$0F
    .byte half,$0F,$04
    .byte volume_envelope, ve_opener_noise_01
    .byte half,$0F
    .byte volume_envelope, ve_opener_noise_00
    .byte quarter,$04,$0F,$0F,$02,$04,$02
    .byte volume_envelope, ve_opener_noise_01
    .byte half,$0F
    .byte volume_envelope, ve_opener_noise_00
    .byte quarter,$04,$0F
    .byte half,$0F,$04
    .byte volume_envelope, ve_opener_noise_01
    .byte half,$0F
    .byte volume_envelope, ve_opener_noise_00
    .byte quarter,$04,$0F,$0F,$02,$04,$02
    .byte loop1
    .word .noise_frame_2to4

    .byte volume_envelope, ve_opener_noise_00
    .byte whole,$0F
    .byte volume_envelope, ve_opener_noise_01
    .byte whole,$04
    .byte volume_envelope, ve_opener_noise_00
    .byte d_quarter,$0F,$0F
    .byte half,$0F
    .byte quarter,$0F
    .byte volume_envelope, ve_opener_noise_01
    .byte half,$04
    .byte volume_envelope, ve_opener_noise_00
    .byte whole,$0F
    .byte volume_envelope, ve_opener_noise_01
    .byte whole,$04
    .byte volume_envelope, ve_opener_noise_00
    .byte quarter,$0F,$0F,$0F,$0F
    .byte volume_envelope, ve_opener_noise_01
    .byte quarter,$04,$04,$04,$04

;    .byte endsound

    .byte loop
    .word title_noise