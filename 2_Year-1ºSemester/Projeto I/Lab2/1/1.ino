//the setup function runs once when you press reset or power the board
void setup() {
  // initialize digital pin 10 as an output.
  pinMode(2, OUTPUT);
}

// the loop function runs over and over again forever
void loop() {
  digitalWrite(2, HIGH);  // turn the LED on (HIGH)
  delay(1000);             // wait for a second
  digitalWrite(2, LOW);   // turn the LED off (LOW)
  delay(1000);             // wait for a second
}