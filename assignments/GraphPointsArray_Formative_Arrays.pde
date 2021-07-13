/* 
ICS3U - Formative Arrays
Title: Sweet Looking Graph
Author: Vansh Sethi
*/

int[][] pos; 


void setup() {
  size(800, 800);
  background(255, 255, 255);
  pos = new int[20][2];
  for (int i = 0; i < 20; i++) {
      int x = int(random(750));
      int y = int(random(750));
      ellipse(x,y,10, 10);
      pos[i][0] = x;
      pos[i][1] = y;
  }

// O(N^2) Time but only 20 so it doesn't matter
  for (int i = 0; i < 20; i++) {
    for (int j = 0; j < 20; j++) {
      line(pos[j][0], pos[j][1], pos[i][0], pos[i][1]);
    }
  }
}

