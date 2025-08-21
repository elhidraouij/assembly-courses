SYS_EXIT  equ 1
SYS_WRITE equ 4
SYS_READ  equ 3
STD_OUT   equ 1
STD_IN    equ 0

section .data
  first_number  db 'Enter a number: '
  len_first_number equ $ - first_number
  second_number db 'Enter another number: '
  len_second_number equ $ - second_number

section .bss
  a resb 2
  b resb 2

section .text
  global _start

_start:
  mov eax, SYS_WRITE
  mov ebx, STD_OUT
  mov ecx, first_number
  mov edx, len_first_number
  int 0x80

  mov eax, SYS_READ
  mov ebx, STD_IN
  mov ecx, a
  mov edx, 2
  int 0x80

  mov eax, SYS_WRITE
  mov ebx, STD_OUT
  mov ecx, second_number
  mov edx, len_second_number
  int 0x80

  mov eax, SYS_READ
  mov ebx, STD_IN
  mov ecx, b
  mov edx, 2
  int 0x80

  mov eax, [a]
  sub eax, '0'
  mov ebx, [b]
  sub ebx, '0'

  add eax, ebx
  inc eax

  mov [a], eax
  add byte [a], 48

  mov eax, SYS_WRITE
  mov ebx, STD_OUT
  mov ecx, a 
  mov edx, 2
  int 0x80

  mov eax, SYS_EXIT
  int 0x80

