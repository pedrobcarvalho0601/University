#define EXT_LED 2
#define LEDR 3
#define LEDG 5
#define LEDB 6

#define TRIG_PIN 7
#define ECHO_PIN 8
#define POT1_PIN A0
#define POT2_PIN A1

void SetBuildInLED(){
  static boolean led_state = true;
  digitalWrite(LED_BUILTIN, led_state);

  if (led_state)
    Serial.println("[REPLY] Builtin LED state: ON");
  else
    Serial.println("[REPLY] Builtin LED state: OFF");

  led_state = !led_state;
}

long measureDistance() {
  long duration, distance;
  
  digitalWrite(TRIG_PIN, LOW);
  delayMicroseconds(2);
  digitalWrite(TRIG_PIN, HIGH);
  delayMicroseconds(10);
  digitalWrite(TRIG_PIN, LOW);
  
  duration = pulseIn(ECHO_PIN, HIGH);
  distance = duration / 58;

  return distance;
}

void TURN_LED_ON(){
  digitalWrite(EXT_LED, HIGH);

  Serial.println("[REPLY] External LED state: ON");
}

void TURN_LED_OFF(){
  digitalWrite(EXT_LED, LOW);

  Serial.println("[REPLY] External LED state: OFF");
}

void RGB_LED(int r, int g, int b){
  analogWrite(LEDR, r);
  analogWrite(LEDG, g);
  analogWrite(LEDB, b);
  Serial.println("[REPLY] RGB LED state: " + String(r) + ", " + String(g) + ", " + String(b));
}

void StreamData(){
  static boolean external_led_state = false;

  external_led_state = !external_led_state;
  digitalWrite(EXT_LED,external_led_state);

  long distance = measureDistance();
  int pot1Value = analogRead(POT1_PIN);
  int pot2Value = analogRead(POT2_PIN);

  Serial.print("[REPLY] Distance: ");
  Serial.print(distance); 
  Serial.print(" Pot1: ");
  Serial.print(pot1Value);
  Serial.print(" Pot2: ");
  Serial.println(pot2Value);
}

void StopStream(){
  Serial.println("[REPLY] STREAM STOPPED");
}

void UnknownReply(String req){
  Serial.println("[REPLY] Unknown request: " + req + ".");
}

//NOTE: you must not use delay() in these functions


void setup() {
  Serial.begin(9600);

  Serial.setTimeout(100);

  pinMode(LED_BUILTIN, OUTPUT);
  pinMode(EXT_LED, OUTPUT);
  pinMode(TRIG_PIN, OUTPUT);
  pinMode(ECHO_PIN, INPUT);
  pinMode(POT1_PIN, INPUT);
  pinMode(POT2_PIN, INPUT);
}

void loop() {
  static boolean stream = false;
  boolean unknown_req = true;
  String request = Serial.readString();

  if(request.length() > 0){
    if(request.endsWith(String('\n')))
      request.remove(request.length()-1);

    Serial.println("[REQUEST] " + request);
  }
  else{
    if (stream)
      request = "STREAMING";
  }

  //Translate String Requests into Actions
  if (request.equals("TOGGLE_BUILTIN_LED")){
    SetBuildInLED();
    unknown_req = false;
  }

  if (request.equals("TURN_LED_ON")){
    TURN_LED_ON();
    unknown_req = false;
  }

  if (request.equals("TURN_LED_OFF")){
    TURN_LED_OFF();
    unknown_req = false;
  }

  if (request.equals("STOP")){
    stream = false;
    StopStream();
    unknown_req = false;
  }

  if (request.equals("STREAMING")){
    stream = true;
    StreamData();
    unknown_req = false;
  }

  if (request.startsWith("RGB_LED ")) {
    int r, g, b;
    sscanf(request.c_str(), "RGB_LED %d %d %d", &r, &g, &b);
    RGB_LED(r, g, b);
    unknown_req = false;
  }
}



