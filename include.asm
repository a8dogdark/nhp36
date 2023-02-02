; Including parts of the game loader
;
LOAD
    ICL 'loader.asm'
PAG7
    ICL 'pag7.asm'
PAG4
    ICL 'pag4.asm'
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