// =========== Game State 1 ===========

// Drawing to Screen
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

    // Displaying the Selection Mages
    for (int i = 0; i < selectionMages.length; i++) {
      selectionMages[i].display();
    }

}

// If Mage is Hovered, make cursor a Hand
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

// Checking if a mage is selected
// If it is, go to next game state and use that mage (set to user mage)
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