/*
  This is a class that forms the background of the sketch. It features houses, some trees and the dock on which the pirate ship stands.
*/

class Environment{
  
  Guest[] guests = new Guest[10];
  
  int xPos;
  int yPos;
  
  PShape boardwalk;
  
  Environment(int xPos, int yPos){
    this.xPos = xPos;
    this.yPos = yPos;
    for (int i = 0; i < guests.length; i ++ ) { 
      guests[i] = new Guest();
    }
  }
  
  void load(){
    boardwalk = loadShape("boardwalk.svg");
  }
  
  void render(){
    shape(boardwalk, xPos, yPos-5);
    for (int i = 0; i < guests.length; i++){
      guests[i].render(xPos+(25*i),yPos+400);
    }
    println(control.seat);
  }
}
