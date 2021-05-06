class Ball { //class initialisation

  //setting variables
  PVector pos;
  PVector speed;
  PVector gravity;
  int r;
  Ball(float x, float y) {  //constructor
    pos=new PVector(x, y);
    speed=new PVector(random(-4, 4), random(0, 2));
    gravity = new PVector(0, 0.2);
    r=30;
  }
  void show() {
    fill(255, 0, 0);
    circle(pos.x, pos.y, r);
  }
  void update() {
    if (pos.y>height) {
      pos.y=-20;
    }
    if (pos.x+speed.x>width||pos.x+speed.x<0) {
      speed.x=-speed.x;
    } 
    pos.add(speed);
    pos.add(gravity);
  }
}
