song_final_boss:
    .byte $03           ;4 streams
    
    .byte MUSIC_SQ1     ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte SQUARE_1      ;which channel
    .byte $30           ;initial duty (01)
    .byte ve_armageddon_sq1      ;volume envelope
    .word final_boss_square1  ;pointer to stream
    .byte $B0           ;tempo, originaly $82 since it was 130 in famitracker, sounded slower

    .byte MUSIC_SQ2     ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte SQUARE_2      ;which channel
    .byte $B0           ;initial duty (10)
    .byte ve_armageddon_sq2a    ;volume envelope
    .word final_boss_square2  ;pointer to stream
    .byte $B0           ;tempo
    
    .byte MUSIC_TRI     ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte TRIANGLE      ;which channel
    .byte $80           ;initial volume (on)
    .byte ve_armageddon_tri    ;volume envelope
    .word final_boss_tri      ;pointer to stream
    .byte $B0           ;tempo


final_boss_square1:
    .byte set_note_offset, 12
;    .byte endsound

;    .byte set_loop1_counter, 4
;.square1_loop:
    .byte eighth,F3,Gs3,F4,Gs3,F3,Gs3,F4,Gs3
    .byte eighth,E3,G3,G4,E4,E3,G3,G4,E4
    .byte eighth,Ds3,G3,F4,G4,Ds3,G3,F4,G4
    .byte eighth,D3,F3,G4,F4,D3,F3,G4,F4
    .byte eighth,F3,Gs3,F4,Gs3,F3,Gs3,F4,Gs3
    .byte eighth,E3,G3,G4,E4,E3,G3,G4,E4
    .byte eighth,Ds3,G3,F4,G4,Ds3,G3,F4,G4
    .byte eighth,D3,F3,G4,F4,D3,F3,G4,F4
;    .byte loop1
;    .word .square1_loop

;    .byte endsound
    .byte loop
    .word final_boss_square1


final_boss_square2:
    .byte set_note_offset, 12
;    .byte endsound
;a=3 b=4 c=5 d=6
    ;;FRAME 0
    .byte volume_envelope, ve_armageddon_sq2a
    .byte d_quarter,F3
    .byte derek4,F3
    .byte d_quarter,G3
    .byte derek4,G3
    .byte d_quarter,Ds3
    .byte volume_envelope, ve_armageddon_sq2b
    .byte d_quarter,Ds3
    .byte d_half,D3
    .byte volume_envelope, ve_armageddon_sq2c
    .byte half,As2
    .byte volume_envelope, ve_armageddon_sq2a
    .byte d_quarter,F3
    .byte derek4,F3
    .byte d_quarter,G3
    .byte derek4,G3
    .byte d_quarter,Ds3,Ds3
    .byte half,G3
    .byte volume_envelope, ve_armageddon_sq2c
    .byte d_half,F3

    ;;FRAME 1
    .byte volume_envelope, ve_armageddon_sq2a
    .byte d_quarter,F3
    .byte derek4,F3
    .byte d_quarter,G3
    .byte derek4,G3
    .byte d_quarter,Gs3,Gs3
    .byte quarter,Gs3
    .byte d_quarter,Gs3,G3
    .byte volume_envelope, ve_armageddon_sq2b
    .byte half,Gs3
    .byte volume_envelope, ve_armageddon_sq2c
    .byte d_half,C4
    .byte d_quarter,C4,As3
    .byte quarter,Gs3
    .byte whole,G3,F3

    ;;FRAME 2
    .byte d_quarter,C4,As3
    .byte quarter,Gs3
    .byte d_quarter,As3,Gs3
    .byte quarter,F3,C4,As3,Gs3,F3
    .byte eighth,C4,As3,Gs3,F3,C4,As3,Gs3,F3,C3,F3,Gs3,As3,C4,F4,G4,Gs4,C5,As4,Gs4,F4
    .byte quarter,C4,Gs3
    .byte d_quarter,F3,C3
    .byte half,Gs2
    .byte volume_envelope, ve_armageddon_sq2d
    .byte d_half,F2

    ;;FRAME 3
    .byte volume_envelope, ve_armageddon_sq2a
    .byte d_quarter,F3
    .byte derek4,F3
    .byte d_quarter,G3
    .byte derek4,G3
    .byte d_quarter,Gs3,Gs3
    .byte quarter,Gs3
    .byte d_quarter,Gs3,G3
    .byte half,Gs3
    .byte volume_envelope, ve_armageddon_sq2d
    .byte derek3,F3, whole,rest,half,rest

;    .byte endsound
    .byte loop
    .word final_boss_square2


final_boss_tri:
    .byte set_note_offset, 12
;    .byte endsound

;    .byte set_loop1_counter, 4
;.tri_loop:
    .byte d_half,F2
    .byte derek2,Gs2
    .byte d_half,Ds2,G2
    .byte half,D2
    .byte d_half,F2
    .byte derek2,Gs2
    .byte d_half,Ds2
    .byte derek4,D2,As1
;    .byte loop1
;    .word .tri_loop

;    .byte endsound
    .byte loop
    .word final_boss_tri