#include <stdio.h>
#include "header.h"

extern int a;//nao e necessaria pois foi definida no header.h
int a = 0;// o a por ser uma variavel global, ocupa espaco antes da execucao do programa, ou seja , um simbolo. assim como a fun2.

float fun2(float a , int b) {return a + b;}

int main (void){
    int i = 1; //i e f como estao dentro de uma funcao, ainda nao ocupam espaco antes da execucao do programa. Logo , nao sao simbolos
    float f = 3.14;
    static int j = 4; //é um simbolo local pois é uma variável glbal mas apenas dentro da main

    i = fun1(i,f);
    printf("%d\n", i);
    return 0;
}