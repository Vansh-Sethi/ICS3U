import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class ICS3U extends PApplet {

/* 
ICS3U - Final Assignment
Title: Magic Mania
Author: Vansh Sethi
*/

// BREAK UP CODE AFTER!!
PFont PixelFont;
Mage[] selectionMages = new Mage[4];

ArrayList<Attack> attacks =  new ArrayList<Attack>();

Mage userMage;
PImage gameBackground;


public void setup() {
  
  String[] fontList = PFont.list();
  PixelFont = createFont("MinecraftFont.ttf", 32);
  selectionMages[0] = new Mage("Blue", 50, 300, "Right", "Large");
  selectionMages[1] = new Mage("Red", 405, 300, "Right", "Large");
  selectionMages[2] = new Mage("Green", 755, 300, "Right", "Large");
  selectionMages[3] = new Mage("Yellow", 1105, 300, "Right", "Large");
  gameBackground = loadImage("background.png");
  gameBackground.resize(1400, 768);

}



String name = "Type Name on Keyboard";
int gameState = 0;

// Draw and move the triangles
public void draw() {
  clear(); // Clear background such that old triangles are not visible
  background(256, 256, 256); // Re-set the background color
  if (gameState == 0) {
    DrawStartScreen();
  }
  if (gameState == 1) {
    DrawChooseScreen();
  }
  if (gameState == 2) {
    DrawGameScreen();
  }
}

public void keyPressed() {
  if (gameState == 0) {
    name = HandleName(key, name);
  }
  if (gameState == 2) {
    userMage.move(key);
  }
}

public void mousePressed() {
  if (gameState == 0) {
    if (mouseX > 540 && mouseX < 860 && mouseY > 640 && mouseY < 650 + 85) {
      gameState = 1;
      cursor(ARROW);
    }
  }
  if (gameState == 1) { 
    mageSelect();
  }

  if (gameState == 2) {
    mageAttack();
  }
}

public void mouseMoved() {
  if (gameState == 0) {
    if (mouseX > 540 && mouseX < 860 && mouseY > 640 && mouseY < 650 + 85) {
      cursor(HAND);
    }
    else{
      cursor(ARROW);
    }
  }

  if (gameState == 1) {
    mageHover();
  }
}


// =========== Game State 0 ===========

// Game Screen Code (put in seperate file later)
public void DrawStartScreen() {
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

public String HandleName(char key, String name) {

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
public void DrawChooseScreen() {
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

    for (int i = 0; i < selectionMages.length; i++) {
      selectionMages[i].display();
    }

}

public void mageHover() {
    if (mouseX > 50 && mouseX < 238+50 && mouseY > 300 && mouseY < 300+264) {
      cursor(HAND);
    }
    else if (mouseX > 405 && mouseX < 238+405 && mouseY > 300 && mouseY < 300+264) {
      cursor(HAND);
    }
    else if (mouseX > 755 && mouseX < 238+755 && mouseY > 300 && mouseY < 300+264) {
      cursor(HAND);
    }
    else if (mouseX > 1105 && mouseX < 238+1105 && mouseY > 300 && mouseY < 300+264) {
      cursor(HAND);
    }
    else {
      cursor(ARROW);
    }
}

public void mageSelect() {
    if (mouseX > 50 && mouseX < 238+50 && mouseY > 300 && mouseY < 300+264) {
      userMage = new Mage("Blue", 700, 350, "Right", "Small");
      gameState = 2;
      cursor(ARROW);
    }
    else if (mouseX > 405 && mouseX < 238+405 && mouseY > 300 && mouseY < 300+264) {
      userMage = new Mage("Red", 700, 350, "Right", "Small");
      gameState = 2;
      cursor(ARROW);
    }
    else if (mouseX > 755 && mouseX < 238+755 && mouseY > 300 && mouseY < 300+264) {
      userMage = new Mage("Green", 700, 350, "Right", "Small");
      gameState = 2;
      cursor(ARROW);
    }
    else if (mouseX > 1105 && mouseX < 238+1105 && mouseY > 300 && mouseY < 300+264) {
      userMage = new Mage("Yellow", 700, 350, "Right", "Small");
      gameState = 2;
      cursor(ARROW);
    }
    else {
      int nothing;
    }
}

// =========== Game State 2 ===========
public void DrawGameScreen() {
    clear();
    image(gameBackground, 0,0);
    userMage.display();

    for (int i = attacks.size() - 1; i >= 0; i--) {
      Attack circle = attacks.get(i);
      circle.display();
    }

}

public void mageAttack() {
  attacks.add(new Attack(userMage.x, userMage.y, 1));
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
  boolean staff = false;

  PImage frame1;
  PImage frame2;
  PImage frame3;
  PImage frame4;
  PImage staff1;
  PImage staff2;
  PImage staff3;


// Constructor (initalize variables)
  Mage (String tempColor, int tempX, int tempY,  String tempDirection, String size) {
    this.mageColor = tempColor; // Set the color 
    this.x = tempX; // Set the x position
    this.y = tempY; // Set the y position
    this.bodyImage = 1; // Set the body image
    direction = tempDirection; // Set the direction
    
    
    if (size == "Small") {
      this.frame1 = loadImage("MageCharacter/" + tempColor + "Mage/" + "move1.png");
      this.frame1.resize(90, 100);
      this.frame2 = loadImage("MageCharacter/" + tempColor + "Mage/" + "move2.png");
      this.frame2.resize(90, 100);
      this.frame3 = loadImage("MageCharacter/" + tempColor + "Mage/" + "move3.png");
      this.frame3.resize(93, 100);
      this.frame4 = loadImage("MageCharacter/" + tempColor + "Mage/" + "move4.png");
      this.frame4.resize(93, 100);

      this.staff1 = loadImage("MageCharacter/Staff/staff1.png");
      this.staff1.resize(27, 73);
      this.staff2 = loadImage("MageCharacter/Staff/staff2.png");
      this.staff2.resize(27, 73);

      this.staff3 = loadImage("MageCharacter/Staff/staff3.png");
      this.staff3.resize(27, 73);

      staff = true;
    }

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

  public void display() {
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

    if (staff) {
      noCursor();

      pushMatrix();
      translate(mouseX, mouseY);
  
      // Rotate staff image by the angle from the mouse to the center of the user's mage in radians

      // Get the angle from the mouse to center of the user's mage  of the screen


      float angle = atan2(mouseY - (userMage.y), mouseX - (userMage.x));

      // Rotate staff image by the angle from the mouse to the center of the user's mage in radians

      


      rotate(angle + PI/2);
      image(staff1, 0, 0);
      popMatrix();
    }



  }

  public void move(char key) {
    if (key == 'w') { 
      y-= 5;
    }
    if (key == 'a') { 
      if (direction == "Right") {
        direction = "Left";
      }
      x-= 5;
    }
    if (key == 's') { 
      y+= 5;
    }
    if (key == 'd') { 
      if (direction == "Left") {
        direction = "Right";
      }
      x+= 5;
    }
  }

}

class Attack {
  int x;
  int y;
  int frames;
  PVector direction;
  int speed;

  Attack (int tempX, int tempY, int tempSpeed) {
    this.x = tempX;
    this.y = tempY;
    this.direction = new PVector(mouseX, mouseY);
    this.speed = tempSpeed;
  }

  public void display() {
    // Show a circle at the x and y position and update the position in the direction vector
    ellipse(x, y, 10, 10);
    x += direction.x * speed*0.01f;
    y += direction.y * speed*0.01f;

    
  }
}
  public void settings() {  size(1400, 768); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "ICS3U" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
