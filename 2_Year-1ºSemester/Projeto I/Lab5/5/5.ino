int speakerPin = 9; 
const int buttonPins[] = {A0, A1, A2, A3, A4, A5, 2, 3};

void playTone(int tone) {
  for (long i = 0; i < 1000; i += tone) {
    digitalWrite(speakerPin, HIGH);
    delayMicroseconds(tone);
    digitalWrite(speakerPin, LOW);
    delayMicroseconds(tone);
  }
}

void playNote(int note) {
  int tone;
  switch (note) {
    case 0: tone = 3830; break; // c
    case 1: tone = 3400; break; // d
    case 2: tone = 3038; break; // e
    case 3: tone = 2864; break; // f
    case 4: tone = 2550; break; // g
    case 5: tone = 2276; break; // a
    case 6: tone = 2029; break; // b
    case 7: tone = 1915; break; // C
  }
  playTone(tone);
}

void setup() {
  pinMode(speakerPin, OUTPUT);

  for (int i = 0; i < 8; i++) {
    pinMode(buttonPins[i], INPUT_PULLUP); //quando pressionado fica LOW
  }
}

void loop() {

  for (int i = 0; i < 8; i++) {
    if (digitalRead(buttonPins[i]) == LOW) {
      playNote(i); 
    }
    else {
      digitalWrite(speakerPin, LOW);
    }
  }
}