;
; File generated by cc65 v 2.18 - Git 3bb3b3c0
;
	.fopt		compiler,"cc65 v 2.18 - Git 3bb3b3c0"
	.setcpu		"65C02"
	.smart		on
	.autoimport	on
	.case		on
	.debuginfo	off
	.importzp	sp, sreg, regsave, regbank
	.importzp	tmp1, tmp2, tmp3, tmp4, ptr1, ptr2, ptr3, ptr4
	.macpack	longbranch
	.forceimport	__STARTUP__
	.import		_clrscr
	.import		_cputc
	.import		_cprintf
	.import		_cgetc
	.import		_cursor
	.import		_screensize
	.export		_main

.segment	"RODATA"

L000C:
	.byte	$54,$79,$70,$65,$20,$63,$68,$61,$72,$61,$63,$74,$65,$72,$73,$20
	.byte	$74,$6F,$20,$73,$65,$65,$0D,$0A,$74,$68,$65,$69,$72,$20,$68,$65
	.byte	$78,$61,$64,$65,$63,$69,$6D,$61,$6C,$20,$63,$6F,$64,$65,$0D,$0A
	.byte	$6E,$75,$6D,$62,$65,$72,$73,$20,$2D,$20,$27,$51,$27,$20,$71,$75
	.byte	$69,$74,$73,$3A,$0D,$0A,$0A,$00
L002D:
	.byte	$3D,$24,$25,$30,$32,$78,$20,$00
L003C:
	.byte	$0D,$0A,$00
L0036	:=	L003C+0

.segment	"BSS"

_height:
	.res	1,$00
_width:
	.res	1,$00
_r:
	.res	1,$00
_t:
	.res	1,$00
_c:
	.res	2,$00

; ---------------------------------------------------------------
; int __near__ GET (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_GET: near

.segment	"CODE"

	jsr     _cgetc
	ldx     #$00
	sta     _c
	stx     _c+1
	ldx     #$00
	jsr     _cputc
	lda     _c
	ldx     _c+1
	jmp     L0001
L0001:	rts

.endproc

; ---------------------------------------------------------------
; int __near__ main (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_main: near

.segment	"CODE"

	jsr     _clrscr
	ldx     #$00
	lda     #$07
	sta     _r
	lda     #<(L000C)
	ldx     #>(L000C)
	jsr     pushax
	ldy     #$02
	jsr     _cprintf
	lda     #<(_width)
	ldx     #>(_width)
	jsr     pushax
	lda     #<(_height)
	ldx     #>(_height)
	jsr     _screensize
	ldx     #$00
	lda     _width
	jsr     pushax
	ldx     #$00
	lda     #$06
	jsr     tosudivax
	sta     _width
	lda     #$01
	jsr     _cursor
	ldx     #$00
	lda     #$00
	sta     _t
	jmp     L0033
L0017:	ldx     #$00
	lda     _r
	jsr     pushax
	ldx     #$00
	lda     _height
	jsr     toseqax
	jeq     L001E
	jsr     _clrscr
	ldx     #$00
	lda     #$00
	sta     _t
	lda     _c
	jsr     _cputc
	ldx     #$00
	lda     #$01
	sta     _r
L001E:	lda     _c
	ldx     _c+1
	cpx     #$00
	bne     L002A
	cmp     #$0A
L002A:	jsr     booleq
	jeq     L0028
	ldx     #$00
	inc     _r
	lda     _r
L0028:	lda     #<(L002D)
	ldx     #>(L002D)
	jsr     pushax
	lda     _c
	ldx     _c+1
	jsr     pushax
	ldy     #$04
	jsr     _cprintf
	lda     _c
	ldx     _c+1
	cpx     #$00
	bne     L0032
	cmp     #$51
L0032:	jsr     booleq
	jeq     L0030
	jmp     L0018
L0030:	ldx     #$00
	inc     _t
	lda     _t
	jsr     pushax
	ldx     #$00
	lda     _width
	jsr     toseqax
	jeq     L0033
	lda     #<(L0036)
	ldx     #>(L0036)
	jsr     pushax
	ldy     #$02
	jsr     _cprintf
	ldx     #$00
	inc     _r
	lda     _r
	ldx     #$00
	lda     #$00
	sta     _t
L0033:	jsr     _GET
	sta     _c
	stx     _c+1
	cpx     #$FF
	bne     L001D
	cmp     #$FF
L001D:	jsr     boolne
	jne     L0017
L0018:	lda     #<(L003C)
	ldx     #>(L003C)
	jsr     pushax
	ldy     #$02
	jsr     _cprintf
	ldx     #$00
	lda     #$00
	jmp     L0007
L0007:	rts

.endproc

