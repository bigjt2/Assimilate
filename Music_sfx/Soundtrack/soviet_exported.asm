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

pitch_envelopes:
  .word pitch_envelope_0

volume_envelope_0:
  .byte 0, ENV_STOP

volume_envelope_1:
  .byte 15, ENV_LOOP
volume_envelope_2:
  .byte 13,13,13,13,0,ENV_STOP
volume_envelope_3:
  .byte 6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,0,ENV_STOP
volume_envelope_4:
  .byte 6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,0,ENV_STOP
volume_envelope_5:
  .byte 1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5,6,6,6,6,7,7,7,7,0,0,0,0,0,ENV_STOP
volume_envelope_6:
  .byte 2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,0,0,ENV_STOP

pitch_envelope_0:
  .byte 0, ENV_LOOP

Square1:
;STL,36,D3
;STL,12,CS3
;STL,36,B2
;STL,12,CS3,D3,CS3,B2,D3
;STL,48,CS3
;STL,36,CS3
;STL,12,B2
;STL,36,AS2
;STL,12,CS3,D3,CS3,B2,AS2
;STL,48,B2

d_half,D3
quarter,CS3
d_half,B2
quarter,CS3,D3,CS3,B2,D3
whole,CS3
d_half,CS3
quarter,B2
d_half,AS2
quarter,CS3,D3,CS3,B2,AS2
whole,B2


;STL,36,E3
;STL,12,G3
;STL,36,FS3
;STL,12,D3,E3,E3,D3,CS3
;STL,24,D3
;STL,36,B2
;STL,24,E3
;STL,12,CS3
;STL,36,D3
;STL,12,CS3,D3,CS3,B2,AS2
;STL,48,B2

d_half,E3
quarter,G3
d_half,FS3
quarter,D3,E3,E3,D3,CS3
half,D3
d_half,B2
half,E3
quarter,CS3
d_half,D3
quarter,CS3,D3,CS3,B2,AS2
whole,B2


Square2:
half,B4,B4,B4,B4,B4,B4,AS4,AS4,AS4,AS4,AS4,AS4,AS4,AS4,B4,B4

half,E5,E5,D5,D5,CS5,CS5,B4,B4,AS4,AS4,AS4,AS4,AS4,AS4
d_half,B4

Triangle:
half,B2,FS2,B2,FS2,B2,D3,CS3,FS2,CS3,FS2,CS3,FS2,CS3,E3,D3,FS2

half,E3,G3,FS3,D3,E3,CS3,D3,B2,AS2,E3,D3,CS3,AS2,CS3
whole,B2



Noise:
;STL,12,14,0
;STL,6,0,2
;STL,24,0,0
;STL,12,0,14
;STL,24,0,0,0
;STL,12,0,14,0
;STL,6,0,2
;STL,24,0,0
;STL,12,0,14
;STL,24,0,0
;STL,12,0,0,0

quarter,14,0
eighth,0,2
half,0,0
quarter,0,14
half,0,0,0
quarter,0,14,0
eighth,0,2
half,0,0
quarter,0,14
half,0,0
quarter,0,0,0


quarter,14,0,14,0,14,0,14,0,14,0,14,0,14,0,14,0,14,0,14,0,14,0
  .byte 14,0,14,0,14,0,14,0,14,0,14,0,14,0,14,0,14,0,14,0,14,0,14,0
  .byte 14,0,14,0,14,0,14,0,14,0,14,0,14,0,14,0,14,0
  .byte GOT
  .word Noise
