col_index_to_alpha:
;===============================================================================
; convert a column number (0-255) to alpha (A...IV)
;
; in:   A       column-number (0-255)
;
; out:  A       lower letter as a screen-code
;       X       upper letter as a screen-code, or 0 for none
;       Y       (clobbered)
;-------------------------------------------------------------------------------
        tay                     ; keep unmodified column number
        sec                     ; clear borrow for subtracting

        ldx # 0                 ; (columns A-Z, no upper letter)
        sbc # 26                ; reduce index by 26
        bcc +                   ; if borrow occured, look up lower "A"-"Z"
        inx                     ; ("A" upper letter)
        sbc # 26                ; reduce index by 26
        bcc +                   ; if borrow occured, look up lower "A"-"Z"
        inx                     ; ("B" upper letter)
        sbc # 26                ; reduce index by 26
        bcc +                   ; if borrow occured, look up lower "A"-"Z"
        inx                     ; ("C" upper letter)
        sbc # 26                ; reduce index by 26
        bcc +                   ; if borrow occured, look up lower "A"-"Z"
        inx                     ; ("D" upper letter)
        sbc # 26                ; reduce index by 26
        bcc +                   ; if borrow occured, look up lower "A"-"Z"
        inx                     ; ("E" upper letter)
        sbc # 26                ; reduce index by 26
        bcc +                   ; if borrow occured, look up lower "A"-"Z"
        inx                     ; ("F" upper letter)
        sbc # 26                ; reduce index by 26
        bcc +                   ; if borrow occured, look up lower "A"-"Z"
        inx                     ; ("G" upper letter)
        sbc # 26                ; reduce index by 26
        bcc +                   ; if borrow occured, look up lower "A"-"Z"
        inx                     ; ("H" upper letter)
        sbc # 26                ; reduce index by 26
        bcc +                   ; if borrow occured, look up lower "A"-"Z"
        inx                     ; ("I" upper letter)
        sbc # 26                ; reduce index by 26

+       tay
        lda @az-230, y
        rts

@az:    .BYTE   $01     ; 'A'
        .BYTE   $02     ; 'B'
        .BYTE   $03     ; 'C'
        .BYTE   $04     ; 'D'
        .BYTE   $05     ; 'E'
        .BYTE   $06     ; 'F'
        .BYTE   $07     ; 'G'
        .BYTE   $08     ; 'H'
        .BYTE   $09     ; 'I'
        .BYTE   $0a     ; 'J'
        .BYTE   $0b     ; 'K'
        .BYTE   $0c     ; 'L'
        .BYTE   $0d     ; 'M'
        .BYTE   $0e     ; 'N'
        .BYTE   $0f     ; 'O'
        .BYTE   $10     ; 'P'
        .BYTE   $11     ; 'Q'
        .BYTE   $12     ; 'R'
        .BYTE   $13     ; 'S'
        .BYTE   $14     ; 'T'
        .BYTE   $15     ; 'U'
        .BYTE   $16     ; 'V'
        .BYTE   $17     ; 'W'
        .BYTE   $18     ; 'X'
        .BYTE   $19     ; 'Y'
        .BYTE   $1a     ; 'Z'