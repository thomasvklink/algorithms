//This is a class Star in which the particle gets created.

class Star { //class initialisation

  //setting variables
  PVector pos;
  PVector speed;
  int r;



  Star(float x, float y) {  //constructor
    pos=new PVector(x, y);
    speed=new PVector(0, 1);
    r=int(random(7, 10)); //10px radius
  }

  void show() {
    fill(255); //Transparency increases as lifetime does. Fade out effect.
    circle(pos.x, pos.y, r); //Draw the actual circle
  }

  void update() {
    pos.add(speed);
    reset();
  }


  void reset() {
    if (pos.y > height + r) {
      pos.y = -r;
      pos.x = random(0, width);
    }
  }
}
