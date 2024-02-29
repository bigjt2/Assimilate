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
  .byte 3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0,ENV_STOP
volume_envelope_3:
  .byte 15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,0,ENV_STOP
volume_envelope_4:
  .byte 5,5,5,5,5,5,5,5,5,ENV_STOP
volume_envelope_5:
  .byte 5,5,5,5,5,5,5,5,0,ENV_STOP
volume_envelope_6:
  .byte 5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,0,ENV_STOP
volume_envelope_7:
  .byte 4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,0,ENV_STOP
volume_envelope_8:
  .byte 4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,0,0,0,0,4,4,4,4,0,0,0,0,4,4,4,4,0,0,0,0,4,4,4,4,0,0,0,0,4,4,4,4,0,0,0,0,ENV_STOP

pitch_envelope_0:
  .byte 0, ENV_LOOP

Square1:
eighth,F3,GS3,F4,GS3,F3,GS3,F4,GS3
eighth,E3,G3,G4,E4,E3,G3,G4,E4
eighth,DS3,G3,F4,G4,DS3,G3,F4,G4
eighth,D3,F3,G4,F4,D3,F3,G4,F4
eighth,F3,GS3,F4,GS3,F3,GS3,F4,GS3
eighth,E3,G3,G4,E4,E3,G3,G4,E4
eighth,DS3,G3,F4,G4,DS3,G3,F4,G4
eighth,D3,F3,G4,F4,D3,F3,G4,F4

Square2:
STL,18,F3
STL,30,F3
STL,18,G3
STL,30,G3
STL,18,DS3,DS3
STL,36,D3
STL,24,AS2
STL,18,F3
STL,30,F3
STL,18,G3
STL,30,G3
STL,18,DS3,DS3
STL,24,G3
STL,36,F3

STL,18,F3
STL,30,F3
STL,18,G3
STL,30,G3
STL,18,GS3,GS3
STL,12,GS3
STL,18,GS3,G3
STL,24,GS3
STL,36,C4
STL,18,C4,AS3
STL,12,GS3
STL,48,G3,F3


STL,18,C4,AS3
STL,12,GS3
STL,18,AS3,GS3
STL,12,F3,C4,AS3,GS3,F3
STL,6,C4,AS3,GS3,F3,C4,AS3,GS3,F3,C3,F3,GS3,AS3,C4,F4,G4,GS4,C5,AS4,GS4,F4
STL,12,C4,GS3
STL,18,F3,C3
STL,24,GS2
STL,36,F2

STL,18,F3
STL,30,F3
STL,18,G3
STL,30,G3
STL,18,GS3,GS3
STL,12,GS3
STL,18,GS3,G3
STL,24,GS3
STL,180,F3

;;;;;;;;;;;;
;;;;;;;;;;;;

d_quarter,F3
derek4,F3
d_quarter,G3
derek4,G3
d_quarter,DS3,DS3
d_half,D3
half,AS2
d_quarter,F3
derek4,F3
d_quarter,G3
derek4,G3
d_quarter,DS3,DS3
half,G3
d_half,F3

d_quarter,F3
derek4,F3
d_quarter,G3
derek4,G3
d_quarter,GS3,GS3
quarter,GS3
d_quarter,GS3,G3
half,GS3
d_half,C4
d_quarter,C4,AS3
quarter,GS3
whole,G3,F3

d_quarter,C4,AS3
quarter,GS3
d_quarter,AS3,GS3
quarter,F3,C4,AS3,GS3,F3
eighth,C4,AS3,GS3,F3,C4,AS3,GS3,F3,C3,F3,GS3,AS3,C4,F4,G4,GS4,C5,AS4,GS4,F4
quarter,C4,GS3
d_quarter,F3,C3
half,GS2
d_half,F2

d_quarter,F3
derek4,F3
d_quarter,G3
derek4,G3
d_quarter,GS3,GS3
quarter,GS3
d_quarter,GS3,G3
half,GS3
STL,180,F3

Triangle:
d_half,F2
derek2,GS2
d_half,DS2,G2
half,D2
d_half,F2
derek2,GS2
d_half,DS2
derek4,D2,AS1


STL,36,F2,STL,60,GS2,STL,36,DS2,G2,STL,24,D2,STL,36,F2,STL,60
  .byte GS2,STL,36,DS2,STL,30,D2,AS1,STL,36,F2,STL,60,GS2,STL,36,DS2,G2,STL,24,D2,STL,36,F2
  .byte STL,60,GS2,STL,36,DS2,STL,30,D2,AS1,STL,36,F2,STL,60,GS2,STL,36,DS2,G2,STL,24,D2,STL
  .byte 36,F2,STL,60,GS2,STL,36,DS2,STL,30,D2,AS1
  .byte GOT
  .word Triangle

Noise:
  .byte STV,0,STL,255,A0,STL,255,A0,STL,255,A0,STL,255,A0,STL,255,A0,STL,255,A0,STL,6,A0
  .byte GOT
  .word Noise
