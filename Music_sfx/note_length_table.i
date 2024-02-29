;note length constants (aliases)
                      ;;FamiTracker, Derek's Exported Files
thirtysecond = $80
sixteenth = $81
eighth = $82          ;;06
quarter = $83         ;;12
half = $84            ;;24
whole = $85           ;;48
d_sixteenth = $86
d_eighth = $87
d_quarter = $88       ;;18
d_half = $89          ;;36
d_whole = $8A         ;;72
t_quarter = $8B
five_eighths =$8C
five_sixteenths=$8D

derek1=$8E            ;;96
derek2=$8F            ;;60
derek3=$90            ;;
derek4=$91            ;;30   
duty_length = $92     ;;192


note_length_table:
    .byte $01   ;32nd note
    .byte $02   ;16th note
    .byte $04   ;8th note
    .byte $08   ;quarter note
    .byte $10   ;half note
    .byte $20   ;whole note
              ;---dotted notes
    .byte $03   ;dotted 16th note
    .byte $06   ;dotted 8th note
    .byte $0C   ;dotted quarter note
    .byte $18   ;dotted half note
    .byte $30   ;dotted whole note?
              ;---other
    .byte $07   ;modified quarter to fit after d_sixteenth triplets
    .byte $14   ;2 quarters plus an 8th
    .byte $0A

    .byte $40   ;darek1
    .byte $28   ;derek2
    .byte $48   ;derek3
    .byte $14   ;derek4
    .byte $80   ;128 units, for the duty test
