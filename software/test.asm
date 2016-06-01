
;- test.asm
;
;; Programa para prueba del compilador de jaguaOs
;


org 010							; Define espacio de pila

define primera "Primera Variable"		; Define la variable "primera"

define segunda "Segunda Variable"




mov RA, 2						; Clear Screen Function
int

jump rutina

mov DR, offset primera
mov RA, 1
int 							; Llama la interrupción

end


:rutina
mov DR, offset segunda			; Carga posicion inicial de  "segunda"
mov RA, 1

int 							; Llama la interrupción

end 							; End Program

