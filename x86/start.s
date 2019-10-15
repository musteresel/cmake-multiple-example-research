        .code32

        .globl kernelentry

        .set FLAGS, 0
        .set MAGIC, 0x1BADB002
        .set CHECKSUM, -(MAGIC + FLAGS)

        .section .boot
        .align 4
MultibootHeader:
	.long MAGIC
	.long FLAGS
	.long CHECKSUM

kernelentry:
	movl $kstack, %esp
	call Run
	cli
	hlt


        .section .bss
        .lcomm kstack_bottom, 1024 // 1 KB Stack space
kstack:
