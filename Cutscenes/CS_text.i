;;;;;;;;;;;;;;;;;;
;;Cutscene Texts
;;;;;;;;;;;;;;;;

Cutscene_Texts:
  .dw CS_LV1_00,CS_LV1_00_erase,CS_LV1_01,CS_LV1_02,CS_LV1_03,CS_LV1_04
  .dw CS_LV1_05,CS_LV1_06,CS_LV1_07,CS_LV1_08,CS_LV1_09,CS_LV1_10
  .dw CS_LV1_11,CS_LV1_12,CS_LV1_13,CS_LV1_14,CS_LV1_15
  .dw CS_LV1_ERASE_A, CS_LV1_ERASE_B
  .dw CS_LV1_txt

  .dw CS_LV6_01,CS_LV6_02,CS_LV6_03,CS_LV6_04,CS_LV6_05
  .dw CS_LV6_06,CS_LV6_07,CS_LV6_08,CS_LV6_09,CS_LV6_10

  .dw CS_BS2_01,CS_BS2_02,CS_BS2_03,CS_BS2_04,CS_BS2_05,CS_BS2_06,CS_BS2_07

  .dw CS_LV12_01,CS_LV12_02,CS_LV12_03,CS_LV12_04,CS_LV12_05
  .dw CS_LV12_06,CS_LV12_07,CS_LV12_08,CS_LV12_09,CS_LV12_10
  .dw CS_LV12_11,CS_LV12_12

  .dw CS_BS3_01,CS_BS3_02,CS_BS3_03,CS_BS3_04,CS_BS3_05
  .dw CS_BS3_06,CS_BS3_07,CS_BS3_08,CS_BS3_09,CS_BS3_10

  .dw CS_LV18_01,CS_LV18_02,CS_LV18_03,CS_LV18_04,CS_LV18_05
  .dw CS_LV18_06,CS_LV18_07,CS_LV18_08,CS_LV18_09,CS_LV18_10
  .dw CS_LV18_11,CS_LV18_12

  .dw CS_CHASE_01,CS_CHASE_02,CS_CHASE_03

  .dw CS_FINL_BTL_01,CS_FINL_BTL_02,CS_FINL_BTL_03,CS_FINL_BTL_04,CS_FINL_BTL_05
  .dw CS_FINL_BTL_06,CS_FINL_BTL_07,CS_FINL_BTL_08,CS_FINL_BTL_09,CS_FINL_BTL_10
  .dw CS_FINL_BTL_11,CS_FINL_BTL_12,CS_FINL_BTL_13

  .dw CS_END_01,CS_END_02,CS_END_03,CS_END_04,CS_END_05
  .dw CS_END_06,CS_END_07,CS_END_08,CS_END_09,CS_END_10
  .dw CS_END_11,CS_END_12,CS_END_13,CS_END_14,CS_END_15

  .dw CS_BS1_01,CS_BS1_02,CS_BS1_03,CS_BS1_04,CS_BS1_05
  .dw CS_BS1_06,CS_BS1_07,CS_Boss1_txt

  .dw CS_LV6_txt,CS_LV12_txt,CS_LV18_txt
  .dw CS_Boss2_txt,CS_Boss3_txt,CS_Boss4_txt,CS_FinalBoss_txt
  .dw CS_BossFight_txt


;;;;;;;;;;;;;;;;;;;;;;
;;LEVEL 1 INTRO
;;;;;;;;;;;;;;;;;;;;;;

CS_LV1_00:
  .db $01,$22,$89
  .db _T,_H,_I,_S, __, _I,_S, __, _O,_S,_S,_A,_N, DOT
  .db $02

CS_LV1_00_erase:
  .db $01,$22,$85
  .db __,__,__,__,__,__,__,__,__,__,__,__,__,__,__,__,__,__,__,__,__,__,__,__
  .db $02

CS_LV1_01:
  .db $01,$22,$A5
  .db _H,_E, __, _A,_R,_E, __, _S,_E,_N,_T, __, _O,_N
  .db $01,$22,$C5
  .db _M,_I,_S,_S,_I,_O,_N, __, _T,_O, __, _A,_S,_S,_I,_M,_I,_L,_A,_T,_E
  .db $02

CS_LV1_02:
  .db $01,$22,$E5
  .db _T,_H,_E, __, _T,_A,_L,_K,_I,_N,_G, __, _M,_O,_N,_K,_E,_Y,_S, __, _O,_F
  .db $01,$23,$05
  .db _P,_L,_A,_N,_E,_T, __, _E,_A,_R,_T,_H, DOT
  .db $02


CS_LV1_03:
  .db $01,$22,$A5
  .db _T,_H,_E,_Y, __, _M,_A,_Y, __,  _D,_O, __,  _R,_I,_D,_I,_C,_U,_L,_O,_U,_S
  .db $01,$22,$C5
  .db _T,_H,_I,_N,_G,_S, __, _L,_I,_K,_E, __,  _T,_R,_Y,_I,_N,_G
  .db $02
CS_LV1_04:
  .db $01,$22,$E5
  .db _D,_E,_F,_E,_N,_D, __, _T,_H,_E,_M,_S,_E,_L,_V,_E,_S, DOT, __, _P,_F,_F,_T, DOT
  .db $02


CS_LV1_05:
  .db $01,$22,$A5
  .db _A,_V,_O,_I,_D, __, _T,_H,_E, __, _S,_I,_L,_L,_Y
  .db $01,$22,$C5
  .db _A,_R,_T,_I,_L,_L,_E,_R,_Y, COMA, __, _M,_I,_S,_S,_I,_L,_E,_S, COMA, __, _E,_T,_C, DOT
  .db $02
CS_LV1_06:
  .db $01,$22,$E5
  .db  _T,_H,_E,_Y, __, _F,_I,_R,_E, __, _A,_T, __, _Y,_O,_U, __, _A,_N,_D
  .db $01,$23,$05
  .db _G,_U,_I,_D,_E, __, _O,_S,_S,_A,_N, __, _T,_O,  __, _V,_I,_C,_T,_O,_R,_Y, DOT
  .db $02


CS_LV1_07:
  .db $01,$22,$A5
  .db _H,_I,_S, __, _R,_I,_V,_A,_L, __, _K,_O,_G,_Y,_A,_R,_U, COMA, __, _I,_S
  .db $01,$22,$C5
  .db _B,_A,_C,_K, __, _O,_N, __, _H,_I,_S, __, _H,_O,_M,_E,_W,_O,_R,_L,_D, COMA
  .db $02
