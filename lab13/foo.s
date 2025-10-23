/*
int foo (int x) {
  return x+1;
}
PROVAAAAAAAAAAAAAA
*/
.data


.text
.globl foo
foo:
    pushq %rbp
    movq %rsp, %rbp

    movl %edi, %eax
    incl %eax

    leave 
    ret