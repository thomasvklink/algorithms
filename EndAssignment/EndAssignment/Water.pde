class Water {

  Water() {
  }

  void render() {
    float xPos = 0;
    float yPos = height*2;
    float offset = 0;
    float inc = 0.01;

    offset += inc;
    stroke(255, 206, 8);
    beginShape(LINES);
    for (int i = 0; i<width; i++) {
      float n = noise((offset+(i*0.003)))*height;
      vertex(xPos+i, yPos);
      vertex(xPos+i, yPos-n);
    };
    endShape();
  }

  void update() {
  }
}
