; void __fastcall__ gotoxy (unsigned char x, unsigned char y);
; void __fastcall__ gotox (unsigned char x);
;

        .export         gotoxy, _gotoxy, _gotox
        .import         popa

        .include        "rpc8e.inc"

gotoxy:
        jsr     popa            ; Get Y

_gotoxy:
        sta     CV              ; Store Y
		sta     BUFROW
        jsr     popa            ; Get X

_gotox:
        sta     CH              ; Store X
		lda     #<OUTST
		clc
		adc     CH
		sta     WINOUT
        rts
