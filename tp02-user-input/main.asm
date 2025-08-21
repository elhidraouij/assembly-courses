section .data
  first_msg db 'Please enter a number: '
  len_first_msg equ $-first_msg
  second_msg db 'You have entered: '
  len_second_msg equ $-second_msg

section .bss
  num resb 5

section .text
  global _start

_start:
  mov eax, 4
  mov ebx, 1
  mov ecx, first_msg
  mov edx, len_first_msg
  int 0x80

  mov eax, 3
  mov ebx, 0
  mov ecx, num
  mov edx, 5
  int 0x80

  mov eax, 4
  mov ebx, 1
  mov ecx, second_msg
  mov edx, len_second_msg
  int 0x80

  mov eax, 4
  mov ebx, 1
  mov ecx, num
  mov edx, 5
  int 0x80

  mov eax, 1
  int 0x80
