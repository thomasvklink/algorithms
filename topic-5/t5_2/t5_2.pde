School school;

void setup(){
  size(1080,720);
  school = new School();
}

void draw(){
  background(46,65,255);
  school.render();
  school.update();
}

void mouseDragged(){
  school.addFish(new Fish(mouseX, mouseY));
}
