static int vout;

void gyroSetup(int gyroPin){
  vout = gyroPin;
}

int gyroRead(){
  return map(analogRead(vout), 0, 620, -360, 360);
}

//included for historical value
/*
void minmax(int reading) {
  static int min = 0;
  static int max =0;
 if (reading < min)
   min = reading;
  if (reading > max)
    max = reading;
    
  Serial.print(min);
  Serial.print(" ");
  Serial.println(max);  
}
*/
