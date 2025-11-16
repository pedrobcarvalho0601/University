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
    case 'a': tone = 2277; break;
    case 'b': tone = 2029; break;
    case 'c': tone = 1915; break;
    case 'd': tone = 1700; break;
    case 'e': tone = 1519; break;
    case 'f': tone = 1432; break;
    case 'g': tone = 1275; break;

    // sharps
    case 'h': tone = 2149; break;
    case 'i': tone = 2031; break;
    case 'j': tone = 1802; break;
    case 'k': tone = 1611; break;
    case 'l': tone = 1516; break;

    case 'H': tone = 4298; break;
    case 'I': tone = 4062; break;
    case 'J': tone = 3604; break;
    case 'K': tone = 3222; break;
    case 'L': tone = 3032; break;

    case 'A': tone = 4552; break;
    case 'B': tone = 4058; break;
    case 'C': tone = 3830; break;
    case 'D': tone = 3400; break;
    case 'E': tone = 3038; break;
    case 'F': tone = 2864; break;
    case 'G': tone = 2550; break;

    case ' ': tone = 0; break;
  }
  playTone(tone, duration);
}

void setup() {
  pinMode(speakerPin, OUTPUT);
}

void loop() {
  static String notes = "eeEb h a gegaddEb h a gega iiEb h a gegaccEb h a gega";  // a space represents a rest
  static int beats[] = {1, 1, 2, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1};
  static int tempo = 100;
  for (int i = 0; i < notes.length(); i++) {
    if (notes[i] == ' ')
      delay(beats[i] * tempo);  // rest
    else
      playNote(notes[i], beats[i] * tempo);
    delay(tempo / 2);  // pause between notes
  }
}
/*
    eeEb h a gegaddEb h a gega iiEb h a gegaccEb h a gega  -  megalovania
    1, 1, 2, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 2, 1, 1, 1  -  beats

    abcdefg (notas centrais)
    h(la) i(do) j(re) k(fa) l(sol) (sustenidos)
    */
