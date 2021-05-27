class Rock {

  PVector pos;

  Rock(float xPos, float yPos) {
    pos = new PVector(xPos,yPos);
  }
  
  void render() {
    noStroke();
    fill(200);
    rect(pos.x, pos.y, 50,50);
  }
  
}
