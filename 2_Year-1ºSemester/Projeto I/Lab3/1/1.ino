int ldrPin = A0;

void setup() {
  Serial.begin(9600);
  pinMode(ldrPin, INPUT);
}

void loop() {
  int ldrValue = analogRead(ldrPin);
  Serial.print("Luminosity: ");
  Serial.println(ldrValue);
  delay(100);
}