//Topic 4 - 2
Rocket rocket;
Stars stars;

void setup() {
  size(1080, 720);
  rectMode(CENTER);
  rocket = new Rocket(width/2, height-100);
  stars = new Stars(width/2, height/2);
}

void draw() {
  background(40);
  stars.display();
  stars.update();
  rocket.display();
  rocket.update();
}

void mouseDragged() {
  rocket.control(mouseX, mouseY);
}
