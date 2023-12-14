#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>
#include <WiFiClient.h>
#include<SoftwareSerial.h>
SoftwareSerial s(3,1);
const char* ssid = "Sano";
const char* password = "sano33333";
String serverName = "http://172.20.10.12/smart_toilet_card/data.php";
void setup() {
  s.begin(9600);
  WiFi.begin(ssid, password);
  while(WiFi.status() != WL_CONNECTED) {
  delay(500);
  }
}

void loop() {
    if(s.available( ) > 0){
      WiFiClient client;
      HTTPClient http;
      http.begin(client, serverName);
      http.addHeader("Content-Type", "multipart/form-data");
      String httpRequestData = s.readStringUntil('\n');
      int      httpResponseCode = http.POST(httpRequestData);
      if (httpResponseCode>0) {
        s.println(httpResponseCode);
        String payload = http.getString();
        s.println(payload);
      }
      // Free resources
      http.end();
    }
  }
