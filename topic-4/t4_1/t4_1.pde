//Topic 4 - 1
Rocket rocket;

void setup() {
  size(1080, 720);
  rectMode(CENTER);
  rocket = new Rocket(width/2,height/2);
}

void draw() {
  background(50);
  rocket.display();
  rocket.update();
}

void mouseDragged(){
  rocket.control(mouseX, mouseY);
}
