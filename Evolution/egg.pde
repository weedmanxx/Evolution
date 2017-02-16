class Egg {
 
  boolean typeC; // < Carnivore?
  float hatchTime;
  float x, y;
  
  float newSpeed, newSight, newMemory, newEggTime, newHatchTime, newLifeTime; 
  
  //vvv  Hatched thing stats  vvv
  
  
  Egg(float _x, float _y, boolean c, float _newSpeed, float _newSight, float _newMemory, float _newEggTime, float _newHatchTime, float _newLifeTime) {
    
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
    
    keepChanging = int(random(1000));
    
    while(keepChanging < 333) {
      
      keepChanging = int(random(1000));
      
      changeAmount++;
      
    }
    
    return changeAmount;
    
  }
  
}