Foreground foreground;
Drop[] drops = new Drop[150];

void setup() {
  size(720, 720);
  foreground = new Foreground(width/2, height/2);
  for (int i = 0; i < drops.length; i++) {
    drops[i] = new Drop(random(0, width), random(0, height)); // Create each object
  }
}

void draw() {
  background(31, 115, 255);
  foreground.display();
  for (int i = 0; i < drops.length; i++) {
    drops[i].display();
    drops[i].update();
  }
}

void keyPressed() {
  if (key == CODED) {
    for (int i = 0; i < drops.length; i++) {
      drops[i].wind(keyCode, 0.0+(0.01*i));
    }
  }
}

//Rain drop
//Position with PVector
//Speed and direction (limited due to gravity) with Pvector added
//Wind can be added to direction
//Fall from a cloud
