;ESTE ES EL INDIRECTO
section .data
    caracter db 64
    result db 0 ;agrega el valor 0 a result
    msg db 'Resultado: ', 0 ;cadena de texto guardada en msg

section .bss
    buffer resb 4 ;reserva 4 bytes de memoria

section .text
    global _start

_start:

    mov al, [caracter]
    movzx eax, al ; carga el valor result en eax y rellena con 0
    mov [buffer], al ; Almacenar el carácter ASCII en el buffer

    mov eax, 4 
    mov ebx, 1
    mov ecx, msg ;manda la cadena de texto que se va a imprimir en pantalla
    mov edx, 11
    int 0x80 ;imprimir en pantalla


    mov eax, 4
    mov ebx, 1
    mov ecx, buffer ;manda la informacion del buffer para imprimir
    mov edx, 1
    int 0x80 ;imprimir en pantalla

    mov eax, 1
    xor ebx, ebx
    int 0x80