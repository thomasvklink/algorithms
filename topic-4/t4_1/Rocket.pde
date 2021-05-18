class Rocket { //class initialisation

  //setting variables
  PVector position;
  PVector speed;
  PVector mouse;
  ParticleSystem particleSystem;

  Rocket(float x, float y) {  //constructor
    position=new PVector(x, y);
    speed=new PVector(0, 1);
    particleSystem = new ParticleSystem(width/2, height/4);
  }

  void display() {
    pushMatrix();
    translate(position.x, position.y);
    rotate(speed.heading()+radians(90));
    noStroke();
    fill(198, 0, 7);
    rect(0, 0, 30, 100);
    triangle(-15, -50, 0, -70, 15, -50);
    fill(150);
    triangle(-30, +45, -15, 25, -15, 45);
    triangle(30, 45, 15, 25, 15, +45);
    fill(0, 155, 255);
    circle(0, -40, 15);
    popMatrix();
    particleSystem.show();
    //noStroke();
    //fill(198,0,7);
    //rect(position.x,position.y, 30, 100);
    //triangle(position.x-15,position.y-50,position.x,position.y-70,position.x+15,position.y-50);
    //fill(150);
    //triangle(position.x-30,position.y+45,position.x-15,position.y+25,position.x-15,position.y+45);
    //triangle(position.x+30,position.y+45,position.x+15,position.y+25,position.x+15,position.y+45);
    //fill(0,155,255);
    //circle(position.x,position.y-40, 15);
  }

  void update() {
    position.add(speed);
    bound();
    particleSystem.update();
  }

  void control(int mousePosX, int mousePosY) {
    magValue = magValue + 0.1;
    mouse = new PVector(mousePosX, mousePosY);
    mouse.sub(position);
    mouse.setMag(magValue);
    speed = mouse;
    
  }

  void bound() {

    if (position.x > width+100) {
      position.x = -100;
    } else if (position.x < -100) {
      position.x = width+100;
    }

    if (position.y > height+100) {
      position.y = -100;
    } else if (position.y < -100) {
      position.y = height+100;
    }
  }
}
