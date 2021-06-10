Ball ball;
Catapult catapult;
Wall wall;

void setup() {
  size(1000, 600); 
  ball = new Ball(width/3, height/2-100);
  catapult= new Catapult (width/3, height/2, ball);
  wall = new Wall(width/1.1, height-100);
}

void draw() {
  background(0, 0, 0);
  catapult.show();
  wall.show();
  wall.collision(ball);
}
void mouseDragged() {
  catapult.dragHandler(mouseX, mouseY);
}
void mouseReleased() {
  catapult.releasedHandler(mouseX, mouseY, pmouseX, pmouseY);
}
