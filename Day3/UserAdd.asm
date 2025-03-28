.model small
.stack 100h
.data
	msg1 db "Enter the number1 : $"
	msg2 db "Enter the number2 : $"
	msg3 db "total : $"
	n1 db 0
	n2 db 0
	
.code
start:
	mov ax,@data
	mov ds,ax
	
	mov dx,offset msg1 
	mov ah,09h	;09h string function
	int 21h
	
	mov ah,01h	;3	al=48+3=51			ah is part of al register
	int 21h
	mov dl,al 	;al-51 dl=51
	sub dl,48 	;dl=51-48
	mov n1,dl 	;nl=3
	
	mov dl,0ah 	;next line
	mov ah,02h 	;Enter
	int 21h
	
	mov dx,offset msg2
	mov ah,09h
	int 21h
	
	mov ah,01h 	;2
	int 21h		;2
	mov dl,al	;dl=50 al=50
	sub dl,48 	;dl-48=2
	mov n2,dl     ;n2=2
	
	mov dl,0ah 
	mov ah,02h
	int 21h
	
	
	mov dx,offset msg3 
	mov ah,09h
	int 21h
	
	mov dl, n1 ;dl=3
	add dl, n2 ;dl=dl+n2=5
	add dl, 48 ;dl=5+48=53
		
		
	mov ah,02h
	int 21h	
   
	mov ax,4c00h
	int 21h
	
end start	
