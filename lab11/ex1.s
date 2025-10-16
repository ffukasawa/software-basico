/* 
int novonum(void) {
  int minhalocal;
  printf("numero: ");
  scanf("%d",&minhalocal);
  return minhalocal;
}
*/
.data
Sf: .string "numero: "
Sf1: .string "%d"

.text
.globl novonum
novonum:
pushq %rbp
movq %rsp, %rbp
subq $16, %rsp

movq $Sf, %rdi
movl $0, %eax #regra p chamar printf
call printf

movq $Sf1, %rdi
leaq -4(%rbp), %rsi
call scanf #retorna em %eax

movl -4(%rbp), %eax
leave
ret
