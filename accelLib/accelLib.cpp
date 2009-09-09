#include "WProgram.h"
#include "accelLib.h"

accelLib::accelLib(int xpin, int ypin)
{
  pinMode(xpin, INPUT);
  pinMode(ypin, INPUT);
  _xpin = xpin;
  _ypin = ypin;
}

int accelLib::readX()
{
   return analogRead(_xpin);
}
int accelLib::readY()
{
   return analogRead(_ypin);
}