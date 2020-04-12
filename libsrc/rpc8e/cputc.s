; void __fastcall__ cputcxy (unsigned char x, unsigned char y, char c);
; void __fastcall__ cputc (char c);
;
        .constructor    initconio
        .export         _cputcxy, _cputc
        .export         cputdirect, newline
        .import         gotoxy, VTABZ

        .include        "rpc8e.inc"

        .segment        "ONCE"

initconio:
        lda     #<OUTST           ; Get the begining of the text window
        sta     WINOUT            ; Set the pointer to the start of the window
        lda     #>OUTST           ; 
        sta     WINOUT+1          ; Set the high byte of the pointer
        rts
		
        .code

; Plot a character - also used as internal function

_cputcxy:
        pha                     ; Save C
        ;jsr     gotoxy          ; Call this one, will pop params
        pla                     ; Restore C and run into _cputc

_cputc:
        cmp     #$0D            ; Test for \r = carrage return
        beq     left
        cmp     #$0A            ; Test for \n = line feed
        beq     newline

cputdirect:
        jsr     put
		inc     WINOUT
        inc     CH              ; Bump to next column
        lda     CH
		clc
        cmp     #80
        bcc     :+
        jsr     newline
left:   lda     #$00            ; Goto left edge of screen
        sta     CH
        lda     #<OUTST           ; Get the begining of the text window
        sta     WINOUT            ; Set the pointer to the start of the window
:       rts

newline:
        inc     CV              ; Bump to next line
		lda     CV
        sta     BUFROW
		clc
		cmp     #50              ; Screen is 50 columns tall
        bcc     :+
        lda     #00              ; Go back to the top of the screen
        sta     CV
		sta     BUFROW
		sta     WINOUT
:		rts

put:    ldy     #00
		sta     (WINOUT),Y        ; put the current character to the display
        rts

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		