; Hello World - Escreve mensagem armazenada na memoria na tela


; ------- TABELA DE CORES -------
; adicione ao caracter para Selecionar a cor correspondente

; 0 branco							0000 0000
; 256 marrom						0001 0000
; 512 verde							0010 0000
; 768 oliva							0011 0000
; 1024 azul marinho					0100 0000
; 1280 roxo							0101 0000
; 1536 teal							0110 0000
; 1792 prata						0111 0000
; 2048 cinza						1000 0000
; 2304 vermelho						1001 0000
; 2560 lima							1010 0000
; 2816 amarelo						1011 0000
; 3072 azul							1100 0000
; 3328 rosa							1101 0000
; 3584 aqua							1110 0000
; 3840 branco						1111 0000



jmp main

cores : var #13
static cores + #0, #2304    ; vermelho
static cores + #1, #256     ; marrom
static cores + #2, #2816    ; amarelo
static cores + #3, #512     ; verde

static cores + #4, #768    ; oliva
static cores + #5, #2560    ; lima
static cores + #6, #3584    ; aqua
static cores + #7, #1536    ; teal
static cores + #8, #1024    ; azul marinho
static cores + #9, #3072    ; azul
static cores + #10, #1280  	; roxo
static cores + #11, #3328   ; rosa
static cores + #12, #2304   ; vermelho


mensagem : string "XUPA FEDERAL"

;---- Inicio do Programa Principal -----

main:
	loadn r0, #532		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #mensagem	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #cores	; Seleciona a COR da Mensagem
	
	call Imprimestr   ;  r0 = Posicao da tela que o primeiro caractere da mensagem sera' impresso;  r1 = endereco onde comeca a mensagem; r2 = cor da mensagem.   Obs: a mensagem sera' impressa ate' encontrar "/0"

	halt
	
;---- Fim do Programa Principal -----

;---- Inicio das Subrotinas -----
	
Imprimestr:	;  Rotina de Impresao de Mensagens:    r0 = Posicao da tela que o primeiro caractere da mensagem sera' impresso;  r1 = endereco onde comeca a mensagem; r2 = cor da mensagem.   Obs: a mensagem sera' impressa ate' encontrar "/0"
	push r0	; protege o r0 na pilha para preservar seu valor
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	push r5
	
	loadn r3, #'\0'	; Criterio de parada

ImprimestrLoop:	
	loadi r4, r1
	loadi r5, r2
	cmp r4, r3
	jeq ImprimestrSai
	add r4, r5, r4
	outchar r4, r0
	inc r0
	inc r1
	inc r2
	jmp ImprimestrLoop
	
ImprimestrSai:	
	pop r5	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts
