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
@CUBE equ 8

charGfx:
.incbin "extracted/charGfx.bin"
.incbin "graphics/kart.img.bin"
charPal:
.incbin "extracted/charPal.bin"
.incbin "graphics/kart.pal.bin"

rivalTable:
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