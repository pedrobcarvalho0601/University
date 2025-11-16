int intensity;

void setup() {
  pinMode(10, OUTPUT);
  intensity=255;
}

void loop() {
  analogWrite(3, intensity); 
  delay(10); 

  if(intensity == 0){
    intensity = 255;
  }

  intensity--;
}