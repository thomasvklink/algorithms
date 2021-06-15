//This is a class Particle in which the particle gets created.

class Particle { //class initialisation

  //setting variables
  PVector pos;
  PVector speed;
  int r;
  int lifetime;
  int shape;

  Particle(float x, float y) {  //constructor
    pos=new PVector(x, y);
    speed=new PVector(random(-1, 1), random(2, 4));
    lifetime = int(random(20, 90)); //Random lifetime between 20 - 90 frames
  }

  void show() {
    fill(5, 38, 123, lifetime); //Transparency increases as lifetime does. Fade out effect.
     pushMatrix();
      translate(pos.x, pos.y+15);
      circle(0, 0, 10);
      triangle(-5, 0, 0, -15, 5, 0);
    popMatrix();
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
