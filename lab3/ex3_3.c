#include <stdio.h>

unsigned char switch_byte(unsigned char x) {
    unsigned char alto = (x & 0xF0) >> 4; //pega os 4 bits altos e desloca para direita
    unsigned char baixo  = (x & 0x0F) << 4; //ppega os 4 bits baixos e desloca para esquerda
    return baixo | alto; // junta os dois
}

unsigned char rotate_left(unsigned char x, int n) {
    unsigned char preenchidos = (x << n); //pega os bits deslocados que se manteram
    unsigned char removidos =(x >> (8 - n));//pega os bits que foram removidos no deslocamento
    return preenchidos | removidos ;//junta os dois
}

int main() {
    unsigned char x = 0xAB;
    printf("switch_byte(0x%X) = 0x%X\n", x, switch_byte(x));


    x = 0x61;
    printf("rotate_left(0x%X, 1) = 0x%X\n", x, rotate_left(x, 1));
    printf("rotate_left(0x%X, 2) = 0x%X\n", x, rotate_left(x, 2));
    printf("rotate_left(0x%X, 7) = 0x%X\n", x, rotate_left(x, 7));
    return 0;
}