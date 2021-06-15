class Water {
  float xPos = 0;
  float yPos = height;
  float offset = 0;
  float inc = 0.01;
  
  Water() {
  }

  void render() {


    offset += inc;
    stroke(5, 38, 123);
    beginShape(LINES);
    for (int i = 0; i<width; i++) {
      float n = noise((offset+(i*0.002)))*height/2;
      vertex(xPos+i, yPos);
      vertex(xPos+i, yPos-n);
    };
    endShape();
  }

  void update() {
  }
}
