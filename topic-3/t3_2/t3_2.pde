Ball ball;
Catapult catapult;

void setup() {
  size(1000, 600); 
  ball = new Ball(width/5, height/2-100);
  catapult= new Catapult (width/5, height/2, ball);
}

void draw() {
  background(0, 0, 0);
  catapult.show();
}
void mouseDragged() {
  catapult.dragHandler(mouseX, mouseY);
}
void mouseReleased() {
  catapult.releasedHandler(mouseX, mouseY, pmouseX, pmouseY);
}
