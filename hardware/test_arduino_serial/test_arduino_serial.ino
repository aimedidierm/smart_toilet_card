#include <ArduinoJson.h>

void setup() {
  Serial.begin(9600);
}

void loop() {
  // Create a JSON document
  DynamicJsonDocument jsonDoc(1024);
  jsonDoc["card"] = "wdwncinwc";

  // Serialize the JSON document to a string
  String jsonString;
  serializeJson(jsonDoc, jsonString);

  // Send the JSON string through serial communication
  Serial.println(jsonString);

  // Delay for some time before sending the next data
  delay(5000); // Adjust the delay according to your requirements
}
