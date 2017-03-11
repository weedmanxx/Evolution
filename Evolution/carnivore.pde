class Carnivore {
 
  float x, y, xSpeed, ySpeed, speed, sight, memory, intET, eggTime, hatchTime, lifeTime, lifeLeft; 
  
  Carnivore(float _x, float _y, float _speed, float _sight, float _memory, float _eggTime, float _hatchTime, float _lifeTime) {
   
    x = _x;
    y = _y;
    
    speed = _speed;
    
    float a = random(359);
    
    xSpeed = speed * cos(radians(a));
    ySpeed = speed * sin(radians(a));
    
    sight = _sight;
    memory = _memory;
    
    intET = _eggTime;
    eggTime = _eggTime;
    hatchTime = _hatchTime;
    
    lifeTime = _lifeTime;
    lifeLeft = lifeTime;
    
  }
  
  void display() {
   
    fill(#D80D36); // Red
    noStroke();
    ellipse(x, y, 6, 6);
    
  }
  
  void move() {
   
    eggTime -= 1/frameRate;
    lifeLeft -= 1/frameRate;
    
    x += xSpeed;
    y -= ySpeed;
    
    if(x > width) {
     
      x = 0;
      
    }
    
    if(x < 0) {
      
      x = width;
      
    }
      
    if(y > height) {
     
      y = 0;
      
    }
    
    if(y < 0) {
      
      y = height;
      
    }
    
    
  }
  
  void changeSpeed() {
   
    float a = random(359);
    
    xSpeed = speed * cos(radians(a));
    ySpeed = speed * sin(radians(a));
    
  }
  
}