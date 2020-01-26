[bits 32] ;32 bit protected mode

;constants
VIDEO_MEMORY equ 0xb8000
WHITE_ON_BLACK equ 0x0f ;color byte for each char

print_str_pm:
  pusha
  mov edx, VIDEO_MEMORY

print_str_pm_loop:
  mov al, [ebx] ;ebx is the address of our char
  mov ah, WHITE_ON_BLACK

  cmp al, 0 ;if end of str
  je print_str_pm_done

  mov [edx], ax ;store char + attr in video memory
  add ebx, 1 ;next char
  add edx, 2 ;next video memory position

  jmp print_str_pm_loop

print_str_pm_done:
  popa
  ret ;pop return address from stack and jump to address