CS_LV1_08:
  .db $01,$22,$E5
  .db _H,_O,_P,_I,_N,_G, __, _H,_E, __, _I,_S, __, _F,_A,_I,_L, DOT
  .db $02


CS_LV1_09:
;  .db $01,$22,$A5
  .db $01,$22,$AB
  .db _O,_R, __, _I,_S, __, _S,_H,_E, QUES
  .db $02

CS_LV1_10:    ;redacted
CS_LV1_11:    ;redacted

CS_LV1_12:
  .db $01,$22,$A6
  .db _Y,_O,_U, COMA, __, _U,_N,_D,_E,_R,DASH,_E,_D,_U,_C,_A,_T,_E,_D, COMA
  .db $01,$22,$C6
  .db _O,_V,_E,_R, DASH,_F,_E,_D, __, _A,_M,_E,_R,_I,_C,_A,_N
  .db $02
CS_LV1_13:
  .db $01,$22,$E6
  .db _S,_C,_H,_O,_O,_L,_C,_H,_I,_L,_D, COMA, __, _C,_A,_N, __, _Y,_O,_U
  .db $01,$23,$06
  .db _H,_E,_L,_P, __, _O,_S,_S,_A,_N, __, _S,_U,_C,_C,_E,_E,_D, QUES
  .db $02


CS_LV1_14:
;  .db $01,$22,$A5
  .db $01,$22,$A7
  .db _L,_E,_T, __, _U,_S, __, _H,_O,_P,_E, __, _S,_O, DOT, DOT, DOT
  .db $02


CS_LV1_15:
  .db $01,$22,$85
  .db _B,_E,_G,_I,_N, __, _A,_S,_S,_I,_M,_I,_L,_A,_T,_I,_O,_N, EXCL, EXCL, EXCL
  .db $02


CS_LV1_ERASE_A:
  .db $01,$22,$A5
  .db __,__,__,__,__,__,__,__,__,__,__,__,__,__,__
  .db __,__,__,__,__,__,__,__,__,__
  .db $01,$22,$C5
  .db __,__,__,__,__,__,__,__,__,__,__,__,__,__,__
  .db __,__,__,__,__,__,__,__,__,__
  .db $02
CS_LV1_ERASE_B:
  .db $01,$22,$E5
  .db __,__,__,__,__,__,__,__,__,__,__,__,__,__,__
  .db __,__,__,__,__,__,__,__,__,__
  .db $01,$23,$05
  .db __,__,__,__,__,__,__,__,__,__,__,__,__,__,__
  .db __,__,__,__,__,__,__,__,__,__
  .db $02


;;;;;;;;;;;;;;;;;;;;;;
;;BOSS 1 INTRO
;;;;;;;;;;;;;;;;;;;;;;

CS_BS1_01:
  .db $01,$22,$A7
  .db _O,_H,__,_N,_O,COMA,__,_F,_A,_T,__,_A,_M,_E,_R,_I,_C,_A,_N
  .db $01,$22,$C7
  .db _S,_C,_H,_O,_O,_L,_C,_H,_I,_L,_D,EXCL,EXCL,EXCL
  .db $02


CS_BS1_02:
  .db $01,$22,$A6
  .db _T,_H,_O,_S,_E,__,_L,_A,_Z,_Y,__,_A,_M,_E,_R,_I,_C,_A,_N,_S
  .db $01,$22,$C6
  .db _A,_R,_E,__,_R,_E,_A,_L,_L,_Y,__,_M,_A,_D,EXCL,__,_I,_T 
  .db $02
CS_BS1_03:
  .db $01,$22,$E6
  .db _S,_E,_E,_M,_S,__,_T,_H,_E,_Y,__,_A,_R,_E
  .db $01,$23,$06
  .db _T,_A,_K,_E,__,_O,_F,_F,_E,_N,_S,_E
  .db $02


CS_BS1_04:
  .db $01,$22,$A6
  .db _T,_O,__,_Z,_O,_M,_B,_I,_E,__,_A,_P,_O,_C,_A,_L,_Y,_P,_S,_E,_S
  .db $01,$22,$C6
  .db _A,_N,_D,__,_H,_A,_V,_I,_N,_G,__,_O,_B,_J,_E,_C,_T,_S
  .db $02
CS_BS1_05:
  .db $01,$22,$E6
  .db _S,_H,_O,_V,_E,_D,__,_U,_P,__,_T,_H,_E,_I,_R
  .db $01,$23,$06
  .db _R,_E,_C,_T,_U,_M,_S,EXCL
  .db $02


CS_BS1_06:
  .db $01,$22,$A6
  .db _T,_H,_E,_Y,__,_H,_A,_V,_E,__,_U,_N,_L,_E,_A,_S,_H,_E,_D
  .db $01,$22,$C6
  .db _T,_H,_E,__,_S,_U,_P,_E,_R,__,_S,_E,_C,_R,_E,_T
  .db $02
CS_BS1_07:
  .db $01,$22,$E6
  .db _W,_E,_A,_P,_O,_N,__,_O,_N,__,_O,_S,_S,_A,_N,EXCL
  .db $01,$23,$06
  .db _D,_O,__,_S,_O,_M,_E,_T,_H,_I,_N,_G,EXCL
  .db $02


;;;;;;;;;;;;;;;;;;;;;;
;;LEVEL 6 INTRO
;;;;;;;;;;;;;;;;;;;;;;

CS_LV6_01:
  .db $01,$22,$A7
  .db _T,_H,_A,_N,_K,_S,__,_T,_O,__,_Y,_O,_U,_R
  .db $01,$22,$C7
  .db _C,_U,_N,_N,_I,_N,_G,COMA,__,_T,_H,_E,__,_S,_E,_C,_R,_E,_T
  .db $02
CS_LV6_02:
  .db $01,$22,$E7
  .db _W,_E,_A,_P,_O,_N,__,_I,_S,__,_N,_O,__,_M,_O,_R,_E,DOT
  .db $02


CS_LV6_03:
  .db $01,$22,$A8
  .db _W,_I,_T,_H,__,_U,_S,_A,__,_N,_O,_W
  .db $01,$22,$C8
  .db _D,_E,_F,_E,_A,_T,_E,_D,COMA,__,_O,_T,_H,_E,_R
  .db $02
CS_LV6_04:
  .db $01,$22,$E8
  .db _P,_A,_R,_T,_S,__,_O,_F,__,_E,_A,_R,_T,_H
  .db $01,$23,$08
  .db _A,_W,_A,_I,_T,DOT
  .db $02


