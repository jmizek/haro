#include <wlLib.h>

wlLib rx(1, 1200);
wlLib tx(0, 9600);

void setup()
{
  
}

void loop()
{
//  tx.writeS(rx.readS());
  tx.writeS('a');
}

