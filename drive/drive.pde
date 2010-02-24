#include <ServoTimer2.h>  // the servo library
#include <buttonLib.h>

#define l_forward 2006
#define l_stop 1503
#define l_reverse 1000
#define r_forward 1000
#define r_stop 1520
#define r_reverse 2022

// Digital pins reserved for button pad
int bp[] = {7, 8, 9, 10, 11, 12, 13};
int servoPins[] = {5, 6};
int l_go;
int r_go;
ServoTimer2 servoRight;    // declare variables for up to eight servos
ServoTimer2 servoLeft;
buttonLib buttons(bp[0],bp[1],bp[2],bp[3],bp[4],bp[5],bp[6]);

void setup(){
  // Init the serial connection back to the compy
  l_go = l_stop;  //initialize to predefined value
  r_go = r_stop;
//  Serial.begin(9600);
//  establishContact();
  servoLeft.attach(servoPins[0]);     // attach a pin to the servos and they will start pulsing
  servoRight.attach(servoPins[1]);
}

void loop()
{
  char press = buttons.readB();
  int l_speed;
  int r_speed;
  switch (press) {
    case '2': {
      l_speed = 100;
      r_speed = 100;
      break;
    }
    case '4': {
      l_speed = -100;
      r_speed = 100;
      break;
    }
    case '6': {
      l_speed = 100;
      r_speed = -100;
      break;
    }
    case '8': {
      l_speed = -100;
      r_speed = -100;
      break;
    }
    default: {
      l_speed = 0;
      r_speed = 0;
    }
  }
  if (l_speed != 0) 
    l_go=map(l_speed, -100, 100, l_reverse, l_forward);
  else
    l_go=l_stop;
  if (r_speed != 0) 
    r_go=map(r_speed, -100, 100, r_reverse, r_forward);
  else
    r_go=r_stop;
  servoLeft.write(l_go);
  servoRight.write(r_go);
}

void establishContact() {
  while (Serial.available() <= 0) {
    Serial.println("0,0,0");   // send an initial string
    delay(300);
  }
}