CS_LV6_05:
  .db $01,$22,$A6
  .db _Y,_O,_U,__,_A,_N,_D,__,_O,_S,_S,_A,_N,__,_A,_R,_E
  .db $01,$22,$C6
  .db _G,_O,_I,_N,_G,__,_T,_O,__,_T,_H,_E,__,_O,_R,_I,_E,_N,_T,EXCL,EXCL
  .db $02


CS_LV6_06:
  .db $01,$22,$A8
  .db _A,_H,COMA,__,_T,_H,_E,__,_O,_R,_I,_E,_N,_T,DASH,DASH
  .db $01,$22,$C8
  .db _L,_A,_N,_D,__,_O,_F,__,_S,_U,_P,_E,_R,_I,_O,_R
  .db $02
CS_LV6_07:
  .db $01,$22,$E8
  .db _C,_A,_R,_S,COMA,__,_D,_E,_L,_I,_C,_I,_O,_U,_S
  .db $01,$23,$08
  .db _N,_O,_O,_D,_L,_E,__,_D,_I,_S,_H,_E,_S,COMA
  .db $02


CS_LV6_08:
  .db $01,$22,$A6
  .db _A,_N,_D,__,_H,_I,_G,_H,_L,_Y,__,_I,_N,_D,_E,_C,_E,_N,_T
  .db $01,$22,$C6
  .db _C,_A,_R,_T,_O,_O,_N,_S,__,_I,_N,_V,_O,_L,_V,_I,_N,_G
  .db $02
CS_LV6_09:
  .db $01,$22,$E6
  .db _S,_C,_H,_O,_O,_L,_G,_I,_R,_L,_S,__,_A,_N,_D
  .db $01,$23,$06
  .db _T,_E,_N,_T,_A,_C,_L,_E,_S,EXCL,EXCL,EXCL
  .db $02


CS_LV6_10:
  .db $01,$22,$AA
  .db _T,_A,_N,_O,_S,_H,_I,_N,_D,_E,EXCL,EXCL,EXCL
  .db $02


;;;;;;;;;;;;;;;;;;;;;;
;;BOSS 2 INTRO
;;;;;;;;;;;;;;;;;;;;;;

CS_BS2_01:
  .db $01,$22,$A7
  .db _A,_N,_O,_T,_H,_E,_R,__,_P,_R,_O,_B,_L,_E,_M,EXCL,EXCL,EXCL
  .db $02


CS_BS2_02:
  .db $01,$22,$A6
  .db _A,__,_G,_R,_E,_A,_T,__,_L,_I,_Z,_A,_R,_D,__,_W,_H,_O
  .db $01,$22,$C6
  .db _B,_E,_A,_R,_S,__,_N,_O,__,_R,_E,_S,_E,_M,_B,_L,_A,_N,_C,_E
  .db $02
CS_BS2_03:
  .db $01,$22,$E6
  .db _T,_O,__,_T,_R,_A,_D,_E,_M,_A,_R,_K,_E,_D
  .db $01,$23,$06
  .db _C,_H,_A,_R,_A,_C,_T,_E,_R,__,_H,_A,_S,__,_R,_I,_S,_E,_N
  .db $02


CS_BS2_04:
  .db $01,$22,$A6
  .db _F,_R,_O,_M,__,_T,_H,_E,__,_S,_E,_A,__,_A,_N,_D,__,_I,_S
  .db $01,$22,$C6
  .db _B,_R,_E,_A,_K,_I,_N,_G,__,_A,_L,_L,__,_T,_H,_I,_N,_G,_S,EXCL
  .db $02


CS_BS2_05:
  .db $01,$22,$A8
  .db _T,_E,_A,_C,_H,__,_T,_H,_A,_T,__,_G,_I,_A,_N,_T
  .db $01,$22,$C8
  .db _M,_O,_N,_S,_T,_E,_R,__,_A,__,_L,_E,_S,_S,_O,_N,EXCL
  .db $02


CS_BS2_06:
  .db $01,$22,$A8
  .db _S,_H,_O,_W,__,_H,_I,_M,__,_Y,_O,_U,__,_T,_H,_E
  .db $01,$22,$C8
  .db _O,_N,_L,_Y,__,_O,_N,_E,__,_A,_L,_L,_O,_W,_E,_D
  .db $02
CS_BS2_07:
  .db $01,$22,$E8
  .db _T,_O,__,_D,_E,_S,_T,_R,_O,_Y,__,_T,_H,_I,_N,_G,_S
  .db $01,$23,$08
  .db _A,_N,_D,__,_B,_E,__,_H,_A,_P,_P,_Y,EXCL
  .db $02


;;;;;;;;;;;;;;;;;;;;;;
;;LEVEL 12 INTRO
;;;;;;;;;;;;;;;;;;;;;;

CS_LV12_01:
  .db $01,$22,$A7
  .db _O,_S,_S,_A,_N,__,_I,_S,__,_B,_A,_C,_K,__,_I,_N 
  .db $01,$22,$C7
  .db _T,_H,_E,__,_U,_S,_S,_R,EXCL
  .db $02
CS_LV12_02:
  .db $01,$22,$E7
  .db DOT,DOT,DOT,_W,_E,__,_J,_U,_S,_T,__,_R,_E,_A,_L,_L,_Y
  .db $01,$23,$07
  .db _W,_A,_N,_T,_E,_D,__,_T,_O,__,_S,_A,_Y,__,_T,_H,_A,_T,DOT
  .db $02


CS_LV12_03:
  .db $01,$22,$A6
  .db _T,_H,_E,__,_P,_E,_O,_P,_L,_E,__,_N,_O,_T
  .db $01,$22,$C6
  .db _H,_A,_P,_P,_Y,__,_I,_N,__,_T,_H,_I,_S,__,_L,_A,_N,_D,DOT
  .db $02
CS_LV12_04:
  .db $01,$22,$E6
  .db _T,_H,_E,_Y,__,_C,_A,_L,_L,__,_T,_H,_E,_M,_S,_E,_L,_V,_E,_S
  .db $01,$23,$06
  .db _A,_S,__,_C,_O,_M,_M,_U,_N,_I,_S,_T,_S,DOT
  .db $02


CS_LV12_05:
  .db $01,$22,$A7
  .db _C,_O,_M,_M,_U,_N,_I,_S,_T,_S,__,_B,_E,_L,_I,_E,_V,_E
  .db $01,$22,$C7
  .db _T,_H,_A,_T,__,_C,_L,_A,_S,_S,_L,_E,_S,_S
  .db $02
