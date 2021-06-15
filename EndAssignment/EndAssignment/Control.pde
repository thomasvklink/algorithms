class Control {

  int xPos;
  int yPos;

  int timer;
  int timer2;
  int timer3;
  color control;
  boolean start;
  int bar;
  color bars;

  Boat schip;

  Control(int xPos, int yPos) {
    this.xPos = xPos;
    this.yPos = yPos;
  }

  void update() {
    if (ship.isMoving) {
      control = color(255, 0, 0);
      timer = 0;
    } else {
      timer++;
      if (timer > 120) {
        control = color(0, 255, 0);
      }
    }
    
    move();
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
    //rect(xPos+30, yPos+40, 150, 20);
    text("Start swinging", xPos+30, yPos+55);
    
    //Restaints button
    stroke(150);
    strokeWeight(4);
    fill(bars);
    circle(xPos, yPos+100, 30);
    fill(0);
    noStroke();
    //rect(xPos+30, yPos+40, 150, 20);
    text("Open/Close restaints", xPos+30, yPos+110);
  }

  void operate(int mouseXpos, int mouseYpos) {
    println(dist(mouseXpos, mouseYpos, xPos+30, yPos+40));
    //Start ride button
    if (!ship.isMoving && dist(mouseXpos, mouseYpos, xPos, yPos+50) < 30) {
      start = true;
    }
    //if (!ship.isMoving
  }

  void move() {
    
    if (start) {
      timer2++;
      if (timer2 < 60) {
        ship.totalRotation = ship.totalRotation + 0.06;
      } else {
        start = false;
        timer2 = 0;
      }
    }
    
    if(bar == 1){
      timer3++;
      if (timer3 < 60){
        ship.bars = ship.bars + 0.01;
      } else {
        bar = 0;
        timer3 = 0;
      }
    }
  }

  void drag() {
    //class to move the control interface around
  }
}
