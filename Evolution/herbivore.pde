class Herbivore {

  float x, y, xSpeed, ySpeed, speed, sight, memory; 
  
  Herbivore(float _x, float _y, float _speed, float _sight, float _memory) {
   
    x = _x;
    y = _y;
    
    speed = _speed;
    
    float a = random(359);
    
    xSpeed = speed * cos(radians(a));
    ySpeed = speed * sin(radians(a));
    
    sight = _sight;
    memory = _memory;
    
  }
  
  
  void display() {
   
    fill(#83A6F0); // Light-ish blue
    noStroke();
    ellipse(x, y, 5, 5);
    
  }
  
  void move() {
   
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