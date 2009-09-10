#include <buttonLib.h>

buttonLib pad(7,8,9,10,11,12,13);

void setup(){
  // Init the serial connection back to the compy
  Serial.begin(9600);
  establishContact();
  //Serial.print(pad._Wraiths[0]);
}

void loop()
{

  // if we get a valid byte, read analog ins:
  if (Serial.available() > 0) {
    char press = pad.readB();
    Serial.println(press);
  }
}

void establishContact() {
  while (Serial.available() <= 0) {
    Serial.println("0,0,0");   // send an initial string
    delay(300);
  }
}
