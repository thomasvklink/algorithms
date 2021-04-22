RedDot[] redDot;

void setup() {
  size(600, 600);
  redDot = new RedDot[200];
  for (int i=0; i<redDot.length; i++) {
    redDot[i] = new RedDot(random(0, width), random(0, height));
  }
}

void draw() {
  background(0);
  for (int i=0; i<redDot.length; i++) {
    redDot[i].show();
  }
}
