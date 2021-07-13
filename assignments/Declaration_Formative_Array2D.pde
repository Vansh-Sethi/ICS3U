/* 
ICS3U - Declaration and Initialization of a 2D Array Formative 
Title: Accessing Array
Author: Vansh Sethi
*/

int[][] array2d = new int[4][5];

void setup() {
  size(500, 500);
  background(255, 255, 255);

  for (int row = 0; row < array2d.length; row++) {
    for (int col = 0; col < array2d[0].length; col++) {
      array2d[row][col] = -1;
    }
  }
  array2d[3][4] = 0;
  array2d[0][2] = 0;
  array2d[2][2] = 2;
  print2DArray(array2d);
}

void draw() {


}

import java.util.Arrays;

void print2DArray(Object[] a) {
  println(Arrays.deepToString(a)
  .replace("[[", "")
  .replace("], [", "\n")
  .replace("]]", "")
  .replace(" ", " "));
}

