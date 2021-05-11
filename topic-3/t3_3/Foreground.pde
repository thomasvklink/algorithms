class Foreground { //class initialisation

  //setting variables
  PVector position;
  
  Foreground(float x, float y) {  //constructor
    position=new PVector(x, y);
  }
  
  void display() {
    noStroke();
    fill(255);
    cloud(0,20);
  }
  
  void cloud(float posX, float posY) {
    for (int i = 0; i < 30; i++){
      circle(posX+(i*25), posY, 50);
    }
  }
}
