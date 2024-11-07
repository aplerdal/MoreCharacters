.gba

.if fileexists("extracted/charGfx.bin")==0
	.create "extracted/charGfx.bin", 0x0
		.incbin "mksc.gba", 0x345800, 0xB0000
	.close
.endif
.if fileexists("extracted/charPal.bin")==0
	.create "extracted/charPal.bin", 0x0
		.incbin "mksc.gba", 0x344600, 0x1000
	.close
.endif

.if fileexists("extracted/rivals.bin")==0
	.create "extracted/rivals.bin", 0x0
		.incbin "mksc.gba", 0xEDC34, 0x100
	.close
.endif

.if fileexists("extracted/handling.bin")==0
	.create "extracted/handling.bin", 0x0
		.incbin "mksc.gba", 0xEC0D8, 0x100
	.close
.endif


.if fileexists("extracted/smallIconGfx.bin")==0
	.create "extracted/smallIconGfx.bin", 0x0
		.incbin "mksc.gba", 0x63834, 0x800
	.close
.endif