Ball ball;

void setup() {
  size(1000, 600); 

  ball = new Ball(100, 300);
}

void draw() {
  background(0, 0, 0);
  ball.show();
  ball.update();
  println(ball.speed);
}
void mouseDragged() {
  ball.drag(mouseX, mouseY);
}
void mouseReleased() {
  ball.released(mouseX, mouseY, pmouseX, pmouseY);
}
