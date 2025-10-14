.data
nums: .int 3, -5, 7, 8, -2
s1:   .string "%d\n"

.text
.globl main
main:
    # --- prólogo ---
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp
    movq %rbx, -8(%rbp)
    movq %r12, -16(%rbp)

    # --- inicializações ---
    movq $nums, %r12      # p = nums
    movl $0, %ebx         # i = 0

L1:                       # início do loop
    cmpl $5, %ebx         # if (i == 5)
    je L2                 # sai do loop se i == 5

    # --- chamada filtro(*p, LIM) ---
    movl (%r12), %edi     # 1º parâmetro = *p
    movl $1, %esi         # 2º parâmetro = LIM
    call filtro           # chama filtro(x, lim)

    # --- chamada printf("%d\n", resultado) ---
    movq $s1, %rdi        # 1º parâmetro = string "%d\n"
    movl %eax, %esi       # 2º parâmetro = valor retornado
    movl $0, %eax         # (printf exige eax = 0)
    call printf

    # --- incremento ---
    addl $1, %ebx         # i++
    addq $4, %r12         # p++
    jmp L1                # volta ao início do loop

L2:
    # --- finalização ---
    movl $0, %eax         # return 0
    movq -8(%rbp), %rbx
    movq -16(%rbp), %r12
    leave
    ret
