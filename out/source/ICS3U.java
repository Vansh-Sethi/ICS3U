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
ICS3U - Assigment #2
Title: Quadratic Lines
Author: Vansh Sethi
*/

/*
The major idea being implemented: Basically, the entire screen can be broken up into 4 quadrants of the same pattern.
To achieve the pattern, we must draw lines that create a right angle to the corner of the quadrant. This can
be achieved with the use of a for loop, that draws lines from one corner of the quadrant to the adjacent side
until it reaches the other corner of the quadrant. Then, we simplyrepeat the final pattern to another quadrant. In the code, this is acheived with the xFactor and yFactor respectively.

The alternative solution is hardcoding each case, however this would make the code messy and unmaintable. Therefore, this 
approach wask taken.
*/

public void setup() {
  

  for (int i = 50; i <= 450; i+=50) {
    for (int j = 50; j <= 450; j+=50) {
      fill(0,0,0);
      circle(i, j, 5);
    }
  }
}
  public void settings() {  size(500, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "ICS3U" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
