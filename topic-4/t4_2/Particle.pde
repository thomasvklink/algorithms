//This is a class Particle in which the particle gets created.

class Particle { //class initialisation

  //setting variables
  PVector pos;
  PVector speed;
  int r;
  int lifetime;
  float green;

  Particle(float x, float y) {  //constructor
    pos=new PVector(x, y);
    speed=new PVector(random(-1, 1), random(2, 4));
    r=15; //10px radius
    lifetime = int(random(20, 90)); //Random lifetime between 20 - 90 frames
  }

  void show() {
    green = lifetime*1.5; //Color fade from orange to red
    fill(255, green, 20, lifetime); //Transparency increases as lifetime does. Fade out effect.
    circle(pos.x, pos.y, r); //Draw the actual circle
    rect(pos.x, pos.y, 10, 10); //Draw the actual rectangle
  }

  void update() {
    pos.add(speed); //SPEEED
    lifetime --; //Decrease lifetime each frame
  }

  boolean isDead() {
    return lifetime==0; //Method to check if the particle is dead
  }

  void reset(float posX, float posY) {
    pos.x = posX;
    pos.y = posY;
    lifetime = int(random(20, 90));
  }
}
