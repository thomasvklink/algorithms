Boat ship;

void setup(){
  fullScreen();
  shapeMode(CENTER);
  //size(1920,1080);
  ship = new Boat(width/2, height/2);
  ship.load();
}

void draw(){
  background(224,255,255);
  ship.update();
  ship.render();
}
