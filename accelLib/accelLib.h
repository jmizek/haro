#ifndef accelLib_h
#define accelLib_h

#include "WProgram.h"

class accelLib
{
 public:
  accelLib(int xpin, int ypin);
  int readX();
  int readY();
 private:
  int _xpin;
  int _ypin;
};

#endif