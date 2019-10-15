#include <stddef.h>
#include <stdbool.h>

void PrintNumber(int const number)
{
  uint16_t * const video = (uint16_t *)0xB8000;
  unsigned const width = 10;
  if (number == 0)
    {
      *(video + width) = '0' | (0x0F << 8);
      return;
    }
  unsigned place = 0;
  bool const negative = (number < 0);
  if (negative) number = -number;
  while (number)
    {
      int digit = number % 10;
      number = number / 10;
      *(video + width - place) = ('0' + digit) | (0x0F << 8);
      ++place;
    }
  if (negative)
    {
      *(video + width - place) = '-' | (0x0F << 8);
    }
}

