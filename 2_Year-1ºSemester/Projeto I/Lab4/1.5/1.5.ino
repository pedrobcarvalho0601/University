#define trigPin 13
#define echoPin 12
#define LEDred 3
#define LEDgreen 5
#define LEDblue 6
#define PINBut 8

long distance;
int main_state = LOW;
int system_state = LOW;
unsigned long previousMillis = 0;
int button_state = LOW;

int RBint = 0;  //12,8

void blinkRedWithVariableFrequency(long distance) {
  unsigned long currentMillis = millis();

  int blinkInterval = measureDistance() * 30;

  if (currentMillis - previousMillis >= blinkInterval) {
    previousMillis = currentMillis;

    if (main_state == LOW) {
      main_state = HIGH;
    } else {
      main_state = LOW;
    }

    digitalWrite(LEDred, main_state);
    digitalWrite(LEDgreen, LOW);
    digitalWrite(LEDblue, LOW);
  }
}

void LED_change() {

  for(int i = 0; i < i+1; i++){
    //red
    digitalWrite(LEDred, HIGH);
    digitalWrite(LEDgreen, LOW);
    digitalWrite(LEDblue, LOW);
    delay(500);
    digitalWrite(LEDred, LOW);
    if (digitalRead(PINBut) == LOW) break;
    //magenta
    digitalWrite(LEDred, HIGH);
    digitalWrite(LEDblue, HIGH);
    delay(500);
    digitalWrite(LEDblue, LOW);
    digitalWrite(LEDred, LOW);
    if (digitalRead(PINBut) == LOW) break;
    //yellow
    digitalWrite(LEDgreen, HIGH);
    digitalWrite(LEDred, HIGH);
    delay(500);
    digitalWrite(LEDgreen, LOW);
    digitalWrite(LEDred, LOW);
    if (digitalRead(PINBut) == LOW) break;
    //green
    digitalWrite(LEDgreen, HIGH);
    delay(500);
    digitalWrite(LEDgreen, LOW);
    if (digitalRead(PINBut) == LOW) break;
    //cyan
    digitalWrite(LEDgreen, HIGH);
    digitalWrite(LEDblue, HIGH);
    delay(500);
    digitalWrite(LEDgreen, LOW);
    digitalWrite(LEDblue, LOW);
    if (digitalRead(PINBut) == LOW) break;
    //blue
    digitalWrite(LEDblue, HIGH);
    delay(500);
    digitalWrite(LEDblue, LOW);
    if (digitalRead(PINBut) == LOW) break;
    //white
    digitalWrite(LEDgreen, HIGH);
    digitalWrite(LEDred, HIGH);
    delay(500);
    digitalWrite(LEDgreen, LOW);
    digitalWrite(LEDred, LOW);
    if (digitalRead(PINBut) == LOW) break;
  }
  return;
}

long measureDistance() {
  long duration, distance;

  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);

  duration = pulseIn(echoPin, HIGH);

  distance = duration / 58;

  return distance;
}

void setup() {
  Serial.begin(9600);
  pinMode(echoPin, INPUT);
  pinMode(trigPin, OUTPUT);

  pinMode(LEDred, INPUT);
  pinMode(LEDgreen, INPUT);
  pinMode(LEDblue, INPUT);
}

void loop() {
  distance = measureDistance();
  button_state = digitalRead(PINBut);

  if (button_state == LOW) {
    if (distance < 20) {
      blinkRedWithVariableFrequency(distance);
      Serial.println("Perigo");
    }

    if (distance >= 20 && distance < 40) {
      digitalWrite(LEDred, HIGH);
      digitalWrite(LEDgreen, HIGH);
      digitalWrite(LEDblue, LOW);
    }

    if (distance >= 40 && distance < 60) {
      digitalWrite(LEDred, LOW);
      digitalWrite(LEDgreen, HIGH);
      digitalWrite(LEDblue, LOW);
    }

    if (distance >= 60 && distance < 80) {
      RBint = (distance - 60) * 12, 8;

      analogWrite(LEDred, RBint);
      analogWrite(LEDblue, RBint);
      analogWrite(LEDgreen, 255);
    }

    if (distance >= 80) {
      digitalWrite(LEDred, HIGH);
      digitalWrite(LEDgreen, HIGH);
      digitalWrite(LEDblue, HIGH);
    }
  }

  if (button_state == HIGH) {
    LED_change();
  }
}
