//This is a class Particle in which the particle gets created.

class Particle { //class initialisation

  //setting variables
  PVector pos;
  PVector speed;
  PVector gravity;
  int r;
  int lifetime;

  Particle(float x, float y) {  //constructor
    pos=new PVector(x, y);
    speed=new PVector(random(-2, 2), random(2, 4));
    r=10;
    lifetime = 255;
  }
  void show() {
    fill(255, 91, 20, lifetime);
    circle(pos.x, pos.y, r);
  }

  void update() {
    pos.add(speed);
    lifetime --;
  }

  boolean isDead() {
    return lifetime<0;
  }
}
