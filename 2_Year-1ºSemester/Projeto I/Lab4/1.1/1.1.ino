#define trigPin 13
#define echoPin 12

long measureDistance(){
  long duration, distance;

  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);

  duration = pulseIn(echoPin, HIGH);

  distance = duration / 58;

  return distance;
}

void setup() {
  Serial.begin(9600);
  pinMode (echoPin, INPUT);
  pinMode (trigPin, OUTPUT);

}

void loop() {
  Serial.println(measureDistance());
  delay(500);
}