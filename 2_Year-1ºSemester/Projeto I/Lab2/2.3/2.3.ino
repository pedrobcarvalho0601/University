int intensity = 1;

void setup() {
  pinMode (3, OUTPUT);
  pinMode (5, OUTPUT);
  pinMode (6, OUTPUT);
  pinMode (9, OUTPUT);
  pinMode (10, OUTPUT);
  pinMode (11, OUTPUT);

  Serial.begin(9600);
}

int array[10] = {3, 5, 6, 9, 10, 11, 10, 9, 6, 5};
int x = 0;

void loop() {
  analogWrite(array[x], intensity);
  delay(analogRead(A0));
  analogWrite(array[x], 0);

  x++;
  if(x == 10)
  {
    x = 0;
    intensity = intensity * 2;
  }

  if (intensity >= 256)
  {
    intensity = 1;
  }

  Serial.println(intensity);
}