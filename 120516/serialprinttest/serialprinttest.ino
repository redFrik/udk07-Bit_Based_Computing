//test with arduino serial monitor
//connect sensors to pins 2 and 3
//open serial monitor in arduino and set baudrate 57600
void setup() {
  pinMode(2, INPUT);
  pinMode(3, INPUT);
  digitalWrite(2, HIGH);  //activate internal pull-up resistor
  digitalWrite(3, HIGH);  //activate internal pull-up resistor
  Serial.begin(57600);    //baudrate
}
void loop() {
  Serial.print("pin 2:");
  Serial.println(digitalRead(2), DEC); //either 0 (for ground), or 1 for open
  
  Serial.print("pin 3:");
  Serial.println(digitalRead(3), DEC); //either 0 (for ground), or 1 for open
  
  delay(50);
}
