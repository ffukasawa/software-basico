/*
#include <stdio.h>

int nums[4] = {65, -105, 111, 34};

int main (void) {
  int i;
  int s = 0;

  for (i=0;i<4;i++)
    s = s+nums[i];

  printf ("soma = %d\n", s);

  return 0;
}
DICA -> &nums[i] = &nums + i * sizeof(int) = &nums + i * 4
*/
/*Dicionario
Registrador     Variavel
%ebx            i 
%r12d           s
%r13d           i * 4
%rcx            &nums + i * 4
*/

.data
nums: .int 65, -105, 111, 34
Sf:   .string "soma = %d\n"

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

movl $0, %ebx       # int i = 0;
movl $0, %r12d      # int s = 0;

L1:
cmp $4, %ebx
jge L2

movl %ebx, %r13d        # para nao modificar %ebx
imull $4, %r13d         # i * 4
movslq %r13d, %r13      # extende para 64bits para add no %rcx
movq $nums, %rcx        # %rcx = &nums
addq %r13, %rcx         # %rcx += %r13d (i*4)
addl  (%rcx), %r12d     # s = s+nums[i];

addl $1, %ebx
jmp L1

L2:
movl %r12d, %eax
/*************************************************************/
/* este trecho imprime o valor de %eax (estraga %eax)  */
  movq    $Sf, %rdi    /* primeiro parametro (ponteiro)*/
  movl    %eax, %esi   /* segundo parametro  (inteiro) */
  movl  $0, %eax
  call  printf       /* chama a funcao da biblioteca */
/*************************************************************/
/***************************************************************/
/* mantenha este trecho aqui e nao mexa - finalizacao!!!!      */
  movq  $0, %rax  /* rax = 0  (valor de retorno) */
  movq    -16(%rbp), %r12 /* recupera r12 */
  movq    -8(%rbp), %rbx  /* recupera rbx */
  leave
  ret      
/***************************************************************/