//class for the Red Dots

class RedDot { //class initialisation
  PVector pos;
  int r;
  RedDot(float x, float y) { //constructor
    pos=new PVector(random(x), random(y));
    r = 30;
  }
  void show() {
    fill(255, 0, 0);
    circle(pos.x, pos.y, r);
  }
}
