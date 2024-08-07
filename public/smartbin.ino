#include "ESP8266WiFi.h"
#include <Servo.h>
#include <TinyGPS++.h> 

const char* ssid = "slt";
const char* password = "password"; 
float latitude , longitude;

#define FIREBASE_HOST “nodemcu-xxxxx-xxxxx-xxxx.firebaseio.com”
#define FIREBASE_AUTH “xGJVxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxZz”

TinyGPSPlus gps;  
SoftwareSerial ss(4, 5);
Servo servo;

const int trigPin = 12;
//Ultrasonic to decide the fullness of the bin
const int echoPin1 = 13;
//Ultrasonic to decide if someone is infront of the bin
const int echoPin2 = 14;

long duration;
float distanceCm;

void setup() {

Serial.begin(115200);
ss.begin(9600);
WiFi.begin(ssid, password);

while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
}

Serial.println("");
Serial.println("WiFi connected");

//Servo motor config
servo.attach(2); //D4
servo.write(0);

//ultrasonic config
pinMode(trigPin, OUTPUT); // Sets the trigPin as an Output
pinMode(echoPin1, INPUT);
pinMode(echoPin2, INPUT);

//Firebase connection
 Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);

}

void loop() {

if(isSomeoneInFront()){
    servo.write(90);
}else{
    servo.write(0);
}

if(ss.available() > 0){
    if (gps.encode(ss.read())) //read gps data
    {
        if (gps.location.isValid()) //check whether gps location is valid
        {
            latitude = gps.location.lat();
            lat_str = String(latitude , 6); // latitude location is stored in a string
            longitude = gps.location.lng();
            lng_str = String(longitude , 6); //longitude location is stored in a string
            Firebase.setString(“latitude/Value“,lat_str);
            Firebase.setString(“longitude/Value“,lng_str);
        }
    }
}
Firebase.setInt(“/BinFull/Value“,decideBinFull());
}

int decideBinFull(){
    triggerUltrasonics();
    // Reads the echoPin, returns the sound wave travel time in microseconds
    duration = pulseIn(echoPin1, HIGH);
    // Calculate the distance
    distanceCm = duration * SOUND_VELOCITY/2;
    return distanceCm;
}

bool isSomeoneInFront(){
    triggerUltrasonics();
     // Reads the echoPin, returns the sound wave travel time in microseconds
    duration = pulseIn(echoPin2, HIGH);
    // Calculate the distance
    distanceCm = duration * SOUND_VELOCITY/2;
    if(distanceCm < 50){
        return true;
    }else{
        return false;
    }
}


void triggerUltrasonics(){
    digitalWrite(trigPin, LOW);
    delayMicroseconds(2);
    digitalWrite(trigPin, HIGH);
    delayMicroseconds(10);
    digitalWrite(trigPin, LOW);
}