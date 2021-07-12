/* 
ICS3U - Assignment 4
Title: Clicking and Revealing
Author: Vansh Sethi
*/

int numClicks = 0;
int[][] posClicks; 


void setup() {
  size(800, 800);
  background(135, 255, 186);
  posClicks = new int[20][2];
}

void draw() {
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

void mousePressed() {
  if (numClicks < 20) {
    posClicks[numClicks][0] = mouseX;
    posClicks[numClicks][1] = mouseY;
    numClicks += 1;
  }

}