.include "soundengine.inc"

.export Song1
Song1: 
  .word Square1
  .word Square2
  .word Triangle
  .word Noise
  .word volume_envelopes
  .word pitch_envelopes

volume_envelopes:
  .word volume_envelope_0
  .word volume_envelope_1
  .word volume_envelope_2
  .word volume_envelope_3
  .word volume_envelope_4
  .word volume_envelope_5
  .word volume_envelope_6
  .word volume_envelope_7
  .word volume_envelope_8

pitch_envelopes:
  .word pitch_envelope_0

volume_envelope_0:
  .byte 0, ENV_STOP

volume_envelope_1:
  .byte 15, ENV_LOOP
volume_envelope_2:
  .byte 6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,0,ENV_STOP
volume_envelope_3:
  .byte 6,6,6,6,6,6,6,6,6,6,6,6,6,5,5,5,5,5,5,5,5,5,5,5,5,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,0,ENV_STOP
volume_envelope_4:
  .byte 8,8,8,8,8,8,0,ENV_STOP
volume_envelope_5:
  .byte 5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,0,ENV_STOP
volume_envelope_6:
  .byte 15,15,15,15,15,15,15,15,15,15,15,15,0,ENV_STOP
volume_envelope_7:
  .byte 15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,0,ENV_STOP
volume_envelope_8:
  .byte 5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,0,ENV_STOP

pitch_envelope_0:
  .byte 0, ENV_LOOP

Square1:
derek1,C3
whole,E3
half,D3,E3
whole,G3
half,A3,G3
whole,E3

half,D3,E3
whole,D3
half,E3,D3
whole,C3,G2
half,C3,E3,A3,G3
whole,E3,D3

derek1,C3
whole,E3
half,D3,E3
whole,G3
half,A3,G3
whole,E3
half,D3,E3

whole,G3
half,G3,C4
whole,E4,D4
half,C4,G3,E3,C3
whole,G2,E2


Square2:
;frame0
duty_length,C4,G3

;frame1
duty_length,G3
derek1,C3,G3

;frame2
duty_length,C4,G3

;frame3
duty_length,E4
derek1,C4,G3

;frame4
derek1,C4
whole,G3
half,A3
d_whole,G3
half,E3,D3
whole,C3
half,G3,C3

;frame5
whole,G3
half,D3,E3
whole,G3,C3
half,C4,G3,E3,C3
whole,G2,G3

;frame6
derek1,C4
whole,G3
half,A3
d_whole,G3
half,G3,C4
whole,E4
half,G4,C5

;frame7
whole,E5
half,C5,G4
whole,E4,D4
half,E4,C4,G3,E3
whole,C3,G2


Triangle:
d_whole,C3
half,C3
derek1,C3
d_whole,G2
half,G2
derek1,G2

d_whole,G2
half,G2
derek1,G2
d_whole,C3
half,C3
derek1,G2

d_whole,C3
half,C3
derek1,C3
d_whole,G2
half,G2
derek1,G2

d_whole,G2
half,G2
derek1,G2
d_whole,C3
half,C3
derek1,G2


Noise:
derek1,13
whole,14
half,14,14
derek1,13,13

,13
STL,48,14
STL,24,14,14
STL,96,13,13,13
STL,48,14
STL,24,14,14
STL,96,13,13,13
STL,48,14
STL,24,14,14,STV,3,STL,96,13,13,13,STV
  .byte 4,STL,48,14,STL,24,14,14,STV,3,STL,96,13,13,13,STV,4,STL,48,14,STL,24,14,14
  .byte STV,3,STL,96,13,13,13,STV,4,STL,48,14,STL,24,14,14,STV,3,STL,96,13,13,13,STV
  .byte 4,STL,48,14,STL,24,14,14,STV,3,STL,96,13,13
  .byte GOT
  .word Noise
