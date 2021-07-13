/* 
ICS3U - Assignment 3
Title: Circle... Faster and Faster
Author: Vansh Sethi
*/

/*
The major idea being implemented: To see if the two circles have collided, we simply take the distance of the user's 
cursor to the center of the moving circle, and if that is smaller than or equal to the radius of the moving circle + the user's circle,
it means that the two circles have touched or colided. Then, we chagne global properties if this colision is met.

The alternative 'solution' is treating the circle as a rectangle, however this would discount many cases.
*/


// Global Variables Initalized (for the moving circle)
int rad = 60;        // Width of the shape
float xpos, ypos;    // Starting position of shape    

float xspeed = 2.8;  // Speed of the shape
float yspeed = 2.2;  // Speed of the shape

int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom


void setup() 
{
  // Set the screen size
  size(640, 360);
  noStroke(); // No stroke to circle
  frameRate(30); // Frame rate of processing program
  ellipseMode(RADIUS);
  // Set the starting position of the shape
  xpos = width/2; 
  ypos = height/2;
}

void draw() 
{
  // Recolor the background 
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

  // Testing to see if the two circles collided (by seeing if the radius from the center of circle exceeds the radius of the two circles added together)
  if (dist(xpos, ypos, mouseX, mouseY) <= rad + 20) {
    // Rendering the circle of the user
      fill(255,255,255);
      ellipse(mouseX, mouseY, 20, 20);

    // Rendering a blue circle (showing that it is collided) and changing global paramters
      fill(0, 104, 255); // Change to color blue
      xspeed += 1.25; // Increase speed horizontally
      yspeed += 1.25; // Increase speed vertically
      rad -= 1; // Reduce the radius
      ellipse(xpos, ypos, rad, rad);  // Render the circle

  }
  // If the circles have not colided, simply render both
  else {
    // Rendering the circle of the user
      fill(255,255,255);
      ellipse(mouseX, mouseY, 20, 20);

    // Rendering the moving circle 
      fill(255,255,255);
      ellipse(xpos, ypos, rad, rad);
  }

}