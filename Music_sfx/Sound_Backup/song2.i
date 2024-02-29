
song2_header:
    .byte $04           ;4 streams
    
    .byte MUSIC_SQ1     ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte SQUARE_1      ;which channel
    .byte $30           ;initial duty (01)
    .byte ve_s2_sq1_intro      ;volume envelope
    .word song2_square1 ;pointer to stream
    .byte $B0           ;tempo, originaly $82 since it was 130 in famitracker, sounded slower

    .byte MUSIC_SQ2     ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte SQUARE_2      ;which channel
    .byte $30           ;initial duty (10)
    .byte ve_s2_sq2_intro      ;volume envelope
    .word song2_square2 ;pointer to stream
    .byte $B0           ;tempo
    
    .byte MUSIC_TRI     ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte TRIANGLE      ;which channel
    .byte $80           ;initial volume (on)
    .byte ve_s2_triangle    ;volume envelope
    .word song2_tri     ;pointer to stream
    .byte $B0           ;tempo

    .byte MUSIC_NOI
    .byte $01
    .byte NOISE
    .byte $30
    .byte ve_s2_noise
    .word song2_noise
    .byte $B0


song2_square1:
    .byte volume_envelope, ve_s2_sq1_intro
    .byte set_note_offset, 12

;frame 0
    .byte derek1, C3, E3, A3, G3 

;frame 1
    .byte derek1, C3, E3, A3
    .byte whole
    .byte G3
    .byte volume_envelope, ve_s2_main_square1
    .byte half, G3, E3

    .byte set_loop1_counter, 4

;frame 2,3,4,5 loop
.sq1_frame_2345:
    .byte quarter, C3, E3, A3, C3
    .byte half, G3
    .byte quarter, E3, C3, E3, A3, C3
    .byte half, G3
    .byte d_half, E3
    .byte quarter, C3, E3, A3, C3
    .byte half, G3
    .byte quarter, E3, C3, B2, G2, C2
    .byte half, G3
    .byte d_half, E3

    .byte loop1
    .word .sq1_frame_2345

    .byte stream_wait, 0, 1    ;hold stream 1

    .byte loop
    .word song2_square1


song2_square2:
    .byte set_note_offset, 12

;frame 0
    .byte derek2, G4

    .byte set_loop1_counter, 12
    .byte volume_envelope, ve_s2_sq2_tremolo
    .byte eighth
.tromolo1:
    .byte G4
    .byte loop1
    .word .tromolo1

    .byte change_tempo, $5C     ;originally $70
    .byte set_loop1_counter, 5
    .byte eighth
.tromolo2:
    .byte G4
    .byte loop1
    .word .tromolo2

    .byte eighth, G4, Gb4, F4, E4, Eb4

    .byte change_tempo, $40     ;originally $50
    .byte eighth, D4, Db4, C4, B3

    .byte change_tempo, $1C     ;originally $20
    .byte eighth, B3, B3

    .byte change_tempo, $B0    

;frame 1
    .byte volume_envelope, ve_s2_sq2_lead1a
    .byte sixteenth, C5, Db5, D5, Eb5, E5, F5, Gb5, G5
    .byte volume_envelope, ve_s2_sq2_lead1b
    .byte d_whole, G5

    .byte volume_envelope, ve_s2_sq2_lead2a
    .byte sixteenth, A4, Bb4, B4, C5, Db5
    .byte volume_envelope, ve_s2_sq2_lead2b
    .byte sixteenth, D5, Eb5, E5
    .byte volume_envelope, ve_s2_sq2_lead2c
    .byte d_whole, E5

    .byte volume_envelope, ve_s2_sq2_lead2a
    .byte sixteenth, F4, Fs4, G4, Gs4
    .byte volume_envelope, ve_s2_sq2_lead2b
    .byte sixteenth, A4, As4, B4, C5
    .byte volume_envelope, ve_s2_sq2_lead2c
    .byte d_whole, C5

    .byte volume_envelope, ve_s2_sq2_lead2a
    .byte sixteenth, C4, Db4, D4, Eb4
    .byte volume_envelope, ve_s2_sq2_lead2b
    .byte sixteenth, E4, F4, Gb4, G4
    .byte volume_envelope, ve_s2_sq2_lead2c
    .byte d_whole, G4

