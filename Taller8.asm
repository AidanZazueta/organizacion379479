_start:
	TEST Ax, Ax
	JS negativo
	CMP Bx, 0
	JS negativo
	CMP Ax, Bx
	JE iguales
	JG mayor_a
	JL mayor_b
Iguales:
	JMP fin
Mayor_a:
	JMP fin
Mayor_b:
	J	MP fin
Negativo:
	JMP fin
Fin