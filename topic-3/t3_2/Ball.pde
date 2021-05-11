class Ball { //class initialisation

  //setting variables
  PVector pos;
  PVector speed;
  PVector gravity;
  int r;
  Ball(float x, float y) {  //constructor
    pos=new PVector(x, y);
    speed=new PVector(0, 0);
    gravity = new PVector(0, 0);
    r=30;
  }
  void show() {
    fill(255, 0, 0);
    circle(pos.x, pos.y, r);
  }
  void update() {
    if (r+pos.y>=height) {
      speed = new PVector(0, 0);
      gravity = new PVector (0, 0);
    }
    if (r+pos.y<=0) {
      speed.y=-speed.y;
    }
    if (pos.x+speed.x>width||pos.x+speed.x<0) {
      speed.x=-speed.x;
    } 
    speed.add(gravity);
    pos.add(speed);
  }
  void drag(float initMouseX, float initMouseY) {
    pos = new PVector(initMouseX, initMouseY);
    speed = new PVector(0, 0);
    gravity= new PVector(0, 0);
  }
  void released(float initMouseX, float initMouseY, float ballMovementX, float ballMovementY) {
    PVector temporary = new PVector ((-(initMouseX-ballMovementX)), -(initMouseY-ballMovementY));
    speed=temporary.normalize().copy();
    speed.mult(temporary.mag()*10);
    gravity = new PVector(0, 0.2);
  }
}
