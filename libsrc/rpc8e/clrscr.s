;
; void clrscr (void);
;
		.import         _waitTick
        .export         _clrscr
        .include        "rpc8e.inc"
		
        .code

; Clear the screen using the blitter

_clrscr:
        lda #$20                ; Ascii space
		sta BLTSTX              ; Also stores the character used when filling
		lda #00
		sta BLTENDX
		sta BLTENDY
		sta CH
		sta CV
		sta BUFROW
		lda     #<OUTST
        sta     WINOUT            ; Reset the output pointer
		lda     #80               ; Screen Height
		sta     BLTWDTH
		lda     #50               ; Screen width
		sta 	BLTHGHT
		lda 	BLTFILL
		sta 	BLTMODE
		jsr     _waitTick
		rts