//simple counter example
//sends a byte (0-255) to pd
//use the [comport 1 57600] object in pd
byte counter;

void setup() {
  Serial.begin(57600);
  counter= 0;
}
void loop() {
  Serial.write(counter);  //sends back raw bytes 0-255
  counter= counter+1;  //increase the counter
  delay(100);  //wait time between each number
}

