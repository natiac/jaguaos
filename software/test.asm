
;- test.asm
;
;; Programa para prueba del compilador de jaguaOs
;



define primera "Primera Variable"		; Define la variable "primera"

define segunda "Segunda Variable"



: rutina
mov DR, offset segunda			; Carga posicion inicial de  "segunda"
mov RA, 1

int 							; Llama la interrupción

end 							; End Program

ret




; Code

org 010							; Define espacio de pila

mov RA, 2						; Clear Screen Function
int

jump rutina

mov DR, offset primera
mov RA, 1
int 							; Llama la interrupción

end
