void setup() {
  pinMode (3, OUTPUT);
  pinMode (5, OUTPUT);
  pinMode (6, OUTPUT);
  pinMode (9, OUTPUT);
  pinMode (10, OUTPUT);
  pinMode (11, OUTPUT);
}

void loop() {
  int sensorValue = analogRead(A0), x;

  x = sensorValue/4;

  analogWrite(3, x);
  analogWrite(5, x/2);
  analogWrite(6, x/4);
  analogWrite(9, x/8);
  analogWrite(10, x/16);
  analogWrite(11, x/32);
}
