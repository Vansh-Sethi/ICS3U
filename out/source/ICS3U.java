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
ICS3U - Assignment 3
Title: Circle... Faster and Faster
Author: Vansh Sethi
*/

int rad = 60;        // Width of the shape
float xpos, ypos;    // Starting position of shape    

float xspeed = 2.8f;  // Speed of the shape
float yspeed = 2.2f;  // Speed of the shape

int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom


public void setup() 
{
  
  noStroke();
  frameRate(30);
  ellipseMode(RADIUS);
  // Set the starting position of the shape
  xpos = width/2;
  ypos = height/2;
}

public void draw() 
{
  background(102);
  
  // Update the position of the shape
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  
  // Test to see if the shape exceeds the boundaries of the screen
  // If it does, reverse its direction by multiplying by -1
  if (xpos > width-rad || xpos < rad) {
    xdirection *= -1;
  }
  if (ypos > height-rad || ypos < rad) {
    ydirection *= -1;
  }

  // Draw the shape

  if (dist(xpos, ypos, mouseX, mouseY) <= rad + 20) {
      fill(255,255,255);
      ellipse(mouseX, mouseY, 20, 20);

      fill(0, 104, 255);
      xspeed += 1.25f;
      yspeed += 1.25f;
      rad -= 1;
      ellipse(xpos, ypos, rad, rad);

  }
  else {
      fill(255,255,255);
      ellipse(mouseX, mouseY, 20, 20);

      fill(255,255,255);
      ellipse(xpos, ypos, rad, rad);
  }

}
  public void settings() {  size(640, 360); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "ICS3U" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
