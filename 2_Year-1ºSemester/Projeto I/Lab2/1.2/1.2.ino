//Global variables
int time;

void setup() {
  // initialize digital pin 10 as an output.
  pinMode(10, OUTPUT);
  time = 2000;
}
void loop() {
  digitalWrite(10, HIGH);  // turn the LED on (HIGH)
  delay(time);             // wait for half a period
  digitalWrite(10, LOW);   // turn the LED off (LOW)
  delay(time);             // wait for half a period
  time = time / 2;         // half of period for the next time
}