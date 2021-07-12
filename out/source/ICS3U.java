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
ICS3U - Formative Iterators
Title: Dots on a Grid
Author: Vansh Sethi
*/

int numClicks = 0;
int[][] posClicks; 


public void setup() {
  
  background(135, 255, 186);
  posClicks = new int[20][2];
}

public void draw() {
  clear();
  background(135, 255, 186);
  if (numClicks < 20) {
    textSize(800);
    fill(255,255,255,70);
    text(str(numClicks), numClicks < 10 ? 150: -100, 675);
  }
  else {
    fill(255, 221, 135);
    ellipse(400,400,40,40);
    for (int i = 0; i < 20; i++) {
      fill(255, 255, 255);
      ellipse(posClicks[i][0], posClicks[i][1], 20, 20);
      fill(0,0,0);
      line(400,400,posClicks[i][0], posClicks[i][1]);
    }
  }
}

public void mousePressed() {
  if (numClicks < 20) {
    posClicks[numClicks][0] = mouseX;
    posClicks[numClicks][1] = mouseY;
    numClicks += 1;
  }

}
  public void settings() {  size(800, 800); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "ICS3U" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
