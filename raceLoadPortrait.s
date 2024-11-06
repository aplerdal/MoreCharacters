// Override the portraits loaded durring the race

.org 0x804ede0 :: jmpt r3, @getCostume

.autoregion
@loadCostumes:
	; Inserting block to load character icons
	push	{r0-r7}

	ldr	r4, =0x6001000		; VRAM Dest
	ldr	r5, =0x3003B98+0x4c	; Character Ids
	mov	r6, #0			; counter

	; UNFINISHED
@@Return:
	pop	{r0-r7}
	ldr	r1,[r0]
	mov	r0,r1
	add	r0,#0xC4
	ldr	r0,[r0]
	ldr	r3,=#0x804EDE9
	bx	r3
.endautoregion