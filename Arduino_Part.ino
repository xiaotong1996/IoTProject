#include<Arduino.h>
//int Led = 13 ;// define LED Interface
//int buttonpin = 3; // define D0 Sensor Interface
//int val = 0;// define numeric variables val
// 
//void setup ()
//{
//  pinMode (Led, OUTPUT) ;// define LED as output interface
//   
//  pinMode (buttonpin, INPUT) ;// output interface D0 is defined sensor
//}
// 
//void loop ()
//{
//  val = digitalRead(buttonpin);// digital interface will be assigned a value of pin 3 to read val
//  if (val == HIGH) // When the sound detection module detects a signal, LED flashes
//  {
//    digitalWrite (Led, HIGH);
//  }
//  else
//  {
//    digitalWrite (Led, LOW);
//  }
//}




int sensorPin = A1; // select the input pin for the potentiometer
int ledPin = 13; // select the pin for the LED
int sensorValue = 0; // variable to store the value coming from the sensor
 
void setup () 
{
  pinMode (ledPin, OUTPUT);
  Serial.begin (9600);
}
 
void loop () 
{
  sensorValue = analogRead (sensorPin);
   Serial.println (sensorValue, DEC);
  //digitalWrite (ledPin, HIGH);
  delay (500);
  //digitalWrite (ledPin, LOW);
  //delay (sensorValue);
 
}
