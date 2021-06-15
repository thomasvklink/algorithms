Flocking flock;
Water water;

void setup() {
  flock = new Flocking();
  water = new Water();
  fullScreen();
  ship = new Boat(width/2, height/2);
  ship.load();
}

void draw() {
  background(224, 255, 255);
  flock.render();
  flock.update();
  water.render();
  ship.render();
}

void mouseDragged(){
  flock.addBird(new Bird(mouseX, mouseY));
}
