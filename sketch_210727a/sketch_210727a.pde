/* 
ICS3U - Final Assignment
Title: Magic Mania
Author: Vansh Sethi
*/

// BREAK UP CODE AFTER!!
PFont PixelFont;
 Mage myMage = new Mage("Blue", 100, 100, "Left");


void setup() {
  size(1400, 768);
  String[] fontList = PFont.list();
  PixelFont = createFont("MinecraftFont.ttf", 32);

}



String name = "Type Name on Keyboard";
int gameState = 0;

// Draw and move the triangles
void draw() {
  clear(); // Clear background such that old triangles are not visible
  background(256, 256, 256); // Re-set the background color
  if (gameState == 0) {
    DrawStartScreen();
  }
  if (gameState == 1) {
    DrawChooseScreen();
    myMage.display();


  }

}



void keyPressed() {
  if (gameState == 0) {
    name = HandleName(key, name);
  }
}

void mousePressed() {
  if (gameState == 0) {
    if (mouseX > 540 && mouseX < 860 && mouseY > 640 && mouseY < 650 + 85) {
      gameState = 1;
      cursor(ARROW);
    }

  }
}

void mouseMoved() {
  if (gameState == 0) {
    if (mouseX > 540 && mouseX < 860 && mouseY > 640 && mouseY < 650 + 85) {
      cursor(HAND);
    }
    else{
      cursor(ARROW);
    }

  }
}


// =========== Game State 0 ===========

// Game Screen Code (put in seperate file later)
void DrawStartScreen() {
    fill(59, 17, 156);
    noStroke();
    rect(0, 0, 350, 768);

    fill(224, 55, 29);
    noStroke();
    rect(350, 0, 350, 768);

    fill(54, 217, 33);
    noStroke();
    rect(700, 0, 350, 768);

    fill(255, 170, 0);
    noStroke();
    rect(1050, 0, 350, 768);

    fill(255, 255, 255);
    textFont(PixelFont);
    textSize(150);
    text("Magic Mania", 280, 200);

    fill(0, 0, 0);
    textFont(PixelFont);
    textSize(75);
    text("Are you Magical Enough to Win?", 165, 350);

    fill(255, 255, 255);
    rect(400, 425, 600, 75, 10, 10, 10, 10);
    
    fill(209, 205, 197);
    textFont(PixelFont);
    textSize(35);
    text(name, 485, 475);

    fill(255, 255, 255, 0);
    strokeWeight(10);
    stroke(255, 255, 255);
    rect(550, 550, 300, 75, 30, 30, 30, 30);

    fill(255, 255, 255);
    textFont(PixelFont);
    textSize(35);
    text("How to Play", 600, 600);

    fill(0,0,0);
    strokeWeight(10);
    rect(550, 650, 300, 75, 30, 30, 30, 30);

    fill(255, 255, 255);
    textFont(PixelFont);
    textSize(35);
    text("Play Game", 610, 700);
}

String HandleName(char key, String name) {

    if (name == "Type Name on Keyboard") {
      name = "";
    }
    if (key == BACKSPACE) {
      return name.substring(0, max(0, name.length()-1));
    }
    if (textWidth(name) > 420) {
      return name;
    }
    return name + key;

}

// =========== Game State 1 ===========
void DrawChooseScreen() {
    clear();
    fill(59, 17, 156);
    noStroke();
    rect(0, 0, 350, 768);

    fill(224, 55, 29);
    noStroke();
    rect(350, 0, 350, 768);

    fill(54, 217, 33);
    noStroke();
    rect(700, 0, 350, 768);

    fill(255, 170, 0);
    noStroke();
    rect(1050, 0, 350, 768);

    fill(255, 255, 255);
    textFont(PixelFont);
    textSize(110);
    text("Choose Your Mage", 215, 180);

}

// Classes Characters
class Mage {
// Data 
  String mageColor;
  int x;
  int y;
  String direction;
  int bodyImage;
  int frames = 1;

  PImage frame1;
  PImage frame2;
  PImage frame3;
  PImage frame4;

// Constructor (initalize variables)
  Mage (String tempColor, int tempX, int tempY,  String tempDirection) {
    this.mageColor = tempColor; // Set the color 
    this.x = tempX; // Set the x position
    this.y = tempY; // Set the y position
    this.bodyImage = 1; // Set the body image
    
    this.frame1 = loadImage("MageCharacter/" + tempColor + "Mage/" + "move1.png");
    this.frame2 = loadImage("MageCharacter/" + tempColor + "Mage/" + "move2.png");
    this.frame3 = loadImage("MageCharacter/" + tempColor + "Mage/" + "move3.png");
    this.frame4 = loadImage("MageCharacter/" + tempColor + "Mage/" + "move4.png");
  }

  void display() {
    print(this.frames);
    this.frames = this.frames + 1;
    print(this.frames);
    if (this.frames < 1) {
      image(frame1, x, y); // Display the image
    }
    else if (this.frames < 10) {
      image(frame2, x, y); // Display the image
    }
    else if (this.frames > 20) {
      image(frame3, x, y); // Display the image
    }
    else if (this.frames > 30) {
      image(frame4, x, y); // Display the image
    }

  }

}
