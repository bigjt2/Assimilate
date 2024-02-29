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

pitch_envelopes:
  .word pitch_envelope_0
  .word pitch_envelope_1

volume_envelope_0:
  .byte 0, ENV_STOP

volume_envelope_1:
  .byte 15, ENV_LOOP
volume_envelope_2:
  .byte 15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,0,ENV_STOP
volume_envelope_3:
  .byte 12,12,12,12,12,12,12,12,12,12,12,11,0,ENV_STOP
volume_envelope_4:
  .byte 15,ENV_STOP
volume_envelope_5:
  .byte 13,13,13,13,13,13,13,13,0,ENV_STOP
volume_envelope_6:
  .byte 11,11,11,11,0,ENV_STOP
volume_envelope_7:
  .byte 10,10,10,10,0,ENV_STOP

pitch_envelope_0:
  .byte 0, ENV_LOOP
pitch_envelope_1:
  .byte 0,-1,ENV_LOOP

Square1:
half,C3,G3,G3,D3,A3,A3,F3,A3,A3,E3,G3,G3

half,C3,G3,G3,D3,A3,A3,F3,A3,A3,F3,A3,A3
half,C3,E3,E3,C3,E3,E3,C3,E3,E3,C3,E3,E3


Square2:
half,E2,C3,C3,F2,D3,D3,A2,F3,F3,G2,E3,E3

half,E2,C3,C3,F2,D3,D3,A2,F3,F3,A2,F3,F3
half,E3,G3,G3,E3,G3,G3,E3,G3,G3,E3,G3,G3


Triangle:
whole,C5
half,G5
whole,D5
d_whole,C5
half,A4
d_whole,G4

whole,C5
half,G5
whole,D5
d_whole,C5
half,A4
d_whole,C5

whole,G5
half,F5
whole,E5
half,D5
whole,C5
half,A4
d_whole,G4

whole,C5
half,G5
whole,D5
STL,144,C5
half,A4

STL,216,C5
half,F5,E5,D5


Noise:
STL,24,12
STL,12,2,7
STL,24,2
STL,12,2,4
STL,24,2,12,2,2
STL,12,2,7
STL,24,2
STL,12,2,4

STL,24,2,12,2,2,STV,5
  .byte STP,1,12,STV,6,STP,0,STL,12,2,7,STL,24,2,STV,5,STP,1,12,STV,6,STP,0,2
  .byte 2,STV,5,STP,1,12,STV,6,STP,0,STL,12,2,4,STL,24,2,12,2,2,STV,5,STP,1
  .byte 12,STV,6,STP,0,STL,12,2,7,STL,24,2,STV,5,STP,1,12,STV,6,STP,0,2,2,STV
  .byte 5,STP,1,12,STV,6,STP,0,STL,12,2,4,STL,24,2,12,2,2,STV,5,STP,1,12,STV
  .byte 6,STP,0,STL,12,2,7,STL,24,2,STV,5,STP,1,12,STV,6,STP,0,2,2,STV,5,STP
  .byte 1,12,STV,6,STP,0,STL,12,2,4,STL,24,2,12,2,2
  .byte GOT
  .word Noise
