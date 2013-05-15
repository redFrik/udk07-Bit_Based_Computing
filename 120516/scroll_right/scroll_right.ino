//scroll right
//sends a byte back to pd.  use the [comport 2 57600] object and decode patch to see the result
byte pat= 0b00000111;  //the pattern - change here to test
void setup() {
  Serial.begin(57600);
}
void loop() {
  byte lsb= pat&1;  //temp store bit 1
  pat= pat>>1;      //shift the pattern one step right
  pat= pat | (lsb<<7);  //write back bit 1 at bit 8 position
  Serial.write(pat);  //send the pattern to pd
  delay(50);        //wait some milliseconds
}