CS_LV12_06:
  .db $01,$22,$E7
  .db _S,_O,_C,_I,_E,_T,_Y,__,_C,_A,_N,__,_B,_E
  .db $01,$23,$07
  .db _A,_C,_H,_I,_E,_V,_E,_D,__,_O,_N,_L,_Y
  .db $02


CS_LV12_07:
  .db $01,$22,$A8
  .db _W,_H,_E,_N,__,_E,_V,_E,_R,_Y,_O,_N,_E
  .db $01,$22,$C8
  .db _H,_A,_S,__,_O,_W,_N,_E,_R,_S,_H,_I,_P,__,_O,_V,_E,_R
  .db $02
CS_LV12_08:
  .db $01,$22,$E8
  .db _T,_H,_E,__,_M,_E,_A,_N,_S,__,_O,_F
  .db $01,$23,$08
  .db _P,_R,_O,_D,_U,_C,_T,_I,_O,_N,DOT
  .db $02


CS_LV12_09:
  .db $01,$22,$A8
  .db _H,_A,EXCL,EXCL,__,_O,_N,_L,_Y,__,_G,_A,_I,_J,_I,_N
  .db $01,$22,$C8
  .db _C,_O,_U,_L,_D,__,_T,_H,_I,_N,_K,__,_U,_P
  .db $02
CS_LV12_10:
  .db $01,$22,$E8
  .db _S,_O,_M,_E,_T,_H,_I,_N,_G,__,_S,_O
  .db $01,$23,$08
  .db _R,_I,_D,_I,_C,_U,_L,_O,_U,_S,EXCL,EXCL,EXCL
  .db $02


CS_LV12_11:
  .db $01,$22,$A8
  .db _S,_T,_I,_C,_K,__,_S,_O,_M,_E,__,_P,_R,_O,_B,_E,_S
  .db $01,$22,$C8
  .db _U,_P,__,_S,_O,_M,_E,__,_C,_O,_M,_M,_I,_E
  .db $02
CS_LV12_12:
  .db $01,$22,$E8
  .db _A,_R,_S,_E,_H,_O,_L,_E,_S,__,_A,_N,_D
  .db $01,$23,$08
  .db _L,_E,_T,_S,__,_M,_O,_V,_E,__,_O,_N,EXCL
  .db $02


;;;;;;;;;;;;;;;;;;;;;;
;;BOSS 3 INTRO
;;;;;;;;;;;;;;;;;;;;;;

CS_BS3_01:
  .db $01,$22,$A7
  .db _S,_O,_M,_E,_T,_H,_I,_N,_G,__,_H,_O,_R,_R,_I,_B,_L,_Y
  .db $01,$22,$C7
  .db _E,_V,_I,_L,__,_L,_U,_R,_K,_S,__,_H,_E,_R,_E,DOT,DOT,DOT
  .db $02


CS_BS3_02:
  .db $01,$22,$A7
  .db _T,_H,_E,__,_C,_O,_M,_M,_I,_E,_S,__,_H,_A,_V,_E
  .db $01,$22,$C7
  .db _B,_E,_E,_N,__,_T,_I,_N,_K,_E,_R,_I,_N,_G,__,_W,_I,_T,_H
  .db $02
CS_BS3_03:
  .db $01,$22,$E7
  .db _F,_O,_R,_C,_E,_S,__,_T,_H,_E,_Y,__,_A,_R,_E
  .db $01,$23,$07
  .db _N,_O,_T,__,_U,_N,_D,_E,_R,_S,_T,_A,_N,_D,DOT
  .db $02


CS_BS3_04:
  .db $01,$22,$A7
  .db _T,_H,_E,_Y,__,_H,_A,_V,_E,__,_V,_I,_O,_L,_A,_T,_E,_D
  .db $01,$22,$C7
  .db _T,_H,_E,__,_V,_E,_R,_Y,__,_L,_A,_W,_S,__,_O,_F
  .db $02
CS_BS3_05:
  .db $01,$22,$E7
  .db _N,_A,_T,_U,_R,_E,__,_A,_N,_D,__,_M,_O,_C,_K,_E,_D
  .db $01,$23,$07
  .db _L,_I,_F,_E,__,_I,_T,_S,_E,_L,_F,DOT
  .db $02


CS_BS3_06:
  .db $01,$22,$A9
  .db _I,_F,__,_H,_U,_M,_I,_L,_I,_A,_T,_I,_O,_N
  .db $01,$22,$C9
  .db _W,_E,_R,_E,__,_I,_N,_V,_O,_L,_V,_E,_D,COMA
  .db $02
CS_BS3_07:
  .db $01,$22,$E9
  .db _T,_H,_I,_S,__,_W,_O,_U,_L,_D,__,_B,_E
  .db $01,$23,$09
  .db _V,_E,_R,_Y,__,_R,_E,_S,_P,_E,_C,_T,_A,_B,_L,_E,DOT
  .db $02


CS_BS3_08:
  .db $01,$22,$A9
  .db _B,_U,_T,__,_I,_T,_S,__,_N,_O,_T,COMA
  .db $01,$22,$C9
  .db _S,_O,__,_D,_O,__,_S,_O,_M,_E,_T,_H,_I,_N,_G
  .db $02
CS_BS3_09:
  .db $01,$22,$E9
  .db _A,_B,_O,_U,_T,__,_T,_H,_I,_S
  .db $01,$23,$09
  .db _P,_E,_R,_V,_E,_R,_S,_I,_O,_N,EXCL
  .db $02


CS_BS3_10:
  .db $01,$22,$A6
  .db _G,_E,_T,__,_R,_E,_A,_D,_Y,__,_T,_O,__,_F,_A,_C,_E,DOT,DOT,DOT
  .db $02


;;;;;;;;;;;;;;;;;;;;;;
;;LEVEL 18 INTRO
;;;;;;;;;;;;;;;;;;;;;;

CS_LV18_01:
  .db $01,$22,$A7
  .db _O,_S,_S,_A,_N,__,_H,_A,_S,__,_D,_E,_C,_I,_D,_E,_D
  .db $01,$22,$C7
  .db _H,_E,__,_I,_S,__,_T,_I,_R,_E,_D,__,_O,_F
  .db $02
CS_LV18_02:
  .db $01,$22,$E7
  .db _B,_L,_U,_E,__,_S,_K,_I,_E,_S,__,_A,_N,_D
  .db $01,$23,$07
  .db _O,_X,_Y,_G,_E,_N,__,_A,_T,_M,_O,_S,_P,_H,_E,_R,_E,DOT
  .db $02


