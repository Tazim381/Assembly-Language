include 'emu8086.inc'
org 100h
.model samll
.data
arr db 5 dup(?)

.code

main proc
    mov ax,@data
    mov ds,ax
    
    print "Enter 5 number: "
    
    mov cx,5
    mov bx,offset arr
    mov ah,1
    
    inputs:
    int 21h
    mov [bx],al
    inc bx
    loop inputs
    
    mov cx,5
    dec cx
    
    outerloop:
    mov bx,cx
    mov si,0
    
    comploop:
    mov al,arr[si]
    mov dl,arr[si+1]
    cmp al,dl
    
    jc noswap
    
    mov arr[si],dl
    mov arr[si+1],al
    
    
    noswap:
    inc si 
    dec bx
    jnz comploop
    
    
    loop outerloop
    
    ;new line
    
    mov ah,2
    mov dl,10
    int 21h
    
    mov dl,13
    int 21h
    
    print "After sorting array: "  
    
    mov cx,5
    mov bx,offset arr
    
    ;display element
    
    output:
    
    mov dl,[bx]
    mov ah,2
    int 21h
    
    mov dl,32
    mov ah,2
    int 21h
    
    inc bx
    loop output   
    
    
     MOV AH, 2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H 
                              
                              
    print "Minimum value is: "  
    
    mov dl,arr[0]
    mov ah,2
    int 21h     
              
    MOV AH, 2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H 
              
    print "Maximum value is: "   
    mov dl,arr[4]
    mov ah,2
    int 21h
    
    
    
                
main endp
    