/* 
ICS3U - Even 2D Array Formative
Title: To be even or not to be
Author: Vansh Sethi
*/

// 3 Rows 4 Columns
int [][] grid = { {1,2,3,4}, {1,4,9,5}, {4,6,8,6}} ;
void setup() {
  size(500, 500);
  background(255, 255, 255);
  println("Even Number Rows and Columns");
  println("============================");

  for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid[0].length; j++) {
      if (grid[i][j] % 2 == 0) {
        println("Row Number: " + str(i) + " Column Number: " + str(j));
      }
    }
  }

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

