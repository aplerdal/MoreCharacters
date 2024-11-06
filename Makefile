# Project name
PROJECT = MoreCharacters

MAIN_FILE = main.s
ASM_FILES = $(wildcard *.s) $(wildcard *.asm)
# Put data files like graphics here
DATA_FILES = $(wildcard *.bin)
GRAPHICS_FILES = $(wildcard graphics/*.png)

KART_GFX_IMG = kart.img.bin
KART_GFX_PAL = kart.img.pal

PATCHED_ROM = $(PROJECT).gba

# Replace this path with your own to support `make run`
MGBA_PATH = "C:\Program Files\mGBA\mGBA.exe"

# ARMIPS executable path
ARMIPS = ./armips
# Grit path. This is installed along devkitpro's gba toolkit.
GRIT = grit

# Default rule to assemble the project
all: $(PATCHED_ROM)

# Rule to create the patched ROM using armips
extract:
	$(ARMIPS) extract.s

$(KART_GFX_IMG) $(KART_GFX_PAL): $(GRAPHICS_FILES)
	@grit $(GRAPHICS_FILES) -ps3 -pe16 -pT0 -ftb -gt -gB4 -Mh8 -Mw8 -fh! -fa -o graphics/kart

$(PATCHED_ROM): $(ASM_FILES) $(DATA_FILES) extract $(KART_GFX_IMG) $(KART_GFX_PAL)
	$(ARMIPS) $(MAIN_FILE) -temp $(PROJECT).txt

# Clean up generated files
clean:
	rm -f $(PATCHED_ROM)

run: $(PATCHED_ROM)
	$(MGBA_PATH) $(PATCHED_ROM)

# PHONY targets are not actual files
.PHONY: all extract clean run