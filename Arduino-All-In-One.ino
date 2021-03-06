// BME (weather all-in-one device) defines
#include <Process.h>

#include <Wire.h>
#include <SPI.h>
#include <SD.h>

#include <Adafruit_Sensor.h>
#include <Adafruit_BME280.h>

#define BME_SCK 13
#define BME_MISO 12
#define BME_MOSI 11
#define BME_CS 10

#define SEALEVELPRESSURE_HPA (1013.25)
Adafruit_BME280 bme(BME_CS, BME_MOSI, BME_MISO,  BME_SCK);

// Supersonic distance measurer defines:
#define SSD_echoPin 4 // Echo Pin
#define SSD_trigPin 3 // Trigger Pin
#define SSD_LEDPin 13 // Onboard LED

const int maximumRange = 200; // Maximum range needed
const int minimumRange = 0; // Minimum range needed
long duration, distance; // Duration used to calculate distance

// Magnetic measurement defines:
#define MM_input 2

File testFile;

void sendCurlMessage(String action, String data) {
    Process p;
    String curlCommand = "curl --data \"" + data + "\" https://wt-23birdsonfire-gmail-com-0.run.webtask.io/" + action + "?webtask_no_cache=1";
    int result = p.runShellCommand(curlCommand);
    Serial.print("Curl command:");
    Serial.println(curlCommand);
//    int result = p.runShellCommand("curl --data \"door toggle\" https://wt-23birdsonfire-gmail-com-0.run.webtask.io/door?webtask_no_cache=1");
    Serial.print("sendCurlMessage result:");
    Serial.println(result);
/*
  p.begin("curl");
  p.addParameter("https://wt-23birdsonfire-gmail-com-0.run.webtask.io/door?webtask_no_cache=1");
  p.run();

  while (p.available() > 0) {
    char c = p.read();
    SerialUSB.print(c);
  }

  SerialUSB.flush();
  */
}

void setup() {  
  pinMode(MM_input, INPUT); // Read the input on pin 2
  Serial.begin(9600); // I also wanted to confirm the value I read.

  pinMode(SSD_trigPin, OUTPUT);
  pinMode(SSD_echoPin, INPUT);
  pinMode(SSD_LEDPin, OUTPUT); // Use LED indicator (if required)

  // Set up BME device.
  Serial.println(F("BME280 test"));
  if (!bme.begin()) {
    Serial.println("Could not find a valid BME280 sensor, check wiring!");
    while (1);
  }

}

void loop() {
  double doorMon_val = digitalRead( MM_input ); // Go read the pin.

  Serial.print("Door monitor measures: ");
  Serial.println(doorMon_val);

/*
  if ( val == HIGH ) {
    digitalWrite ( 13, HIGH ); // Turn on the LED when the value is high.
  }
  else {
    digitalWrite ( 13, LOW ); // Turn off the LED when the value is low.
  }
*/

  /* The following trigPin/echoPin cycle is used to determine the
  distance of the nearest object by bouncing soundwaves off of it. */ 

  digitalWrite(SSD_trigPin, LOW); 
  delayMicroseconds(2); 
  
  digitalWrite(SSD_trigPin, HIGH);
  delayMicroseconds(10); 
  
  digitalWrite(SSD_LEDPin, LOW);
  duration = pulseIn(SSD_echoPin, HIGH);
  
  //Calculate the distance (in cm) based on the speed of sound.
  distance = duration/58.2;

  if (distance >= maximumRange || distance <= minimumRange){
    /* Send a negative number to computer and Turn LED ON 
    to indicate "out of range" */
//    Serial.println("Distance: -1");
//    digitalWrite(SSD_LEDPin, HIGH); 
  }
  else {
    /* Send the distance to the computer using Serial protocol, and
    turn LED OFF to indicate successful reading. */
    Serial.print("Distance: ");
    Serial.println(distance);
    digitalWrite(SSD_LEDPin, LOW); 
  }


  Serial.print("Temperature = ");
  Serial.print(bme.readTemperature());
  Serial.print(" *C / ");
  Serial.print(bme.readTemperature()*9/5 + 32);
  Serial.println(" *F");
  
  Serial.print("Pressure = ");

  Serial.print(bme.readPressure() / 100.0F);
  Serial.println(" hPa");

  Serial.print("Approx. Altitude = ");
  Serial.print(bme.readAltitude(SEALEVELPRESSURE_HPA));
  Serial.println(" m");

  monitorHumidity();

  Serial.println();

  delay(1500);
}

int humidityState = 0;

void monitorHumidity() {
  Serial.print("Humidity = ");
  Serial.print(bme.readHumidity());
  Serial.println(" %");

  if(humidityState == 0 && bme.readHumidity() > 70) {
    humidityState = 1;
    sendCurlMessage("door", "open");
  }
  else if(humidityState == 1 && bme.readHumidity() < 70) {
    humidityState = 0;
    sendCurlMessage("door", "close");
  }

}

void keyPressed() {
  exit(0);  // Stops the program
}

