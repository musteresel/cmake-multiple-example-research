// Dependency on framework code
extern void Run();

// Actual backend code
#include <stdio.h>
void PrintNumber(int const number)
{
  printf("Got number %d\n", number);
}

int main()
{
  Run();
}
