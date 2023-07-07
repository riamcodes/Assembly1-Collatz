#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <math.h>
#include "library.h"
#include "graphics.h"

extern uint32_t collatz(uint32_t);

int main(void) {
  uint32_t i,n,xp,yp;

  InitializeHardware(HEADER,"Collatz Conjecture");
  SetForeground(0xFFFF0000);
  xp = 1;
  n = 2;
  while (xp < XPIXELS - 1) {
    i = 0;
    while (i < 4) {
      yp = collatz(n);
      DrawPixel(xp,yp,COLOR_RED);
      DrawPixel(xp-1,yp,COLOR_RED);
      DrawPixel(xp-1,yp-1,COLOR_RED);
      DrawPixel(xp,yp-1,COLOR_RED);
      DrawPixel(xp+1,yp-1,COLOR_RED);
      DrawPixel(xp+1,yp,COLOR_RED);
      DrawPixel(xp+1,yp+1,COLOR_RED);
      DrawPixel(xp,yp+1,COLOR_RED);
      DrawPixel(xp-1,yp+1,COLOR_RED);
      i++;
      n++;
    }
    xp++;
  }
}
