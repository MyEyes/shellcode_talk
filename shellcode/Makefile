CC := gcc
AS := nasm

BINARIES := test test_exec_only test_no_write
SHELLCODES := basic/version1 basic/version2 basic/version3


all: $(BINARIES) $(SHELLCODES)
	
% :: %.c
	$(CC) $< -o $@

% :: %.asm
	$(AS) $<

clean:
	rm -f $(BINARIES)
	rm -f $(SHELLCODES)