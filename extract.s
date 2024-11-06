.gba

.if fileexists("Extracted/charGfx.bin")==0
	.create "Extracted/charGfx.bin", 0x0
		.incbin "mksc.gba", 0x345800, 0xB0000
	.close
.endif
.if fileexists("Extracted/charPal.bin")==0
	.create "Extracted/charPal.bin", 0x0
		.incbin "mksc.gba", 0x344604, 0x1000
	.close
.endif

.if fileexists("Extracted/rivals.bin")==0
	.create "Extracted/rivals.bin", 0x0
		.incbin "mksc.gba", 0xEDC34, 0x100
	.close
.endif

.if fileexists("Extracted/handling.bin")==0
	.create "Extracted/handling.bin", 0x0
		.incbin "mksc.gba", 0xEC0D8, 0x100
	.close
.endif