CS_LV18_03:
  .db $01,$22,$A6
  .db _H,_E,__,_N,_E,_E,_D,_S,__,_T,_O,__,_G,_E,_T,__,_A,_W,_A,_Y
  .db $01,$22,$C6
  .db _T,_O,__,_A,__,_P,_L,_A,_C,_E,__,_T,_H,_A,_T,__,_F,_E,_E,_L,_S
  .db $02
CS_LV18_04:
  .db $01,$22,$E6
  .db _A,__,_L,_I,_T,_T,_L,_E,__,_M,_O,_R,_E,__,_L,_I,_K,_E
  .db $01,$23,$06
  .db _H,_O,_M,_E,__,_F,_O,_R,__,_A,_W,_H,_I,_L,_E,DOT
  .db $02


CS_LV18_05:
  .db $01,$22,$A8
  .db _S,_O,__,_H,_E,__,_D,_E,_C,_I,_D,_E,_D,__,_T,_O
  .db $01,$22,$C8
  .db _T,_A,_K,_E,__,_A,__,_S,_T,_R,_O,_L,_L,__,_U,_P,__,_T,_O
  .db $02
CS_LV18_06:
  .db $01,$22,$E8
  .db _T,_H,_E,__,_H,_U,_M,_A,_N,__,_C,_O,_L,_O,_N,_Y
  .db $01,$23,$08
  .db _O,_N,__,_T,_H,_E,__,_M,_O,_O,_N,DOT
  .db $02


CS_LV18_07:
  .db $01,$22,$A7
  .db _E,_A,_R,_T,_H,__,_S,_T,_A,_R,_T,_I,_N,_G,__,_T,_O
  .db $01,$22,$C7
  .db _L,_O,_O,_K,__,_W,_E,_L,_L,__,_O,_N,__,_I,_T,_S
  .db $02
CS_LV18_08:
  .db $01,$22,$E7
  .db _W,_A,_Y,__,_T,_O,__,_B,_E,_I,_N,_G
  .db $01,$23,$07
  .db _A,_S,_S,_I,_M,_I,_L,_A,_T,_E,_D,DOT
  .db $02


CS_LV18_09:
  .db $01,$22,$A7
  .db _T,_R,_U,_L,_Y,COMA,__,_Y,_O,_U,_V,_E,__,_D,_O,_N,_E
  .db $01,$22,$C7
  .db _A,_M,_A,_Z,_I,_N,_G,__,_U,_P,__,_T,_O,__,_N,_O,_W,DOT
  .db $02


CS_LV18_10:
  .db $01,$22,$A7
  .db _W,_A,_T,_C,_H,__,_O,_U,_T,COMA,__,_T,_H,_O,_U,_G,_H,DOT
  .db $01,$22,$C7
  .db _T,_H,_E,_R,_E,__,_M,_A,_Y,__,_B,_E
  .db $02
CS_LV18_11:
  .db $01,$22,$E7
  .db _C,_E,_R,_T,_A,_I,_N,__,_S,_O,_M,_E,_O,_N,_E
  .db $01,$23,$07
  .db _O,_U,_T,__,_T,_H,_E,_R,_E,__,_W,_H,_O,__,_I,_S
  .db $02


CS_LV18_12:
  .db $01,$22,$A8
  .db _B,_E,_C,_O,_M,_I,_N,_G,__,_J,_E,_A,_L,_O,_U,_S
  .db $01,$22,$C8
  .db _O,_F,__,_Y,_O,_U,_R,__,_S,_U,_C,_C,_E,_S,_S,DOT
  .db $02


;;;;;;;;;;;;;;;;;;;;;;
;;KOGY CHASE INTRO
;;;;;;;;;;;;;;;;;;;;;;

CS_CHASE_01:
  .db $01,$22,$A6
  .db _O,_S,_S,_A,_N,__,_I,_S,__,_F,_I,_N,_I,_S,_H,__,_W,_I,_T,_H
  .db $01,$22,$C6
  .db _K,_O,_G,_Y,_A,_R,_U,__,_M,_E,_D,_D,_L,_I,_N,_G,EXCL
  .db $02


CS_CHASE_02:
  .db $01,$22,$A8
  .db _R,_U,_N,__,_D,_O,_W,_N,__,_T,_H,_A,_T
  .db $01,$22,$C8
  .db _D,_I,_N,_G,_B,_A,_T,__,_A,_N,_D,__,_S,_H,_O,_W
  .db $02
CS_CHASE_03:
  .db $01,$22,$E8
  .db _H,_E,_R,__,_W,_H,_O,__,_W,_E,_A,_R,_S,__,_T,_H,_E
  .db $01,$23,$08
  .db _P,_A,_N,_T,_S,EXCL
  .db $02


;;;;;;;;;;;;;;;;;;;;;;
;;FINAL BATTLE INTRO
;;;;;;;;;;;;;;;;;;;;;;

CS_FINL_BTL_01:
  .db $01,$22,$A7
  .db _H,_M,DOT,__,_L,_O,_O,_K,_S,__,_L,_I,_K,_E,__,_Y,_O,_U
  .db $01,$22,$C7
  .db _C,_A,_U,_G,_H,_T,__,_K,_O,_G,_Y,_A,_R,_U,DOT,DOT,DOT
  .db $02


CS_FINL_BTL_02:
  .db $01,$22,$A8
  .db _B,_U,_T,__,_I,_T,__,_A,_L,_S,_O,__,_L,_O,_O,_K,_S
  .db $01,$22,$C8
  .db _L,_I,_K,_E,__,_S,_H,_E,__,_B,_R,_O,_U,_G,_H,_T
  .db $02
CS_FINL_BTL_03:
  .db $01,$22,$E8
  .db _A,__,_B,_I,_G,__,_P,_I,_N,_K,__,_T,_O,_Y
  .db $01,$23,$08
  .db _W,_I,_T,_H,__,_H,_E,_R,DOT
  .db $02

CS_FINL_BTL_04:
  .db $01,$22,$A8
  .db DOT,DOT,DOT, __, _W,_E, __, _K,_N,_O,_W, __, _W,_H,_A,_T
  .db $01,$22,$C8
  .db _Y,_O,_U, __, _T,_H,_I,_N,_K,_I,_N,_G,DOT,DOT
  .db $02

