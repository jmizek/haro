#include "WProgram.h"
#include "motorLib.h"
#include <ServoTimer2.h>  // the servo library

#define l_forward 2006
#define l_stop 1503
#define l_reverse 1000
#define r_forward 1000
#define r_stop 1511
#define r_reverse 2022

motorLib::motorLib(int l_pin, int r_pin)
{
  _l_speed = l_stop;  //initialize to predefined value
  _r_speed = r_stop;
  ServoTimer2 servoLeft = _servoLeft;    // declare variables for up to eight servos
  ServoTimer2 servoRight = _servoRight;
  servoLeft.attach(l_pin);     // attach a pin to the servos and they will start pulsing
  servoRight.attach(r_pin);
}

void writeL(int set_l)
{
  //expects numbers to be from -100 to 100
  // where -100 is full reverse,
  _l_speed=map(set_l, -100, 100, l_reverse, l_forward);
  servoLeft.write(_l_speed);
}

void writeR(int set_r)
{
  //expects numbers to be from -100 to 1oo
  // where -100 is full reverse and 100 is full forward
  _r_speed=map(set_r, -100, 100, r_reverse, r_forward);
  servoRight.write(_r_speed);
}

int readL()
{
  //returns formatted l speed
  return map(_l_speed, l_reverse, l_forward, -100, 100);
}

int readRMotor()
{
  //returns formatted r speed
  return map(_r_speed, r_reverse, r_forward, -100, 100);
}