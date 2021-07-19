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
ICS3U - Assignment 5
Title: Parallax Triangles
Author: Vansh Sethi
*/

// Create instances of Triangles
Triangle[] LargeTriangles = new Triangle[25];
Triangle[] MediumTriangles = new Triangle[20];
Triangle[] SmallTriangles = new Triangle[15];
// int x = 0;



public void setup() {
  // Set up the screen
 
//  pushMatrix();


  // Set up the triangles
  for (int i = 0; i < LargeTriangles.length; i++) {
    LargeTriangles[i] = new Triangle(PApplet.parseInt(random(0, width)), PApplet.parseInt(random(0, height)), random(0.5f, 1.5f), "foreground", 2.2f);
  }

  for (int i = 0; i < MediumTriangles.length; i++) {
    MediumTriangles[i] = new Triangle(PApplet.parseInt(random(0, width)), PApplet.parseInt(random(0, height)), random(0.5f, 1.5f), "midground", 1.3f);
  }

  for (int i = 0; i < SmallTriangles.length; i++) {
    SmallTriangles[i] = new Triangle(PApplet.parseInt(random(0, width)), PApplet.parseInt(random(0, height)), random(0.5f, 1.5f), "background", 1.0f);
  }



}

// Draw and move the triangles
public void draw() {
  clear();
  background(0, 42, 47);
  for (int i = 0; i < LargeTriangles.length; i++) {
    LargeTriangles[i].display();
  }

  for (int i = 0; i < MediumTriangles.length; i++) {
    MediumTriangles[i].display();
  }

  for (int i = 0; i < SmallTriangles.length; i++) {
    SmallTriangles[i].display();
  }
  // int size = 35;
  // triangle(200, 200, 200+(size/tan(PI/3)), 200-size, 200+2*(size/tan(PI/3)), 200);


  // translate(220, 186);
  // rotate(radians(x));
  // x+=1;
  // triangle(0, 0, (size/tan(PI/3)), size, 2*(size/tan(PI/3)), 0);


}

// Create the object Triangle
class Triangle {
// Data 
  int x;
  int y;
  float rotateSpeed;
  String type; 
  int size; 
  float move;
  float speed;
  int triColor;

// Constructor (initalize variables)
  Triangle (int tempX, int tempY, float tempRotateSpeed, String tempType, float tempSpeed) {
    x = tempX;
    y = tempY;
    move = random(0, 100);
    rotateSpeed = tempRotateSpeed;
    type = tempType;
    if (type == "foreground") {
      size = 35;
    }
    else if (type == "midground") {
      size = 25;
    }
    else {
      size = 15;
    }
    speed = tempSpeed;
    int a = PApplet.parseInt(random(0, 4));
    if (a == 1) {
      triColor = color(231, 223, 175);
    }
    if (a == 2) {
      triColor = color(171, 163, 125);
    }
    if (a == 3) {
      triColor = color(0, 93, 132);
    }
    else {
      triColor = color(255, 255, 255);
    }
  }

// Method that displays the triangle
  public void display() {
    translate(x,y);
    rotate(radians(move));
    move+=rotateSpeed;
    noStroke();
    fill(triColor);
    triangle(0, 0, (size/tan(PI/3)), size, 2*(size/tan(PI/3)), 0);
    moveDown();
    resetMatrix();


  }

  public void moveDown() {
    y+=speed;
 
    
    if (y-size > height) { 
      y = 0;
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
