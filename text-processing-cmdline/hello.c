#include <stdio.h>

// #define DEBUG_HERE printf("%s:%d\n", __FILE__, __LINE__)
#define DEBUG_HERE

int main(void)
{
  DEBUG_HERE;
  printf("Hello, world!\n");
  DEBUG_HERE;
  return 0;
}
