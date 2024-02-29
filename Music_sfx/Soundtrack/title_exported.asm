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


volume_envelope_2:
  .byte 8,8,8,8,5,5,5,5,0,ENV_STOP
volume_envelope_3:
  .byte 6,6,6,6,4,4,4,4,3,3,3,3,2,2,2,2,0,ENV_STOP
volume_envelope_4:
  .byte 4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,ENV_STOP
volume_envelope_5:
  .byte 3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,7,7,7,7,0,0,0,0,7,7,7,7,0,0,0,0,7,7,7,7,0,0,0,0,7,7,7,7,0,ENV_STOP
volume_envelope_6:
  .byte 3,3,3,3,0,0,0,0,3,3,3,3,0,0,0,0,3,3,3,3,0,0,0,0,3,3,3,3,0,0,0,0,3,3,3,3,0,0,0,0,0,ENV_STOP
volume_envelope_7:
  .byte 7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,0,ENV_STOP

pitch_envelope_0:
  .byte 0, ENV_LOOP

STV,7 = ve_opener_sq_05
STV,5 = ve_opener_sq_03
STV,6 = ve_opener_sq_04
STV,4 = ve_opener_sq_02

Square1:
  .byte volume_envelope, ve_opener_sq_05
whole,A1,A2
quarter,D2
quarter,CS2,A2
d_half,GS2
whole,A1,A2
quarter,D2
quarter,CS2,A2
d_half,GS2

  .byte volume_envelope, ve_opener_sq_03
d_half,G3
derek1,A3
quarter,D5
d_half,CS5,A3
derek1,E3, whole,rest, quarter,rest

d_half,G3
derek1,A3
quarter,D5
d_half,CS5
whole,E5
  .byte volume_envelope, ve_opener_sq_04
derek1,E5, whole,rest

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Square2:
  .byte volume_envelope, ve_opener_sq_03
whole,E4,E4
  .byte volume_envelope, ve_opener_sq_04
whole,FS4,CS4
half,E4,CS4,B3,A3
whole,E3,A3

  .byte volume_envelope, ve_opener_sq_02
quarter,G4,D4,A4,FS4,G4,D4,A4,FS4
quarter,G4,D4,A4,FS4,G4,D4,A4,FS4
quarter,E4,A3,G4,FS4,E4,A3,G4,A3
quarter,E4,A3,G4,FS4,D4,CS4,B3,A3  

  .byte volume_envelope, ve_opener_sq_03
quarter,D4
  .byte volume_envelope, ve_opener_sq_02
quarter,D4,A4
  .byte volume_envelope, ve_opener_sq_03
quarter,FS4
  .byte volume_envelope, ve_opener_sq_02
quarter,G4,D4,A4,FS4,G4,D4,A4
  .byte volume_envelope, ve_opener_sq_03
quarter,G4
  .byte volume_envelope, ve_opener_sq_02
quarter,G4
  .byte volume_envelope, ve_opener_sq_03
quarter,FS4
  .byte volume_envelope, ve_opener_sq_02
quarter,A4,FS4
  .byte volume_envelope, ve_opener_sq_03
quarter,E4
  .byte volume_envelope, ve_opener_sq_02
quarter,A3,G4
  .byte volume_envelope, ve_opener_sq_03
quarter,CS4
  .byte volume_envelope, ve_opener_sq_02
quarter,E4,A3,G4,A3,E4,A3,G4,FS4,D4,CS4,B3,A3

  .byte volume_envelope, ve_opener_sq_03
d_half,D4
derek1,E4
half,B4
d_half,D5
whole,CS5
  .byte volume_envelope, ve_opener_sq_04
derek1,CS5, whole,rest

;;;;;;;;;;;;;;;;;;;;

Triangle:
  .byte volume_envelope, ve_opener_tri_01
whole,A1,A2
quarter,A1
half,B1,CS2
d_half,A2
whole,A1,A2
quarter,A2
half,GS2,E2
d_half,CS2


  .byte volume_envelope, ve_opener_tri_02
quarter,G1,D2,G1,D2,G1,D2,G1,D2,G1,D2,G1,D2,G1,D2,G1,D2,G1,E2
  .byte volume_envelope, ve_opener_tri_01
quarter,G2,FS2,E2,A1,G1,A1
  .byte volume_envelope, ve_opener_tri_02
quarter,G1,E2
  .byte volume_envelope, ve_opener_tri_01
quarter,G2,FS2,E2,A1,G1,A1


d_half,G1
derek2,G1
d_half,G1
derek2,G1
d_half,A1
derek2,A1
d_half,A1
derek2,A1

;;;;;;;;;;;;;;;;;;;;;;;

Noise:
  .byte volume_envelope, ve_opener_noise_00
whole,15
  .byte volume_envelope, ve_opener_noise_01
whole,4
  .byte volume_envelope, ve_opener_noise_00
d_quarter,15,15
half,15
quarter,15
  .byte volume_envelope, ve_opener_noise_01
half,4
  .byte volume_envelope, ve_opener_noise_00
whole,15
  .byte volume_envelope, ve_opener_noise_01
whole,4
  .byte volume_envelope, ve_opener_noise_00
d_quarter,15,15
half,15
quarter,15
  .byte volume_envelope, ve_opener_noise_01
half,4

  .byte volume_envelope, ve_opener_noise_00
whole,15
  .byte volume_envelope, ve_opener_noise_01
whole,4
  .byte volume_envelope, ve_opener_noise_00
d_quarter,15,15
half,15
quarter,15
  .byte volume_envelope, ve_opener_noise_01
half,4
  .byte volume_envelope, ve_opener_noise_00
whole,15
  .byte volume_envelope, ve_opener_noise_01
whole,4
  .byte volume_envelope, ve_opener_noise_00
quarter,15,15,15,15
  .byte volume_envelope, ve_opener_noise_01
quarter,4,4,4,4

half,15
  .byte volume_envelope, ve_opener_noise_00
quarter,4,15
half,15,4
  .byte volume_envelope, ve_opener_noise_01
half,15
  .byte volume_envelope, ve_opener_noise_00
quarter,4,15,15,2,4,2
  .byte volume_envelope, ve_opener_noise_01
half,15
  .byte volume_envelope, ve_opener_noise_00
quarter,4,15
half,15,4
  .byte volume_envelope, ve_opener_noise_01
half,15
  .byte volume_envelope, ve_opener_noise_00
quarter,4,15,15,2,4,2

  .byte volume_envelope, ve_opener_noise_00
whole,15
  .byte volume_envelope, ve_opener_noise_01
whole,4
  .byte volume_envelope, ve_opener_noise_00
d_quarter,15,15
half,15
quarter,15
  .byte volume_envelope, ve_opener_noise_01
half,4
  .byte volume_envelope, ve_opener_noise_00
whole,15
  .byte volume_envelope, ve_opener_noise_01
whole,4
  .byte volume_envelope, ve_opener_noise_00
quarter,15,15,15,15
  .byte volume_envelope, ve_opener_noise_01
quarter,4,4,4,4
