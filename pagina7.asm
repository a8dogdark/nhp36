pagina7_init = $0700

.proc pagina7, pagina7_init
	//org $0700
INICIO
	.BYTE $00,$03
	.WORD INICIO,PRINCIPAL
	JSR KEM
	LDX $230
	LDY $0231
	STX $CFFC
	STY $CFFD
	LDX #<DLS
	LDY #>DLS
	LDA #$00
	STX $0230
	STX $D402
	STY $0231
	STY $D403
	STA $41
	JMP $0400
KEM
	LDX #$C0
    LDY #$00
    SEI
    LDA $D40E
    PHA
    STY $D40E
    STX $CC
    STY $CB
LOOP7
    LDA ($CB),Y
    DEC $D301
    STA ($CB),Y
    INC $D301
    INY
    BNE LOOP7
    INC $CC
    BEQ @EXIT
    LDA $CC
    CMP #$D0
    BNE LOOP7
    LDA #$D8
    STA $CC
    BNE LOOP7
@EXIT
    DEC $D301
    LDX #$01
    LDY #$4C
    LDA #$13
    STX $EE17
    STY $ED8F
    STA $ED67
    LDX #$80
    LDY #$03
    STX $EBA3
    STY $EBA8
    LDY #$04
    LDA #$EA
NOP
    STA $ED85,Y
    DEY
    BPL NOP
    LDY #STACF-STACI
MOVE7
    LDA STACI,Y
    STA $ECEF,Y
    DEY
    BPL MOVE7
    PLA
    STA $D40E
    CLI
    CLC
    RTS
STACI
    LDA #$7D
    LDX $62
    BEQ CC0
    LDA #$64
CC0
    CLC
    ADC $EE19,X
    DEY
    BPL CC0
    CLC
    ADC $0312
    SEC
    SBC #$64
    BCC CC3
    STA $0312
    LDY #$02
    LDX #$06
    LDA #$4F
CC2
    ADC $0312
    BCC CC1
    INY
    CLC
CC1
    DEX
    BNE CC2
    STA $02EE
    STY $02EF
    JMP $ED96
CC3
    JMP $ED3D
STACF
	.BY +128,"  Por Parche Negro Soft  "
DLS
	.BYTE $70,$70,$70,$70,$70,$70,$70
	.BYTE $70,$70,$70,$70,$70,$70,$70
	.BYTE $47
	.WORD SHOW
	.BYTE $41
	.WORD DLS
SHOW
	.SB "  --   PRISMA   --  "
PRINCIPAL
	LDX #<INICIO
	LDY #>INICIO
	STX $0C
	STY $0D
	LDX $CFFC
	LDY $CFFD
	STX $230
	STY $231
	JMP ($0304)
.endp