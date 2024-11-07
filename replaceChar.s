// overides the memory address character graphics are loaded from durring a race.

// 0x80ebf58 : Unk handling table
// 0x80ec0d8 : Other handling table  

; Using pointer replacement instead
;.org 0x803cf5c :: jmpt r3, @GetCharPal 

.org 0x8043750 :: jmpt r0, @GetCharGfx


; move rival table
.org 0x8049228 :: .word org(rivalTable)
.org 0x80492c0 :: .word org(rivalTable)

; Replace graphics pointers
.org 0x8043704 :: .word org(charGfx)
.org 0x8005f94 :: .word org(charGfx)
.org 0x8006064 :: .word org(charGfx)
.org 0x80100c8 :: .word org(charGfx)
.org 0x8016ea0 :: .word org(charGfx)

; Replace palette pointers
.org 0x803cfac :: .word org(charPal)+6
.org 0x8005fa8 :: .word org(charPal)
.org 0x80100cc :: .word org(charPal)
.org 0x8016eac :: .word org(charPal)
.org 0x8017b6c :: .word org(charPal)

// Move Handling table
.org 0x803c31c :: .word org(handlingTable)

; move icons
.org 0x8003150 :: .word org(smallIconGfx)
.org 0x8003644 :: .word org(smallIconGfx)
.org 0x800ad88 :: .word org(smallIconGfx)
.org 0x800c954 :: .word org(smallIconGfx)
.org 0x8015520 :: .word org(smallIconGfx)
.org 0x8018038 :: .word org(smallIconGfx)
.org 0x8018580 :: .word org(smallIconGfx)
.org 0x802264c :: .word org(smallIconGfx)
.org 0x802b5f8 :: .word org(smallIconGfx)

.org 0x80D9794 :: .byte 0x08 ; To set luigi to load character 9 in game.

.autoregion
@GetCharGfx:
	; All registers can be modified safely. r0 is return address.
	; Incoming register values:
	; r2 = character sprite address
	; r7 = charater size offset

	; TODO: if not all custom chars: check if character <= 8, if so, use default table
	ldr	r2, =org(charGfx)

	add	r0, r2, r7
	mov	r2, #0x3f
	and	r2, r1
	lsl	r1, r2, #0x1
	add	r1, r1, r2
	lsl	r1, r1, #0x2
	sub	r1, r1, r2
	lsl	r1, r1, #0xd
	add	r0, r0, r1
	@@Return:
	ldr	r3, =0x8043785 ; function return adress
	bx	r3
	.pool
@GetCharPal:
	; Incoming register values:
	; r0 = palette offset
	; r4 = char id
	; r6 = offset to char data
	lsl	r4, r4, #0x9
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	add	r0, r0, r4
	ldr	r1, =org(charPal)+6 ; offset for skipping first 3 colors
	add	r4, r0, r1
	ldr	r3, =0x803cf69
	bx	r3
	.pool
.endautoregion