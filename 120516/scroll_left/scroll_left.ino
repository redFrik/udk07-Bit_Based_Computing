//scroll left
//sends a byte back to pd.  use the [comport 2 57600] object and decode patch to see the result
byte pat= 0b10100000;  //the pattern - change here to test
void setup() {
  Serial.begin(57600);
}
void loop() {
  byte msb= pat&128;  //temp store bit 8
  pat= pat<<1;      //shift the pattern one step left
  pat= pat | (msb>>7);  //write back bit 8 at bit 1 position
  Serial.write(pat);  //send the pattern to pd
  delay(200);        //wait some milliseconds
}

