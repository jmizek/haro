#ifndef motorLib_h
#define motorLib_h

#include "WProgram.h"
#include <ServoTimer2.h>

class motorLib
{
 public:
  motorLib(int l_pin, int r_pin);
  void writeL(int set_l);
  void writeR(int set_r);
  int readL();
  int readR();
 private:
  int _l_speed;
  int _r_speed;
  ServoTimer2 _servoLeft;
  ServoTimer2 _servoRight;
};

#endif