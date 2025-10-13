/*
#include <stdio.h>

int main (void) {
  int i = 1;
  while(i < 11){
    printf("%d\n", (i*i));
    i++;
  }
  return 0;
}
*/

.data
Sf: .string "%d\n"

.text
.globl main
main:
/********************************************************/
/* mantenha este trecho aqui e nao mexa - prologo !!!   */
  pushq   %rbp
  movq    %rsp, %rbp
  subq    $16, %rsp
  movq    %rbx, -8(%rbp)  /* guarda rbx */
  movq    %r12, -16(%rbp)  /* guarda r12 */
/********************************************************/
movl $1, %ebx      # int i = 1;

L1:
  cmp $11, %ebx        # while(i < 11)
  jge L2               # sai do loop se i >= 11

  movl %ebx, %eax      # move para eax para printar e nao alterar ebx
  imull %eax, %eax     # eax = i*i
/*************************************************************/
/* este trecho imprime o valor de %eax (estraga %eax)  */
  movq    $Sf, %rdi    /* primeiro parametro (ponteiro)*/
  movl    %eax, %esi   /* segundo parametro  (inteiro) */
  movl  $0, %eax
  call  printf       /* chama a funcao da biblioteca */
/*************************************************************/

addl $1, %ebx
jmp L1

L2:
/***************************************************************/
/* mantenha este trecho aqui e nao mexa - finalizacao!!!!      */
  movq  $0, %rax  /* rax = 0  (valor de retorno) */
  movq    -16(%rbp), %r12 /* recupera r12 */
  movq    -8(%rbp), %rbx  /* recupera rbx */
  leave
  ret      
/***************************************************************/