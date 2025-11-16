#include <TFT.h>
#include <SPI.h>
#include <LiquidCrystal.h>

#define cs 10
#define dc 8
#define rst 9
int p = A0;

TFT TFTscreen = TFT(cs, dc, rst);

int x = 0, xpast = 0;
int height = 1, heightpast = 0;
double progress = 0;

LiquidCrystal lcd(7, 6, 5, 4, 3, 2);

byte Cube0[] = {
  B00000,
  B00000,
  B00000,
  B00000,
  B00000,
  B00000,
  B00000,
  B00000
};
byte Cube1[] = {
  B10000,
  B10000,
  B10000,
  B10000,
  B10000,
  B10000,
  B10000,
  B10000
};
byte Cube2[] = {
  B11000,
  B11000,
  B11000,
  B11000,
  B11000,
  B11000,
  B11000,
  B11000
};
byte Cube3[] = {
  B11100,
  B11100,
  B11100,
  B11100,
  B11100,
  B11100,
  B11100,
  B11100
};
byte Cube4[] = {
  B11110,
  B11110,
  B11110,
  B11110,
  B11110,
  B11110,
  B11110,
  B11110
};
byte Cube5[] = {
  B11111,
  B11111,
  B11111,
  B11111,
  B11111,
  B11111,
  B11111,
  B11111
};

void graphDraw (int x, int height, int xpast, int heightpast) {
  TFTscreen.stroke(255, 0, 0);
  
  TFTscreen.line(xpast, heightpast, x, height);
}

void progressDraw (double progress){
  int pos = 0;

  if(progress > 80)
    progress = 80;

  
  
  for (int i = 1; i <= 80){
     if(progress == i){
      pos = 80/i;
      lcd.setCursor(, random(0, 2));
      lcd.write(byte(0));
    }
  }
}

void setup() {
  Serial.begin(9600);

  TFTscreen.begin();
  TFTscreen.background(255, 255, 255);

  lcd.begin(16, 2);

  lcd.createChar(0, Cube0);
  lcd.createChar(1, Cube1);
  lcd.createChar(2, Cube2);
  lcd.createChar(3, Cube3);
  lcd.createChar(4, Cube4);
  lcd.createChar(5, Cube5);

  lcd.clear();
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

  //1 pixel = 12,8 no potenciometro
  //16x5 (80) pixels
  progress = height / 12,8;

  progressDraw (progress);

  delay(50);
}
  
