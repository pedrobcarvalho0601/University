int speakerPin = 9; // Speaker pin
int ledPins[] = {4, 5, 6, 7, 8, 10, 11, 12}; // LED pins

void playTone(int tone, int duration) {
  for (long i = 0; i < duration * 1000L; i += tone * 2) {
    digitalWrite(speakerPin, HIGH);
    delayMicroseconds(tone);
    digitalWrite(speakerPin, LOW);
    delayMicroseconds(tone);
  }
}

void playNote(char note, int duration) {
  int tone;
  switch (note) {
    case 'c': tone = 1915; digitalWrite(ledPins[0], HIGH); break;
    case 'v': tone = 1807; digitalWrite(ledPins[1], HIGH); break;
    case 'd': tone = 1700; break;
    case 'w': tone = 1609; digitalWrite(ledPins[2], HIGH); break;
    case 'e': tone = 1519; break;
    case 'f': tone = 1432; break;
    case 'g': tone = 1275; digitalWrite(ledPins[3], HIGH); break;
    case 'l': tone = 1205; digitalWrite(ledPins[4], HIGH); break;
    case 'a': tone = 1136; break;
    case 'n': tone = 1075; digitalWrite(ledPins[5], HIGH); break;
    case 'b': tone = 1014; break;
    case 'C': tone = 956; digitalWrite(ledPins[6], HIGH); break;
  }
  playTone(tone, duration);
}

void setup() {
  pinMode(speakerPin, OUTPUT);


  for (int i = 0; i < 8; i++) {
    pinMode(ledPins[i], OUTPUT);
    digitalWrite(ledPins[i], LOW); 
  }
}

void loop() {

  static String notes = "cvwwwllCCnl  gln  Cnl"; 
  static int beats[] = {2.5, 1, 1, 1, 1, 1, 1, 1.5, 2.5, 1.5, 1, 1, 1, 1.5, 1,1 ,1, 2.5, 1.3, 1, 1};
  static int tempo = 300;

  for (int i = 0; i < notes.length(); i++) {
    if (notes[i] == ' ') {
      digitalWrite(ledPins[7], HIGH);
      delay(beats[i] * tempo); 
      digitalWrite(ledPins[7], LOW);
    } else {
      playNote(notes[i], beats[i] * tempo);
      for (int j = 0; j < 8; j++){
        digitalWrite(ledPins[j], LOW);
      }
    }
    delay(tempo / 2); 
  }
}