import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class ICS3U extends PApplet {

/* 
ICS3U - Formative Classes
Title: SquareBox Classes
Author: Vansh Sethi
*/

// Create instances of SquareBoxs
Squarebox Square1 = new Squarebox(200, 200, 50);
Squarebox Square2 = new Squarebox(400, 400, 25);
Squarebox Square3 = new Squarebox(50, 50, 100);


public void setup() {
  // Set up the screen
 
}

// Draw and move the square boxes
public void draw() {
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
  public void display() {
    rect(x, y, sideLength, sideLength);
  }

// Method that moves the square box
  public void move(int distance) { 
    x += distance;
    if (x - sideLength > 512) {
      x = 0;
    }
  }
}
  public void settings() {  size(512, 512); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "ICS3U" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
