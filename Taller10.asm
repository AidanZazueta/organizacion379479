section .data
    char db 0
    newline db 10

section .text
    global _start

_start:
    ; Sumar dos números distintos
    mov al, 10000010b     ; AL = 130
    ; Parte A = 01000001
    ; Rotar a la derecha (ROR)
    ROR al, 1

    ; Guardar en char
    mov [char], al

    ; Escribir carácter en consola
    mov eax, 4            ; syscall write
    mov ebx, 1            ; stdout
    mov ecx, char
    mov edx, 1
    int 0x80

    ; Salto de línea
    mov eax, 4            ; syscall write
    mov ebx, 1            ; stdout
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Salir
    mov eax, 1            ; syscall exit
    mov ebx, 0            ; código de salida
    int 0x80

