ArrayList < Carnivore > carnivores = new ArrayList < Carnivore > ();
ArrayList < Herbivore > herbivores = new ArrayList < Herbivore > ();
ArrayList < Food > foods = new ArrayList < Food > ();
ArrayList < Egg > eggs = new ArrayList < Egg > ();

boolean drawSight = false;



void setup() {
 
 //Table table = new Table(); 
  
 //table.addColumn("Time (seconds)"); 
 //table.addColumn("Speed");
 //table.addColumn("Sight");
 //table.addColumn("Memory"); 
 //table.addColumn("Time per egg layed");
 //table.addColumn("Time for egg to hatch");
 //table.addColumn("Life time");
 
 textSize(16);  
  
 fullScreen();
 noStroke();

 /* 
  
   ===~~~---> TO DO <---~~~===
 
   - fine tune starting parameters
   - add food/hunger
   - Ask dino for suggestions
 
 */


 //x, y, speed, sight, how long thing remembers other thing, time per egg layed, time for said egg to hatch, lifetime
 
 for(int i = 0; i < 2; i++) {
 
 //carnivores.add(new Carnivore(random(width), random(height), 5, 500, 5, 5000, 5, 50));
 herbivores.add(new Herbivore(random(width), random(height), 2, 2000, 5, 3, 2, 10, 5));

 }
 
 for(int i = 0; i < 10; i++) {
 
 foods.add(new Food());
   
 }

}

void draw() {

 background(255);
 
 printAvgs();

 carnivoreActions();
 herbivoreActions();
 death();
 eggActions();
 foodStuff();
 
 for(Herbivore h : herbivores) {
  
   h.x = mouseX;
   h.y = mouseY;
   
 }
 

}

void foodStuff() {
 
  for(Food f : foods) {
    
    f.display();
    
  }
  
}

void printAvgs() {
 
    int i = 0;
    float totalSpeed = 0;
    float totalSight = 0;
    float totalMemory = 0;
    float totalEggTime = 0;
    float totalLifeTime = 0;
    float totalHatchTime = 0; 
    float totalFood = 0;
     
  for(Herbivore h : herbivores) {
   
    i++;
    
    totalSpeed += h.speed;
    totalSight += h.sight;
    totalMemory += h.memory;
    totalEggTime += h.intET;
    totalLifeTime += h.lifeTime;
    totalHatchTime += h.hatchTime;
    totalFood += h.food;
    
  }
  
  String avg = "Averages - Speed: " + (totalSpeed / i) + ", Sight: " + totalSight / i + ", Memory: " + totalMemory / i + ", Time per egg layed: " + totalEggTime / i + ", Time for egg to hatch: " + totalHatchTime / i + ", Lifetime: " + totalLifeTime / i + ", Food: " + totalFood / i;
  
  println(avg);
  
  //println("Averages - Speed: " + totalSpeed / i + ", Sight: " + totalSight / i + ", Memory: " + totalMemory / i + ", Time per egg layed: " + totalEggTime / i + ", Time for egg to hatch: " + totalHatchTime / i + ", Lifetime: " + totalLifeTime / i);
  
  stroke(0);
  fill(0);
  text(avg, 4, height - 5);
  
}

void mousePressed() {

    int i = 0;
    float totalSpeed = 0;
    float totalSight = 0;
    float totalMemory = 0;
    float totalEggTime = 0;
    float totalLifeTime = 0;
   
  
  for(int j = 0; j < 5; j++) {
   
    if(j == 2) {
    
    println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
      
    } else {
   
    println("");
   
    }
    
  }
  
 
  
  for(Herbivore h : herbivores) {
   
    i++;
    
    println("Heribvore #" + i + " - Speed: " + h.speed + ", Sight: " + h.sight + ", Memory: " + h.memory + ", Time per egg layed: " + h.intET + ", Life time: " + h.lifeTime);
    
    totalSpeed += h.speed;
    totalSight += h.sight;
    totalMemory += h.memory;
    totalEggTime += h.intET;
    totalLifeTime += h.lifeTime;
    
  }
  
  println("");
  
  println("Averages - Speed: " + totalSpeed / i + ", Sight: " + totalSight / i + ", Memory: " + totalMemory / i + ", Time per egg layed: " + totalEggTime / i + ", Lifetime: " + totalLifeTime / i);

}

