gdt_start: ;start with null 8 byte
  dd 0x0 ;4 byte
  dd 0x0 ;same here

; GDT for code segment. base = 0x00000000, length = 0xfffff
; for flags, refer to os-dev.pdf document, page 36
gdt_code:
  dw 0xffff ;segment length, bits 0-15
  dw 0x0 ;segment base, bits 0-15
  db 0x0 ;segment base, bits 16-23
  db 10011010b ;flags 8 bits
  db 11001111b ;flags 4 bits + seg length, bits 16-23
  db 0x0 ;segs base, bits 24-31

; GDT for data seg. Base and length identical to code seg
gdt_data:
  dw 0xffff
  dw 0x0
  db 0x0
  db 10010010b
  db 11001111b
  db 0x0

gdt_end:
; nothing here yet?

gdt_descriptor:
  dw gdt_end - gdt_start - 1 ;size 16 bit - always 1 less than true size
  dd gdt_start ;address 32 bit

; Constants for later
CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start
