class Rock {

  PVector pos;

  Rock(float xPos, float yPos) {
    pos = new PVector(xPos,yPos);
  }
  
  void render() {
    noStroke();
    fill(200);
    circle(pos.x, pos.y, 50);
  }
  
}
