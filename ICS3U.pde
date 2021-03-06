/* 
ICS3U - Final Assignment
Title: Magic Mania
Author: Vansh Sethi
*/

// BREAK UP CODE AFTER!!
PFont PixelFont;
Mage[] selectionMages = new Mage[4];

ArrayList<Attack> attacks =  new ArrayList<Attack>();
ArrayList<Skeleton> skeletons =  new ArrayList<Skeleton>();


Mage userMage;
PImage gameBackground;
PImage emptyHeart;
PImage fullHeart;

int score = 0;
int runTime = 0;
int lives = 3;

void setup() {
  size(1400, 768);
  String[] fontList = PFont.list();
  PixelFont = createFont("MinecraftFont.ttf", 32);
  selectionMages[0] = new Mage("Blue", 50, 300, "Right", "Large");
  selectionMages[1] = new Mage("Red", 405, 300, "Right", "Large");
  selectionMages[2] = new Mage("Green", 755, 300, "Right", "Large");
  selectionMages[3] = new Mage("Yellow", 1105, 300, "Right", "Large");
  gameBackground = loadImage("background.png");
  gameBackground.resize(1400, 768);
  emptyHeart = loadImage("MageCharacter/emptyHeart.png");
  emptyHeart.resize(64, 55);

  fullHeart = loadImage("MageCharacter/fullHeart.png");
  fullHeart.resize(64, 55);


  for (int i = 0; i < 5; i++) {
    skeletons.add(new Skeleton(int(random(0, width)), int(random(340, 590)), "Right"));
  }

}



String name = "Type Name on Keyboard";
int gameState = 0;

// Draw and move the triangles
void draw() {
  clear(); // Clear background such that old triangles are not visible
  background(256, 256, 256); // Re-set the background color
  if (gameState == 0 || gameState == 10) {
    DrawStartScreen();
  }

  if (gameState == 1) {
    DrawChooseScreen();
  }
  if (gameState == 2) {
    DrawGameScreen();
  }
  if (gameState == 3) {
    DrawGameOverScreen();
  }
}

void keyPressed() {
  if (gameState == 0) {
    name = HandleName(key, name);
  }
  if (gameState == 2) {
    userMage.move(key);

  }
  
}

void mousePressed() {
  if (gameState == 0) {
    if (mouseX > 540 && mouseX < 860 && mouseY > 640 && mouseY < 650 + 85) {
      gameState = 1;
      cursor(ARROW);
    }
    else if (mouseX > 540 && mouseX < 860 && mouseY > 545 && mouseY < 625) {
      gameState = 10;
      cursor(ARROW);
    }
  }
  if (gameState == 1) { 
    mageSelect();
  }

  if (gameState == 2) {
    if (runTime > 20) {
      mageAttack();
    }
  }

  if (gameState == 3) {
    handlePlayAgain();
  }

  if (gameState == 10) {
    if (mouseX > 545 && mouseX < 863 && mouseY > 593 && mouseY < 677) {
      gameState = 0;
    }
  }
}

