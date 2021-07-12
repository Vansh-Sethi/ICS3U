/* 
ICS3U - Formative Iterators
Title: Dots on a Grid
Author: Vansh Sethi
*/

int rad = 60;        // Width of the shape
float xpos, ypos;    // Starting position of shape    

float xspeed = 2.8;  // Speed of the shape
float yspeed = 2.2;  // Speed of the shape

int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom


void setup() 
{
  size(640, 360);
  noStroke();
  frameRate(30);
  ellipseMode(RADIUS);
  // Set the starting position of the shape
  xpos = width/2;
  ypos = height/2;
}

void draw() 
{
  background(102);
  
  // Update the position of the shape
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  
  // Test to see if the shape exceeds the boundaries of the screen
  // If it does, reverse its direction by multiplying by -1
  if (xpos > width-rad || xpos < rad) {
    xdirection *= -1;
  }
  if (ypos > height-rad || ypos < rad) {
    ydirection *= -1;
  }

  // Draw the shape

  if (dist(xpos, ypos, mouseX, mouseY) <= rad + 20) {
      fill(255,255,255);
      ellipse(mouseX, mouseY, 20, 20);

      fill(0, 104, 255);
      xspeed += 1.25;
      yspeed += 1.25;
      rad -= 1;
      ellipse(xpos, ypos, rad, rad);

  }
  else {
      fill(255,255,255);
      ellipse(mouseX, mouseY, 20, 20);

      fill(255,255,255);
      ellipse(xpos, ypos, rad, rad);
  }

}