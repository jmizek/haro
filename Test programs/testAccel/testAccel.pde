//test accelerometer library

#include <accelLib.h>


// define the pins for the accelerometer

#define xPin 3
#define yPin 4


//create the accelLib object

accelLib accel(xPin,yPin);


void setup()
 {

  // start serial port at 9600 bps:

  Serial.begin(9600);

  establishContact();
  // send a byte to establish contact until receiver responds
 
}


void establishContact()
 {

  while (Serial.available() <= 0)
  {

    Serial.println("0,0,0");
   // send an initial string

    delay(300);

  }

}



void loop()

{

  Serial.println(accel.readX());

  Serial.println(accel.readY());

  delay(10);

}
