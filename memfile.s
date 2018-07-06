INICIA					
	AND	R5, R5, 0      	; Zera registrador             
	AND	R7, R7, 0    	;             
	AND	R0, R0, 0    	;              
	AND	R4, R4, 0    	;               	  		
        
	ADD 	R5, R5, #2    	; R5 recebe Numero base da PG (2)           	
	ADD 	R7, R7, R5    	; Valor da PG deve ser adicionado no registrador da dupla              			
        
	ADD 	R0, R0, #200
	ADD 	R0, R0, #200
	ADD 	R0, R0, #200
	ADD 	R0, R0, #100    ; X=7 (posicao base da memoria = X*100)
	
	ADD	R4, R4, #1	; Inicia contador
	STR	R7, [R0]	; Salva o primeiro valor da PG

LOOP
	TST	R7, #2147483648	; Verifica se o valor da PG é maior que 2^31
	BNE	FIM		; Se for, finaliza o codigo
    	LSL 	R7, R7, #1  	; Senão, multiplica por 2		     					
	ADD 	R4, R4, #1	; Incrementa o contador     	         
	ADD 	R0, R0, #4    	; Incrementa endereco de memoria
	STR	R7, [R0]	; Salva valor na memoria
	CMP	R4, #10		; Verifica se fez 10 interacoes
	BEQ	FIM		; Caso tenha feito, finaliza o codigo
	B 	LOOP		; Caso contrario, reinicia o loop								  
FIM
