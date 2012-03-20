// Jeremy Saglimbeni - 2011 - http://thecustomgeek.com

int i;
int led = 3;
int ledLevel;
int targetValue;
void setup() {
  pinMode(led, OUTPUT);
}
void loop() {
  //awesome code here
    adjust(255);
    delay(1000); //time to do more awesome code
    adjust(127);
    delay(1000); //additional code here
    adjust(25);
    delay(1000); //grand slam ending code here
}

void adjust(int targetValue)  {
  if (ledLevel < targetValue) {
    for (int x = ledLevel; x <= targetValue; x++) {
      analogWrite(led, x);
      delay(8);
    }
  }

  if (ledLevel > targetValue) {
    for (int x = ledLevel; x >= targetValue; x--) {
      analogWrite(led, x);
      delay(8);
    }
  }
  ledLevel = targetValue;
}
