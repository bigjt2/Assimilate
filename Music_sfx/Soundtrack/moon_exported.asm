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

pitch_envelopes:
  .word pitch_envelope_0
  .word pitch_envelope_1
  .word pitch_envelope_2

volume_envelope_0:
  .byte 0, ENV_STOP

volume_envelope_1:
  .byte 15, ENV_LOOP
volume_envelope_2:
  .byte 6,ENV_STOP

pitch_envelope_0:
  .byte 0, ENV_LOOP
pitch_envelope_1:
  .byte 1,2,3,4,4,ENV_LOOP
pitch_envelope_2:
  .byte 3,6,9,14,14,ENV_LOOP

Square1:
    
STL,36,F3,F3,
STL,12,C4,
STL,36,C4,
STL,24,C4,C4,C4,
STL,36,C4,
STL,60,F4,
STL,24,C4,A3,E3,D3,

d_half,A3
derek2,A3
d_half,A3
derek2,A3
d_half,G3
derek2,G3
d_half,G3
half,G3,C4
quarter,F4

STL,36,A3,STL,60,A3,STL,36,A3,STL,60,A3,STL,36,G3,STL,60,G3,STL,36,G3,STL,24
  .byte G3,C4,STL,12,F4,

STV,2,F3,A3,F4,F3,A3,G4,F4,C4,F3,A3,C4,F4,A4,G4,F4,C4,F3
  .byte A3,F4,F3,A3,G4,F4,C4,F3,A3,C4,F4,A4,G4,F4,C4,F3,A3,F4,F3,A3,G4,F4,C4,F3
  .byte A3,C4,F4,A4,G4,F4,C4,F3,A3,F4,F3,A3,G4,F4,C4,F3,A3,C4,F4,A4,G4,F4,C4,F3
  .byte A3,F4,F3,A3,G4,F4,C4,F3,A3,C4,F4,A4,G4,F4,C4,F3,A3,F4,F3,A3,G4,F4,C4,F3
  .byte A3,C4,F4,A4,G4,F4,C4,F3,A3,F4,F3,A3,G4,F4,C4,F3,A3,C4,F4,A4,G4,F4,C4,F3
  .byte A3,F4,F3,A3,G4,F4,C4,F3,A3,C4,F4,A4,G4,F4,C4
  .byte GOT
  .word Square1

Square2:
STL,255,A0,  REST
STL,129,A0,  REST

STL,36,F4
STL,108,E4
STL,24,A4,G4
STL,36,F4,G4
STL,24,A4
STL,96,A4

d_half,F4
derek3,E4
half,A4,G4
d_half,F4,G4
half,A4
derek1,A4

STL,36,F4,G4
STL,72,A4
STL,48,G4
STL,96,C5,F5

d_half,F4,G4
d_whole,A4
whole,G4
derek1,C5,F5

STL,60,F4
STL,12,E4,F4
STL,36,C5
STL,24,A4,G4,F4
STL,18,G4,A4
STL,156,F4

derek1,F4
quarter,E4,F4
d_half,C5
half,A4,G4,F4
d_quarter,G4,A4   ;18
derek3,F4         ;156

STL,60,F4
STL,12,E4,F4
STL,36,C5
STL,24,A4,G4,F4
STL,12,F4,E4,F4
STL,24,C5
STL,36,A4
STL,96,G4

derek2,F4
quarter,E4,F4
d_half,C5
half,A4,G4,F4
quarter,F4,E4,F4
half,C5
d_half,A4
derek1,G4

STL,36,C4,C4
STL,12,A3
STL,36,G3
STL,24,F3,G3,F3
STL,36,A3
STL,60,C4
STL,24,G3,F3,G3,F3

d_half,C4,C4
quarter,A3
d_half,G3
half,F3,G3,F3
d_half,A3
derek2,C4
half,G3,F3,G3,F3

STL,36,C4
STL,60,C4
STL,36,C4
STL,60,C4
STL,36,E3
STL,60,E3
STL,12,C3,E3,F3
STL,24,C4,E4
STL,12,A4

d_half,C4
derek2,C4
d_half,C4
derek2,C4
d_half,E3
derek2,E3
quarter,C3,E3,F3
half,C4,E4
quarter,A4

Triangle:
;STL,36,F4,C4
;STL,72,F3
;STL,48,F4
;STL,36,D4,A3
;STL,120,D3

