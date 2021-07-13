/* 
ICS3U - Assignment 4
Title: Clicking and Revealing
Author: Vansh Sethi
*/

/*
The major idea being implemented: We use a 2D array to keep track of user's clicks on the screen, and a global variable to track
how many clicks the user has performed on screen. When that variable is over 20 (or the user has clicked 20 times), we use
the aforementioned 2D array to show where the user has clicked.
*/


// Initalize Global Count of Clicks
int numClicks = 0;
// Initalize Positions of Places Clicked
int[][] posClicks; 


void setup() {
  // Set Screen Size
  size(800, 800);
  // Set Color of Screen
  background(135, 255, 186);
  // Initalize Array (such that it can be indexed)
  posClicks = new int[20][2];
}

void draw() {
  clear();
  background(135, 255, 186);
  // Render Clicks Until the User has clicked 20 times
  if (numClicks < 20) {
    // Text to show amount of clicks
    textSize(800); // size of text
    fill(255,255,255,70); // color of text
    text(str(numClicks), numClicks < 10 ? 150: -100, 675); // show text
  }
  // After 20 clicks have been completed by user
  else {
    // Set center circle 
    fill(255, 221, 135); // yellow circle
    ellipse(400,400,40,40); // make a circle and center it
    // For each stored position, render a circle
    for (int i = 0; i < 20; i++) {
      // Render Circle
      fill(255, 255, 255); // white color
      ellipse(posClicks[i][0], posClicks[i][1], 20, 20); // make a circle and position it at the user's click
      fill(0,0,0); // make the line connecting black
      line(400,400,posClicks[i][0], posClicks[i][1]); // make a line connecting the circle to the center circle
    }
  }
}

// When the mouse is clicked
void mousePressed() {
  // Only do this while below 20 clicks (don't want to record more)
  if (numClicks < 20) {
    // Save where they clicked to the array, using numClicks as an index
    posClicks[numClicks][0] = mouseX; // save x position of click
    posClicks[numClicks][1] = mouseY; // save y position of click
    // Updating numClicks that tracks how many times clicked
    numClicks += 1;
  }

}