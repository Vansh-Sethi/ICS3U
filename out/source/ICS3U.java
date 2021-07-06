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
ICS3U - Assigment #1
Title: Coincentric Circles
Author: Vansh Sethi
*/

public void setup() {
    
    background(214, 214, 214);

}

public void draw() {
    background(214, 214, 214);

    // Small cirlce
    if (dist(mouseX, mouseY, 300,300) <= 100) {
        clear(); 
        fill(255,255,255);
        circle(300, 300, 600);
        circle(300, 300, 400);

        fill(242, 255, 3);
        circle(300, 300, 200);

        fill(255,255,255);
        line(mouseX, mouseY, mouseX, mouseY+10);
        line(mouseX, mouseY, mouseX, mouseY-10);
        line(mouseX, mouseY, mouseX+10, mouseY);
        line(mouseX, mouseY, mouseX-10, mouseY);
    }

    // Medium Circle
    else if (dist(mouseX, mouseY, 300,300) <= 200) {
        clear();
        fill(255,255,255);
        circle(300, 300, 600);

        fill(34, 255, 5);
        circle(300, 300, 400);

        fill(255,255,255);
        circle(300, 300, 200);

        fill(255,255,255);
        rect(mouseX, mouseY, 20, 20);
    }

    // Large Circle
    else if (dist(mouseX, mouseY, 300,300) <= 300) {
        clear();
        fill(255,0,0);
        circle(300, 300, 600);

        fill(255,255,255);
        circle(300, 300, 400);

        fill(255,255,255);
        circle(300, 300, 200);

        fill(255,255,255);
        circle(mouseX, mouseY, 20);
    }

    // last case
    else {
        clear();
        fill(255,255,255);
        circle(300, 300, 600);
        circle(300, 300, 400);
        circle(300, 300, 200);
    }

}
  public void settings() {  size(600, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "ICS3U" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
