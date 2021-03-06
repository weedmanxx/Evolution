class Herbivore {

  float x, y, xSpeed, ySpeed, speed, sight, memory, intET, eggTime, hatchTime, lifeTime, lifeLeft, maxFood, food; 
  
  Herbivore(float _x, float _y, float _speed, float _sight, float _memory, float _eggTime, float _hatchTime, float _lifeTime, float _maxFood) {
   
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
    
    maxFood = _maxFood;
    
    food = round(maxFood/2);
    
  }
  
  
  void display() {
   
    fill(#83A6F0); // Light-ish blue
    noStroke();
    ellipse(x, y, 5, 5);
    
  }
  
  void move() {
   
    eggTime -= 1/frameRate;
    lifeLeft -= 1/frameRate;
    food -= 1/(frameRate*10);
    
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
}