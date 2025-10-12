#include <stdio.h>

void dump (void *p, int n) {
  unsigned char *p1 = p;
  while (n--) {//percorre todos os bytes
    printf("%p - %02x\n", p1, *p1); // mostra o endereco de memoria e o conteudo do byte em hexadecimal e 2 digitos
    p1++;
  }
}

int main (void) {
 // como estamos em little endian o endereco inicial tem a parte menos significativa. logo, ele printa "de tras para frente"
  char c = 150;
  short s = -3;
  int i = -151;
  printf("dump de c: \n");
  dump(&c, sizeof(c));// como c e signed ele so vai de -128 a 127 (se fosse unsigned iria de 0 a 255), ou seja, ha 256 possibilidades de numero. Para encaixar o 150 -> 150 - 256 = -106
  // entao o numero guardado e -106. 106 = 0x6a(0110 1010) ->  -106 = 1001 0101 + 1 (inverte bit por bit e adiciona 1) = 1001 0110 (0x96)
  printf("dump de s: \n");
  dump(&s, sizeof(s));// como e 3 (0000 0000 0000 0011) negativo -> inverte todo bit a adiciona 1 no fim (1111 1111 1111 1100 + 1) = (1111 1111 1111 1101 = ff fd)
  printf("dump de i: \n");
  dump(&i, sizeof(i));// 151 = 0x96(0000 0000 0000 0000 0000 0000 1001 0111) -> -151 = (1111 1111 1111 1111 1111 1111 0110 1000 + 1) = (1111 1111 1111 1111 1111 1111 0110 1001 = ff ff ff 69)
  return 0;
}