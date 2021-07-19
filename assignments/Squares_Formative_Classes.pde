/* 
ICS3U - Formative Classes
Title: SquareBox Classes
Author: Vansh Sethi
*/

// Create instances of SquareBoxs
Squarebox Square1 = new Squarebox(200, 200, 50);
Squarebox Square2 = new Squarebox(400, 400, 25);
Squarebox Square3 = new Squarebox(50, 50, 100);


void setup() {
  // Set up the screen
 size(512, 512);
}

// Draw and move the square boxes
void draw() {
  clear();
  Square1.display();
  Square1.move(10);
  Square2.display();
  Square2.move(5);
  Square3.display();
  Square3.move(15);
}

// Create the object Squarebox
class Squarebox {
// Data 
  int sideLength;
  int x;
  int y;

// Constructor (initalize variables)
  Squarebox (int tempX, int tempY, int tempSideLength) {
    x = tempX;
    y = tempY;
    sideLength = tempSideLength;
  }
// Method that displays the square box
  void display() {
    rect(x, y, sideLength, sideLength);
  }

// Method that moves the square box
  void move(int distance) { 
    x += distance;
    if (x - sideLength > 512) {
      x = 0;
    }
  }
}
