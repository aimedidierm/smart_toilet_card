#include <ArduinoJson.h>
#include <LiquidCrystal.h>
#include <SPI.h>
#include <MFRC522.h>

String data = "";
LiquidCrystal lcd(A0, A1, A2, A3, A4, A5);
#define SS_PIN 10
#define RST_PIN 9
#define buzzer 8
#define red 7
#define green 3
int motor1 = 6;
int motor2 = 5;
const int buto = 2;
byte readCard[4];
int k = 0;
String tagID = "";
MFRC522 mfrc522(SS_PIN, RST_PIN);
String card = "";
boolean getID();
int buttonState = 0;
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
  Serial.begin(9600);
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
    else
    {
      lcd.clear();
      lcd.setCursor(0, 0);
      lcd.print("Loading");
      StaticJsonDocument<50> doc;
      doc["card"] = tagID;
      serializeJson(doc, Serial);
      Serial.println();
      while (k == 0)
      {
        if (Serial.available() > 0)
        {
          data = Serial.readStringUntil('\n');

          DynamicJsonDocument doc(2048);
          DeserializationError error = deserializeJson(doc, data);
          // Serial.println(data);
          if (error)
          {
            Serial.print(F("deserializeJson() failed: "));
            Serial.println(error.f_str());
            return;
          } 

          if (doc["cstatus"])
          {
            int cstatus = doc["cstatus"];

            if (cstatus == 1)
            {
              lowbalance();
            }
            else
            {
            int balance = doc["balance"];
              lcd.clear();
              lcd.setCursor(0, 0);
              lcd.print("Welcome");
              lcd.setCursor(0, 1);
              lcd.print("Balance:");
              lcd.print(balance);
              digitalWrite(green, HIGH);
              delay(2000);
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
  lcd.print("Low balance");
  tone(buzzer, 1000, 500);
  delay(3000);
  digitalWrite(red, LOW);
  resetFunc();
}

void cardNotFound()
{
  lcd.clear();
  lcd.setCursor(0, 0);
  digitalWrite(red, HIGH);
  lcd.print("Card not found");
  tone(buzzer, 1000, 500);
  delay(3000);
  digitalWrite(red, LOW);
  resetFunc();
}

void opendoor()
{
  digitalWrite(green, HIGH);
  openSingleDoor();
  openSingleDoor();
  openSingleDoor();
  delay(3000);
  closeSingleDoor();
  closeSingleDoor();
  closeSingleDoor();
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
      openSingleDoor();
      openSingleDoor();
      openSingleDoor();
      delay(3000);
      closeSingleDoor();
      closeSingleDoor();
      closeSingleDoor();
      resetFunc();
    }
    delay(200);
  }
}

void openSingleDoor()
{
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("Opening Door");
  digitalWrite(motor1,HIGH);
  digitalWrite(motor2,LOW);
  delay(400);
}

void closeSingleDoor()
{
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("Closing Door");
  digitalWrite(motor1,LOW);
  digitalWrite(motor2,HIGH);
  delay(400); 
  digitalWrite(motor2,LOW);
}
