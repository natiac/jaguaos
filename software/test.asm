
;- test.asm
;
;; Programa para prueba del compilador de jaguaOs
;


org 100							; Define espacio de pila

define string "Hola Mundo"		; Define la variable "string"

define otra "test"

mov DR, offset string			; Carga posicion inicial de la variable "string"
mov AR, 01						; Define llamar funcion "01" de la interrupción

int 							; Llama la interrupcion

mov DR, offset otra
mov AR, 01

int 							; Llama la interrupción

