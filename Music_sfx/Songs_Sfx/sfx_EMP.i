sfx_EMP:
    .byte $02           ;2 streams

    .byte SFX_1         ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte TRIANGLE      ;which channel
    .byte $80           ;initial duty
    .byte ve_s2_triangle   ;volume envelope
    .word EMP_triangle  ;pointer to stream
    .byte $FA           ;tempo

    .byte SFX_2         ;which stream
    .byte $01           ;status byte (stream enabled)
    .byte NOISE         ;which channel
    .byte $30           ;initial volume (on)
    .byte ve_sfx_EMPnoise1    ;volume envelope
    .word EMP_noise  ;pointer to stream
    .byte $FA           ;tempo

EMP_triangle:
    .byte set_loop1_counter, 2 ;3
.loop:
    .byte eighth, A1,As1,B1,C2,Cs2
    .byte eighth, Cs2,C2,B1,As1,A1
    .byte loop1
    .word .loop
    .byte endsound

EMP_noise:
    .byte five_eighths, $17
    .byte volume_envelope, ve_sfx_EMPnoise2
    .byte set_loop1_counter, 3 ;5
.hold:
    .byte five_eighths, $17
    .byte loop1
    .word .hold
    .byte endsound