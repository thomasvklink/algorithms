/*
  This is a class that creates the guests which want to ride the pirate ship.
*/

class Guest {

  int xPos;
  int yPos;
  
  color shirt;

  Guest() {
    int r = int(random(0,255));
    int g = int(random(0,255));
    int b = int(random(0,255));
    shirt = color(r,g,b);
  }

  void render(int xPos, int yPos) {
    noStroke();
    fill(shirt);
    rect(xPos-25, yPos-38, 20,35);
    fill(255,214,188);
    circle(xPos-15, yPos-50, 20);
  }
}
