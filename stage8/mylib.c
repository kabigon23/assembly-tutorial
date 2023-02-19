#include <stdlib.h>
#include <time.h>

void inimylib(){
    srand(time(NULL));
}

int get_number(){
    int a;
    a = rand()%45 + 1;
    return a;
}
