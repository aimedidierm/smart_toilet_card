int motor1 = 4;
int motor2 = 5;
void setup() {
  pinMode(motor1,OUTPUT);
  pinMode(motor2,OUTPUT);
}

void loop() {
//  opendoor();
//  nostate();
  closedoor();
}

void opendoor(){
  digitalWrite(motor1,HIGH);
  digitalWrite(motor2,LOW);
  delay(10000);
}

void closedoor(){
  digitalWrite(motor2,HIGH);
  digitalWrite(motor1,LOW);
  delay(10000);
  }
void nostate(){
  digitalWrite(motor1,LOW);
  digitalWrite(motor2,LOW);
  }
