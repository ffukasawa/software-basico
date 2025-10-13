/*
int nums[] = {10, -21, -30, 45};
int main() {
  int i, *p;
  for (i = 0, p = nums; i != 4; i++, p++)
    if ((*p % 2) == 0)
      printf("%d\n", *p);
  return 0;
}
*/

/*
Dicionário
Registrador Variável
%ebx        i
%r12        *p
*/

.data
nums: .int 10, -21, -30, 45
Sf: .string "%d\n"

.text
.globl main
main:
/********************************************************/
/* mantenha este trecho aqui e nao mexa - prologo !!!   */
  pushq   %rbp
  movq    %rsp, %rbp
  subq    $16, %rsp
  movq    %rbx, -8(%rbp)
  movq    %r12, -16(%rbp)
/********************************************************/

movl $0, %ebx
movq $nums, %r12

L1:
cmpl $4, %ebx
je L3

movl (%r12), %eax       # lê o número *p
movl %eax, %edx         # copia para edx (teste)
andl $1, %edx           # testa o bit menos significativo
cmpl $0, %edx           # se resultado == 0 -> par
je   L2                 # se == 0 -> par (jump if equal to L2)

addl $1, %ebx
addq $4, %r12
jmp L1


L2:
/*************************************************************/
/* este trecho imprime o valor de %eax (estraga %eax)  */
  movq    $Sf, %rdi    /* primeiro parametro (ponteiro)*/
  movl    %eax, %esi   /* segundo parametro  (inteiro) */
  call  printf       /* chama a funcao da biblioteca */
/*************************************************************/
addl $1, %ebx              # i++
addq $4, %r12              # p++
jmp L1

L3:
/***************************************************************/
/* mantenha este trecho aqui e nao mexa - finalizacao!!!!      */
  movq  $0, %rax  /* rax = 0  (valor de retorno) */
  movq  -8(%rbp), %rbx
  movq  -16(%rbp), %r12
  leave
  ret      
/***************************************************************/