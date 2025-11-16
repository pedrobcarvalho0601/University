#define EXT_LED 2

// Utility functions (add as needed)
void SetBuildInLED(){
  static boolean led_state = true;
  digitalWrite(LED_BUILTIN, led_state);

  if (led_state)
    Serial.println("[REPLY] Builtin LED state: ON");
  else
    Serial.println("[REPLY] Builtin LED state: OFF");

  led_state = !led_state;
}

void TURN_LED_ON(){
  digitalWrite(EXT_LED, HIGH);

  Serial.println("[REPLY] External LED state: ON");
}

void TURN_LED_OFF(){
  digitalWrite(EXT_LED, LOW);

  Serial.println("[REPLY] External LED state: OFF");
}

void StreamData(){
  static boolean external_led_state = false;

  external_led_state = !external_led_state;
  digitalWrite(EXT_LED,external_led_state);

  Serial.println("[REPLY] " + String(random(101)));

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
}
