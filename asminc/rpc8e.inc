
;-----------------------------------------------------------------------------
; Zero page stuff
WINOUT :=      $00     ; Next free character on the output buffer

;-----------------------------------------------------------------------------
; Hardware

; Monitor ouput registers
BUFROW :=      $0300   ; Text buffer row
CH     :=      $0301   ; Cursor horizontal position
CV     :=      $0302   ; Cursor vertical position
CMODE  :=      $0303   ; Cursor mode
OUTST  :=      $0310   ; Text buffer start