[org 0x7c00] ; the boot sector is stored at 0x7C00. I don't like writing offsets

mov bx, loading
call print
call newline

mov al, 0x02
int 0x13


%include "stdio\print.asm"

loading:
    db 'Booting CaTDOS, please hold...', 0
	
	
	
; fill with 510 zeros minus the size of the previous code
times 510-($-$$) db 0
; magic number (it WON'T boot without this)
dw 0xaa55 

