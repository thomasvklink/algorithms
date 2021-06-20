/*
  This is a class Control used to create the front display in which is shown how the user can interact with the program.
 It handles the controls of the ship and the constraints of the guests as well as being able to unload and onload guests onto the ship.
*/

class Control {//class initialisation
  
  //reference classes
  Boat schip;
  
  //variables for position
  int xPos;
  int yPos;
  
  //timers 
  int timer = 120;
  int timer2;
  int timer3;
  int timer4;
  
  //creating variables which help with the design of the control panel
  color control;
  boolean start;
  int rides;
  int served;
  
  //creating variables for the bars
  color bars;
  int bar;
  boolean isOpen;
  
  //creating variables for the loading and unloading of the guests
  int seat;
  int line;
  color guests = color(255, 0, 0);
  boolean load = false;
  boolean unload = false;
  boolean loaded;

  Control(int xPos, int yPos) { //constructor
    this.xPos = xPos;
    this.yPos = yPos;
    seat = 0;
    line =5;
  }

  void update() {
    indicate();
    actuate();
  }

  void indicate() {
    //Indicator colors to start swinging, only green when the ship is not swinging and the restaints are closed
    if (ship.isMoving || isOpen) {
      control = color(255, 0, 0);
      bars = color(255, 0, 0);
      timer = 0;
    } else {
      timer++;
      if (timer > 120) { //Timer to check if the ship has not been moving for 2 seconds before giving the green light.
        control = color(0, 255, 0);
        bars = color(0, 255, 0);
      }
    }

    if (isOpen) { //If the restaints are opened in the station, indicator light will turn blue.
      bars = color(0, 0, 255);
      guests = color(0, 255, 0);
    } else {
      guests = color(255, 0, 0);
    }
  }

  void actuate() {

    if (start) {
      timer2++;
      if (timer2 < 60) { //make the ship rock faster in the first 60 frames
        ship.totalRotation = ship.totalRotation + 0.06;
      } else {
        start = false;
        timer2 = 0;
      }
    }

    if (bar == 1) {
      timer3++;
      if (timer3 < 60) {
        ship.bars = ship.bars + 0.01;
      } else {
        bar = 3;
        timer3 = 0;
      }
    }

    if (bar == 2) {
      timer3++;
      if (timer3 < 60) {
        ship.bars = ship.bars - 0.01;
      } else {
        bar = 0;
        timer3 = 0;
      }
    }

    if (load) { //load the guests in their seats in intervals
      timer4++;
      ship.seat = 1;
      if (timer4 < 60) {
        ship.seat = 2;
      } else if (timer4 < 120) {
        ship.seat = 3;
      } else if (timer4 < 180) {
        ship.seat = 4;
      } else if (timer4 < 240) {
        ship.seat = 5;
      } else {
        ship.seat = 5;
        timer4 = 0;
        load = false;
        loaded = true;
      }
    }

    if (unload) { //unload the guests from their seats in intervals
      timer4++;
      ship.seat = 5;
      if (timer4 < 60) {
        ship.seat = 4;
      } else if (timer4 < 120) {
        ship.seat = 3;
      } else if (timer4 < 180) {
        ship.seat = 2;
      } else if (timer4 < 240) {
        ship.seat = 1;
      } else {
        ship.seat = 0;
        timer4 = 0;
        unload = false;
        loaded = false;
      }
    }
  }

  void render() {
    //Panel
    fill(210);
    stroke(150);
    strokeWeight(5);
    strokeJoin(ROUND);
    rect(xPos, yPos, 300, 300);
    fill(0);
    text("OPERATION PANEL", xPos+10, yPos+20);

    //Start ride button
    stroke(150);
    strokeWeight(4);
    fill(control);
    circle(xPos, yPos+50, 30);
    fill(0);
    noStroke();
    text("Start swinging", xPos+30, yPos+55);

    //Restaints button
    stroke(150);
    strokeWeight(4);
    fill(bars);
    circle(xPos, yPos+100, 30);
    fill(0);
    noStroke();
    text("Open/Close restaints", xPos+30, yPos+105);

    //Guest control
    stroke(150);
    strokeWeight(4);
    fill(guests);
    circle(xPos, yPos+150, 30);
    fill(0);
    noStroke();
    text("Load/Unload guests", xPos+30, yPos+155);
    
    //Rides
    text("Rides:", xPos+30, yPos+200);
    text(rides, xPos+70, yPos+200);
    
    //Guests served
    text("Guests: ", xPos+100, yPos+200);
    text(served, xPos+150, yPos+200);
  }

  void operate(int mouseXpos, int mouseYpos) {
    //Start ride button
    if (!ship.isMoving && !isOpen &&dist(mouseXpos, mouseYpos, xPos, yPos+50) < 30) {
      start = true;
      rides++;
      if(loaded){
      served = served + 9;
      }
    }
    
    //Open/close restaints button
    if (!ship.isMoving && dist(mouseXpos, mouseYpos, xPos, yPos+100) < 30) {
      if (bar ==0) {
        bar = 1;
        isOpen = true;
      } else if (bar == 3) {
        bar = 2;
        isOpen = false;
      }
    }

    if (!ship.isMoving && isOpen && dist(mouseXpos, mouseYpos, xPos, yPos+150) < 30) {
      if (!loaded){
        load = true;
      } else {
        unload = true;
      }
      
    }
  }
}
