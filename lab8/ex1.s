/*
 #include <stdlib.h>
  int main() {
    system("ls -ls");
    return 0;
  }
*/

.data
  s1: .string "ls -ls"

  .text
  .globl main
  main:
  /* prologo */
    pushq %rbp
    movq  %rsp, %rbp

  movq $s1, %rdi     # endereço da string "ls -ls" vai no %rdi
  call system        # chama a função system

  movl $0, %eax

  /* finalizacao */
    leave
    ret