LIST p=16F887
include <P16F887.inc>
 
 __CONFIG _CONFIG1,0XE032
 __CONFIG _CONFIG2,0XF3FF
;-----------------

;------PORT CONFIG----
	org 0
	
	BSF STATUS, RP0
	BSF TRISD, 3 ;Declarandp el pin 3 como entrada DEL PUERTO D	BSF PONER PIN EN 1
	BCF STATUS, RP0	;Entrando al banco 0
    
	banksel TRISC
	clrf TRISC
	banksel PORTC
    clrf PORTC

MAIN
	BTFSS PORTD, 3 ;si el pin 3 del puerto D esta en 1
	GOTO Apagar
	MOVLW b'11111111' ;PRENDEMOS EL LED
	MOVWF PORTC	

	GOTO MAIN

Apagar
	MOVLW b'000000' ;APAGAMOS EL MAIN
	MOVWF PORTC
	GOTO MAIN
	RETURN

	END