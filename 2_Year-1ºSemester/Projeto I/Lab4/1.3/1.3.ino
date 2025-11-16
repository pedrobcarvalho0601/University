#define trigPin 13
#define echoPin 12
#define LEDred 3
#define LEDgreen 5
#define LEDblue 6

long distance;

int RBint = 0; //12,8

long measureDistance(){
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
  pinMode (echoPin, INPUT);
  pinMode (trigPin, OUTPUT);

  pinMode (LEDred, INPUT);
  pinMode (LEDgreen, INPUT);
  pinMode (LEDblue, INPUT);
}

void loop() {
  distance = measureDistance();

  if (distance < 20)
  {
    //Serial.println("Close to an object");
    digitalWrite (LEDred, HIGH);
    digitalWrite (LEDgreen, LOW);
    digitalWrite (LEDblue, LOW);

    
  }

  if (distance >= 20 && distance < 40)
  {
    digitalWrite (LEDred, HIGH);
    digitalWrite (LEDgreen, HIGH);
    digitalWrite (LEDblue, LOW);
  }

  if (distance >= 40 && distance < 60)
  {
    digitalWrite (LEDred, LOW);
    digitalWrite (LEDblue, HIGH);
    digitalWrite (LEDgreen, LOW);
  }

  if (distance >= 60 && distance <= 80)
  {
    RBint = (distance - 60) * 12,8;

    analogWrite (LEDred, RBint);
    analogWrite (LEDgreen, RBint);
    analogWrite (LEDblue, 255);
  }

  if (distance > 80)
  {
    digitalWrite (LEDred, HIGH);
    digitalWrite (LEDgreen, HIGH);
    digitalWrite (LEDblue, HIGH);
  }

  Serial.println(measureDistance());
  delay (100);
}