//This is the class that calls the particles from the class Star and puts them together in one Stars object.

class Stars { //class initialisation

  //setting variables
  PVector pos;
  Star[] stars;

  Stars(float x, float y) { //constructor
    pos=new PVector(x, y);
    stars = new Star[100];

    for (int i=0; i < stars.length; i++) {
      stars[i] = new Star(random(0, width), random(0, height));
    }
  }

  void update() {
    for (int i=0; i<stars.length; i++) {
      stars[i].update();
    }
  }

  void display() {
    for (int i=0; i<stars.length; i++) {
      stars[i].show();
    }
  }
}
