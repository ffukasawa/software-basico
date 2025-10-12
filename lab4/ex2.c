#include <stdio.h>

void dump (void *p, int n) {
  unsigned char *p1 = p;
  while (n--) {
    printf("%p - %02x\n", p1, *p1);
    p1++;
  }
}

int main (void) {
  short l = -32765;// 32765 = (0x7ffd) 0111 1111 1111 1101 -> -32765 = 1000 0000 0000 0010 + 1 = 1000 0000 0000 0011 (80 03)
  unsigned short k = 32771;//32771 = (0X8003) 1000 0000 0000 0011 
  printf("l=%d, k=%u \n", l, k);
  printf("dump de l: \n");
  dump(&l, sizeof(l));
  printf("dump de k: \n");
  dump(&k, sizeof(k));
  return 0;
}