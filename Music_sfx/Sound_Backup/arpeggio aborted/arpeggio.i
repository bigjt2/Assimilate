;;;;;;;;;;;;;;;;;;;;
arpeggio_index:

    .word no_arpeggio
    .word arp_s2_square1_intro

;;;;;;;;;;;;;;;;;;;;;

no_arpeggio:
    .byte $83

arp_s2_square1_intro:
    .byte 0, 3, 5, 0, -7, -10, $81, 8, 0, $82


;;;;;;;;;;;;;;;;;;;;;;;

arp_none = $00
arp_s2_sq1_intro = $01