void keyPressed() {

 if (key == 's') {

  drawSight = !drawSight;

 }
 
 

}

void death() {

 for (Carnivore c: carnivores) {

  if (c.lifeLeft < 0) {

   carnivores.remove(c);
   break;

  }

 }

 for (Herbivore h: herbivores) {

  if (h.lifeLeft < 0) {

   herbivores.remove(h);
   break;

  }

 }

}

void eggActions() {

 for (Egg e: eggs) {

  e.update();

 }

 eggLaying();
 hatching();

}

void carnivoreActions() {

 for (Carnivore c: carnivores) {

  c.display();
  c.move();

  noFill();
  stroke(0);
  if (drawSight) {

   ellipse(c.x, c.y, c.sight * 2, c.sight * 2);

  }

  for (Herbivore h: herbivores) {

   if (dist(c.x, c.y, h.x, h.y) < 10) {

    herbivores.remove(h);
    break;

   }
  }

  for (Herbivore h: herbivores) {

   if (c.sight > dist(c.x, c.y, h.x, h.y)) {

    float xDist, yDist, hyp, speedCoeff;

    xDist = c.x - h.x;
    yDist = c.y - h.y;

    hyp = dist(c.x, c.y, h.x, h.y);

    speedCoeff = c.speed / hyp;

    c.xSpeed = -xDist * speedCoeff;
    c.ySpeed = yDist * speedCoeff;

   }






  }

 }

}

void herbivoreActions() {

 for (Herbivore h: herbivores) {

  h.display();
  h.move();

  noFill();
  stroke(0);

  if (drawSight) {

   ellipse(h.x, h.y, h.sight * 2, h.sight * 2);

    }

  for (Carnivore c: carnivores) {

   if (h.sight > dist(h.x, h.y, c.x, c.y)) {

    float xDist, yDist, hyp, speedCoeff;

    xDist = h.x - c.x;
    yDist = h.y - c.y;

    hyp = dist(c.x, c.y, h.x, h.y);

    speedCoeff = h.speed / hyp;

    h.xSpeed = xDist * speedCoeff;
    h.ySpeed = -yDist * speedCoeff;

   }

  }
  
  
  if(h.food < h.maxFood) {
    for (Food f: foods) {

   if (h.sight > dist(h.x, h.y, f.x, f.y)) {

    float xDist, yDist, hyp, speedCoeff;

    xDist = h.x - f.x;
    yDist = h.y - f.y;

    hyp = dist(f.x, f.y, h.x, h.y);

    speedCoeff = h.speed / hyp;

    h.xSpeed = -xDist * speedCoeff;
    h.ySpeed = yDist * speedCoeff;
    
    if(dist(f.x, f.y, h.x, h.y) < 10) {
       
      h.food++;   
      foods.remove(f);
      
      
    } 
   }

    break;

  }
  
  }
  
  
 }
 
}

void hatching() {

 for (Egg e: eggs) {

  if (e.hatchTime < 0) {
   if (e.typeC) {

    carnivores.add(new Carnivore(e.x, e.y, e.newSpeed, e.newSight, e.newMemory, e.newEggTime, e.newHatchTime, e.newLifeTime));

   } else {

    herbivores.add(new Herbivore(e.x, e.y, e.newSpeed, e.newSight, e.newMemory, e.newEggTime, e.newHatchTime, e.newLifeTime, e.newMaxFood));

   }

   eggs.remove(e);
   break;

  }

 }

}

void eggLaying() {

 for (Herbivore h: herbivores) {

  if (h.eggTime < 0) {

   h.eggTime = h.intET;

   eggs.add(new Egg(h.x, h.y, false, h.speed, h.sight, h.memory, h.eggTime, h.hatchTime, h.lifeTime, h.maxFood));

  }

 }

 for (Carnivore c: carnivores) {

  if (c.eggTime < 0) {

   c.eggTime = c.intET;

   eggs.add(new Egg(c.x, c.y, true, c.speed, c.sight, c.memory, c.eggTime, c.hatchTime, c.lifeTime, /* PLACE HOLD */ 0));

  }

 }

}

float round(float number, float decimal) {
    
  return (float)(round((number*pow(10, decimal))))/pow(10, decimal);
  
  //stolen from internet http://stackoverflow.com/questions/9627182/how-do-i-limit-decimal-precision-in-processing
  
} 