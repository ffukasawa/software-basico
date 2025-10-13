/*
Escreva em C um programa que imprima os quadrados dos números de 1 a 10. 
Para calcular o quadrado de um valor, você pode multiplicá-lo por si mesmo.

Esse programa não deve utilizar um array de inteiros global! 
Utilize uma variável (local) inteira para obter os valores de 1 a 10.
*/
#include <stdio.h>

int main (void) {
  int i = 1;
  while(i < 11){
    printf("%d\n", (i*i));
    i++;
  }
  return 0;
}