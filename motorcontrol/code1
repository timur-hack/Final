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
