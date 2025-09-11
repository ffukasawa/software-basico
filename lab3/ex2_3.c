#include <stdio.h>

int odd_ones(unsigned int x) {
  int resultado = 0;  //vai armazenar a paridade dos bits 1

    while (x) {
        resultado ^= (x & 1); //ou exclusivo com o último bit de x
        x >>= 1;           //desloca x para a direita
    }
    return resultado; //0 = par, 1 = ímpar
}
int main() {
  printf("%x tem numero %s de bits\n",0x01010101,odd_ones(0x01010101) ? "impar":"par");
  printf("%x tem numero %s de bits\n",0x01030101,odd_ones(0x01030101) ? "impar":"par");
  return 0;
}