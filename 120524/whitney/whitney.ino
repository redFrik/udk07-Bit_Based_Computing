//whitney
//a more complex number generator
byte val;
int counter;

void setup() {
  counter= 0;
  Serial.begin(57600);
}

void loop() {
  val= 0;
  
  if(counter%(360/8)==0) {
    val |= (1<<7);
  }
  if(counter%(360/7)==0) {  //here we have a slight problem - 51.43
    val |= (1<<6);
  }
  if(counter%(360/6)==0) {
    val |= (1<<5);
  }
  if(counter%(360/5)==0) {
    val |= (1<<4);
  }
  if(counter%(360/4)==0) {
    val |= (1<<3);
  }
  if(counter%(360/3)==0) {
    val |= (1<<2);
  }
  if(counter%(360/2)==0) {
    val |= (1<<1);
  }
  if(counter%(360/1)==0) {
    val |= (1<<0);
  }
  Serial.write(val);
  counter= (counter+1)%360;
  //delayMicroseconds(500);
  delay(50);
}

