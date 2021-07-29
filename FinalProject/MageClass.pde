// Mage Character Class
class Mage {
// Data 
  String mageColor;
  int x;
  int y;
  String direction;
  int staffImage = 0;
  PImage[] staffs = new PImage[3];
  int bodyImage;
  int frames = 1;
  boolean staff = false;

  boolean staffAttack = false;
  
// Image frames
  PImage frame1;
  PImage frame2;
  PImage frame3;
  PImage frame4;



// Constructor (initalize variables)
  Mage (String tempColor, int tempX, int tempY,  String tempDirection, String size) {
    this.mageColor = tempColor; // Set the color 
    this.x = tempX; // Set the x position
    this.y = tempY; // Set the y position
    this.bodyImage = 1; // Set the body image
    direction = tempDirection; // Set the direction
    
    // Non-selectable mage (has staff)
    if (size == "Small") {
      this.frame1 = loadImage("MageCharacter/" + tempColor + "Mage/" + "move1.png");
      this.frame1.resize(90, 100);
      this.frame2 = loadImage("MageCharacter/" + tempColor + "Mage/" + "move2.png");
      this.frame2.resize(90, 100);
      this.frame3 = loadImage("MageCharacter/" + tempColor + "Mage/" + "move3.png");
      this.frame3.resize(93, 100);
      this.frame4 = loadImage("MageCharacter/" + tempColor + "Mage/" + "move4.png");
      this.frame4.resize(93, 100);

      this.staffs[0] = loadImage("MageCharacter/Staff/staff1.png");
      this.staffs[0].resize(27, 73);
      this.staffs[1] = loadImage("MageCharacter/Staff/staff2.png");
      this.staffs[1].resize(27, 73);

      this.staffs[2] = loadImage("MageCharacter/Staff/staff3.png");
      this.staffs[2].resize(27, 73);

      staff = true;
    }

    // Selectable mage (no staff)
    if (size == "Large") {
      this.frame1 = loadImage("MageCharacter/" + tempColor + "Mage/" + "move1.png");
      this.frame1.resize(238, 264);
      this.frame2 = loadImage("MageCharacter/" + tempColor + "Mage/" + "move2.png");
      this.frame2.resize(238, 264);
      this.frame3 = loadImage("MageCharacter/" + tempColor + "Mage/" + "move3.png");
      this.frame3.resize(245, 264);
      this.frame4 = loadImage("MageCharacter/" + tempColor + "Mage/" + "move4.png");
      this.frame4.resize(245, 264);
    }



  }

// Show Mage
  void display() {
    this.frames = this.frames + 1;
    if (this.frames % 6 == 0) {
      if (this.bodyImage == 1) {
        this.bodyImage = 2;
      }
      else if (this.bodyImage == 2) {
        this.bodyImage = 3;
      }
      else if (this.bodyImage == 3) {
        this.bodyImage = 4;
      }
      else if (this.bodyImage == 4) {
        this.bodyImage = 1;
      }
    }

    if (this.bodyImage == 1) {
      if (direction == "Right") {
        image(frame1, x, y);
      }
      else {
        pushMatrix();
        translate(x + frame1.width, y);
        scale(-1,1); 
        image(frame1,0,0);
        popMatrix();
      }
    }
    else if (this.bodyImage == 2) {
      if (direction == "Right") {
        image(frame2, x, y);
      }
      else {
        pushMatrix();
        translate(x + frame2.width, y);
        scale(-1,1); 
        image(frame2,0,0);
        popMatrix();
      }
    }
    else if (this.bodyImage == 3) {
      if (direction == "Right") {
        image(frame3, x, y);
      }
      else {
        pushMatrix();
        translate(x + frame3.width, y);
        scale(-1,1); 
        image(frame3,0,0);
        popMatrix();
      }
    }
    else if (this.bodyImage == 4) {
      if (direction == "Right") {
        image(frame4, x, y);
      }
      else {
        pushMatrix();
        translate(x + frame4.width, y);
        scale(-1,1); 
        image(frame4,0,0);
        popMatrix();
      }    
    }

// Show Staff at cursor and rotated relative to mage
    if (staff) {
      noCursor();
      pushMatrix();
      translate(mouseX, mouseY);
      // Rotate staff image by the angle from the mouse to the center of the user's mage in radians
      // Get the angle from the mouse to center of the user's mage  of the screen
      float angle = atan2(mouseY - (userMage.y + userMage.frame1.height), mouseX - (userMage.x + userMage.frame1.width));
      rotate(angle + PI/2);
      image(staffs[staffImage], 0, 0);
      popMatrix();
      if (staffAttack == true && frames % 6 == 0 && staffImage <= 2) {
        staffImage += 1;
      }
      if (staffImage > 2) {
        staffImage = 0;
        staffAttack = false;
      }
      
    }

  }

// Move Mage based on Key
// Constraints are added so it can't move off the bridge in the environment
  void move(char key) {

    if (key == 'w') { 
      if (!(x >= 135 && y <= 340) && !(x <= 135 && y <= 365) && !(x >= 1165 && y <= 365))  {
        y-= 7;
      }
   
    }
    if (key == 'a') { 
      if (direction == "Right") {
        direction = "Left";
      }
      if (!(x <= 150 && y <= 350) && !(x<=180 && y >= 595)) {
        x-= 7;
      }
      if (x <= -90) {
        x = 1390;
      }
    }
    if (key == 's') { 
      if (!(y >= 630 && x >= 180) && !(y >= 590 && x >= 1190) && !(y >= 590 && x <= 110)) {
        y+= 7;
      } 
    }
    if (key == 'd') { 
      if (direction == "Left") {
        direction = "Right";
      }
      if (!(x >= 1150 && y <= 350) && !(x >= 1125 && y >= 595)) {
        x+= 7;
      }
      if (x >= 1390) {
        x = -90;
      }
    }
  }

}
