Flocking flock;
Water water;
Boat ship;

void setup() {
  flock = new Flocking();
  water = new Water();
  fullScreen();
  shapeMode(CENTER);
  ship = new Boat(width/2, height/2);
  ship.load();
}

void draw(){
  background(224,255,255);
  ship.update();
  water.movingWater();
  flock.update();
  flock.render();
  ship.render();
}

void mouseDragged(){
  flock.addBird(new Bird(mouseX, mouseY));
}
