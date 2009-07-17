// Digital pins reserved for button pad
static int BP[7]; //zero-indexed!
int Probes[3] = {BP[2], BP[0], BP[4]};
int Wraiths[4] = {BP[1], BP[6], BP[3], BP[5]}; 

void setupButton(int a, int b, int c, int d, int e, int f, int g){
  // Set up the button pad madness
  BP[0] = a;
  BP[1] = b;
  BP[2] = c;
  BP[3] = d;
  BP[4] = e;
  BP[5] = f;
  BP[6] = g;
  for (int n=0; n<3; n++)
    pinMode(Probes[n], INPUT);
  for (int n=0; n<4; n++) {
    pinMode(Wraiths[n], OUTPUT); 
    digitalWrite(Wraiths[n], HIGH);
  }
}

// Sweeps button pad to determine button pressed
char readButton() {
   for (int n=0; n<4; n++) {
     digitalWrite(Wraiths[n], LOW);
     delay(100);
     for (int m=0; m<3; m++) {
        if (digitalRead(Probes[m]) == LOW) { // success!
            digitalWrite(Wraiths[n], HIGH);
            return decodeButtonPadCombo(n, m);
        }
     }
     digitalWrite(Wraiths[n], HIGH);
   }
   return '?';
}

// Decode which button pad button got pressed base on 
// which digital pin combo got triggered
// n = 0...3 "Wraiths", m = 0...2 "Probes"
char decodeButtonPadCombo(int n, int m) {
  switch (n) {
    case 0: 
      switch (m) {
        case 0: return '1'; 
        case 1: return '2';
        case 2: return '3';
      }
    case 1: 
      switch (m) {
        case 0: return '4';
        case 1: return '5';
        case 2: return '6';
      }
    case 3: 
      switch (m) {
        case 0: return '7';
        case 1: return '8';
        case 2: return '9';
      }
    case 2: 
      switch (m) {
        case 0: return '*';
        case 1: return '0';
        case 2: return '#'; 
      }
  }
  return '?';
}
