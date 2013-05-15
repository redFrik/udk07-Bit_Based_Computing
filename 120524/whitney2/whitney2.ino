//whitney2
//a more complex number generator
byte val;
byte counter;

void setup() {
  pinMode(2, INPUT);
  pinMode(3, INPUT);
  pinMode(4, INPUT);
  digitalWrite(2, HIGH);  //internal pull-up resistor
  digitalWrite(3, HIGH);  //internal pull-up resistor
  digitalWrite(4, HIGH);  //internal pull-up resistor
  counter= 0;
  Serial.begin(57600);
}

void loop() {
  val= 0;
  
  if(counter%(255/7)==0) {
    val |= (1<<7);    //or operation. 1<<7= 0b10000000
  }
  if(counter%(255/6)==0) {
    val |= (1<<6);
  }
  if(counter%(255/5)==0) {
    val |= (1<<5);
  }
  if(counter%(255/4)==0) {
    val |= (1<<4);
  }
  if(counter%(255/3)==0) {
    val |= (1<<3);
  }
  if(counter%(255/2)==0) {
    val |= (1<<2);
  }
  if(counter%(255/1)==0) {
    val |= (1<<1);
  }
  Serial.write(val);
  counter++;
  //delayMicroseconds(500);
  
  //if(digitalRead(2)==HIGH) {
  //  delay(20);
  //} else {
  //  delay(40);
  //}
  
  //delay(digitalRead(2)*20+20);
  
  delay(
    (digitalRead(2)*10)
    +
    (digitalRead(3)*30)
    +
    (digitalRead(4)*100)
    +
    1
   );
}

