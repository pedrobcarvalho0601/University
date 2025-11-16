// Pin definitions
#define BUTTON_PIN (9)
#define LED_RED (7)
#define LED_YELLOW (6)
#define LED_GREEN (5)

// Definition of main program states
// Each defined keyword corresponds to an increasing number(0, 1, 2) 
enum STATE_ENUM {
  ON,
  OFF,
  RED,
  YELLOW,
  GREEN
} system_state;

// Variables used for button and debounce
int buttonState;                                 // the current reading from the input pin 
int lastButtonState = LOW;                       // the previous reading from the input pin 
unsigned long lastDebounceTime = 0;              // the last time the output pin was toggled 
const unsigned long debounceDelay = 50;          // the debounce time; increase if the output flickers

// Function to detect the press of a button, with debounce (adapted from the Arduino Debounce Example)
// -> returns true if the button was pressed (after the debounce time)
bool buttonPressed() {
  int reading = digitalRead(BUTTON_PIN);
  bool pressed = false;
  // If the switch changed, due to noise or pressing:
  if (reading != lastButtonState) {
    // reset the debouncing timer
    lastDebounceTime = millis();
  }
  if ((millis() - lastDebounceTime) > debounceDelay) {
    // if the button state has changed:
    if (reading != buttonState) {
      buttonState = reading;
      // only toggle the LED if the new button state is HIGH 
      if (buttonState == HIGH) {
        pressed = true;
      }
    }
  }
  // save the reading. Next time through the loop,
  // it'll be the lastButtonState: 
  lastButtonState = reading;
  return pressed;
}
void setup() {
  //setup your pins
  pinMode(BUTTON_PIN, INPUT);
  pinMode(LED_RED, OUTPUT);
  pinMode(LED_YELLOW, OUTPUT);
  pinMode(LED_GREEN, OUTPUT);
  // define initial state
  system_state = ON;
  digitalWrite(LED_RED, HIGH);
  digitalWrite(LED_YELLOW, HIGH);
  digitalWrite(LED_GREEN, HIGH);
  //initialize button state
  lastButtonState = digitalRead(BUTTON_PIN);
}
void loop() {
  // STATE MACHINE
  switch (system_state) {
    case ON:
      if (buttonPressed()) { 
        digitalWrite(LED_RED, LOW);
        digitalWrite(LED_YELLOW, LOW);
        digitalWrite(LED_GREEN, LOW);
        system_state = OFF;
      }
      break;
    case OFF:
      if (buttonPressed()) { 
        digitalWrite(LED_RED, HIGH);
        digitalWrite(LED_YELLOW, LOW);
        digitalWrite(LED_GREEN, LOW);
        system_state = RED;
      }
      break;
    case RED:
      if (buttonPressed()) { 
        digitalWrite(LED_RED, LOW);
        digitalWrite(LED_YELLOW, HIGH);
        system_state = YELLOW;
      }
      break;
    case YELLOW:
      if (buttonPressed()) {
        digitalWrite(LED_YELLOW, LOW);
        digitalWrite(LED_GREEN, HIGH);
        system_state = GREEN;
      }
      break;
    case GREEN:
      if (buttonPressed()) {
        digitalWrite(LED_GREEN, HIGH);
        digitalWrite(LED_RED, HIGH);
        digitalWrite(LED_YELLOW, HIGH);
        system_state = ON;
      }
      break;
    default:  // should never get here -> safety
      system_state = ON;
      break;
  }
}