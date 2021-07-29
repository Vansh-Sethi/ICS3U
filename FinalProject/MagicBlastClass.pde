// Magic Blast Class
class Attack {
  // Data
  int x;
  int y;
  int frames = 0;
  PVector direction;
  int speed;
  PVector inital;
  PImage[] attackImages = new PImage[3];
  int imageShown = 0;

// Initalize Variables and load Images of Sprites of Image
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

// Show the Magic Blast
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