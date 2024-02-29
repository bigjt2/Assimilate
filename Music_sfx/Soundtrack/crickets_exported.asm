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

pitch_envelopes:
  .word pitch_envelope_0

volume_envelope_0:
  .byte 0, ENV_STOP

volume_envelope_1:
  .byte 15, ENV_LOOP

pitch_envelope_0:
  .byte 0, ENV_LOOP

Square1:
  .byte STV,0,STL,255,A0,STL,129,A0
  .byte GOT
  .word Square1

Square2:
  .byte STV,0,STL,255,A0,STL,129,A0
  .byte GOT
  .word Square2

Triangle:
  .byte STV,0,STL,255,A0,STL,129,A0
  .byte GOT
  .word Triangle

Noise:
  .byte STV,0,STL,255,A0,STL,129,A0
  .byte GOT
  .word Noise
