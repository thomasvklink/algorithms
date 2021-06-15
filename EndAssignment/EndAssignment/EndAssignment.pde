Flocking flock;
Water water;

void setup() {
  size(600, 600);
  flock = new Flocking();
  water = new Water();
}

void draw() {
  background(224, 255, 255);
  flock.render();
  flock.update();
  water.render();
}

void mouseDragged(){
  flock.addBird(new Bird(mouseX, mouseY));
}