CS_FINL_BTL_05:
  .db $01,$22,$A7
  .db _B,_U,_T,__,_T,_H,_A,_T,__, _I,_S, __, DASH,_N,_O,_T,DASH
  .db $01,$22,$C7
  .db _W,_H,_A,_T,__,_W,_E, __, _M,_E,_A,_N, __, _B,_Y
  .db $02
CS_FINL_BTL_06:
  .db $01,$22,$E7
  .db _H,_E,_R,__,_P,_I,_N,_K,__,_T,_O,_Y,EXCL
  .db $02

CS_FINL_BTL_07:
  .db $01,$22,$A6
  .db _T,_H,_I,_S, __, _T,_O,_Y, __,_I,_S,__,_G,_I,_G,_A,_N,_T,_I,_C,COMA
  .db $01,$22,$C6
  .db _W,_E,_L,_L,DASH,_A,_R,_M,_O,_R,_E,_D,__,_S,_H,_I,_P
  .db $02
CS_FINL_BTL_08:
  .db $01,$22,$E6
  .db _W,_I,_T,_H,__,_L,_O,_T,_S,__,_O,_F
  .db $01,$23,$06
  .db _A,_L,_I,_E,_N,__,_F,_I,_R,_E,_P,_O,_W,_E,_R,EXCL
  .db $02


CS_FINL_BTL_09:
  .db $01,$22,$A7
  .db _A,_N,_D,__,_R,_I,_G,_H,_T,__,_N,_O,_W,__,_I,_T
  .db $01,$22,$C7
  .db _A,_I,_M,_I,_N,_G,__,_F,_O,_R,__,_O,_S,_S,_A,_N,EXCL
  .db $02


CS_FINL_BTL_10:
  .db $01,$22,$AA
  .db _T,_H,_I,_S,__,_I,_S,__,_I,_T,EXCL,EXCL
  .db $01,$22,$C9
  .db _F,_I,_N,_A,_L,__,_B,_A,_T,_T,_L,_E,EXCL,EXCL
  .db $02


CS_FINL_BTL_11:
  .db $01,$22,$A7
  .db _I,_F,__,_Y,_O,_U,__,_W,_A,_N,_T,__,_T,_O
  .db $01,$22,$C7
  .db _L,_I,_V,_E,__,_T,_O,__,_S,_E,_E,__,_C,_R,_E,_D,_I,_T,_S
  .db $02
CS_FINL_BTL_12:
  .db $01,$22,$E7
  .db _Y,_O,_U,_L,_L,__,_N,_E,_E,_D,__,_T,_O 
  .db $01,$23,$07
  .db _B,_E,__,_A,_T,__,_Y,_O,_U,_R,__,_B,_E,_S,_T,EXCL
  .db $02


CS_FINL_BTL_13:
  .db $01,$22,$AB
  .db _G,_O,_O,_D,__,_L,_U,_C,_K,EXCL
  .db $02


;;;;;;;;;;;;;;;;;;;;;;
;;ENDING
;;;;;;;;;;;;;;;;;;;;;;

CS_END_01:
  .db $01,$22,$AB
  .db _V,_I,_C,_T,_O,_R,_Y,EXCL,EXCL,EXCL
  .db $02


CS_END_02:
  .db $01,$22,$A6
  .db _C,_O,_N,_G,_R,_A,_T,_U,_L,_A,_T,_I,_O,_N,_S,EXCL,EXCL
  .db $01,$22,$C6
  .db _Y,_O,_U,__,_H,_A,_V,_E,__,_A,_S,_S,_I,_M,_I,_L,_A,_T,_E,_D
  .db $02
CS_END_03:
  .db $01,$22,$E6
  .db _T,_H,_E,__,_T,_A,_L,_K,_I,_N,_G,__,_M,_O,_N,_K,_E,_Y,_S
  .db $01,$23,$06
  .db _O,_F,__,_P,_L,_A,_N,_E,_T,__,_E,_A,_R,_T,_H,EXCL,EXCL
  .db $02


CS_END_04:
  .db $01,$22,$A7
  .db _A,_N,_D,__,_B,_E,_S,_T,_E,_D,__,_O,_S,_S,_A,_N,_S
  .db $01,$22,$C7
  .db _O,_L,_D,_E,_S,_T,__,_R,_I,_V,_A,_L,__,_T,_O,_O,EXCL,EXCL
  .db $02


CS_END_05:
  .db $01,$22,$A9
  .db _N,_O,_T,__,_B,_A,_D,__,_F,_O,_R
  .db $01,$22,$C9
  .db _C,_H,_U,_B,_B,_Y,__,_A,_M,_E,_R,_I,_C,_A,_N
  .db $02
CS_END_06:
  .db $01,$22,$E9
  .db _S,_C,_H,_O,_O,_L,_C,_H,_I,_L,_D,EXCL
  .db $02


CS_END_07:
  .db $01,$22,$A7
  .db _Y,_O,_U,__,_A,_R,_E,__,_T,_R,_U,_L,_Y,__,_A,_N
  .db $01,$22,$C7
  .db _A,_S,_S,_I,_M,_I,_L,_A,_T,_E,__,_M,_A,_S,_T,_E,_R,EXCL
  .db $02


CS_END_08:
  .db $01,$22,$A7
  .db _N,_O,_W,__,_B,_E,__,_S,_U,_R,_E,__,_T,_O
  .db $01,$22,$C7
  .db _G,_E,_T,__,_Y,_O,_U,_R,__,_P,_A,_R,_E,_N,_T,_S
  .db $02
CS_END_09:
  .db $01,$22,$E7
  .db _T,_O,__,_B,_U,_Y,__,_T,_H,_E,__,_S,_E,_Q,_U,_E,_L
  .db $01,$23,$07
  .db _W,_H,_E,_N,__,_I,_T,__,_C,_O,_M,_E,_S,__,_O,_U,_T,EXCL
  .db $02


CS_END_10:
  .db $01,$22,$A7
  .db _T,_H,_E,__,_S,_E,_Q,_U,_E,_L,__,_W,_I,_L,_L
  .db $01,$22,$C7
  .db _B,_R,_I,_N,_G,__,_Y,_O,_U,__,_H,_A,_P,_P,_I,_N,_E,_S,_S
  .db $02
CS_END_11:
  .db $01,$22,$E7
  .db _A,_N,_D,__,_L,_U,_C,_K,DOT,__,_A,_N,_D,__,_Y,_O,_U,_R
  .db $01,$23,$07
  .db _P,_A,_R,_E,_N,_T,_S,__,_M,_O,_N,_E,_Y,__,_W,_I,_L,_L,DOT,DOT,DOT
  .db $02


