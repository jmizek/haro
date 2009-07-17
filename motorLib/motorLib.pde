#include <ServoTimer2.h>  // the servo library

static ServoTimer2 servoRight;    // declare variables for up to eight servos
static ServoTimer2 servoLeft;
static int l_speed;
static int r_speed;
#define l_forward 2006
#define l_stop 1503
#define l_reverse 1000
#define r_forward 1000
#define r_stop 1511
#define r_reverse 2022

void setupMotor(int left_pin, int right_pin){
  servoLeft.attach(left_pin);     // attach a pin to the servos and they will start pulsing
  servoRight.attach(right_pin);
}

void writeMotor(int set_l, int set_r){
  //expects numbers to be from -100 to 100
  // where -100 is full reverse,
  l_speed=map(set_l, -100, 100, l_reverse, l_forward);
  r_speed=map(set_r, -100, 100, r_reverse, r_forward);
  servoLeft.write(l_speed);
  servoRight.write(r_speed);
}

int readLMotor(){
  //returns formatted l speed
  return map(l_speed, l_reverse, l_forward, -100, 100);
}

int readRMotor(){
  //returns formatted r speed
  return map(r_speed, r_reverse, r_forward, -100, 100);
}
