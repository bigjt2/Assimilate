song_final_victory:
    .byte $03           ;3 streams
    
    .byte MUSIC_SQ1     ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte SQUARE_1      ;which channel
    .byte $30           ;initial duty (01)
    .byte ve_endfnfr_sq1b     ;volume envelope
    .word final_victory_sqr1 ;pointer to stream
    .byte $90           ;tempo, originaly $82 since it was 130 in famitracker, sounded slower

    .byte MUSIC_SQ2     ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte SQUARE_2      ;which channel
    .byte $30           ;initial duty (10)
    .byte ve_endfnfr_sq2tri      ;volume envelope
    .word final_victory_sqr2 ;pointer to stream
    .byte $90           ;tempo
    
    .byte MUSIC_TRI     ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte TRIANGLE      ;which channel
    .byte $80           ;initial volume (on)
    .byte ve_endfnfr_sq2tri    ;volume envelope
    .word final_victory_tri     ;pointer to stream
    .byte $90           ;tempo


final_victory_sqr1:
;    .byte endsound

    .byte volume_envelope, ve_endfnfr_sq1
    .byte half, rest
    .byte half, G4
    .byte quarter, E4
    .byte half, G4, E4
    .byte quarter, E4, D4, E4, D4
    .byte half, C4, G3
    .byte quarter, G3, C4, E4
    .byte half, G4, E4
    .byte half, rest

    .byte set_note_offset, 24
    .byte volume_envelope, ve_endfnfr_sq1b
    .byte quarter, G3, C4, E4
    .byte half, G4, E4
    .byte half, rest

    .byte change_tempo, $98
    .byte set_note_offset, -12
    .byte volume_envelope, ve_endfnfr_sq1
    .byte quarter, G3, C4, E4
    .byte half, G4, E4
    .byte half, rest

    .byte change_tempo, $A0
    .byte set_note_offset, 24
    .byte volume_envelope, ve_endfnfr_sq1b
    .byte quarter, G3, C4, E4
    .byte half, G4, E4
    .byte half, rest

    .byte change_tempo, $AA
    .byte set_note_offset, 0
    .byte volume_envelope, ve_endfnfr_sq1
    .byte quarter, G3, C4, E4
    .byte half, G4, E4
    .byte quarter, D4
    .byte quarter, C4
    .byte half, C4
    .byte d_whole, rest
    .byte endsound


final_victory_sqr2:
;    .byte endsound

    .byte half, rest
    .byte half, G4
    .byte quarter, E4
    .byte half, G4, E4
    .byte quarter, E4, D4, E4, D4
    .byte half, C4, G3
    .byte quarter, G3, C4, E4
    .byte half, G4, E4

    .byte duty_length,rest, derek3,rest, five_eighths,rest

    .byte change_tempo, $AA
    .byte quarter, G3, C4, E4
    .byte half, G4, E4
    .byte quarter, D4
    .byte quarter, C4
    .byte half, C4
    .byte d_whole, rest
    .byte endsound


final_victory_tri:
;    .byte endsound

    .byte half, rest
    .byte half, G4
    .byte quarter, E4
    .byte half, G4, E4
    .byte quarter, E4, D4, E4, D4
    .byte half, C4, G3
    .byte quarter, G3, C4, E4
    .byte half, G4, E4

    .byte duty_length,rest, derek3,rest, five_eighths,rest

    .byte change_tempo, $AA
    .byte quarter, G3, C4, E4
    .byte half, G4, E4
    .byte quarter, D4
    .byte quarter, C4
    .byte half, C4
    .byte d_whole, rest
    .byte continue_fanfare, $00
    .byte endsound


