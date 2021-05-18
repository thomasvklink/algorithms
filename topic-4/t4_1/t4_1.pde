//Topic 4 - 1
Rocket rocket;

void setup() {
  size(1080,720);
  rectMode(CENTER);
  rocket = new Rocket(width/2,height-100);
}

void draw() {
  background(50);
  rocket.display();
  rocket.update();
}

void keyPressed() {
  if (key == CODED) {
    rocket.keyControl(keyCode);
  }
}

void mouseDragged(){
  rocket.mouseControl(mouseX, mouseY);
}
