#include <LiquidCrystal.h>

LiquidCrystal lcd (7, 6, 5, 4, 3, 2);
unsigned long lastUpdate;

void setup() {
  lcd.begin (16, 2);
  lcd.setCursor(3, 0);
  lcd.print("Projeto 1!");
  lcd.setCursor(0, 1);
  lcd.print("LCD 16x2 Screen");
  lastUpdate = millis();
}

void loop() {
  if((millis() - lastUpdate) > 250) {
    lcd.scrollDisplayRight();
    lastUpdate = millis();
  }
}
