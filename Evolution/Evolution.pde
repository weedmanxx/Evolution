ArrayList<Carnivore> carnivores = new ArrayList<Carnivore>(); 
ArrayList<Herbivore> herbivores = new ArrayList<Herbivore>(); 
ArrayList<Food> foods = new ArrayList<Food>(); 

void setup() {
 
  fullScreen();
  noStroke();
  
  carnivores.add(new Carnivore(random(width), random(height), 9.99, 500, 5)); 
  
  herbivores.add(new Herbivore(random(width), random(height), 10, 25, 5));
  
}

void draw() {
  
  background(255);
  
  carnivoreActions();
  herbivoreActions();
  
  
}

void mousePressed() {
 
  
  
}
  
void carnivoreActions() {
  
 for(Carnivore c : carnivores) {
   
    c.display();
    c.move();
    
    noFill();
    stroke(0);
    ellipse(c.x, c.y, c.sight*2, c.sight*2);
    
    for(Herbivore h : herbivores) {
     
      if(c.sight > dist(c.x, c.y, h.x, h.y)) {
       
        float xDist, yDist, hyp, speedCoeff;
        
        xDist = c.x - h.x;
        yDist = c.y - h.y;
        
        hyp = dist(c.x, c.y, h.x, h.y);
        
        speedCoeff = c.speed / hyp;
      
        c.xSpeed = -xDist * speedCoeff;
        c.ySpeed = yDist * speedCoeff;
      
      }
      
      if(dist(c.x, c.y, h.x, h.y) < 10) {
       
        h.x = random(width);
        h.y = random(height);
        
      }
      
    } 
  }
  
}

void herbivoreActions() {
 
    for(Herbivore h : herbivores) {
   
    h.display();
    h.move();
    
    noFill();
    stroke(0);
    ellipse(h.x, h.y, h.sight*2, h.sight*2);
    
    for(Carnivore c : carnivores) {
     
      if(h.sight > dist(h.x, h.y, c.x, c.y)) {
       
        float xDist, yDist, hyp, speedCoeff;
        
        xDist = h.x - c.x;
        yDist = h.y - c.y;
        
        hyp = dist(c.x, c.y, h.x, h.y);
        
        speedCoeff = h.speed / hyp;
      
        h.xSpeed = xDist * speedCoeff;
        h.ySpeed = -yDist * speedCoeff;
      
          }      
      
        } 
      }
    }
  

  