LIST p=16F887
include <P16F887.inc>

 __CONFIG _CONFIG1,0XE032
 __CONFIG _CONFIG2,0XF3FF

	cblock 0x20
	d1
	d2
	d3

	endc ;USEFUL "VARIABLES"
	org 0x00;;
	banksel ANSEL
	clrf ANSEL
	banksel ANSELH
	clrf ANSELH

;-----------------

;------PORT CONFIG----
	banksel TRISC
	clrf TRISC
	banksel PORTC
    clrf PORTC
MAIN
    call funcion0
    GOTO MAIN
    
funcion0
	movlw b'11111111' ;oxof
	movwf PORTC
	call Retardo_1s
	clrf PORTC
    call Retardo_1s
	return
Retardo_1s
	
	movlw 0x2D
	movwf d1
	movlw 0xE7
	movwf d2
	movlw 0x0B
	movwf d3

retardo_1s_0
	
	decfsz d1,f
	goto $+2
	decfsz d2,f
	goto $+2
	decfsz d3,f
	goto retardo_1s_0
	return

	END