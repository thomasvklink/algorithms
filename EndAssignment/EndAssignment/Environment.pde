/*
  This is a class that forms the background of the sketch. It features houses, some trees and the dock on which the pirate ship stands.
*/

class Environment{
  
  int xPos;
  int yPos;
  
  int spots = 0;
  boolean queue = false;
 
  PShape boardwalk;
  
  Environment(int xPos, int yPos){
    this.xPos = xPos;
    this.yPos = yPos;
  }
  
  void load(){
    boardwalk = loadShape("boardwalk.svg");
  }
  
  void update(){
    switch(ship.seat){
      case 0:
      spots = 0;
      break;
      case 1:
      spots = 2;
      break;
      case 2:
      spots = 4;
      break;
      case 3:
      spots = 6;
      break;
      case 4:
      spots = 8;
      break;
      case 5:
      spots = 9;
      queue = true;
      break;
    }
    
    if (queue){
      spots = 0;
      if (ship.seat == 0){
      queue = false;
      }
    }
    
  }
  
  void render(Guest[] guests){
    shape(boardwalk, xPos, yPos-5);
    for (int i = 0; i < guests.length-spots; i++){
      guests[i].render((xPos+300)+(25*i),yPos+420);
    }
  }
}
