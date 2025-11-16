#define trigPin 12
#define echoPin 11
#define po A0
#define po2 A1

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

void potencio(){
  int val;
  int val2;
  val = analogRead(po);
  val2 = analogRead(po2);
  Serial.print(val);
  Serial.print(val2);
}

void StreamData(){
 // Serial.println("[REPLY] " + String(random(101)));
  Serial.print(measureDistance());
  potencio();
}

void StopStream(){
  Serial.println("[REPLY] STREAM STOPPED");
}

void UnknownReply(String req){
  Serial.println("[REPLY] Unknown request: " + req + ".");
}

void setup() {
  Serial.begin(9600);
  Serial.setTimeout(100);
  pinMode (echoPin, INPUT);
  pinMode (trigPin, OUTPUT);

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


