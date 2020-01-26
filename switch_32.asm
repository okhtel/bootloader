[bits 16]

switch_to_protected_mode:
  cli ;disable interrupts
  lgdt [gdt_descriptor] ;load gdt descriptor
  mov eax, cr0 ;control register
  or eax, 0x1 ;set 32 bit mode bit in cr0
  mov cr0, eax
  jmp CODE_SEG:init_protected_mode ;jump by using diff seg

[bits 32]
init_protected_mode: ;now using 32 bit instructions
  mov ax, DATA_SEG ;update segment registers
  mov ds, ax
  mov ss, ax
  mov es, ax
  mov fs, ax
  mov gs, ax

  mov ebp, 0x90000 ;update stack at top of the free space
  mov esp, ebp

  call BEGIN_PROTECTED_MODE
