; ---------------------------------------------------------------------------
; crt0.s
; ---------------------------------------------------------------------------
;
; Startup code for c65el02

.export   _init, _exit
.import   _main

.export   __STARTUP__ : absolute = 1        ; Mark as startup
.import   __STACK_START__, __STACK_SIZE__       ; Linker generated

.import    copydata, zerobss, initlib, donelib

.include  "zeropage.inc"

.macro SEP30
     .byte     $E2
     .byte     $30
.endmacro

.macro XCE
     .byte     $FB
.endmacro
 
; ---------------------------------------------------------------------------
; Place the startup code in a special segment

.segment  "STARTUP"

; ---------------------------------------------------------------------------
; A little light 6502 housekeeping

_init:    
		  ;Get the processor into 6502 mode
		  SEP30
		  SEC
		  XCE
		  LDX     #$FF                 ; Initialize Hardware stack pointer to $02FF (thanks to the eloram bug), the software stack is 0x100 to 0x1FF and not the same thing
          TXS                          ; In fact putting the same place causes the program not to work.
          CLD                          ; Clear decimal mode
		  CLC
		  
; ---------------------------------------------------------------------------
; Set cc65 argument stack pointer

          LDA     #<(__STACK_START__ + __STACK_SIZE__ - 1)
          STA     sp
          LDA     #>(__STACK_START__ + __STACK_SIZE__ - 1)
          STA     sp+1

; ---------------------------------------------------------------------------
; Initialize memory storage

          JSR     zerobss              ; Clear BSS segment
          JSR     copydata             ; Initialize DATA segment
          JSR     initlib              ; Run constructors

; ---------------------------------------------------------------------------
; Call main()

          JSR     _main

; ---------------------------------------------------------------------------
; Back from main (this is also the _exit entry):  force a software break

_exit:    JSR     donelib              ; Run destructors
          BRK