d_half,F4,C4
d_whole,F3
whole,F4
d_half,D4,A3
derek1,D3,half,rest  ;wierd notelength in exporter, split up

;STL,12,F4,F4,F4,F4,F4,F4,F4,F4,C4,C4,C4,C4,C4,C4,C4,C4,D4,D4,D4,D4,D4,D4,D4,D4,C4,C4,C4,C4,C4,C4,C4,C4

quarter,F4,F4,F4,F4,F4,F4,F4,F4,C4,C4,C4,C4,C4,C4,C4,C4,D4,D4,D4,D4,D4,D4,D4,D4,C4,C4,C4,C4,C4,C4,C4,C4

;STL,12,AS3,AS3,AS3,AS3,AS3,AS3,AS3,AS3,G3,G3,G3,G3,G3,G3,G3,G3,C4,C4,C4,C4,C4,C4,C4,C4,E4,E4,E4,E4,E4,E4,E4,E4,F4

quarter,AS3,AS3,AS3,AS3,AS3,AS3,AS3,AS3,G3,G3,G3,G3,G3,G3,G3,G3,C4,C4,C4,C4,C4,C4,C4,C4,E4,E4,E4,E4,E4,E4,E4,E4,F4

;STL,36,A3
;STL,60,A3
;STL,36,AS3
;STL,60,AS3
;STL,36,C4
;STL,60,C4
;STL,36,C4
;STL,60,C4

d_half,A3
derek2,A3
d_half,AS3
derek2,AS3
d_half,C4
derek2,C4
d_half,C4
derek2,C4

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
STL,36,A3,STL,60,A3,STL,36,AS3,STL,60,AS3
  .byte STL,36,C4,STL,60,C4,STL,36,C4,STL,60,C4,STL,36,A3,STL,60,A3,STL,36,AS3,STL,60,AS3
  .byte STL,36,C4,STL,60,C4,STL,36,C4,STL,60,C4,STL,36,A3,STL,60,A3,STL,36,AS3,STL,60,AS3
  .byte STL,36,C4,STL,60,C4,STL,36,C4,STL,60,C4,STV,6,STL,12,F4,F4,F4,F4,F4,F4,F4,F4
  .byte C4,C4,C4,C4,C4,C4,C4,C4,D4,D4,D4,D4,D4,D4,D4,D4,C4,C4,C4,C4,C4,C4,C4,C4
  .byte AS3,AS3,AS3,AS3,AS3,AS3,AS3,AS3,G3,G3,G3,G3,G3,G3,G3,G3,C4,C4,C4,C4,C4,C4,C4,C4
  .byte E4,E4,E4,E4,E4,E4,E4,E4,F4,F4,F4,F4,F4,F4,F4,F4,C4,C4,C4,C4,C4,C4,C4,C4
  .byte D4,D4,D4,D4,D4,D4,D4,D4,C4,C4,C4,C4,C4,C4,C4,C4,AS3,AS3,AS3,AS3,AS3,AS3,AS3,AS3
  .byte G3,G3,G3,G3,G3,G3,G3,G3,C4,C4,C4,C4,C4,C4,C4,C4,E4,E4,E4,E4,E4,E4,E4,E4

  .byte GOT
  .word Triangle

Noise:
  .byte STV,0,STL,255,A0,STL,255,A0,STL,255,A0,STL,255,A0,STL,84,A0

STV,4,STP,1,STL,12,0
  .byte STV,5,STP,0,11,11,11

