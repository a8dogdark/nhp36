pagina4_init = $03FD
.proc pagina4, pagina4_init

	//ORG $03FD
	.BYTE $55,$55,$FE
    LDA $D301
    AND #$02
    BEQ ERROR
    LDX #$0B
MOVE
    LDA SIOV,X
    STA $0300,X
    DEX
    BPL MOVE
    JSR $E459
    BMI ERROR
    LDA FIN
    STA GENDAT
    CLC
    RTS
ERROR
    LDX $CFFC
    LDY $CFFD
    STX $0230
    STY $0231
    LDY #$00
LER
    LDA TABLA,Y
    STA ($58),Y
    INY
    CPY #27
    BNE LER
    LDA #$3C
    STA $D302
LOOP4
    BNE LOOP4
TABLA
    .SB +128,"ERROR "
    .SB +128,"!!!"
    .SB " CARGU"
    .SB "E NUEV"
    .SB "AMENTE"
SIOV
    .BYTE $60,$00,$52,$40
    .WORD $CC00
    .BYTE $23,$00
    .WORD $03BC
    .BYTE $00,$80
FIN
.endp