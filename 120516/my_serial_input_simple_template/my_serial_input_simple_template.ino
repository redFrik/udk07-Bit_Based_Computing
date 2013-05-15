//simple test with one sensor only
//use arduino serial monitor (set baudrate there to 57600)
void setup() {
  pinMode(2, INPUT);
  digitalWrite(2, HIGH);  //activate internal pull-up resistor
  Serial.begin(57600);    //baudrate
}
void loop() {
  Serial.println(digitalRead(2), DEC); //either 0 (for ground), or 1 for open
  delay(50);
}
