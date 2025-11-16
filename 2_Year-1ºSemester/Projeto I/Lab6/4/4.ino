#include <TFT.h>
#include <SPI.h>

#define cs 10
#define dc 8
#define rst 9
int p = A0;

TFT TFTscreen = TFT(cs, dc, rst);

int x = 0, xpast = 0;
int height = 1, heightpast = 0;

void graphDraw (int x, int height, int xpast, int heightpast) {
  TFTscreen.stroke(255, 0, 0);
  
  TFTscreen.line(xpast, heightpast, x, height);
}

void setup() {
  Serial.begin(9600);

  TFTscreen.begin();
  TFTscreen.background(255, 255, 255);
}

void loop() {
  heightpast = height;
  height = analogRead(p) / 8; 
  Serial.println(height);

  if(height > 127 || height < 0){
    height = heightpast = x = xpast = 0;
    TFTscreen.background(255, 255, 255);
  }

  xpast = x;
  x = x + 1;
  
  if (x >= 159){
    x = xpast = 0;
    TFTscreen.background(255, 255, 255);
  }

  graphDraw (x, height, xpast, heightpast);

  delay(50);
}
  
