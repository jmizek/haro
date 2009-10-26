#include <motorLib.h>

motorLib motors(9, 10);

void setup()
{
}

void loop()
{
motors.writeR(75);
} 