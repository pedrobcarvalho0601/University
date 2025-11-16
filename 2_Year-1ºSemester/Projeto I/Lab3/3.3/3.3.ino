#define LED_pin (4)
enum STATE_ENUM {
  OFF,
  ON
};

unsigned long change_time;  // time of last state change
unsigned int main_state = OFF;

void Blink_state_machine() {
  switch (main_state) {
    case ON:
      if ((millis() - change_time) >= 3000) {

        change_time = millis();
        digitalWrite(LED_pin, LOW);

        main_state = OFF;
      }
      break;

    case OFF:
      if ((millis() - change_time) >= 3000) {
        
        change_time = millis();
        digitalWrite(LED_pin, HIGH);

        main_state = ON;
      }
      break;
  }
}
void setup() {

  pinMode(LED_pin, OUTPUT);
  change_time = millis();
  digitalWrite(LED_pin, LOW);

  Serial.begin(9600);
}
void loop() {
  // Run the state machine
  Blink_state_machine();
  // You can run other state machines in parallel
  // Read the value from the LDR and print to serial port
  Serial.println(analogRead(A0));
}