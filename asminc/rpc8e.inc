
;-----------------------------------------------------------------------------
; Zero page stuff
WINOUT :=      $FE     ; Next free character on the output buffer

;-----------------------------------------------------------------------------
; Hardware

; Monitor input and ouput registers
BUFROW :=      $0300   ; Text buffer row
CH     :=      $0301   ; Cursor horizontal position
CV     :=      $0302   ; Cursor vertical position
CMODE  :=      $0303   ; Cursor mode
CHARIND:=      $0304   ; The char buffer index
CHARPOS:=      $0305   ; Where new chars are stored
CHARREG:=      $0306   ; Gives the char at CHARIND
BLTMODE:=      $0307
BLTSTX :=      $0308
BLTSTY :=      $0309
BLTENDX:=      $030A
BLTENDY:=      $030B
BLTWDTH:=      $030C
BLTHGHT:=      $030D
OUTST  :=      $0310   ; Text buffer start

; Blit commands
BLTFILL:=      $01
BLTINVR:=      $02
BLTCOPY:=      $03
