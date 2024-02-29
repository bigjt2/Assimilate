
song2_header:
    .byte $04           ;4 streams
    
    .byte MUSIC_SQ1     ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte SQUARE_1      ;which channel
    .byte $30           ;initial duty (01)
    .byte ve_s2_sq1_intro      ;volume envelope
    .word song2_square1 ;pointer to stream
    .byte $B8   ;$96           ;originally $82 since it was 130 in famitracker, sounded slower

    .byte MUSIC_SQ2     ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte SQUARE_2      ;which channel
    .byte $30           ;initial duty (10)
    .byte ve_s2_sq2_intro      ;volume envelope
    .word song2_square2 ;pointer to stream
    .byte $A0           ;tempo
    
    .byte MUSIC_TRI     ;which stream
    .byte $00           ;status byte (stream enabled)
    .byte TRIANGLE      ;which channel
    .byte $80           ;initial volume (on)
    .byte ve_derek_long    ;volume envelope
    .word song2_tri     ;pointer to stream
    .byte $96           ;tempo

    .byte MUSIC_NOI
    .byte $00
    .byte NOISE
    .byte $30
    .byte ve_ddrum2
    .word song2_noise
    .byte $96


song2_square1:
    .byte volume_envelope, ve_s2_sq1_intro
;    .byte set_arpeggio, arp_s2_sq1_intro
    .byte set_note_offset, 12

;frame 0
    .byte derek1, C3, E3, A3, G3 
    .byte stream_wait, 1, 0    ;re-enable stream 2 so it can proceed

;frame 1
    .byte derek1, C3, E3, A3
    .byte whole
    .byte G3
;    .byte set_arpeggio, arp_none
    .byte volume_envelope, ve_s2_main_square1
    .byte half, G3, E3

    .byte set_loop1_counter, 4
    .byte change_tempo, $A0
    .byte stream_wait, 0, 1    ;hold stream 1 until frame 1 of stream 2 is finished

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

    .byte change_tempo,  $B8

    .byte loop
    .word song2_square1


song2_square2:
    .byte set_note_offset, 12
;    .byte set_arpeggio, arp_none

;frame 0
    .byte derek2, G4

    .byte set_loop1_counter, 12
    .byte volume_envelope, ve_s2_sq2_tremolo
    .byte eighth
.tromolo1:
    .byte G4
    .byte loop1
    .word .tromolo1

    .byte change_tempo, $70
    .byte set_loop1_counter, 5
    .byte eighth
.tromolo2:
    .byte G4
    .byte loop1
    .word .tromolo2

    .byte eighth, G4, Gb4, F4, E4, Eb4

    .byte change_tempo, $50
    .byte eighth, D4, Db4, C4, B3

    .byte change_tempo, $20
    .byte eighth, B3, B3

    .byte change_tempo, $B8

    .byte stream_wait, 1, 1    ;set stream 2 waitflag, wait on stream 1, frame 0

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

;32 16ths = 64  //  4 d_ws = 192

    .byte change_tempo, $A0
    .byte stream_wait, 0, 0    ;allow stream 1 to advance now

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

    .byte loop
    .word song2_square2


song2_tri:
    .byte endsound

song2_noise:
    .byte endsound