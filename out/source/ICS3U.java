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

float circleX; // x-coordinate of the circle
float circleY; // y-coordinate of the circle
float size; // diameter of the circle

public void setup() {
   //size of the run window, global variables width and height have value of 600
  stroke(11,31,227); //blue colour for the outline of the shapes
}

// remember all the code in here gets run over and over again
public void draw() {
  
  //create a random float value for the x-coordinate of the circle from 0 to the width of the
  //run window

  circleX = random(width);  
  
  //create a random float value for the y-coordinate of the circle from 0 to the height of the
  //run window
  circleY = random(height);  
  
  //create a random float value for the diameter of the circle from 0 to 20;
  size = random(20);  
  
  //create a VERTICAL line that splits the run window into half
  line(width/2,0,width/2,height); 
  
  // create the HORIZONTAL line that splits the run window into half
  line(0,height/2,width,height/2); 
  
  //draw the circle
  if (circleX <= 300 && circleY <=300) {
    ellipse(circleX,circleY,size,size);
  }
}
  public void settings() {  size(600,600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "ICS3U" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
