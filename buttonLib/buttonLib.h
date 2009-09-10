#ifndef buttonLib_h
#define buttonLib_h

#include "WProgram.h"

class buttonLib
{
 public:
  buttonLib(int apin, int bpin, int cpin, int dpin, int epin, int fpin, int gpin);
  char readB();
 private:
  int _Probes[3];
  int _Wraiths[4];
  char decodeButtonPadCombo(int n, int m);
};

#endif