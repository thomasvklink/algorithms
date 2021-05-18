class Rocket { //class initialisation

  //setting variables
  PVector position;
  PVector speed;
  float rotation;
  PVector mouse;
  float magValue;
  ParticleSystem thrust;

  Rocket(float x, float y) {  //Constructor
    position=new PVector(x, y);
    speed=new PVector(0, -1); //Standard speed of 1 up
    thrust = new ParticleSystem(position.x, position.y); //Initialize the particle system for a thrust effect
  }

  void display() {

    thrust.show(); //Show the rocket's thrust, a particle system

    pushMatrix();
    translate(position.x, position.y);
    rotate(speed.heading()+radians(90)); //Rotate graphic according to speed vector angle, points in the direction it is moving

    noStroke(); //Rocket
    fill(198, 0, 7);
    rect(0, 0, 30, 100);
    triangle(-15, -50, 0, -70, 15, -50);
    fill(150);
    triangle(-30, +45, -15, 25, -15, 45);
    triangle(30, 45, 15, 25, 15, +45);
    fill(0, 155, 255);
    circle(0, -40, 15);

    popMatrix();
  }

  void update() {
    position.add(speed); //SPEEEEED
    bound(); //Method for keeping the rocket in the window

    PVector thruster = new PVector(-45, 0); //Update particle spawn location to match rocket rotation
    float rotation = speed.heading();
    thruster.rotate(rotation);
    thrust.update((position.x+thruster.x), (position.y+thruster.y));
  }

  void control(int mousePosX, int mousePosY) { //Controls of the rocket

    if (magValue < 5) { //Speed towards the mouse then slow using the magnitude of the speed vector.
      magValue = magValue + 0.25;
    } 

    mouse = new PVector(mousePosX, mousePosY); //Store mouse position as vector
    mouse.sub(position); //Subtract rocket position with the current mouse positon
    mouse.setMag(magValue); //Set a fixed magnitude to prevent the rocket speeding off
    speed = mouse; //Use the mouse vector as speed
  }

  void bound() { //Limit movements of the rocket to stay in the window

    if (position.x > width+100) { //Horizontal limits
      position.x = -100;
    } else if (position.x < -100) {
      position.x = width+100;
    }

    if (position.y > height+100) { //Vertical limits
      position.y = -100;
    } else if (position.y < -100) {
      position.y = height+100;
    }

    if (magValue > 1) { //Reset magnitude value for speed start effect to the mouse
      magValue = magValue - 0.25;
    }
  }
}
