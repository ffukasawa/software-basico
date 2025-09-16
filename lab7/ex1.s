/* 
#include <stdio.h>

char S2[] = {65, 108, 111, 32, 123, 103, 97, 108, 101, 114, 97, 125, 33, 0};

int main (void) {
  char *pc = S2;
  while (*pc)
    printf ("%c", *pc++);
  printf("\n");
  return 0;
} 
*/
/*
Dicionário
Registrador Variável
rbx         pc
eax         temp
*/

.data  # segmento de dados
# char S2[] = {65, 108, 111, 32, 123, 103, 97, 108, 101, 114, 97, 125, 33, 0};
S2: .byte 65, 108, 111, 32, 123, 103, 97, 108, 101, 114, 97, 125, 33, 0

.text #segmento de texto
#int main (void) {
.globl main #main é um simbolo global (toda funcao é global)
main:

/********************************************************/
/* mantenha este trecho aqui e nao mexa - prologo !!!   */
  pushq   %rbp
  movq    %rsp, %rbp
  subq    $16, %rsp
  movq    %rbx, -8(%rbp)  /* guarda rbx */
  movq    %r12, -16(%rbp)  /* guarda r12 */
/********************************************************/

#   char *pc = S2; <== dividindo essa linha
#   char *pc; ponteiro tem 8 bytes (movq)
#   pc = S2;
movq     $S2, %rbx

#  while (*pc)
# while(*pc != 0)
LOOP_WHILE:
    cmpb    $0, (%rbx)
    je FORA_WHILE



#   printf ("%c", *pc++); <== simplificando
# *pc++ incrementa o conteudo de pc. (*pc)++ incrementa o conteudo da memoria apontada pelo pc
#   temp = *pc; expandir um cara de 1byte(*pc - aponta para um char) para um cara de 4bytes
    movsbl      (%rbx), %eax     #mov vom sinal(s) de 1byte(b) para 4bytes(l)

#   printf("%c", temp);
/*************************************************************/
/* este trecho imprime o valor de %eax (estraga %eax)  */
  movq    $Sf, %rdi    /* primeiro parametro (ponteiro)*/
  movl    %eax, %esi   /* segundo parametro  (inteiro) */
  movl  $0, %eax
  call  printf       /* chama a funcao da biblioteca */
/*************************************************************

#   pc++;
    incq    %rbx
    jmp     LOOP_WHILE

FORA_WHILE:
# printf("\n");
/*************************************************************/
/* este trecho imprime o \n (estraga %eax)                  */
  movq    $Sf2, %rdi    /* primeiro parametro (ponteiro)*/
  movl  $0, %eax
  call  printf       /* chama a funcao da biblioteca */
/*************************************************************/
#     return 0;
#} 
/***************************************************************/
/* mantenha este trecho aqui e nao mexa - finalizacao!!!!      */
  movq  $0, %rax  /* rax = 0  (valor de retorno) */
  movq    -16(%rbp), %r12 /* recupera r12 */
  movq    -8(%rbp), %rbx  /* recupera rbx */
  leave
  ret      
/***************************************************************/