CS_END_12:
  .db $01,$22,$A7
  .db _B,_R,_I,_N,_G,__,_U,_S,__,_J,_A,_P,_A,_N,_E,_S,_E
  .db $01,$22,$C7
  .db _T,_H,_E,__,_R,_E,_S,_O,_U,_R,_C,_E,_S,__,_T,_O
  .db $02
CS_END_13:
  .db $01,$22,$E7
  .db _B,_U,_Y,__,_U,_P,__,_M,_O,_R,_E,__,_O,_F
  .db $01,$23,$07
  .db _Y,_O,_U,_R,__,_C,_O,_U,_N,_T,_R,_Y,EXCL
  .db $02


CS_END_14:
  .db $01,$22,$AB
  .db _S,_O,__,_I,_N,__,_E,_N,_D
  .db $01,$22,$C8
  .db _E,_V,_E,_R,_Y,_O,_N,_E,__,_W,_I,_N,_N,_E,_R,EXCL
  .db $02


CS_END_15:
  .db $01,$22,$AB
  .db _S,_A,_Y,_O,_U,_N,_A,_R,_A,EXCL
  .db $02


;;;;;;;;;;;;;;;;;;;;;;
;;CREDITS
;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;
;CS_CRED_0:
;  .db $01,$22,$A5
;  .db 
;  .db $01,$22,$C5
;  .db 
;  .db $02
;CS_CRED_0:
;  .db $01,$22,$E5
;  .db 
;  .db $01,$23,$05
;  .db 
;  .db $02



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;CUTSCENE TEXT ALIASES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

para_lv1_00 = $00
para_lv1_00_erase = $01
para_lv1_01 = $02
para_lv1_02 = $03
para_lv1_03 = $04
para_lv1_04 = $05
para_lv1_05 = $06
para_lv1_06 = $07
para_lv1_07 = $08
para_lv1_08 = $09
para_lv1_09 = $0A
para_lv1_10 = $0B
para_lv1_11 = $0C
para_lv1_12 = $0D
para_lv1_13 = $0E
para_lv1_14 = $0F
para_lv1_15 = $10
L1_norm_eraseA = $11
L1_norm_eraseB = $12
LV1_announceTXT = $13

para_LV6_01 = $14
para_LV6_02 = $15
para_LV6_03 = $16
para_LV6_04 = $17
para_LV6_05 = $18
para_LV6_06 = $19
para_LV6_07 = $1A
para_LV6_08 = $1B
para_LV6_09 = $1C
para_LV6_10 = $1D

para_BS2_01 = $1E
para_BS2_02 = $1F
para_BS2_03 = $20
para_BS2_04 = $21
para_BS2_05 = $22
para_BS2_06 = $23
para_BS2_07 = $24

para_LV12_01 = $25
para_LV12_02 = $26
para_LV12_03 = $27
para_LV12_04 = $28
para_LV12_05 = $29
para_LV12_06 = $2A
para_LV12_07 = $2B
para_LV12_08 = $2C
para_LV12_09 = $2D
para_LV12_10 = $2E
para_LV12_11 = $2F
para_LV12_12 = $30

para_BS3_01 = $31
para_BS3_02 = $32
para_BS3_03 = $33
para_BS3_04 = $34
para_BS3_05 = $35
para_BS3_06 = $36
para_BS3_07 = $37
para_BS3_08 = $38
para_BS3_09 = $39
para_BS3_10 = $3A

para_LV18_01 = $3B
para_LV18_02 = $3C
para_LV18_03 = $3D
para_LV18_04 = $3E
para_LV18_05 = $3F
para_LV18_06 = $40
para_LV18_07 = $41
para_LV18_08 = $42
para_LV18_09 = $43
para_LV18_10 = $44
para_LV18_11 = $45
para_LV18_12 = $46

para_CHASE_01 = $47
para_CHASE_02 = $48
para_CHASE_03 = $49

para_FINL_BTL_01 = $4A
para_FINL_BTL_02 = $4B
para_FINL_BTL_03 = $4C
para_FINL_BTL_04 = $4D
para_FINL_BTL_05 = $4E
para_FINL_BTL_06 = $4F
para_FINL_BTL_07 = $50
para_FINL_BTL_08 = $51
para_FINL_BTL_09 = $52
para_FINL_BTL_10 = $53
para_FINL_BTL_11 = $54
para_FINL_BTL_12 = $55
para_FINL_BTL_13 = $56

para_END_01 = $57
para_END_02 = $58
para_END_03 = $59
para_END_04 = $5A
para_END_05 = $5B
para_END_06 = $5C
para_END_07 = $5D
para_END_08 = $5E
para_END_09 = $5F
para_END_10 = $60
para_END_11 = $61
para_END_12 = $62
para_END_13 = $63
para_END_14 = $64
para_END_15 = $65

para_BS1_01 = $66
para_BS1_02 = $67
para_BS1_03 = $68
para_BS1_04 = $69
para_BS1_05 = $6A
para_BS1_06 = $6B
para_BS1_07 = $6C

Boss1_announceTXT = $6D
LV6_announceTXT = $6E
LV12_announceTXT = $6F
LV18_announceTXT = $70
Boss2_announceTXT = $71
Boss3_announceTXT = $72
Boss4_announceTXT = $73
FinalBoss_announceTXT = $74
BossFight_announceTXT = $75



;;;;;;;;;;;;;;;;;;;;;;;;
;;Level Announce Texts
;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;
CS_LV1_txt:   
  ;$01 is activator byte for address, two bytes after are address
  ;$02 is activator byte to end writing
  .db $01,$21,$AD
  .db _L,_E,_V,_E,_L,__,_1
  .db $02

;;;;;;;;;;;;;;;;
CS_LV2_txt:   
  .db $01,$21,$AD
  .db _L,_E,_V,_E,_L,__,_2
  .db $02

;;;;;;;;;;;;;;;;
CS_LV3_txt:   
  .db $01,$21,$AD
  .db _L,_E,_V,_E,_L,__,_3
  .db $02

;;;;;;;;;;;;;;;;
CS_LV4_txt:   
  .db $01,$21,$AD
  .db _L,_E,_V,_E,_L,__,_4
  .db $02

;;;;;;;;;;;;;;;;
CS_Boss1_txt:   
  .db $01,$21,$C8
;  .db $01,$21,$E8
  .db _A,_M,_E,_R,_I,_C,_A,_N, __, _S,_E,_C,_R,_E,_T
  .db $01,$21,$EB
  .db _W,_E,_A,_P,_O,_N,EXCL,EXCL,EXCL
  .db $02

;;;;;;;;;;;;;;;;
CS_LV6_txt:   
  .db $01,$21,$AD
  .db _L,_E,_V,_E,_L,__,_6
  .db $02

;;;;;;;;;;;;;;;;
CS_LV7_txt:   
  .db $01,$21,$AD
  .db _L,_E,_V,_E,_L,__,_7
  .db $02

;;;;;;;;;;;;;;;;
CS_LV8_txt:   
  .db $01,$21,$AD
  .db _L,_E,_V,_E,_L,__,_8
  .db $02

;;;;;;;;;;;;;;;;
CS_LV9_txt:
  .db $01,$21,$AD
  .db _L,_E,_V,_E,_L,__,_9
  .db $02

;;;;;;;;;;;;;;;;
CS_LV10_txt:
  .db $01,$21,$AD
  .db _L,_E,_V,_E,_L,__,_1,_0
  .db $02

;;;;;;;;;;;;;;;;
CS_Boss2_txt:   
  .db $01,$21,$C8
  .db _G,_A,_W,_D,DASH,_J,_I,_R,_R,_A,_A,_A,_A,EXCL,EXCL,EXCL
  .db $02

;;;;;;;;;;;;;;;;
CS_LV12_txt:
  .db $01,$21,$AD
  .db _L,_E,_V,_E,_L,__,_1,_2
  .db $02

;;;;;;;;;;;;;;;;
CS_LV13_txt:
  .db $01,$21,$AD
  .db _L,_E,_V,_E,_L,__,_1,_3
  .db $02

;;;;;;;;;;;;;;;;
CS_LV14_txt:
  .db $01,$21,$AD
  .db _L,_E,_V,_E,_L,__,_1,_4
  .db $02

;;;;;;;;;;;;;;;;
CS_LV15_txt:
  .db $01,$21,$AD
  .db _L,_E,_V,_E,_L,__,_1,_5
  .db $02

;;;;;;;;;;;;;;;;
CS_LV16_txt:
  .db $01,$21,$AD
  .db _L,_E,_V,_E,_L,__,_1,_6
  .db $02

;;;;;;;;;;;;;;;;
CS_Boss3_txt:
  .db $01,$21,$E9
  .db _M,_E,_C,_H,_A,DASH,_S,_T,_A,_L,_I,_N,EXCL,EXCL
  .db $02

;;;;;;;;;;;;;;;;
CS_LV18_txt:
  .db $01,$21,$AD
  .db _L,_E,_V,_E,_L,__,_1,_8
  .db $02

;;;;;;;;;;;;;;;;
CS_LV19_txt:
  .db $01,$21,$AD
  .db _L,_E,_V,_E,_L,__,_1,_9
  .db $02

;;;;;;;;;;;;;;;;
CS_LV20_txt:
  .db $01,$21,$AD
  .db _L,_E,_V,_E,_L,__,_2,_0
  .db $02

;;;;;;;;;;;;;;;;
CS_LV21_txt:
  .db $01,$21,$AD
  .db _L,_E,_V,_E,_L,__,_2,_1
  .db $02

;;;;;;;;;;;;;;;;
CS_Boss4_txt:   
  .db $01,$21,$E8
  .db _C,_A,_T,_C,_H,__,_K,_O,_G,_Y,_A,_R,_U,EXCL,EXCL,EXCL
  .db $02

;;;;;;;;;;;;;;;;
CS_FinalBoss_txt:   
  .db $01,$21,$E9
  .db _F,_I,_N,_A,_L,__,_B,_A,_T,_T,_L,_E,EXCL,EXCL,EXCL
  .db $02

;;;;;;;;;;;;;;;;
CS_Cow_txt:
  .db $01,$21,$6A
  .db _B,_O,_N,_U,_S,__,_S,_T,_A,_G,_E
  .db $01,$21,$AA
  .db _C,_O,_W,__,_L,_E,_V,_E,_L,EXCL,EXCL,EXCL
  .db $02

;;;;;;;;;;;;;;;;
CS_Campout_txt
  .db $01,$21,$6A
  .db _B,_O,_N,_U,_S,__,_S,_T,_A,_G,_E
  .db $01,$21,$AA
  .db _N,_I,_N,_T,_E,_N,_D,_O,_A,_G,_E
  .db $01,$21,$CA
  .db _C,_A,_M,_P,_O,_U,_T,__,_2,_0,_1,_0

;;;;;;;;;;;;;;;;
CS_Bonus_txt:
  .db $01,$22,$86
  .db _Y,_O,_U, __, _H,_A,_V,_E, __, _6,_0, __, _S,_E,_C,_O,_N,_D,_S,DOT
  .db $01,$22,$A3
  .db _A,_S,_S,_I,_M,_I,_L,_A,_T,_I,_O,_N, __, _I,_N, __, _T,_H,_I,_S, __, _L,_E,_V,_E,_L
  .db $01,$22,$C2
  .db _E,_A,_R,_N,_S, __, _Y,_O,_U, __, _E,_X,_T,_R,_A, __, _P,_O,_I,_N,_T,_S,EXCL, __, _Y,_O,_U
  .db $01,$22,$E2
  .db _M,_I,_G,_H,_T, __, _A,_L,_S,_O, __, _G,_E,_T, __, _S,_O,_M,_E, __, _1,DASH,_U,_P,_S,EXCL,EXCL
  .db $02

;;;;;;;;;;;;;;;;;
CS_BossFight_txt:
  .db $01,$21,$8A
;  .db $01,$21,$AA
  .db _B,_O,_S,_S,__,_F,_I,_G,_H,_T,EXCL,EXCL
  .db $02



COMA = $D5
QUES = $D6
COLN = $D7
EXCL = $D8
DASH = $D9
DOT = $DA
PERC = $DB
_0 = $DC
_1 = $DD
_2 = $DE
_3 = $DF
_4 = $E0
_5 = $E1
_6 = $E2
_7 = $E3
_8 = $E4
_9 = $E5
_A = $E6
_B = $E7
_C = $E8
_D = $E9
_E = $EA
_F = $EB
_G = $EC
_H = $ED
_I = $EE
_J = $EF
_K = $F0
_L = $F1
_M = $F2
_N = $F3
_O = $F4
_P = $F5
_Q = $F6
_R = $F7
_S = $F8
_T = $F9
_U = $FA
_V = $FB
_W = $FC
_X = $FD
_Y = $FE
_Z = $FF
__ = $00