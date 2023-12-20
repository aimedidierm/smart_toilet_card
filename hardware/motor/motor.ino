#include <LiquidCrystal.h>
int motor1 = 6;
int motor2 = 5;
LiquidCrystal lcd(A0, A1, A2, A3, A4, A5);
void setup() {
  lcd.begin(16, 2);
  pinMode(motor1,OUTPUT);
  pinMode(motor2,OUTPUT);
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("System restarted");
  delay(2000);
}

void loop() {
  opendoor();
  opendoor();
  opendoor();
  opendoor();
  opendoor();
  closedoor();
  closedoor();
  closedoor();
  closedoor();
  closedoor();
}

void opendoor()
{
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("Opening Door");
  digitalWrite(motor1,HIGH);
  digitalWrite(motor2,LOW);
  delay(1000);
}

void closedoor()
{
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("Closing Door");
  digitalWrite(motor1,LOW);
  digitalWrite(motor2,HIGH);
  delay(1000); 
}
