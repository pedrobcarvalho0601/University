void setup() {
  pinMode (3, OUTPUT);
  pinMode (5, OUTPUT);
  pinMode (6, OUTPUT);
  pinMode (9, OUTPUT);
  pinMode (10, OUTPUT);
  pinMode (11, OUTPUT);
}

void loop() {
  analogWrite(3, 64);
  analogWrite(5, 32);
  analogWrite(6, 16);
  analogWrite(9, 8);
  analogWrite(10, 4);
  analogWrite(11, 2);
}
