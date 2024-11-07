ifeq ($(OS),Windows_NT)
	EXE = .exe
endif

# Project name
PROJECT = MoreCharacters

MAIN_FILE = main.s
ASM_FILES = $(wildcard *.s) $(wildcard *.asm)

PATCHED_ROM = $(PROJECT).gba

# Replace this path with your own to support `make run`
MGBA_PATH = "C:\Program Files\mGBA\mGBA.exe"

# ARMIPS executable path
ARMIPS = ./bin/armips$(EXE)
# PTEXCONV path.
PTEXCONV = ./bin/ptexconv$(EXE)

# Graphics paths
CHARS = $(wildcard graphics/*.def)

LG_CHAR_GFX = $(patsubst %.def, %_char_lg.png, $(CHARS))
LG_CHAR_BIN = $(patsubst %.png, %.bin, $(LG_CHAR_GFX))

MD_CHAR_GFX = $(patsubst %.def, %_char_md.png, $(CHARS))
MD_CHAR_BIN = $(patsubst %.png, %.bin, $(MD_CHAR_GFX))

SM_CHAR_GFX = $(patsubst %.def, %_char_sm.png, $(CHARS))
SM_CHAR_BIN = $(patsubst %.png, %.bin, $(SM_CHAR_GFX))

CHAR_GFX = $(LG_CHAR_GFX) $(MD_CHAR_GFX) $(SM_CHAR_GFX)
CHAR_BIN = $(LG_CHAR_BIN) $(MD_CHAR_BIN) $(SM_CHAR_BIN)

#SM_ICON_RACE_GFX = $(patsubst %.def, %_icon_race_sm.png, $(CHARS))
#SM_ICON_MENU_GFX = $(patsubst %.def, %_icon_menu_sm.png, $(CHARS))


# Default rule to assemble the project
all: $(PATCHED_ROM)

# Rule to create the patched ROM using armips
extract:
	$(ARMIPS) extract.s

$(CHAR_BIN): $(CHAR_GFX)
	@echo build/gfx/$(notdir $@)
	$(PTEXCONV) $(basename $@).png -o build/gfx/$(basename $(notdir $@)) -cn -ns -b 4 -p 1 -po 3

$(PATCHED_ROM): $(ASM_FILES) $(DATA_FILES) extract $(CHAR_BIN)
	$(ARMIPS) $(MAIN_FILE) -temp $(PROJECT).txt

# Clean up generated files
clean:
	rm -f $(PATCHED_ROM)

run: $(PATCHED_ROM)
	$(MGBA_PATH) $(PATCHED_ROM)

# PHONY targets are not actual files
.PHONY: all extract clean run