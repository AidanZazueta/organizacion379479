section .data
    msg_ok db "Operacion completada sin errores.", 10, 0
    msg_err db "Se lanzo una excepcion", 10, 0
    msg_fin db "Fin del programa.", 10, 0

section .text
    global _start

_start:
    call funcion_peligrosa
    jmp try_end

try_catch:
    call print_string
    mov rdi, msg_err
    call print_string
    mov rdi, msg_fin
    call print_string
    jmp fin_programa

try_end:
    mov rdi, msg_ok
    call print_string
    mov rdi, msg_fin
    call print_string
    jmp fin_programa

funcion_peligrosa:
    mov rax, 1
    cmp rax, 1
    je lanzar_excepcion
    ret

lanzar_excepcion:
    jmp _catch_block

_catch_block:
    jmp try_catch

print_string:
    mov rsi, rdi
    call d_print
    ret

d_print:
    mov byte [rsi + rdx], 0
    mov rax, 1
    mov rdi, 1
    mov rdx, 100
    syscall
    ret

fin_programa:
    mov rax, 60
    xor rdi, rdi
    syscall