;frame 2
    .byte volume_envelope, ve_s2_sq2_stucatto
    .byte half, G4
    .byte quarter, E4
    .byte half, G4, E4
    .byte quarter, E4, D4, E4, D4
    .byte half, C4, G3
    .byte quarter, G3
    .byte half, C4, E4, G4
    .byte quarter, E4
    .byte volume_envelope, ve_s2_sq2_lead1a
    .byte quarter, E4
    .byte volume_envelope, ve_s2_sq2_lead1b
    .byte half, E4
    .byte d_whole, rest

;frame 3
    .byte volume_envelope, ve_s2_sq2_stucatto
    .byte half, G4
    .byte quarter, E4
    .byte half, G4, E4
    .byte quarter, E4, D4, E4, D4
    .byte half, C4, G3
    .byte quarter, G3
    .byte half, C4, E4, G4
    .byte quarter, E4
    .byte volume_envelope, ve_s2_sq2_lead1a
    .byte quarter, C4
    .byte volume_envelope, ve_s2_sq2_lead1b
    .byte half, C4
    .byte d_whole, rest

;frame 4
    .byte volume_envelope, ve_s2_sq2_stucatto
    .byte quarter, C4
    .byte half, E4, G4
    .byte d_half, rest
    .byte quarter, C4
    .byte half, E4, A4
    .byte d_half, rest
    .byte quarter, C4, E4
    .byte half, C5, B4
    .byte quarter, G4
    .byte volume_envelope, ve_s2_sq2_lead1a
    .byte quarter, E4
    .byte volume_envelope, ve_s2_sq2_lead1b
    .byte half, E4
    .byte d_whole, rest

;frame 5
    .byte volume_envelope, ve_s2_sq2_stucatto
    .byte half, G4
    .byte quarter, E4
    .byte half, G4, E4
    .byte quarter, E4, D4, E4, D4
    .byte half, C4, G3
    .byte quarter, G3, C4, E4
    .byte half, G4, E4
    .byte quarter, D4
    .byte volume_envelope, ve_s2_sq2_lead1a
    .byte quarter, C4
    .byte volume_envelope, ve_s2_sq2_lead1b
    .byte half, C4
    .byte d_whole, rest

    .byte stream_wait, 0, 0    ;resume square 1
    .byte stream_wait, 2, 0    ;resume triangle channel
    .byte stream_wait, 3, 0    ;resume noise channel

    .byte loop
    .word song2_square2


song2_tri:
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

    .byte stream_wait, 2, 1   ;stall triangle channel
    .byte loop
    .word song2_tri


song2_noise:
;frame 0
    .byte whole, $0F, $0A, $0F
    .byte half, $0A, $0A
    .byte whole, $0F, $0A, $0F
    .byte half, $0A, $0A

;frame 1
    .byte whole, $0F, $0A, $0F
    .byte half, $0A, $0A
    .byte whole, $0F, $0A, $0F
    .byte volume_envelope, ve_s2_noise_short
    .byte quarter, $0A, $0A, $0A, $0A

;frame 2,3,4,5
    .byte set_loop1_counter, 4

.noise_loop:
    .byte half, $0F
    .byte quarter, $0A, $0F
    .byte half, $0F, $0A, $0F
    .byte quarter, $0A, $0F
    .byte half, $0F, $0A, $0F
    .byte quarter, $0A, $0F
    .byte half, $0F, $0A, $0F
    .byte quarter, $0A, $0F
    .byte half, $0F, $0A

    .byte loop1
    .word .noise_loop

    .byte volume_envelope, ve_s2_noise

    .byte stream_wait, 3, 1    ;stall noise

    .byte loop
    .word song2_noise