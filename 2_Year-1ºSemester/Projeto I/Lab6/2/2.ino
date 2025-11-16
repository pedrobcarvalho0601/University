#include <TFT.h>
#include <SPI.h>

#define cs 10
#define dc 8
#define rst 9

TFT TFTscreen = TFT(cs, dc, rst);

int xPos = 0;

void drawSquare() {
  int bgColorR = map(random(0, 256), 0, 255, 0, 255);
  int bgColorG = map(random(0, 256), 0, 255, 0, 255);
  int bgColorB = map(random(0, 256), 0, 255, 0, 255);
  TFTscreen.background(bgColorR, bgColorG, bgColorB);

  int strokeColorR = map(random(0, 256), 0, 255, 0, 255);
  int strokeColorG = map(random(0, 256), 0, 255, 0, 255);
  int strokeColorB = map(random(0, 256), 0, 255, 0, 255);
  TFTscreen.stroke(strokeColorR, strokeColorG, strokeColorB);
  
  TFTscreen.line(40, 24, 40, 104);  // Left line
  TFTscreen.line(40, 24, 120, 24);  // Top line
  TFTscreen.line(120, 24, 120, 104);  // Right line
  TFTscreen.line(40, 104, 120, 104);  // Bottom line
}

void drawTriangle() {
  int bgColorR = map(random(0, 256), 0, 255, 0, 255);
  int bgColorG = map(random(0, 256), 0, 255, 0, 255);
  int bgColorB = map(random(0, 256), 0, 255, 0, 255);
  TFTscreen.background(bgColorR, bgColorG, bgColorB);
  
  int strokeColorR = map(random(0, 256), 0, 255, 0, 255);
  int strokeColorG = map(random(0, 256), 0, 255, 0, 255);
  int strokeColorB = map(random(0, 256), 0, 255, 0, 255);
  TFTscreen.stroke(strokeColorR, strokeColorG, strokeColorB);
  
  TFTscreen.line(80, 96, 40, 32);  // Left line
  TFTscreen.line(80, 96, 120, 32);  // Right line
  TFTscreen.line(40, 32, 120, 32);  // Bottom line
}

void drawRectangle() {
  int bgColorR = map(random(0, 256), 0, 255, 0, 255);
  int bgColorG = map(random(0, 256), 0, 255, 0, 255);
  int bgColorB = map(random(0, 256), 0, 255, 0, 255);
  TFTscreen.background(bgColorR, bgColorG, bgColorB);
  
  int strokeColorR = map(random(0, 256), 0, 255, 0, 255);
  int strokeColorG = map(random(0, 256), 0, 255, 0, 255);
  int strokeColorB = map(random(0, 256), 0, 255, 0, 255);
  TFTscreen.stroke(strokeColorR, strokeColorG, strokeColorB);

  TFTscreen.line(50, 24, 50, 104);  // Left line
  TFTscreen.line(50, 24, 110, 24);  // Top line
  TFTscreen.line(110, 24, 110, 104);  // Right line
  TFTscreen.line(50, 104, 110, 104);  // Bottom line
}

void setup() {
  Serial.begin(9600);

  TFTscreen.begin();
  TFTscreen.background(250, 16, 200);
}

void loop() { 
  // Draw a square
  drawSquare();
  delay(2000);

  // Draw a triangle
  drawTriangle();
  delay(2000);

  // Draw a rectangle
  drawRectangle();
  delay(2000);
}
  
