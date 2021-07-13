/* 
ICS3U - Car Events
Title: Car
Author: Vansh Sethi
*/

int[][] pos; 
int carX = 50; 
int carY = 50;
boolean vertical = false;


void setup() {
  size(800, 800);
  background(255, 255, 255);
}

void draw() {
  clear();
  background(255, 255, 255);
  fill(253, 35, 2);
  if (vertical) {
    rect(carX, carY, 20, 60);
  }
  else {
    rect(carX, carY, 60, 20);
  }

}

void keyPressed() {
  if (keyCode == 38) {
    carY -= 10;
    vertical = true;
  }
  else if (keyCode == 39) {
    carX += 10;
    vertical = false;
  }
  else if (keyCode == 40) {
    carY += 10;
    vertical = true;
  }
  else if (keyCode == 37) {
    carX -= 10;
    vertical = false;
  }
}

