#include <stdio.h>
#include "header.h"

//extern int a;

int fun1(int i, float f){
    return fun2(f,i) + a;
}
//i e f nao ocupam espaco pois nao foram inicializados, ou seja , nao sao simbolos. ocupariam espaco quando executasse a main por exemplo mas continuam nao sendo simbolos