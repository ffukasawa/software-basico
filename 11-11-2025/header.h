//variaveis externas
extern int a;
extern int z;// nao tem o simbolo z pois ele nao criou espaco de memoria uma vez que ainda nao foi referenciado

//prototipos
float fun2(float a, int b);
int fun1(int i, float f);
double fun3(float a, double b); // nao da erro pq simplesmente nao foi usada no codigo 
//apenas definir o prototipo, vc nao cria o simbolo. Apenas tras conhecimento