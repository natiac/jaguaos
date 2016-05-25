
;- test.asm
;
;; Programa para prueba del compilador de jaguaOs
;


org 000							; Define espacio de pila

define primera "Hola"		; Define la variable "string"

define segunda "test"

mov DR, offset primera			; Carga posicion inicial de la variable "string"
mov RA, 01						; Define llamar funcion "01" de la interrupción

int 							; Llama la interrupcion

mov DR, offset segunda
mov RA, 01

int 							; Llama la interrupción

