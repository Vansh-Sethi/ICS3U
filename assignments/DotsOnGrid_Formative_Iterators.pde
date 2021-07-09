/* 
ICS3U - Formative Iterators
Title: Dots on a Grid
Author: Vansh Sethi
*/

void setup() {
  size(500, 500);

  for (int i = 50; i <= 450; i+=50) {
    for (int j = 50; j <= 450; j+=50) {
      fill(0,0,0);
      circle(i, j, 5);
    }
  }
}
