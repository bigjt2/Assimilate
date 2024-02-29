song_endstg_fanfare:
    .byte $03           ;3 streams
    
    .byte MUSIC_SQ1     ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte SQUARE_1      ;which channel
    .byte $30           ;initial duty (01)
    .byte ve_endfnfr_sq1     ;volume envelope
    .word endstg_fnfr_sqr1 ;pointer to stream
    .byte $AA           ;tempo, originaly $82 since it was 130 in famitracker, sounded slower

    .byte MUSIC_SQ2     ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte SQUARE_2      ;which channel
    .byte $30           ;initial duty (10)
    .byte ve_endfnfr_sq2tri      ;volume envelope
    .word endstg_fnfr_sqr2 ;pointer to stream
    .byte $AA           ;tempo
    
    .byte MUSIC_TRI     ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte TRIANGLE      ;which channel
    .byte $80           ;initial volume (on)
    .byte ve_endfnfr_sq2tri    ;volume envelope
    .word endstg_fnfr_tri     ;pointer to stream
    .byte $AA           ;tempo


endstg_fnfr_sqr1:
;    .byte endsound

    .byte half, rest
    .byte half, G4
    .byte quarter, E4
    .byte half, G4, E4
    .byte quarter, E4, D4, E4, D4
    .byte half, C4, G3
    .byte quarter, G3, C4, E4
    .byte half, G4, E4
    .byte quarter, D4
    .byte quarter, C4
    .byte half, C4
    .byte d_whole, rest
    .byte endsound


endstg_fnfr_sqr2:
;    .byte endsound

    .byte half, rest
    .byte half, G4
    .byte quarter, E4
    .byte half, G4, E4
    .byte quarter, E4, D4, E4, D4
    .byte half, C4, G3
    .byte quarter, G3, C4, E4
    .byte half, G4, E4
    .byte quarter, D4
    .byte quarter, C4
    .byte half, C4
    .byte d_whole, rest
    .byte endsound


endstg_fnfr_tri:
;    .byte endsound

    .byte half, rest
    .byte half, G4
    .byte quarter, E4
    .byte half, G4, E4
    .byte quarter, E4, D4, E4, D4
    .byte half, C4, G3
    .byte quarter, G3, C4, E4
    .byte half, G4, E4
    .byte quarter, D4
    .byte quarter, C4
    .byte half, C4
    .byte d_whole, rest
;    .byte continue_fanfare, $00  ;began switching the fanfare_advance variable in beneath
                                  ;the level_starts label in main .asm file instead of here - to avoid a bug.
    .byte endsound


