
// define the pins for the accelerometer
static int x_pin;
static int y_pin;

void setupAccel(int x, int y) {
  x_pin=x;
  y_pin=y;
}

int readAccel()
{
   int result[] = {analogRead(x_pin), analogRead(y_pin)};
   return result[]; //can this be reduced to a one-liner?
}
