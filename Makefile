# Project name
PROJECT = MoreCharacters

MAIN_FILE = main.s
ASM_FILES = $(wildcard *.s) $(wildcard *.asm)
# Put data files like graphics here
DATA_FILES = $(wildcard *.bin)
PATCHED_ROM = $(PROJECT).gba

# Replace this path with your own to support `make run`
MGBA_PATH = "C:\Program Files\mGBA\mGBA.exe"

# ARMIPS executable path
ARMIPS = ./armips

# Default rule to assemble the project
all: $(PATCHED_ROM)

# Rule to create the patched ROM using armips
extract:
	$(ARMIPS) extract.s

$(PATCHED_ROM): $(ASM_FILES) $(DATA_FILES) extract
	$(ARMIPS) $(MAIN_FILE) -temp $(PROJECT).txt

# Clean up generated files
clean:
	rm -f $(PATCHED_ROM)

run: $(PATCHED_ROM)
	$(MGBA_PATH) $(PATCHED_ROM)

# PHONY targets are not actual files
.PHONY: all extract clean run