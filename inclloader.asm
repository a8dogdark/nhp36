LOAD
    ICL 'loader.asm'
PAG7
    ICL 'pagina7.asm'
PAG4
    ICL 'pagina4.asm'
@GENDAT
	.BYTE 0
ESPSIO
    .BYTE $55,$55
NME
    .BYTE "...................."
BLQ
    .BYTE "..."
PFIN
    .BYTE 0,0