const int buttonPins[] = {A0, A1, A2, A3, A4, A5};
const int ledPinR[] = {1, 2, 3};
const int ledPinG[] = {4, 5, 6};

void setup() {
  Serial.begin(9600);

  for (int i = 0; i < 6; i++) {
    pinMode(buttonPins[i], INPUT_PULLUP);
  }
  for (int i =; i < 3; i++){
    pinMode(ledPinR[i], OUTPUT);
    pinMode(ledPinG[i], OUTPUT);
  }
}

void loop() {
  
  if (n[5] != NULL){
    for(int i = 0; i < 3; i++){
      for(int i = 0; i < 3; i++){
        digitalWrite(ledPinsR[j], HIGH);
        digitalWrite(ledPinG[j], HIGH);
        delay(1000);
        digitalWrite(ledPinsR[j], LOW);
        digitalWrite(ledPinG[j], LOW);
      }
    }

    
  }
}
