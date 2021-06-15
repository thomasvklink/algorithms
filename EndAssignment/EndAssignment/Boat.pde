class Boat {

  int xPos;
  int yPos;
  
  PShape boat;

  Boat(int xPos, int yPos) {
    this.xPos = xPos;
    this.yPos = yPos;
  }

  void load() {
    boat = loadShape("boat.svg");
  }
  
  void render(){
    shape(boat, 0, 0);
  }
}
