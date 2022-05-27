
; NOTE: this routine *must* be aligned to fit *within* a 256-byte page!
;
fast_write:
;===============================================================================
; write a given value to RAM up to 40 times quickly
;
; in:   A       value to write; `zp_addr` must be set
;       X       number of times to write value
;       Y       current offset from `zp_addr` to start at
;
; out:  Y       Y is returned incremented by X;
;               i.e. ready to write next value
;       A, X    (preserved)
;-------------------------------------------------------------------------------
        pha                     ; put aside screen code to print

        lda.w @addrs, x         ; look up lo-byte of address to jump to
        sta.w @jmp+1            ; change jump address to match
        
        pla                     ; retrieve character to print
@jmp    jmp @chars

@addrs: ;-----------------------------------------------------------------------
        .BYTE   <@rts
        .BYTE   <@chr1,         <@chr2,         <@chr3,         <@chr4
        .BYTE   <@chr5,         <@chr6,         <@chr7,         <@chr8
        .BYTE   <@chr9,         <@chr10,        <@chr11,        <@chr12
        .BYTE   <@chr13,        <@chr14,        <@chr15,        <@chr16
        .BYTE   <@chr17,        <@chr18,        <@chr19,        <@chr20
        .BYTE   <@chr21,        <@chr22,        <@chr23,        <@chr24
        .BYTE   <@chr25,        <@chr26,        <@chr27,        <@chr28
        .BYTE   <@chr29,        <@chr30,        <@chr31,        <@chr32
        .BYTE   <@chr33,        <@chr34,        <@chr35,        <@chr36
        .BYTE   <@chr37,        <@chr38,        <@chr39,        <@chr40

@chars: ;-----------------------------------------------------------------------
@chr40: sta [zp_addr], y
        iny
@chr39: sta [zp_addr], y
        iny
@chr38: sta [zp_addr], y
        iny
@chr37: sta [zp_addr], y
        iny
@chr36: sta [zp_addr], y
        iny
@chr35: sta [zp_addr], y
        iny
@chr34: sta [zp_addr], y
        iny
@chr33: sta [zp_addr], y
        iny
@chr32: sta [zp_addr], y
        iny
@chr31: sta [zp_addr], y
        iny
@chr30: sta [zp_addr], y
        iny
@chr29: sta [zp_addr], y
        iny
@chr28: sta [zp_addr], y
        iny
@chr27: sta [zp_addr], y
        iny
@chr26: sta [zp_addr], y
        iny
@chr25: sta [zp_addr], y
        iny
@chr24: sta [zp_addr], y
        iny
@chr23: sta [zp_addr], y
        iny
@chr22: sta [zp_addr], y
        iny
@chr21: sta [zp_addr], y
        iny
@chr20: sta [zp_addr], y
        iny
@chr19: sta [zp_addr], y
        iny
@chr18: sta [zp_addr], y
        iny
@chr17: sta [zp_addr], y
        iny
@chr16: sta [zp_addr], y
        iny
@chr15: sta [zp_addr], y
        iny
@chr14: sta [zp_addr], y
        iny
@chr13: sta [zp_addr], y
        iny
@chr12: sta [zp_addr], y
        iny
@chr11: sta [zp_addr], y
        iny
@chr10: sta [zp_addr], y
        iny
@chr9:  sta [zp_addr], y
        iny
@chr8:  sta [zp_addr], y
        iny
@chr7:  sta [zp_addr], y
        iny
@chr6:  sta [zp_addr], y
        iny
@chr5:  sta [zp_addr], y
        iny
@chr4:  sta [zp_addr], y
        iny
@chr3:  sta [zp_addr], y
        iny
@chr2:  sta [zp_addr], y
        iny
@chr1:  sta [zp_addr], y
        iny

@rts    rts
