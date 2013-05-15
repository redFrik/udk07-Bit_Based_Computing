//repetition from last week

byte counter= 0;  //8bit value  255= 0b11111111
  //0 = 0b00000000
  //1 = 0b00000001
  //2 = 0b00000010
  //3 = 0b00000011
  //4 = 0b00000100
  //etc
void setup() {
  Serial.begin(57600);
}
void loop() {
  //Serial.println(counter, BIN);  //binary (to serial monitor)
  //Serial.println(counter);       //decimal (to serial monitor)
  Serial.write(counter);           //raw byte (to pd)
  counter++;    //0-255
  delay(500);   //speed
}