void mouseMoved() {
  if (gameState == 0) {
    if (mouseX > 540 && mouseX < 860 && mouseY > 640 && mouseY < 650 + 85) {
      cursor(HAND);
    }
    else if (mouseX > 540 && mouseX < 860 && mouseY > 545 && mouseY < 625) {
      cursor(HAND);
    }
    
    else{
      cursor(ARROW);
    }
  }

  if (gameState == 1) {
    mageHover();
  }

  if (gameState == 3) {
    handlePlayAgainHover();
  }

  if (gameState == 10) {
    if (mouseX > 545 && mouseX < 863 && mouseY > 593 && mouseY < 677) {
      cursor(HAND);
    }
    else {
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

  if (gameState == 10) {
    // Instructions
    fill(0, 0, 0, 230);
    rect(50, 30, 1300, 700);

    fill(255, 255, 255);
    textFont(PixelFont);
    textSize(75);
    text("How to Play", 480, 150);

    textSize(40);
    text("- WASD to move", 380, 250);

    textSize(40);
    text("- Move Mouse to Aim", 380, 350);

    textSize(40);
    text("- Click to Shoot", 380, 450);

    textSize(40);
    text("- +100 Points for Killing One Skeleton", 380, 550);

    
    fill(255, 255, 255, 0);
    strokeWeight(10);
    stroke(255, 255, 255);
    rect(550, 600, 300, 75, 30, 30, 30, 30);

    fill(255, 255, 255);
    textFont(PixelFont);
    textSize(35);
    text("Let's Play", 622, 650);
  }
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

    for (int i = 0; i < selectionMages.length; i++) {
      selectionMages[i].display();
    }

}

void mageHover() {
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

void mageSelect() {
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
void DrawGameScreen() {
    clear();
    image(gameBackground, 0,0);
    runTime += 1;

  
    HashMap<Integer, String> deleteAttack = new HashMap<Integer, String>();
    IntList toRemoveSkeles =  new IntList();
    IntList toRemoveAttacks =  new IntList();

    for (int i = attacks.size() - 1; i >= 0; i--) {
      Attack circle = attacks.get(i);
      circle.display();
      for (int j = skeletons.size() - 1; j >= 0; j--) {
        Skeleton enemy = skeletons.get(j);
        if ((circle.x < enemy.skeletonWalk[0].width+enemy.x && circle.x > enemy.skeletonWalk[0].width-enemy.x) && (circle.y < enemy.skeletonWalk[0].height+enemy.y && circle.y > enemy.skeletonWalk[0].height-enemy.y)) {
          toRemoveAttacks.append(i);
          deleteAttack.put(i, "Destroy");
          enemy.health -= 3;
          if (enemy.health <= 0) {
            toRemoveSkeles.append(j);
            score += 100;
          }
        }
      }
      if (circle.x < 0 || circle.x > width || circle.y < 0 || circle.y > height) { 
        toRemoveAttacks.append(i);
         deleteAttack.put(i, "Destroy");
      }
    }
    toRemoveSkeles.sort();
    for (int i = toRemoveSkeles.size() - 1; i >= 0; i--) {
      skeletons.remove(toRemoveSkeles.get(i));
    }
    printArray(toRemoveAttacks);
    for (int i = toRemoveAttacks.size() - 1; i >= 0; i--) {
      if (deleteAttack.get(toRemoveAttacks.get(i)) == "Destroy") {
        attacks.remove(toRemoveAttacks.get(i));
        deleteAttack.put(toRemoveAttacks.get(i), "nope");
      }
    }

    toRemoveAttacks.clear();
    toRemoveSkeles.clear();

    for (int i = skeletons.size() - 1; i >= 0; i--) {
      Skeleton enemy = skeletons.get(i);
      enemy.display();
    }

    fill(255, 255, 255);
    textFont(PixelFont);
    textSize(30);
    text("Wizard: " + name, 25, 50);

    text("Score: " + score, 25, 740);
    userMage.display();

    if (lives == 3) {
      image(fullHeart, 1300 ,25);
      image(fullHeart, 1225 ,25);
      image(fullHeart, 1150,25);
    }
    if (lives == 2) {
      image(emptyHeart, 1300 ,25);
      image(fullHeart, 1225 ,25);
      image(fullHeart, 1150,25);
    }
    if (lives == 1) {
      image(emptyHeart, 1300 ,25);
      image(emptyHeart, 1225 ,25);
      image(fullHeart, 1150,25);
    }
    if (lives < 1) {
      image(emptyHeart, 1300 ,25);
      image(emptyHeart, 1225 ,25);
      image(emptyHeart, 1150,25);
    }
    if (lives <= 0) {
      gameState = 3;
    }

    
    


    if (runTime % 100 == 0) {
      skeletons.add(new Skeleton(int(random(0, width)), int(random(340, 590)), "Right"));
    }

}

void mageAttack() {
  attacks.add(new Attack(userMage.x + userMage.frame1.width/2, userMage.y + userMage.frame1.height/2, 1));
  userMage.staffAttack = true;
}

// =========== Game State 3 ===========
void DrawGameOverScreen() {
  clear();
  lives = 3;
  attacks.clear();
  skeletons.clear();

  for (int i = 0; i < 5; i++) {
    skeletons.add(new Skeleton(int(random(0, width)), int(random(340, 590)), "Right"));
  }
  
  image(gameBackground, 0,0);

  fill(0, 0, 0, 150);
  rect(0, 0, width, height);

  fill(255, 255, 255);
  textFont(PixelFont);
  textSize(75);
  text("Game Over!", 485, 200);

  fill(255, 255, 255);
  textFont(PixelFont);
  textSize(75);
  text("Your Final Score: " + score, 350, 300);

  fill(255, 255, 255);
  textFont(PixelFont);
  textSize(50);
  text("Want to Play Again?", 460, 450);

  fill(255, 255, 255);
  textFont(PixelFont);
  textSize(30);
  text("Great Job Wizard, " + name, 20, 750);

  fill(255, 255, 255, 0);
  strokeWeight(10);
  stroke(255, 255, 255);
  rect(550, 500, 300, 75, 30, 30, 30, 30);

  fill(255, 255, 255);
  textFont(PixelFont);
  textSize(35);
  text("Yes", 665, 550);

  fill(0,0,0);
  strokeWeight(10);
  rect(550, 600, 300, 75, 30, 30, 30, 30);

  fill(255, 255, 255);
  textFont(PixelFont);
  textSize(35);
  text("No", 680, 650);


}

void handlePlayAgain() {
  if ((mouseX > 543 && mouseX < 853) && (mouseY < 574 && mouseY > 496)) {
    gameState = 1;
  }
  else if (mouseX > 546 && mouseX < 852 && mouseY > 595 && mouseY < 677) {
    exit();
  }
}

void handlePlayAgainHover() {
  if ((mouseX > 543 && mouseX < 853) && (mouseY < 574 && mouseY > 496)) {
    cursor(HAND);
  }
  else if (mouseX > 546 && mouseX < 852 && mouseY > 595 && mouseY < 677) {
    cursor(HAND);
  }
  else {
    cursor(ARROW);
  }

}

// Classes Characters
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

class Attack {
  int x;
  int y;
  int frames = 0;
  PVector direction;
  int speed;
  PVector inital;
  PImage[] attackImages = new PImage[3];
  int imageShown = 0;

  Attack (int tempX, int tempY, int tempSpeed ) {
    this.x = tempX;
    this.y = tempY;
    this.inital = new PVector(tempX, tempY);
    this.direction = new PVector(mouseX, mouseY);
    this.speed = tempSpeed;

    this.attackImages[0] = loadImage("MageCharacter/attack/attack1.png");
    this.attackImages[0].resize(23*2, 15*2);
    this.attackImages[1] = loadImage("MageCharacter/attack/attack2.png");
    this.attackImages[1].resize(23*2, 15*2);
    this.attackImages[2] = loadImage("MageCharacter/attack/attack3.png");
    this.attackImages[2].resize(23*2, 15*2);


  }

  void display() {
    frames += 1;
    if (frames%6 == 0) { 
      imageShown += 1;
      if (imageShown > 2) {
        imageShown = 0;
      }
    }

    // Fire a projectile from the user's mage at the mouse
    x -= (this.inital.x - this.direction.x) * 0.05;
    y -= (this.inital.y - this.direction.y) * 0.05;
      pushMatrix();
      translate(x, y);
      // Rotate staff image by the angle from the mouse to the center of the user's mage in radians
      // Get the angle from the mouse to center of the user's mage  of the screen
      float angle = atan2(y - (inital.y), x - (inital.x));
      rotate(angle);
      image(attackImages[imageShown], 0, 0);
      popMatrix();


  
  }
}

class Skeleton {
  int x;
  int y;
  String direction;
  int bodyImage = 0;
  int frames = 1;
  int health = 9;
  boolean attackMode = false;
  int attackImage = 0;


  PImage[] skeletonWalk = new PImage[4];
  PImage[] skeletonAttack = new PImage[4];

  Skeleton(int tempX, int tempY, String tempDirection) {
    this.x = tempX;
    this.y = tempY;
    this.direction = tempDirection;
    skeletonWalk[0] = loadImage("Skeleton/walk/walk1.png");
    skeletonWalk[1] = loadImage("Skeleton/walk/walk2.png");
    skeletonWalk[2] = loadImage("Skeleton/walk/walk3.png");
    skeletonWalk[3] = loadImage("Skeleton/walk/walk4.png");

    skeletonAttack[0] = loadImage("Skeleton/fight/fight1.png");
    skeletonAttack[1] = loadImage("Skeleton/fight/fight2.png");
    skeletonAttack[2] = loadImage("Skeleton/fight/fight3.png");
    skeletonAttack[3] = loadImage("Skeleton/fight/fight4.png");


    for (int i = 0; i < skeletonWalk.length; i++) {
      skeletonWalk[i].resize(int(45*2.5), int(51*2.5));
    }
    for (int i = 0; i < skeletonAttack.length; i++) {
      skeletonAttack[i].resize(int(45*2.5), int(51*2.5));
    }
  }

  void display() {
    if (dist(userMage.x, userMage.y, x, y) < 100 && attackMode == false) { 
      this.attackMode = true;
    }
    
    if (dist(userMage.x, userMage.y, x, y) > 100 && attackMode == true) { 
      this.attackMode = false;
    }
    


    if (!this.attackMode) {

      x += (userMage.x - x) * 0.01;
      y += (userMage.y - y) * 0.01;

      if (x > userMage.x) {
        direction = "Left";
      }
      else {
        direction = "Right";
      }

      this.frames = this.frames + 1;
      if (this.frames % 6 == 0) {
        if (this.bodyImage == 0) {
          this.bodyImage = 1;
        }
        else if (this.bodyImage == 1) {
          this.bodyImage = 2;
        }
        else if (this.bodyImage == 2) {
          this.bodyImage = 3;
        }
        else if (this.bodyImage == 3) {
          this.bodyImage = 1;
        }
      }

      if (direction == "Right") {
        image(skeletonWalk[bodyImage], x, y);
      }
      else {
        pushMatrix();
        translate(x + skeletonWalk[bodyImage].width, y);
        scale(-1,1); 
        image(skeletonWalk[bodyImage],0,0);
        popMatrix();
      }
    }
    else {
      if (x > userMage.x) {
        direction = "Left";
      }
      else {
        direction = "Right";
      }

      this.frames = this.frames + 1;
      if (this.frames % 12 == 0) {
        if (this.attackImage == 0) {
          this.attackImage = 1;
        }
        else if (this.attackImage == 1) {
          this.attackImage = 2;
        }
        else if (this.bodyImage == 2) {
          this.attackImage = 3;
          if(dist(userMage.x, userMage.y, x, y) < 100) {
            lives -= 1;
          }
        }
        else if (this.bodyImage == 3) {
          // this.attackMode = false;

          this.attackImage = 0;
        }
      }

      if (direction == "Right") {
        image(skeletonWalk[attackImage], x, y);
      }
      else {
        pushMatrix();
        translate(x + skeletonAttack[attackImage].width, y);
        scale(-1,1); 
        image(skeletonAttack[attackImage],0,0);
        popMatrix();
      }
      
    }

    
    
    if (health == 10) {
      fill(77, 255, 0);
      rect(x, y-15, 85, 10);

    }
    else if (health > 4) {
      fill(251, 255, 0);
      rect(x, y-15, 55, 10);

    }
    else {
      fill(255, 4, 0);
      rect(x, y-15, 25, 10);
    }
    
  }
}