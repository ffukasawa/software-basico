/* programa 1*/
/*
#include <stdio.h>

int main (void) {
  int x = 0xffffffff; // int e signed e bit mais significativo 1 entao x=-1
  int y = 2;
  printf("x=%d, y=%d\n", x, y);
  printf("x é menor do que y? %s\n", (x<y)?"sim":"nao"); // x e menor que y nesse caso
  return 0;
} */

/* programa 2*/
/*
#include <stdio.h>

int main (void) {
  unsigned int x = 0xffffffff; // agora e unsigned entao representa o maior valor possivel de um inteiro
  unsigned int y = 2;
  printf("x=%d, y=%d\n", x, y); // %d interpreta como inteiro e por isso printa -1 para x
  printf("x é menor do que y? %s\n", (x<y)?"sim":"nao"); // x nao e menor que y nesse caso
  return 0;
}
*/

/* programa 3*/
/*
#include <stdio.h>

int main (void) {
  int x = 0xffffffff;
  unsigned int y = 2;
  printf("x=%d, y=%d\n", x, y);
  printf("x é menor do que y? %s\n", (x<y)?"sim":"nao"); // se um dos operandos for unsigned o outro vira unsigned tambem
  return 0;
}
*/
