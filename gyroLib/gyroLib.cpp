#include "WProgram.h"
#include "gyroLib.h"

gyroLib::gyroLib(int pin)
{
  pinMode(pin, INPUT);
  _pin = pin;
}

int gyroLib::readG()
{
   return map(analogRead(_pin), 0, 620, -360, 360);
}