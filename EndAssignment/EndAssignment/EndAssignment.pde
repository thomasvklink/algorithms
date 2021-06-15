Flocking flock;
Water water;
Boat ship;
Control control;

void setup() {
  flock = new Flocking();
  water = new Water();
  fullScreen();
  shapeMode(CENTER);
  ship = new Boat(width/2, height/2);
  ship.load();
  control = new Control(width-200, height-200);
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
  control.update();
  control.render();
}

void mouseDragged(){
  flock.addBird(new Bird(mouseX, mouseY));
}

void mousePressed(){
  control.operate(mouseX,mouseY);
}
