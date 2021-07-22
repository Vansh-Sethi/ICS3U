/* 
ICS3U - Assignment 5
Title: Parallax Triangles
Author: Vansh Sethi
*/

/*
The major idea being implemented: To create a parallax effect, three layers of traingles were created, that move at different speeds,
to simulate the illusion that the screen is moving. To draw the triangles on the screen, an x and y coordinate is created, and is set as the
bottom left point of the triangle. From there, we simply calculate the distance from the bottom left of the traingle to the bottom middle. 
The height of the triangle is known, which is perpendicular to the base, creating a right angled traignles, which gives enough information to calculate
the distance from the point to the center (since it's equilateral, all angles are 60 deg). We want the adjacent side to the angle, so we use the tan function
and rearrange for the adjacent side. The final calculation is height/tan(60deg), and then we simply add the x distance so it renders relative to the other
point. The x and y of the top center of the traingle is simply that adjacent side for the x, and the height (or size variable) for the y. To get the last
points coordinates, we just multiply the x by 2 and keep the y the same, to maintain equilateral-ness. 
*/

// Create instances of Triangles
Triangle[] LargeTriangles = new Triangle[35]; // Large Triangles (35 Triangles)
Triangle[] MediumTriangles = new Triangle[25]; // Medium Triangles (20 Triangles)
Triangle[] SmallTriangles = new Triangle[23]; // Small Triangles (15 Triangles)

void setup() {
  // Set up the screen
 size(512, 512);

  // Set up the triangles (Define the triangles and save them to their respective arrays)

  // Large Triangles
  for (int i = 0; i < LargeTriangles.length; i++) {
    // Define a new Triangle using the Class and assign it to the ith index of the array
    LargeTriangles[i] = new Triangle(int(random(0, width)), int(random(0, height)),  "foreground", 3.0);
  }

  // Medium Triangles
  for (int i = 0; i < MediumTriangles.length; i++) {
    MediumTriangles[i] = new Triangle(int(random(0, width)), int(random(0, height)), "midground", 2.0);
  }

  // Small Triangles
  for (int i = 0; i < SmallTriangles.length; i++) {
    SmallTriangles[i] = new Triangle(int(random(0, width)), int(random(0, height)), "background", 1.0);
  }

}

// Draw and move the triangles
void draw() {
  clear(); // Clear background such that old triangles are not visible
  background(0, 42, 47); // Re-set the background color

  for (int i = 0; i < SmallTriangles.length; i++) {
    SmallTriangles[i].display(); // Display the small triangles
  }

  for (int i = 0; i < MediumTriangles.length; i++) {
    MediumTriangles[i].display(); // Display the medium triangles
  }

  for (int i = 0; i < LargeTriangles.length; i++) {
    LargeTriangles[i].display(); // Display the large triangles
  }

}

// Create the object Triangle
class Triangle {
// Data 
  int x; // X-coordinate of the triangle
  int y; // Y-coordinate of the triangle
  String type; // Either large, medium, or small triangle
  int size; // The size of the triangle
  float speed; // Set the speed of the triangle when it moves down
  color triColor; // Set the color of the triangle

// Constructor (initalize variables)
  Triangle (int tempX, int tempY, String tempType, float tempSpeed) {
    x = tempX; // Set the x position (randomly)
    y = tempY; // Set the y position (randomly)
    type = tempType; // Set the type of the triangle (large, medium, or small)

    // Depending on type, set the size of the triangle
    if (type == "foreground") {
      size = 35; // If the type is foreground, set the size to 35
    }
    else if (type == "midground") {
      size = 25; // If the type is midground, set the size to 25
    }
    else {
      size = 15; // If the type is background, set the size to 15
    }

    // Set the speed of the triangle
    speed = tempSpeed;

    // Randomly set the color of the triangle
    int a = int(random(0, 4));
    if (a == 1) {
      triColor = color(255, 255, 255); // White (half of triangles)
    }
    else if (a == 2) {
      triColor = color(168, 155, 120); // Light brown
    }
    else if (a == 3) {
      triColor = color(0, 93, 132); // Blue color
    }
    else {
      triColor = color(255, 255, 255); // White color
    }
  }

// Method that displays the triangle
  void display() {
    moveDown(); // Call the moveDown method (to move the triangle down)
    noStroke(); // Remove the stroke of the triangle
    fill(triColor); // Set the color of the triangle based on the randomly generated color
    triangle(x, y, x+(size/tan(PI/3)), y+size, x+2*(size/tan(PI/3)), y); // Draw the triangle using Trig (refer to top to understand the trigonometry)
  }

// Method that moves the triangle down
  void moveDown() {
    y+=speed; // Change the Y-Position of the triangle by adding the speed to it

    // If the triangle has reached the bottom of the screen, reset it to the top
    if (y-size > height) { 
      y = 0; // Resetting to the top
    }
  }

}
