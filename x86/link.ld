ENTRY(kernelentry)
OUTPUT_FORMAT(elf32-i386)

SECTIONS
{
  . = 0x100000;
  .text :
  {
    *(.boot)
    *(.text)
  }
  .data :
  {
    *(.data)
    *(.rodata)
  }
  .bss :
  {
    *(.bss)
  }
}
