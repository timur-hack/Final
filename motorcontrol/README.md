# Я создал управление двигателями на языке C++ с использованием платы arduino UNO двумя двигателями и контроллером L298N
IN1 (L298N) к пин 8 (Arduino)
IN2 (L298N) к пин 9 (Arduino)
IN3 (L298N) к пин 10 (Arduino)
IN4 (L298N) к пин 11 (Arduino)
# Этот код позволяет Arduino управлять двумя моторами с использованием драйвера L298N для выполнения движения по квадрату:

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
  
  turnRight();    
  delay(500);     
  
  moveForward();  
  delay(1000);    
  
  turnRight();   
  delay(500);    
  
  moveForward(); 
  delay(1000);    
  
  turnRight();   
  delay(500);    
  
  moveForward();  
  delay(1000);    
  
  turnRight();  
  delay(500);    
  }

void moveForward() {
  digitalWrite(IN1, HIGH); // Мотор 1 движется вперёд
  digitalWrite(IN2, LOW);
  digitalWrite(IN3, HIGH); // Мотор 2 движется вперёд
  digitalWrite(IN4, LOW);
}

void turnRight() {
  digitalWrite(IN1, HIGH); // Мотор 1 продолжает двигаться вперёд
  digitalWrite(IN2, LOW);
  digitalWrite(IN3, LOW);  // Мотор 2 движется назад
  digitalWrite(IN4, HIGH);
}
# Этот код позволяет Arduino управлять двумя моторами с использованием драйвера L298N для выполнения движения вперед на протижении одной секунды потом назад на первоначальную позицию :
  

  GNU nano 4.8                                                                                       code2                                                                                                 
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


