/*
PLEASE, FOR THE LOVE OF SCIENCE, CONNECT THE BUTTON PAD PROPERLY!
PINS 1,3,5 ARE ALL INPUTS AND AS SUCH MUST HAVE A RESISTOR CONNECTED TO +5
FAILURE TO DO SO PRODUCES SPURIOUS RESULTS THAT WILL TAKE HOURS OF TROUBLESHOOTING
*/

#include "WProgram.h"
#include "buttonLib.h"

buttonLib::buttonLib(int apin, int bpin, int cpin, int dpin, int epin, int fpin, int gpin)
{
  _Probes[0] = cpin;
  _Probes[1] = apin;
  _Probes[2] = epin;
  _Wraiths[0]= bpin;
  _Wraiths[1]= gpin;
  _Wraiths[2]= dpin;
  _Wraiths[3]= fpin;
  for (int n=0; n<3; n++)
    pinMode(_Probes[n], INPUT);
  for (int n=0; n<4; n++){
    pinMode(_Wraiths[n], OUTPUT); 
    digitalWrite(_Wraiths[n], HIGH);
  }
}

// Sweeps button pad to determine button pressed
char buttonLib::readB()
{
   for (int n=0; n<4; n++) {
     digitalWrite(_Wraiths[n], LOW);
     delay(10); //short delay to let pin get set
     for (int m=0; m<3; m++) {
        if (digitalRead(_Probes[m]) == LOW) { // success!
            digitalWrite(_Wraiths[n], HIGH);
            return decodeButtonPadCombo(n, m);
        }
     }
     digitalWrite(_Wraiths[n], HIGH);
   }
   return '?';
}

// Decode which button pad button got pressed base on 
// which digital pin combo got triggered
// n = 0...3 "Wraiths", m = 0...2 "Probes"
char buttonLib::decodeButtonPadCombo(int n, int m) {
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