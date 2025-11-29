section .data
    msg db "Resultado: ", 0
    len equ $ - msg

    error_msg db "Error: Division por cero", 0
    len_error equ $ - error_msg

    newline db 10, 0
    lenNL equ $ - newline

section .bss
    resultado resb 1

section .text
    global _start

_start:
    ; ============================
    ; Números hardcoded
    ; ============================
    mov al, '8'       ; primer número (ASCII)
    sub al, '0'       ; convertir a entero (8)

    mov bl, '0'       ; segundo número (ASCII)
    sub bl, '0'       ; convertir a entero (0)

    cmp bl, 0         
    je division_por_cero 

    ; ============================
    ; División AL / BL 
    ; ============================
    xor ah, ah        ; limpiar AH para div
    div bl            ; resultado en AL

    ; ============================
    ; Convertir resultado a ASCII
    ; ============================
    add al, '0'
    mov [resultado], al

    ; ============================
    ; Imprimir "Resultado: "
    ; ============================
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, len
    int 0x80

    ; ============================
    ; Imprimir el resultado
    ; ============================
    mov eax, 4
    mov ebx, 1
    mov ecx, resultado
    mov edx, 1
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80
    
division_por_cero:
    mov eax, 4
    mov ebx, 1
    mov ecx, error_msg
    mov edx, len_error
    int 0x80



