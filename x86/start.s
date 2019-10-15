[BITS 32]

[GLOBAL kernelentry]
[EXTERN Run]

FLAGS	equ 0
MAGIC	equ 0x1BADB002
CHECKSUM	equ -(MAGIC + FLAGS)

[SECTION .boot]
align 4
MultibootHeader:
	dd MAGIC
	dd FLAGS
	dd CHECKSUM

kernelentry:
	lea esp,[kstack]
	call Run
	cli
	hlt


[SECTION .bss]
resb 1024 ;1 KB Stack space
kstack:
