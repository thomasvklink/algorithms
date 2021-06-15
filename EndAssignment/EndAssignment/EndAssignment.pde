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
  for (int i = 0; i < 20; i++) {
    flock.addBird(new Bird(random(0, width), random(height/6, 0)));
  }
}

void draw() {
  background(224, 255, 255);
  ship.particles();
  ship.update();
  water.movingWater();
  flock.update();
  flock.render();
  ship.render();
}
