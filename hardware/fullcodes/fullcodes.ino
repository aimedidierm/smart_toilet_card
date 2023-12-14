#include <ArduinoJson.h>
#include <LiquidCrystal.h>
#include <SPI.h>
#include <MFRC522.h>
#include <SoftwareSerial.h>

String data = "";
LiquidCrystal lcd(A0, A1, A2, A3, A4, A5);
char directmoney[12] = "100";
#define SS_PIN 10
#define RST_PIN 9
#define buzzer 8
#define red 0
#define green 1
int motor1 = 4;
int motor2 = 5;
const int buto = 2;
byte readCard[4];
int k = 0;
String tagID = "";
MFRC522 mfrc522(SS_PIN, RST_PIN);
String card = "";
boolean getID();
int buttonState = 0;
SoftwareSerial mySerial(6, 7);
void setup()
{
  lcd.begin(16, 2);
  pinMode(buzzer, OUTPUT);
  pinMode(red, OUTPUT);
  pinMode(motor1, OUTPUT);
  pinMode(motor2, OUTPUT);
  pinMode(buto, INPUT);
  digitalWrite(red, LOW);
  digitalWrite(green, LOW);
  mySerial.begin(9600);
  SPI.begin();
  mfrc522.PCD_Init();
  lcd.setCursor(0, 0);
  lcd.print("Smart public");
  lcd.setCursor(0, 1);
  lcd.print("Toilet Billing");
  delay(2000);
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("System");
  lcd.setCursor(0, 1); 
  lcd.print("By Eliane");
  delay(2000);
}

void loop()
{
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("Tap Your Card");

  if (getID())
  {
    if (tagID == "9269801D")
    {
      lcd.clear();
      lcd.setCursor(0, 0);
      lcd.print("Welcome admin");
      tone(buzzer, 1000, 1000);
      delay(2000);
      opendoor();
    }
    else if (tagID == "C32A2242")
    {
      lcd.clear();
      lcd.setCursor(0, 0);
      lcd.print("Welcome cleaner");
      tone(buzzer, 1000, 1000);
      delay(2000);
      opendoor();
    }
    else if (tagID == "3379BEAB" || tagID == "5314B2AB")
    {
      lcd.clear();
      lcd.setCursor(0, 0);
      lcd.print("Loading");
      mySerial.println((String)"card=" + tagID + "&dmoney=" + directmoney);
      while (k == 0)
      {
        if (mySerial.available() > 0)
        {
          data = mySerial.readStringUntil('\n');
          //kwakira data zivuye kuri node mcu na server

          DynamicJsonDocument doc(1024); // Adjust the size as needed
          DeserializationError error = deserializeJson(doc, data);

          if (error)
          {
            mySerial.print(F("deserializeJson() failed: "));
            mySerial.println(error.f_str());
            return;
          }

          if (doc["cstatus"])
          {
            int cstatus = doc["cstatus"];
            int balance = doc["balance"];

            if (cstatus == 1)
            {
              lowbalance();
            }
            else
            {
              lcd.clear();
              lcd.setCursor(0, 0);
              lcd.print("Balance:");
              lcd.print(balance);
              digitalWrite(green, HIGH);
              opendoor();
            }
          }
        }
      }
    }
  }
}

void (*resetFunc)(void) = 0;

boolean getID()
{
  if (!mfrc522.PICC_IsNewCardPresent())
  {
    return false;
  }
  if (!mfrc522.PICC_ReadCardSerial())
  {
    return false;
  }
  tagID = "";
  for (uint8_t i = 0; i < 4; i++)
  {
    tagID.concat(String(mfrc522.uid.uidByte[i], HEX));
  }
  tagID.toUpperCase();
  mfrc522.PICC_HaltA();
  return true;
}

void lowbalance()
{
  lcd.clear();
  lcd.setCursor(0, 0);
  digitalWrite(red, HIGH);
  lcd.print("Insufficient funds");
  tone(buzzer, 1000, 500);
  delay(1300);
  digitalWrite(red, LOW);
  resetFunc();
}

void opendoor()
{
  digitalWrite(green, HIGH);
  digitalWrite(motor1,HIGH);
  digitalWrite(motor2,LOW);
  delay(2000);
  digitalWrite(motor2,HIGH);
  digitalWrite(motor1,LOW);
  delay(5000);
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("Somebody in");
  delay(1000);
  opendoor2();
}

void opendoor2()
{
  int i = 1;
  while (i > 0)
  {
    buttonState = digitalRead(buto);
    if (buttonState == LOW)
    {
      digitalWrite(motor1,HIGH);
      digitalWrite(motor2,LOW);
      delay(2000);
      digitalWrite(motor2,HIGH);
      digitalWrite(motor1,LOW);
      delay(5000);
      resetFunc();
    }
    delay(200);
  }
}
