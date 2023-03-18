LIST p=16F887
include <P16F887.inc>
 
;-----------------

;------PORT CONFIG----
	org 0
	
	BSF STATUS, RP0

	BCF TRISC, 6 ;Declaranbdo pin 6 como salida DEL PUERTO C 	BCF = PONER PIN EN 0
	BSF TRISD, 3 ;Declarandp el pin 2 como entrada DEL PUERTO E	BSF PONER PIN EN 1

	BCF STATUS, RP0	;Entrando al banco 0
    ;banksel PORTE
    ;MOVLW 0xFF ;b'11111111'
	;MOVWF PORTE

MAIN
	BTFSS PORTD, 3 ;si el pin 0 del puerto E esta en 1
	GOTO Apagar
	BSF PORTC, 6 ;PRENDEMOS EL LED
	GOTO MAIN

Apagar
	BCF PORTC, 6 ;APAGAMOS EL MAIN
	GOTO MAIN


	END