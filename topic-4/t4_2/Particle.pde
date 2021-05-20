//This is a class Particle in which the particle gets created.

class Particle { //class initialisation

  //setting variables
  PVector pos;
  PVector speed;
  int r;
  int lifetime;
  float green;
  int shape;

  Particle(float x, float y) {  //constructor
    pos=new PVector(x, y);
    speed=new PVector(random(-1, 1), random(2, 4));
    r=15; //15px radius
    lifetime = int(random(20, 90)); //Random lifetime between 20 - 90 frames
    shape = int(random(1, 3));
  }

  void show() {
    green = lifetime*1.5; //Color fade from orange to red
    fill(255, green, 20, lifetime); //Transparency increases as lifetime does. Fade out effect.
    if (shape == 1) {
      circle(pos.x, pos.y, r*1.5); //Draw the actual circle
    } else {
      fill(134, 134, 134, lifetime); //Transparency increases as lifetime does. Fade out effect.
      rect(pos.x, pos.y, r, r); //Draw the actual rectangle
    }
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
