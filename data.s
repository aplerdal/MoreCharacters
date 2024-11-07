; Append graphics and other data
; You must add the following for each custom character
;	"@CHAR_NAME equ nextid" where next id is the next available number
;	".incbin graphics/imagename_chr.bin" under charGfx:
;	".incbin graphics/imagename_pal.bin" under "charPal:" (You must manually create palettes for star etc.)
;	".word @RIVAL1, @RIVAL2, ..." under "rivalTable:" If you don't understand just copy the included example and change the last entry to @CHAR_NAME
; You can optionally add your own handling table as well, but by default one is included for the next 8 characters.

.autoregion
.align 0x10

@MARIO	equ 0
@LUIGI	equ 1
@PEACH	equ 2
@TOAD	equ 3
@YOSHI	equ 4
@DK	equ 5
@WARIO	equ 6
@BOWSER	equ 7

; Custom
@CUBE	equ 8

charGfx:
.incbin "extracted/charGfx.bin"
.incbin "build/gfx/cube_char_lg_chr.bin"
.incbin "build/gfx/cube_char_md_chr.bin"
.incbin "build/gfx/cube_char_sm_chr.bin"
charPal:
.incbin "extracted/charPal.bin"
.incbin "build/gfx/cube_char_lg_pal.bin"
.incbin "build/gfx/cube_char_md_pal.bin"
.incbin "build/gfx/cube_char_sm_pal.bin"

charSmallIcon:
.incbin "extracted/smallIconGfx.bin"
.incbin "extracted/smallIconGfx.bin"

rivalTable:
.word @CUBE, @LUIGI, @PEACH, @TOAD, @YOSHI, @DK, @WARIO, @MARIO
.incbin "extracted/rivals.bin"
; Add a new rival table for each new character. Last (8th) entry must be the number of the character you are adding.
.word @MARIO, @LUIGI, @PEACH, @TOAD, @YOSHI, @DK, @WARIO, @CUBE

handlingTable:
.incbin "extracted/handling.bin"
; I don't know how handling works so I will just include it twice.
; The handling for new characters will be the same as the character with the id `newChar%8`
; In this example the cube's handling aligns to mario `8%8 = 0 = @MARIO`
.incbin "extracted/handling.bin"
.endautoregion