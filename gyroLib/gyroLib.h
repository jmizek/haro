#ifndef gyroLib_h
#define gyroLib_h

#include "WProgram.h"

class gyroLib
{
 public:
  gyroLib(int pin);
  int read();
 private:
  int _pin;
};

#endif
