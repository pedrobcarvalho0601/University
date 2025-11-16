#include <LiquidCrystal.h>

LiquidCrystal lcd(7, 6, 5, 4, 3, 2);
unsigned long lastUpdate;

byte Heart[] = {
  B00000,
  B01010,
  B11111,
  B11111,
  B01110,
  B00100,
  B00000,
  B00000
};
byte Bell[] = {
  B00100,
  B01110,
  B01110,
  B01110,
  B11111,
  B00000,
  B00100,
  B00000
};
byte Alien[] = {
  B11111,
  B10101,
  B11111,
  B11111,
  B01110,
  B01010,
  B11011,
  B00000
};
byte Check[] = {
  B00000,
  B10001,
  B01010,
  B00100,
  B01010,
  B10001,
  B00000,
  B00000
};
byte Speaker[] = {
  B00001,
  B00011,
  B01111,
  B01111,
  B01111,
  B00011,
  B00001,
  B00000
};
byte Sound[] = {
  B00001,
  B00011,
  B00101,
  B01001,
  B01001,
  B01011,
  B11011,
  B11000
};
byte Skull[] = {
  B00000,
  B01110,
  B10101,
  B11011,
  B01110,
  B01110,
  B00000,
  B00000
};
byte Lock[] = {
  B01110,
  B10001,
  B10001,
  B11111,
  B11011,
  B11011,
  B11111,
  B00000
};

void setup() {

  lcd.begin(16, 2);

  lcd.createChar(0, Heart);
  lcd.createChar(1, Bell);
  lcd.createChar(2, Alien);
  lcd.createChar(3, Check);
  lcd.createChar(4, Speaker);
  lcd.createChar(5, Sound);
  lcd.createChar(6, Skull);
  lcd.createChar(7, Lock);

  lcd.clear();
}
void loop() {
  lcd.setCursor(random(0, 16), random(0, 2));
  lcd.write(byte(0));
  lcd.setCursor(random(0, 16), random(0, 2));
  lcd.write(byte(1));
  lcd.setCursor(random(0, 16), random(0, 2));
  lcd.write(byte(2));
  lcd.setCursor(random(0, 16), random(0, 2));
  lcd.write(byte(3));
  lcd.setCursor(random(0, 16), random(0, 2));
  lcd.write(byte(4));
  lcd.setCursor(random(0, 16), random(0, 2));
  lcd.write(byte(5));
  lcd.setCursor(random(0, 16), random(0, 2));
  lcd.write(byte(6));
  lcd.setCursor(random(0, 16), random(0, 2));
  lcd.write(byte(7));
  delay(5000);
  lcd.clear();
}
