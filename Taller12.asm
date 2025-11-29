section .data
  struct db "1/2/3", 0
  msg db "La suma es: ", 0
  newline db 10, 10

section .bss
  buffer resb 1
  
section .text
  global _start
  
%macro ADD_DIGIT 1
  mov al, [%1]
  sub al, '0'
  add bl, al
%endmacro

_start:
  xor bl, bl
  
  ADD_DIGIT struct
  ADD_DIGIT struct+2
  ADD_DIGIT struct+4
  
  add bl, '0'
  mov [buffer], bl
  
  mov eax, 4
  mov ebx, 1
  mov ecx, msg
  mov edx, 12
  int 0x80
  
  mov eax, 4
  mov ebx, 1
  mov ecx, buffer
  mov edx, 1
  int 0x80
  
  mov eax, 4
  mov ebx, 1
  mov ecx, newline
  mov edx, 1
  int 0x80
  
  mov eax, 4
  xor ebx, ebx
  int 0x80