int speakerPin = 9; 

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
    case 'c': tone = 1915; break;
    case 'd': tone = 1700; break;
    case 'e': tone = 1519; break;
    case 'f': tone = 1432; break;
    case 'g': tone = 1275; break;
    case 'a': tone = 1136; break;
    case 'b': tone = 1014; break;
    case 'C': tone = 956; break;
  }
  playTone(tone, duration);
}

void setup() {
  pinMode(speakerPin, OUTPUT);
}

void loop() {
  /******** DEFINE YOUR MELODY HERE **********/
  static String notes = "cdefgabCbagfedc";  // a space represents a rest
  static int beats[] = { 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 2, 4, 8, 4 };
  static int tempo = 300;
  for (int i = 0; i < notes.length(); i++) {
    if (notes[i] == ' ')
      delay(beats[i] * tempo);  // rest
    else
      playNote(notes[i], beats[i] * tempo);
    delay(tempo / 2);  // pause between notes
  }
}