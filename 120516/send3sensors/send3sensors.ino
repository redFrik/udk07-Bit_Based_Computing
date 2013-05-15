//send three digital sensors as a byte
//connect sensors to pins 2, 3 and 4
//use a pd patch with [comport 1 57600] to read the byte
void setup() {
  Serial.begin(57600);
  pinMode(2, INPUT);
  pinMode(3, INPUT);
  pinMode(4, INPUT);
  digitalWrite(2, HIGH);
  digitalWrite(3, HIGH);
  digitalWrite(4, HIGH);
}
void loop() {
  Serial.write(digitalRead(2) + (digitalRead(3)*2) + (digitalRead(4)*4));
  //Serial.write((digitalRead(2)<<0) + (digitalRead(3)<<1) + (digitalRead(4)<<2));
  delay(100);
}

