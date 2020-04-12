; char cgetc (void);
;
; If open_apple key is pressed then the high-bit of the key is set.
;

        .export         _cgetc
        .import         cursor, put

        .include        "rpc8e.inc"

_cgetc:
        ; Wait for keyboard strobe.
		lda     CHARIND
:		cmp     CHARPOS
        beq     :-		
		
		
        ; Retrieve the character.
		lda     CHARREG
        pha
        jsr     put
		inc     CHARIND
        pla
        rts