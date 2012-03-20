// Jeremy Saglimbeni - 2011 - http://thecustomgeek.com

char datain[9];
int i;
int led = 3;
int ledLevel;
int index;
int targetValue;
char digit1[1];
char digit2[1];
char digit3[1];
String mystring;
void setup() {
  pinMode(led, OUTPUT);
  Serial.begin(9600);
  Serial.println("Ready for command!");
}
void loop() {
  index = 0;
  while(Serial.available() > 0 && index < 9)
  {
    char aChar = Serial.read();
    datain[index] = aChar;
    index++;
    datain[index] = '\0'; // Keep the string NULL terminated   
  }
  String mystring = datain;
  if (mystring.startsWith("led")) {
    digit1[1] = datain[4];
    digit2[1] = datain[5];
    digit3[1] = datain[6];
    targetValue = atoi(digit2);
    adjust(targetValue);
    datain[1] = '-';
  }
  delay(50);
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
  Serial.print("Old LED level:");
  Serial.print(ledLevel);
  ledLevel = targetValue;
  Serial.print("   New LED level:");
  Serial.println(ledLevel);
}
