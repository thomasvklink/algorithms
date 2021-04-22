class Eyes {
  color innerEyeColor;
  color outerEyeColor;
  color irisColor;
  color evilEyesColor;
  float eyeX;
  float eyeY;
  boolean evilEyes;

  Eyes (float initEyeX, float initEyeY) {
    eyeX = initEyeX;
    eyeY = initEyeY;
    eyeX = width/2;
    eyeY = height/2;
    outerEyeColor = color(0, 0, 0);
    innerEyeColor = color(255, 255, 255);
    irisColor = color(0, 0, 0);
    evilEyesColor = color (255, 0, 0);
  }

  void display() {
    noStroke();
    ellipseMode(CENTER);


    //outer eye triangle head
    fill(outerEyeColor);
    ellipse((eyeX-42), (eyeY-19.5), (15), (12));

    //inner eye triangle head
    fill(innerEyeColor);
    if (evilEyes) {
      fill (evilEyesColor);
    }
    ellipse((eyeX-42), (eyeY-19.5), (7.5), (4.5));

    //iris eye triangle head
    fill(irisColor);
    ellipse((eyeX-42), (eyeY-19.5), (3.3), (1.5));

    //outer eye ellipse head
    fill(outerEyeColor);
    ellipse((eyeX), (eyeY-21), (15), (18));

    //inner eye ellipse head
    fill(innerEyeColor);
    if (evilEyes) {
      fill (evilEyesColor);
    }
    ellipse((eyeX), (eyeY-21), (7.5), (10.5));

    //iris eye ellipse head
    fill(irisColor);
    ellipse((eyeX), (eyeY-21), (3), (6));

    //outer eye rectangle head
    fill(outerEyeColor);
    ellipse((eyeX+45), (eyeY-19.2), (15), (15));

    //inner eye rectangle head
    fill(innerEyeColor);
    if (evilEyes) {
      fill (evilEyesColor);
    }
    ellipse((eyeX+45), (eyeY-19.2), (6), (6));

    //iris eye rectangle head
    fill(irisColor);
    ellipse((eyeX+45), (eyeY-19.2), (3), (3));
  }
  void pressed() {
    evilEyes = !evilEyes;
  }
  void dragged (float initEyeX, float initEyeY) {
    eyeX = initEyeX;
    eyeY = initEyeY;
  }
  void setPosition(float x, float y) {
    eyeX = x;
    eyeY = y;
  }
}
