#include <ctype.h>
#include <stdio.h>

/*int string2num (char *s) {
  int a = 0;
  for (; *s; s++)
    a = a*10 + (*s - '0');
  return a;
}

int main (void) {
  printf("==> %d\n", string2num("1234"));
  printf("==> %d\n", string2num("1234") + 1);
  printf("==> %d\n", string2num("1234") + string2num("1"));
  return 0;
}

int string2num (char *s, int base) {
  int a = 0;
  for (; *s; s++)
    a = a*base + (*s - '0');
  return a;
}

int main (void) {
printf("%d\n", string2num("777", 8));
printf("%d\n", string2num("777", 10));
} */

int string2num (char *s, int base) {
    int a = 0, val;
    for (; *s; s++) {
        if (*s >= '0' && *s <= '9') {
            val = *s - '0';           
        } 
        else if (*s >= 'a' && *s <= 'z') {
            val = *s - 'a' + 10;      
        } 
        else {
            break; 
        }
        a = a * base + val;
    }
    return a;
}
 int main(void){
  printf("%d\n", string2num("1a", 16));
  printf("%d\n", string2num("a09b", 16));
  printf("%d\n", string2num("z09b", 36));
 }


