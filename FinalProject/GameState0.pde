// =========== Game State 0 ===========

// Start Screen Code (Drawing)
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


// Handling Name on Screen
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