STV,4,STP,1,0,STV,7,STP,0,2,STV,5,5,STV,7,2,STV
  .byte 4,STP,1,0,STV,7,STP,0,2,STV,5,5,5,STV,4,STP,1,0,STV,7,STP,0,2,STV
  .byte 5,5,STV,7,2,STV,4,STP,1,0,STV,7,STP,0,2,STV,5,5,STV,7,2,STV,4,STP
  .byte 1,0,STV,7,STP,0,2,STV,5,5,STV,7,2,STV,4,STP,1,0,STV,7,STP,0,2,STV
  .byte 5,5,5,STV,4,STP,1,0,STV,7,STP,0,2,STV,5,5,STV,7,2,STV,4,STP,1,0
  .byte STV,7,STP,0,2,STV,5,5,STV,7,2,STV,4,STP,1,0,STV,7,STP,0,2,STV,5,5
  .byte STV,7,2,STV,4,STP,1,0,STV,7,STP,0,2,STV,5,5,5,STV,4,STP,1,0,STV,7
  .byte STP,0,2,STV,5,5,STV,7,2,STV,4,STP,1,0,STV,7,STP,0,2,STV,5,5,STV,7
  .byte 2,STV,4,STP,1,0,STV,7,STP,0,2,STV,5,5,STV,7,2,STV,4,STP,1,0,STV,7
  .byte STP,0,2,STV,5,5,5,STV,4,STP,1,0,STV,7,STP,0,2,STV,5,5,STV,7,2,STV
  .byte 4,STP,1,0,STV,7,STP,0,2,STV,5,5,STV,7,2,STV,4,STP,1,0,STV,7,STP,0
  .byte 2,STV,5,5,STV,7,2,STV,4,STP,1,0,STV,7,STP,0,2,STV,5,5,5,STV,4,STP
  .byte 1,0,STV,7,STP,0,2,STV,5,5,STV,7,2,STV,4,STP,1,0,STV,7,STP,0,2,STV
  .byte 5,5,STV,7,2,STV,4,STP,1,0,STV,7,STP,0,2,STV,5,5,STV,7,2,STV,4,STP
  .byte 1,0,STV,7,STP,0,2,STV,5,5,5,STV,4,STP,1,0,STV,7,STP,0,2,STV,5,5
  .byte STV,7,2,STV,4,STP,1,0,STV,7,STP,0,2,STV,5,5,STV,7,2,STV,4,STP,1,0
  .byte STV,7,STP,0,2,STV,5,5,STV,7,2,STV,4,STP,1,0,STV,7,STP,0,2,STV,5,5
  .byte 5,STV,4,STP,1,0,STV,7,STP,0,2,STV,5,5,STV,7,2,STV,4,STP,1,0,STV,7
  .byte STP,0,2,STV,5,5,STV,7,2,STV,4,STP,1,0,STV,7,STP,0,2,STV,5,5,STV,7
  .byte 2,STV,4,STP,1,0,STV,7,STP,0,2,STV,5,5,5,STV,4,STP,1,0,STV,7,STP,0
  .byte 2,STV,5,5,STV,7,2,STV,4,STP,1,0,STV,7,STP,0,2,STV,5,5,STV,7,2,STV
  .byte 4,STP,1,0,STV,7,STP,0,2,STV,5,5,STV,7,2,STV,4,STP,1,0,STV,7,STP,0
  .byte 2,STV,5,5,5,STV,4,STP,1,0,STV,7,STP,0,2,STV,5,5,STV,7,2,STV,4,STP
  .byte 1,0,STV,7,STP,0,2,STV,5,5,STV,7,2,STV,4,STP,1,0,STV,7,STP,0,2,STV
  .byte 5,5,STV,7,2,STV,4,STP,1,0,STV,7,STP,0,2,STV,5,5,5,STV,4,STP,1,0
  .byte STV,7,STP,0,2,STV,5,5,STV,7,2,STV,4,STP,1,0,STV,7,STP,0,2,STV,5,5
  .byte STV,7,2,STV,4,STP,1,0,STV,7,STP,0,2,STV,5,5,STV,7,2,STV,4,STP,1,0
  .byte STV,7,STP,0,2,STV,5,5,5,STV,4,STP,1,0,STV,7,STP,0,2,STV,5,5,STV,7
  .byte 2,STV,4,STP,1,0,STV,7,STP,0,2,STV,5,5,STV,7,2,STV,4,STP,1,0,STV,7
  .byte STP,0,2,STV,5,5,STV,7,2,STV,4,STP,1,0,STV,7,STP,0,2,STV,5,5,5,STV
  .byte 4,STP,1,0,STV,7,STP,0,2,STV,5,5,STV,7,2,STV,4,STP,1,0,STV,7,STP,0
  .byte 2,STV,5,5,STV,7,2,STV,4,STP,1,0,STV,7,STP,0,2,STV,5,5,STV,7,2,STV
  .byte 4,STP,1,0,STV,7,STP,0,2,STV,5,5,5,STV,4,STP,1,0,STV,7,STP,0,2,STV
  .byte 5,5,STV,7,2,STV,4,STP,1,0,STV,7,STP,0,2,STV,5,5,STV,7,2,STV,4,STP
  .byte 1,0,STV,7,STP,0,2,STV,5,5,STV,7,2,STV,4,STP,1,0,STV,7,STP,0,2,STV
  .byte 5,5,5,STV,4,STP,1,0,STV,7,STP,0,2,STV,5,5,STV,7,2,STV,4,STP,1,0
  .byte STV,7,STP,0,2,STV,5,5,STV,7,2,STV,4,STP,1,0,STV,7,STP,0,2,STV,5,5
  .byte STV,7,2,STV,4,STP,1,0,STV,7,STP,0,2,STV,5,5,5,STV,4,STP,1,0,STV,7
  .byte STP,0,2,STV,5,5,STV,7,2,STV,4,STP,1,0,STV,7,STP,0,2,STV,5,5,STV,7
  .byte 2,STV,4,STP,1,0,STV,7,STP,0,2,STV,5,5,STV,7,2,STV,4,STP,1,0,STV,7
  .byte STP,0,2,STV,5,5,5,STV,4,STP,1,0,STV,7,STP,0,2,STV,5,5,STV,7,2,STV
  .byte 4,STP,1,0,STV,7,STP,0,2,STV,5,5,STV,7,2,STV,4,STP,1,0,STV,7,STP,0
  .byte 2,STV,5,5,STV,7,2,STV,4,STP,1,0,STV,7,STP,0,2,STV,5,5,5,STV,4,STP
  .byte 1,0,STV,7,STP,0,2,STV,5,5,STV,7,2,STV,4,STP,1,0,STV,7,STP,0,2,STV
  .byte 5,5,STV,7,2,STV,4,STP,1,0,STV,7,STP,0,2,STV,5,5,STV,7,2,STV,4,STP
  .byte 1,0,STV,7,STP,0,2,STV,5,5,5,STV,4,STP,1,0,STV,7,STP,0,2,STV,5,5
  .byte STV,7,2,STV,4,STP,1,0,STV,7,STP,0,2,STV,5,5,STV,7,2,STV,4,STP,1,0
  .byte STV,7,STP,0,2,STV,5,5,STV,7,2,STV,4,STP,1,0,STV,7,STP,0,2,STV,5,5
  .byte 5,STV,4,STP,1,0,STV,7,STP,0,2,STV,5,5,STV,7,2,STV,4,STP,1,0,STV,7
  .byte STP,0,2,STV,5,5,STV,7,2,STV,4,STP,1,0,STV,7,STP,0,2,STV,5,5,STV,7
  .byte 2,STV,4,STP,1,0,STV,7,STP,0,2,STV,5,5,5,STV,4,STP,1,0,STV,7,STP,0
  .byte 2,STV,5,5,STV,7,2,STV,4,STP,1,0,STV,7,STP,0,2,STV,5,5,STV,7,2,STV
  .byte 4,STP,1,0,STV,7,STP,0,2,STV,5,5,STV,7,2,STV,4,STP,1,0,STV,7,STP,0
  .byte 2,STV,5,5,5,STV,4,STP,1,0,STV,7,STP,0,2,STV,5,5,STV,7,2,STV,4,STP
  .byte 1,0,STV,7,STP,0,2,STV,5,5,STV,7,2,STV,4,STP,1,0,STV,7,STP,0,2,STV
  .byte 5,5,STV,7,2,STV,4,STP,1,0,STV,7,STP,0,2,STV,5,5,5,STV,4,STP,1,0
  .byte STV,7,STP,0,2,STV,5,5,STV,7,2,STV,4,STP,1,0,STV,7,STP,0,2,STV,5,5
  .byte STV,7,2,STV,4,STP,1,0,STV,7,STP,0,2,STV,5,5,STV,7,2,STV,4,STP,1,0
  .byte STV,7,STP,0,2,STV,5,5,5,STV,4,STP,1,0,STV,7,STP,0,2,STV,5,5,STV,7
  .byte 2,STV,4,STP,1,0,STV,7,STP,0,2,STV,5,5,STV,7,2,STV,4,STP,1,0,STV,7
  .byte STP,0,2,STV,5,5,STV,7,2,STV,4,STP,1,0,STV,7,STP,0,2,STV,5,5,5,STV
  .byte 4,STP,1,0,STV,7,STP,0,2,STV,5,5,STV,7,2,STV,4,STP,1,0,STV,7,STP,0
  .byte 2,STV,5,5,STV,7,2
  .byte GOT
  .word Noise
