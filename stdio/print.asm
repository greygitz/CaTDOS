print:
    pusha
	jmp print_start ; no, this isn't needed... it's just easier to read

; keep this in mind:
; while (string[i] != 0) { print string[i]; i++ }

print_start:
    mov al, [bx] ; 'bx' is the base address for the string
	
    cmp al, 0 ; is AL 0?
    je exit   ; if AL is 0, stop looping

    ; the part where we print with the BIOS help
    mov ah, 0x0e
    int 0x10 ; 'al' already contains the char

    ; increment pointer and do next loop
    add bx, 1
    jmp print_start

exit:
    popa
    ret



newline:
    pusha
    
    mov ah, 0x0e
    mov al, 0x0a ; newline char
    int 0x10
    mov al, 0x0d ; carriage return
    int 0x10
    
    popa
    ret
