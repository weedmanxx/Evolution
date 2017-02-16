ArrayList < Carnivore > carnivores = new ArrayList < Carnivore > ();
ArrayList < Herbivore > herbivores = new ArrayList < Herbivore > ();
ArrayList < Food > foods = new ArrayList < Food > ();
ArrayList < Egg > eggs = new ArrayList < Egg > ();

boolean drawSight = false;

void setup() {

 fullScreen();
 noStroke();

 /* 
  
   ===~~~---> TO DO <---~~~===
 
   - fix life time
   - fix starting parameters
   - REALLY need to fix starting parameters
   - add food/hunger
   - Ask dino for suggestions
 
 */


 //x, y, speed, sight, how long thing remembers other thing, time per egg layed, time for said egg to hatch, lifetime
 carnivores.add(new Carnivore(random(width), random(height), 5, 500, 5, 5, .5, 5));
 herbivores.add(new Herbivore(random(width), random(height), 4, 500, 5, 2, .5, 5));

}

void draw() {

 background(255);

 carnivoreActions();
 herbivoreActions();
 death();
 eggActions();

}

void mousePressed() {



}

void keyPressed() {

 if (key == 's') {

  drawSight = !drawSight;

 }

}

void death() {

 for (Carnivore c: carnivores) {

  if (c.lifeTime < 0) {

   carnivores.remove(c);
   break;

  }

 }

 for (Herbivore h: herbivores) {

  if (h.lifeTime < 0) {

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
  
 }
 
}

void hatching() {

 for (Egg e: eggs) {

  if (e.hatchTime < 0) {
   if (e.typeC) {

    carnivores.add(new Carnivore(e.x, e.y, e.newSpeed, e.newSight, e.newMemory, e.newEggTime, e.newHatchTime, e.newLifeTime));

   } else {

    herbivores.add(new Herbivore(e.x, e.y, e.newSpeed, e.newSight, e.newMemory, e.newEggTime, e.newHatchTime, e.newLifeTime));

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

   eggs.add(new Egg(h.x, h.y, false, h.speed, h.sight, h.memory, h.eggTime, h.hatchTime, h.lifeTime));

  }

 }

 for (Carnivore c: carnivores) {

  if (c.eggTime < 0) {

   c.eggTime = c.intET;

   eggs.add(new Egg(c.x, c.y, true, c.speed, c.sight, c.memory, c.eggTime, c.hatchTime, c.lifeTime));

  }

 }

}