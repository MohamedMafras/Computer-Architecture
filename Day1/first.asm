 .model small  ; specifies the memory model as small, 
              ; meaning that both code and  
			  ; data segments are limited to 64KB each.


.stack 100h  ;This tells the assembler  to define a stack segment.
              ;This sets the stack size to 256 bytes 
 
 .data   ;Defines the data segment where variables and constants are stored.
  msg db "Hello $"     

.code   ;Defines the code segment where the actual instructions are written.

start:  ;This is the entry point

  mov ax,@data   ; Loads the address of the data segment into the ax register
  
  mov ds,ax      ;Moves the value in ax into ds (Data Segment Register) 
                 ;so that we can access variables in the data segment.
  
  mov dx, offset msg  ;Loads the offset(address) of the msg string 
                      ;into the dx register.
					  
  mov ah, 09h ; Loads function 09h into ah, which is the DOS interrupt
                 ;for printing a string.
			 
  int 21h ;Calls DOS interrupt 21h, which executes function 09h,
          ;printing the string stored in msg.
		  
  
  mov ax,4c00h  ;Loads function 4Ch (Terminate Program) into ax. 
                ;00h in AL indicates a successful exit.
				
  int 21h   ;Calls DOS interrupt 21h, 
            ;which terminates the program and 
			;returns control to the operating system.
  
end start