/* 
ICS3U - Assignment 5
Title: Parallax Triangles
Author: Vansh Sethi
*/

// Create instances of Triangles
Triangle[] LargeTriangles = new Triangle[25];
Triangle[] MediumTriangles = new Triangle[20];
Triangle[] SmallTriangles = new Triangle[15];
// int x = 0;



void setup() {
  // Set up the screen
 size(512, 512);
//  pushMatrix();


  // Set up the triangles
  for (int i = 0; i < LargeTriangles.length; i++) {
    LargeTriangles[i] = new Triangle(int(random(0, width)), int(random(0, height)), random(0.5, 1.5), "foreground", 2.2);
  }

  for (int i = 0; i < MediumTriangles.length; i++) {
    MediumTriangles[i] = new Triangle(int(random(0, width)), int(random(0, height)), random(0.5, 1.5), "midground", 1.3);
  }

  for (int i = 0; i < SmallTriangles.length; i++) {
    SmallTriangles[i] = new Triangle(int(random(0, width)), int(random(0, height)), random(0.5, 1.5), "background", 1.0);
  }



}

// Draw and move the triangles
void draw() {
  clear();
  background(0, 42, 47);
  for (int i = 0; i < LargeTriangles.length; i++) {
    LargeTriangles[i].display();
  }

  for (int i = 0; i < MediumTriangles.length; i++) {
    MediumTriangles[i].display();
  }

  for (int i = 0; i < SmallTriangles.length; i++) {
    SmallTriangles[i].display();
  }
  // int size = 35;
  // triangle(200, 200, 200+(size/tan(PI/3)), 200-size, 200+2*(size/tan(PI/3)), 200);


  // translate(220, 186);
  // rotate(radians(x));
  // x+=1;
  // triangle(0, 0, (size/tan(PI/3)), size, 2*(size/tan(PI/3)), 0);


}

// Create the object Triangle
class Triangle {
// Data 
  int x;
  int y;
  float rotateSpeed;
  String type; 
  int size; 
  float move;
  float speed;
  color triColor;

// Constructor (initalize variables)
  Triangle (int tempX, int tempY, float tempRotateSpeed, String tempType, float tempSpeed) {
    x = tempX;
    y = tempY;
    move = random(0, 100);
    rotateSpeed = tempRotateSpeed;
    type = tempType;
    if (type == "foreground") {
      size = 35;
    }
    else if (type == "midground") {
      size = 25;
    }
    else {
      size = 15;
    }
    speed = tempSpeed;
    int a = int(random(0, 4));
    if (a == 1) {
      triColor = color(231, 223, 175);
    }
    if (a == 2) {
      triColor = color(171, 163, 125);
    }
    if (a == 3) {
      triColor = color(0, 93, 132);
    }
    else {
      triColor = color(255, 255, 255);
    }
  }

// Method that displays the triangle
  void display() {
    translate(x,y);
    rotate(radians(move));
    move+=rotateSpeed;
    noStroke();
    fill(triColor);
    triangle(0, 0, (size/tan(PI/3)), size, 2*(size/tan(PI/3)), 0);
    moveDown();
    resetMatrix();


  }

  void moveDown() {
    y+=speed;
 
    
    if (y-size > height) { 
      y = 0;
    }
  }

}
