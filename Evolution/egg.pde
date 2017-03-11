class Egg {
 
  boolean typeC; // < Carnivore?
  float hatchTime;
  float x, y;
  
  float newSpeed, newSight, newMemory, newEggTime, newHatchTime, newLifeTime, newMaxFood; 
  
  //vvv  Hatched thing stats  vvv
  
  
  Egg(float _x, float _y, boolean c, float _newSpeed, float _newSight, float _newMemory, float _newEggTime, float _newHatchTime, float _newLifeTime, float _newMaxFood) {
    
    newSpeed = _newSpeed;
    newSight = _newSight;
    newMemory = _newMemory;
    newEggTime = _newEggTime;
    newHatchTime = _newHatchTime;
    newLifeTime = _newLifeTime;
    
    x = _x;
    y = _y;
    
    typeC = c;
    hatchTime = newHatchTime;
    
    newSpeed += evolve();
    newSight += evolve();
    newMemory += evolve();
    newEggTime += evolve();
    newHatchTime += evolve();
    newLifeTime += evolve();
    newMaxFood += evolve();
    
    if(newSpeed < 1) {
      
      newSpeed = 1;
      
    }
    
    if(newSight < 0) {
     
      newSight = 0;
      
    }
    
    if(newMemory < 1) {
     
      newMemory = 1;
      
    }
    
    if(newEggTime < 1) {
     
      newEggTime = 1;
      
    }
    
    if(newHatchTime < 1) {
      
      newHatchTime = 1;
      
    }
    
    if(newLifeTime < 1) {
     
      newLifeTime = 1;
      
    }
    
    if(newMaxFood < 2) {
     
      newMaxFood = 2;
      
    }
    
    
  }
  
  void update() {
   
   noFill();
   stroke(0);
   ellipse(x, y, 5, 5);
    
   hatchTime -= 1/frameRate; 
    
  }
  
  int evolve() {
    
    int changeAmount = 0;
    int keepChanging;
    int negative = 0;
    
    negative = int(random(0, 2));
    
    if(negative == 0) {
     
      negative = -1;
      
    }
    
    keepChanging = int(random(1000));
    
    while(keepChanging < 333) {
      
      keepChanging = int(random(1000));
      
      changeAmount++;
      
    }
    
    return changeAmount * negative;
    
  }
  
}