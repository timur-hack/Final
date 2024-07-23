#define IN1 8
#define IN2 9
#define IN3 10
#define IN4 11

void setup() {
  // Установка пинов как выход
  pinMode(IN1, OUTPUT);
  pinMode(IN2, OUTPUT);
  pinMode(IN3, OUTPUT);
  pinMode(IN4, OUTPUT);
}

void loop() {
  moveForward();  
  delay(1000);   
  
  Stop();    
  delay(500);

  backWard();
  delay(1000);

   Stop();  
  delay(1000);
  
  }

void moveForward() {
  digitalWrite(IN1, HIGH); // Мотор 1 движется вперёд
  digitalWrite(IN2, LOW);
  digitalWrite(IN3, HIGH); // Мотор 2 движется вперёд
  digitalWrite(IN4, LOW);
}

void backWard() {
  digitalWrite(IN1, LOW); 
  digitalWrite(IN2, HIGH); //  Мотор 1 движется назад
  digitalWrite(IN3, LOW); 
  digitalWrite(IN4, HICH); // Мотор 2 движеться назад
}

 void Stop() { // остановка для калибровки
  digitalWrite(IN1, LOW);
  digitalWrite(IN2, LOW);
  digitalWrite(IN3, LOW);
  digitalWrite(IN4, LOW);
}

