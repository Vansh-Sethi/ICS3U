// Skeleton Character Class
class Skeleton {
  // Data
  int x;
  int y;
  String direction;
  int bodyImage = 0;
  int frames = 1;
  int health = 9;
  boolean attackMode = false;
  int attackImage = 0;

// Image Frames
  PImage[] skeletonWalk = new PImage[4];
  PImage[] skeletonAttack = new PImage[4];

// Constructor (load images and data)
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

// Resize image frames
    for (int i = 0; i < skeletonWalk.length; i++) {
      skeletonWalk[i].resize(int(45*2.5), int(51*2.5));
    }
    for (int i = 0; i < skeletonAttack.length; i++) {
      skeletonAttack[i].resize(int(45*2.5), int(51*2.5));
    }
  }

// Display skeleton (change image based on frames so it looks like it's moving)
  void display() {
    if (dist(userMage.x, userMage.y, x, y) < 100 && attackMode == false) { 
      this.attackMode = true;
    }
    
    if (dist(userMage.x, userMage.y, x, y) > 100 && attackMode == true) { 
      this.attackMode = false;
    }
    

// Moving not attacking images
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

    // Attacking images animation
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

    
    // Show health bar on top of Skeleton
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