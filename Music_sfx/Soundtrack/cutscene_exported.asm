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



volume_envelope_2:  intermission_squares_1
  .byte 1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5,6,6,6,6,7,7,7,7,8,8,8,8,9,9,9,9,10,10,10,10,ENV_STOP

volume_envelope_4:  intermission_triangle
  .byte 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,ENV_STOP

volume_envelope_5:  intermission_noise1
  .byte 15,15,15,15,12,12,12,12,5,5,5,5,0,ENV_STOP

volume_envelope_6:  intermission_noise2
  .byte 11,11,11,11,9,9,9,9,7,7,7,7,5,5,5,5,3,3,3,3,0,ENV_STOP

volume_envelope_7:  intermission_squares_2
  .byte 5,5,5,5,7,7,7,7,ENV_STOP

pitch_envelope_0:
  .byte 0, ENV_LOOP

Square1:
volume_envelope, ve_intermission_squares_1
derek1,B2,AS2
duty_length,FS2

derek1,B2,CS3,E3,DS3

derek1,B2,AS2,FS2,FS2

duty_length,FS2,AS2


Square2:
volume_envelope, ve_intermission_squares_1
derek1,DS3,CS3
duty_length,AS2

derek1,DS3,FS3,B3,B3

derek1,DS3,CS3,B2,AS2

duty_length,B2,FS2

whole,DS3
volume_envelope, ve_intermission_squares_2
half,FS3,DS3
volume_envelope, ve_intermission_squares_1
whole,CS3
volume_envelope, ve_intermission_squares_2
half,CS3,B2
volume_envelope, ve_intermission_squares_1
whole,AS2
volume_envelope, ve_intermission_squares_2
half,AS2,B2,FS3,DS3,CS3,B2

volume_envelope, ve_intermission_squares_1
whole,DS3
volume_envelope, ve_intermission_squares_2
half,FS3,DS3
volume_envelope, ve_intermission_squares_1
whole,FS3
volume_envelope, ve_intermission_squares_2
half,CS3,B2
volume_envelope, ve_intermission_squares_1
whole,B3
volume_envelope, ve_intermission_squares_2
half,CS3,B2
volume_envelope, ve_intermission_squares_1
derek1,B3

whole,DS3
volume_envelope, ve_intermission_squares_2
half,FS3,DS3
volume_envelope, ve_intermission_squares_1
whole,CS3
volume_envelope, ve_intermission_squares_2
half,CS3,B2
volume_envelope, ve_intermission_squares_1
whole,B2
volume_envelope, ve_intermission_squares_2
half,CS3,B2
volume_envelope, ve_intermission_squares_1
whole,AS2
volume_envelope, ve_intermission_squares_2
half,AS2,B2

volume_envelope, ve_intermission_squares_1
d_whole,B2
volume_envelope, ve_intermission_squares_2
half,CS3
whole,DS3,FS3
volume_envelope, ve_intermission_squares_1
d_whole,FS2
volume_envelope, ve_intermission_squares_2
half,B2,FS3,DS3,CS3,B2


Triangle:
volume_envelope, ve_intermission_triangle
whole,rest
half,B3,CS4,DS4,FS4,B4,AS4
duty_length,FS4

whole,rest
half,B3,CS4,DS4,FS4,B4,AS4,FS4,DS4,CS4,B3
derek1,FS3

whole,rest
half,B3,CS4,DS4,FS4,B4,AS4,FS4,DS4,CS4,B3,GS4,DS4,CS4,B3

half,FS4,DS4,CS4,B3,GS3,B3,CS4,DS4
duty_length,CS4


Noise:
volume_envelope, ve_intermission_noise1
whole,15
volume_envelope, ve_intermission_noise2
half,4,13
volume_envelope, ve_intermission_noise1
half,15,15
volume_envelope, ve_intermission_noise2
whole,4
volume_envelope, ve_intermission_noise1
whole,15
volume_envelope, ve_intermission_noise2
half,4,13
volume_envelope, ve_intermission_noise1
half,15,15,2,4

