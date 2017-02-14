class Food {
 
  float x, y, size;
  
  Food() {
   
    x = random(width);
    y = random(height);
    
    size = random(2, 10);
    
  }
  
  void display() {
   
    fill(#85E31B); //Light green
    noStroke();
    ellipse(x, y, 3, 3);
    
  }
  
}