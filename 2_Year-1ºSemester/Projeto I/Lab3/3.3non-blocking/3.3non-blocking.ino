#define LED_pin (4)
// Definition of main program states
// Each defined keyword corresponds to an increasing number (0,1,2)
enum STATE_ENUM {
  OFF,
  ON
};
unsigned int main_state = OFF;
unsigned long change_time;  // time of last state change
// State machine with non-blocking code
void Blink_state_machine() {
  switch (main_state) {
    case OFF:
      // when in OFF state, do nothing
      // (just wait to change)
      if ((millis() - change_time) >= 3000) {
        change_time = millis();
        // change LED on the transition
        digitalWrite(LED_pin, HIGH);
        main_state = ON;
      }
      break;
    case ON:
      // when in ON state, do nothing
      // (just wait to change)
      if ((millis() - change_time) >= 3000) {
        change_time = millis();
        // change LED on the transition
        digitalWrite(LED_pin, LOW);
        main_state = OFF;
      }
      break;
    default:
      // should never get here
      main_state = OFF;
      break;
  }
}
void setup() {
  // setup your pins
  pinMode(LED_pin, OUTPUT);
  // setup the first state (OFF)
  digitalWrite(LED_pin, LOW);
  change_time = millis();
  // setup the serial port
  Serial.begin(9600);
}
void loop() {
  // Run the state machine
  Blink_state_machine();
  // You can run other state machines in parallel
  // Read the value from the LDR and print to serial port
  Serial.println(analogRead(A0));
}