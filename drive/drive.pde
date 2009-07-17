#include motorLib.pde
#include buttonLib.pde

// Digital pins reserved for button pad
int bp[] = {7, 8, 9, 10, 11, 12, 13};
int servoPins[] = {5, 6};

void setup(){
  // Init the serial connection back to the compy
  Serial.begin(9600);
  establishContact();
  
  setupButton(bp[0],bp[1],bp[2],bp[3],bp[4],bp[5],bp[6]);
  setupMotor(servoPins[0], servoPins[1]);
}

void loop()
{
  char press = readButton();
  int l_speed;
  int r_speed;
 
  switch (press) {
    case '2': {
      l_speed = 100;
      r_speed = 100;
      break;
    }
    case '4': {
      l_speed = 100;
      r_speed = -100;
      break;
    }
    case '6': {
      l_speed = -100;
      r_speed = 100;
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
  /*
  //Historical test code
  Serial.println("x");
  r_speed=1000;
  for (int i=2; i>-1; i--){
    int readin = -1;
    while(readin==-1)
      readin=Serial.read();
    Serial.println(readin);
    r_speed=r_speed+(readin-48)*pow(10, i);
  }
  Serial.println(r_speed);
  servoRight.write(r_speed);
  */
  motorWrite(l_speed,r_speed);
}

void establishContact() {
  while (Serial.available() <= 0) {
    Serial.println("0,0,0");   // send an initial string
    delay(300);
  }
}
