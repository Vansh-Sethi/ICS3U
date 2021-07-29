// =========== Game State 3 ===========

// Draw the Death Screen
void DrawGameOverScreen() {
  // Reset variables
  clear();
  lives = 3;
  attacks.clear();
  skeletons.clear();

// Reset skeletons (such that game be played again)
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
  text("Your Final Score: " + score, 340, 300);

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

// If the user clicks on the "Yes" button, the game will be reset, if not, it will close the program
void handlePlayAgain() {
  if ((mouseX > 543 && mouseX < 853) && (mouseY < 574 && mouseY > 496)) {
    gameState = 1;
  }
  else if (mouseX > 546 && mouseX < 852 && mouseY > 595 && mouseY < 677) {
    exit();
  }
}

// If the user hovers on either button, the cursor will change to a hand
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



