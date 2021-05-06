Ball ball;

void setup() {
  size(1000, 600); 

  ball = new Ball(random(0, width), random(-1000, 0));
}

void draw() {
  background(0,0,0);
  ball.show();
  ball.update();
}
