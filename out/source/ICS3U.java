import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.Arrays; 

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
ICS3U - Car Events
Title: Car
Author: Vansh Sethi
*/

int[][] array2d = new int[4][4];

public void setup() {
  
  background(255, 255, 255);

  for (int row = 0; row < array2d.length; row++) {
    for (int col = 0; col < array2d[0].length; col++) {
      array2d[row][col] = 5;
    }
  }
  print2DArray(array2d);
}

public void draw() {


}



public void print2DArray(Object[] a) {
  println(Arrays.deepToString(a)
  .replace("[[", "")
  .replace("], [", "\n")
  .replace("]]", "")
  .replace(" ", " "));
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
