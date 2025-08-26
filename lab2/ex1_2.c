#include <stdio.h>

void dump (void *p, int n) {
  unsigned char *p1 = p;
  while (n--) {
    printf("%p - %02x\n", p1, *p1);
    p1++;
  }
}

/*int main (void) {
  int i = 1000;
  long j = 20000;
  short k = 12;
  char l = 'a';
  char m = 97;

  printf("INICIO: \n");
  dump(&i, sizeof(i));

  printf("INICIO: \n");
  dump(&j, sizeof(j));

  printf("INICIO: \n");
  dump(&k, sizeof(k));

  printf("INICIO: \n");
  dump(&l, sizeof(l));

  printf("INICIO: \n");
  dump(&m, sizeof(m));
  return 0;
}*/

int main (void) {
  char p[] = "$";
  dump(p, sizeof(p));
  return 0;
}
