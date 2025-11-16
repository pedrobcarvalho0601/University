#define LED_pin (4)
#define BUTTON_PIN (9)
#define LEDred
 (7)
#define LEDgreen (6)
#define LEDblue (5)

enum STATE_ENUM1 {
  ON,
  OFF,
  RED,
  YELLOW,
  GREEN
} system_state;

enum STATE_ENUM2 {
  OFF1,
  ON1
};

unsigned int main_state = OFF;
unsigned long change_time; 
int buttonState;                                
int lastButtonState = LOW;                       
unsigned long lastDebounceTime = 0;             
const unsigned long debounceDelay = 50;          

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

void LED_change() {
  switch (system_state) {
    case ON:
      if (buttonPressed()) { 
        //red
        digitalWrite(LEDred, HIGH);
        digitalWrite(LEDgreen, LOW);
        digitalWrite(LEDblue, LOW);
        delay(500);
        digitalWrite(LEDred, LOW);
        //magenta
        digitalWrite(LEDred, HIGH);
        digitalWrite(LEDblue, HIGH);
        delay(500);
        digitalWrite(LEDblue, LOW);
        digitalWrite(LEDred, LOW); 
        //yellow
        digitalWrite(LEDgreen, HIGH);
        digitalWrite(LEDred, HIGH);
        delay(500);
        digitalWrite(LEDgreen, LOW);
        digitalWrite(LEDred, LOW); 
        //green
        digitalWrite(LEDgreen, HIGH);
        delay(500);
        digitalWrite(LEDgreen, LOW);
        //cyan
        digitalWrite(LEDgreen, HIGH);
        digitalWrite(LEDblue, HIGH);
        delay(500);
        digitalWrite(LEDgreen, LOW);
        digitalWrite(LEDblue, LOW);
        //blue
        digitalWrite(LEDblue, HIGH);
        delay(500);
        digitalWrite(LEDblue, LOW);
        //white
        digitalWrite(LEDgreen, HIGH);
        digitalWrite(LEDred, HIGH);
        delay(500);
        digitalWrite(LEDgreen, LOW);
        digitalWrite(LEDred, LOW);
}

void Blink_state_machine() {
  switch (main_state) {
    case OFF1:

      if ((millis() - change_time) >= 3000) {
        change_time = millis();
        digitalWrite(LED_pin, HIGH);
        main_state = ON1;
      }
      break;
    case ON1:
      if ((millis() - change_time) >= 3000) {
        change_time = millis();
        digitalWrite(LED_pin, LOW);
        main_state = OFF1;
      }
      break;
    default:
      main_state = OFF1;
      break;
  }
}
void setup() {
  pinMode(BUTTON_PIN, INPUT);
  pinMode(LEDred
  , OUTPUT);
  pinMode(LEDgreen, OUTPUT);
  pinMode(LEDblue, OUTPUT);
  // define initial state
  system_state = ON;
  digitalWrite(LEDred
  , HIGH);
  digitalWrite(LEDgreen, HIGH);
  digitalWrite(LEDblue, HIGH);
  //initialize button state
  lastButtonState = digitalRead(BUTTON_PIN);

  pinMode(LED_pin, OUTPUT);
  digitalWrite(LED_pin, LOW);
  change_time = millis();
  Serial.begin(9600);
}
void loop() {
  Blink_state_machine();
  LED_change();

  Serial.println(analogRead(A0));
}