section .data
    num1    db 6
    num2    db 4
    result  db 0

section .text
    global _start

_start:
    mov al, [num1]
    cmp al, [num2]
    je correcto

    add al, '0'
    mov [result], al
    jmp print

correcto:
    mov byte [result], '1'

print:
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 1
    int 0x80
