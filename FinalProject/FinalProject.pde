/*
 __  __             _        __  __             _       
|  \/  |           (_)      |  \/  |           (_)      
| \  / | __ _  __ _ _  ___  | \  / | __ _ _ __  _  __ _ 
| |\/| |/ _` |/ _` | |/ __| | |\/| |/ _` | '_ \| |/ _` |
| |  | | (_| | (_| | | (__  | |  | | (_| | | | | | (_| |
|_|  |_|\__,_|\__, |_|\___| |_|  |_|\__,_|_| |_|_|\__,_|
               __/ |                                    
              |___/          

By. Vansh Sethi
Summative for ICS3U                           
*/

/* 
========================================
 Game Structure: The Game is divided into 5 parts:
 1. Start Screen
 2. How to Play Screen
 3. Selection Screen
 4. Game Screen
 5. End Screen

 The code for each part is written in seperate files, and the gameState global variable controls what part is shown or being played to the user
 The start screen corresponds to gameState 0, selection screen corresponds to gameState 1, game screen corresponds to gameState 2, and end screen corresponds to gameState 3

 There are 3 classes: Skeletons, Mages, and Magic Blasts. Those can be found in their respective files.
========================================
*/ 
// Global Variables
PFont PixelFont; // Pixel Font

Mage[] selectionMages = new Mage[4]; // Selection Mages
ArrayList<Attack> attacks =  new ArrayList<Attack>(); // List of Magic Blasts on Screen
ArrayList<Skeleton> skeletons =  new ArrayList<Skeleton>(); // List of Skeletons on Screen
Mage userMage; // User Mage

PImage gameBackground; // Game Background
PImage emptyHeart; // Empty Heart Image
PImage fullHeart; // Filled Heart Image

int score = 0; // Initalize Score
int runTime = 0; // Initalize Runtime
int lives = 3; // Initalize Lives
String name = "Type Name on Keyboard"; // Initalize Name
int gameState = 0; // Initalize Gamestate

// Set up the Game
void setup() {
  size(1400, 768); // Screen Size
  PixelFont = createFont("MinecraftFont.ttf", 32); // Set up Pixel Font

  selectionMages[0] = new Mage("Blue", 50, 300, "Right", "Large"); // Set up Blue Mage 
  selectionMages[1] = new Mage("Red", 405, 300, "Right", "Large"); // Set up Red Mage
  selectionMages[2] = new Mage("Green", 755, 300, "Right", "Large"); // Set up Green Mage
  selectionMages[3] = new Mage("Yellow", 1105, 300, "Right", "Large"); // Set up Yellow Mage

  gameBackground = loadImage("background.png"); // Set up Game Background
  gameBackground.resize(1400, 768); // Resize Game Background
  emptyHeart = loadImage("MageCharacter/emptyHeart.png"); // Set up Empty Heart Image
  emptyHeart.resize(64, 55); // Resize Empty Heart Image

  fullHeart = loadImage("MageCharacter/fullHeart.png"); // Set up Full Heart Image
  fullHeart.resize(64, 55); // Resize Full Heart Image

  // Initalize 5 Skeletons to be on Screen when Game Starts
  for (int i = 0; i < 5; i++) {
    skeletons.add(new Skeleton(int(random(0, width)), int(random(340, 590)), "Right"));
  }
}

// Draw the Game based on GameState
void draw() {
  clear(); 
  background(256, 256, 256); 
  // Start Screen
  if (gameState == 0 || gameState == 10) {
    DrawStartScreen();
  }
  // Selection Screen
  if (gameState == 1) {
    DrawChooseScreen();
  }
  // Game Screen
  if (gameState == 2) {
    DrawGameScreen();
  }
  // Death Screen
  if (gameState == 3) {
    DrawGameOverScreen();
  }
}

// Handling of Key Presses
void keyPressed() {
  // Start Screen (if type name)
  if (gameState == 0) {
    name = HandleName(key, name);
  }
  // Move User's Mage (WASD)
  if (gameState == 2) {
    userMage.move(key);
  }
}

// Handle Mouse Presses
void mousePressed() {
  // Clicking Start and How to Play Buttons
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

  // Selecting a Mage
  if (gameState == 1) { 
    mageSelect();
  }

  // Creating a Magic Blast
  if (gameState == 2) {
    if (runTime > 20) {
      mageAttack();
    }
  }

  // Button to Restart Game
  if (gameState == 3) {
    handlePlayAgain();
  }

  // Clicking Back Button on How to Screen
  if (gameState == 10) {
    if (mouseX > 545 && mouseX < 863 && mouseY > 593 && mouseY < 677) {
      gameState = 0;
    }
  }
}

// Handling hovering on buttons (to make cursor a hand)
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