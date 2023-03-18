LIST p=16F887
include <P16F887.inc>
 
	__CONFIG _CONFIG1,0XE032
 	__CONFIG _CONFIG2,0XF3FF

;-----------------

;------PORT CONFIG----
	org 0x00;
	banksel TRISC
	clrf TRISC
	banksel PORTC
    clrf PORTC

MAIN
	call funcionE

funcionE
	movlw b'00000001' ;oxof
	movwf PORTC
	
	END