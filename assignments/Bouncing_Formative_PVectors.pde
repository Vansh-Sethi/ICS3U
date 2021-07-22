/* 
ICS3U - Formative PVectors
Title: Bouncing Ball - Physics Simulation
Author: Vansh Sethi
*/

// Create Vectors
PVector pos, vel;

void setup() {
  // Set up the screen
  size(512, 512);
  // Initalize Vectors
  pos = new PVector(width/2, 0);
  vel = new PVector(0, 0);
}

void draw() {
  clear();
  ellipse(pos.x, pos.y, 50, 50);
  // Update Vectors Continously Downard
  pos.add(vel);
  vel.add(0,1);
  // If it hits the bottom of the screen, reverse its velocity (such that it goes up)
  if (pos.y > height) {
    vel.y *= -0.8;
  }
}