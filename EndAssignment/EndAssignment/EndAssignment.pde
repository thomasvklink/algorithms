/*  
 Algorithm in Creative Technology Final Project
 Tristan van Marle, Thomas van Klink
 June 2021
 
 Program description:
 This program shows a pirate ship like the ones which can be seen in theme parks.
 In this program there are multiple algorithms: 
 Birds in the sky which use flocking, the pirate ship that uses the mass-spring damper-system,
 the water waves which are made out of perlin noise and the waterdrops dripping from the boat which are particles.
 As a user you are able to swing the pirate ship make sure the restraints are locked or unlocked and unload or onload people onto the pirate ship.
 */

//importing libraries
import gifAnimation.*;

//Reference classes
Flocking flock;
Water water;
Boat ship;
Control control;
Environment environment;
Guest[] guests = new Guest[9];

void setup() {
  //Sketch settings
  fullScreen(2);
  shapeMode(CENTER);
  //Creating objects
  flock = new Flocking();
  water = new Water();
  environment = new Environment(width/2, height/2);
  for (int i = 0; i < guests.length; i ++ ) { 
      guests[i] = new Guest();
    }
  ship = new Boat(width/2, height/2);
  control = new Control(width-200, height-225);
  for (int i = 0; i < 10; i++) {
    flock.addBird(new Bird(random(0, width), random(height/6, 0), this));
  }
  
  //Loading images
  ship.load();
  environment.load();
}

void draw() {
  background(224, 255, 255);
  water.movingWater();
  flock.update();
  flock.render();
  ship.update();
  ship.render(guests);
  environment.update();
  environment.render(guests);
  control.update();
  control.render();
}

void mousePressed() {
  //Being able to operate & interact using the controls with a click of your mouse.
  control.operate(mouseX, mouseY);
}
