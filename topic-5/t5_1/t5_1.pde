Flock flock;
Rock rock;

void setup() {
  size(1080,720);
  rectMode(CENTER);
  flock = new Flock();
  // Add an initial set of boids into the system
  for (int i = 0; i < 200; i++) {
    Boid b = new Boid(width/2,height/2);
    flock.addBoid(b);
  }
  rock = new Rock(width/2+100, height/2);
}

void draw() {
  background(46,65,255);
  flock.run();
  rock.render();
  // Instructions
  fill(0);
  text("Drag the mouse to generate new boids.",10,height-16);
}

// Add a new boid into the System
void mouseDragged() {
  flock.addBoid(new Boid(mouseX,mouseY));
}
