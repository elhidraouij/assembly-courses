SYS_WRITE equ 4
SYS_READ  equ 3
STD_OUT   equ 1
STD_IN    equ 0

section .data
  hi_msg db 'Welcome, please enter your name: '
  len_hi_msg equ $ - hi_msg

section .bss
  answer resb 10

section .text
  global _start

_start:
  mov eax, SYS_WRITE
  mov ebx, STD_OUT
  mov ecx, hi_msg
  mov edx, len_hi_msg
  int 0x80

  mov eax, SYS_READ
  mov ebx, STD_IN
  mov ecx, answer
  mov edx, 10
  int 0x80

  mov eax, SYS_WRITE
  mov ebx, STD_OUT
  mov ecx, answer
  mov edx, 10
  int 0x80

  mov eax, 1
  int 0x80

