// =========== Game State 2 ===========

// Drawing the Game Environment and Elements on it
void DrawGameScreen() {
    clear();

    image(gameBackground, 0,0); // Image of the background
    runTime += 1; // Increase the runTime by 1

  

    // Following Code checks for collisions between Magic Blasts and Skeletons (in O(N^2) time)
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
    for (int i = toRemoveAttacks.size() - 1; i >= 0; i--) {
      if (deleteAttack.get(toRemoveAttacks.get(i)) == "Destroy") {
        attacks.remove(toRemoveAttacks.get(i));
        deleteAttack.put(toRemoveAttacks.get(i), "nope");
      }
    }

    toRemoveAttacks.clear();
    toRemoveSkeles.clear();

// Show Enemy Skeletons
    for (int i = skeletons.size() - 1; i >= 0; i--) {
      Skeleton enemy = skeletons.get(i);
      enemy.display();
    }

// User's Name in Bottom Left
    fill(255, 255, 255);
    textFont(PixelFont);
    textSize(30);
    text("Wizard: " + name, 25, 50);

// Show User's Score in top Left
    text("Score: " + score, 25, 740);
    userMage.display();

// Show User's Lives in Top Right
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

    
    

// Every so often, a new Skeleton is created
    if (runTime % 100 == 0) {
      skeletons.add(new Skeleton(int(random(0, width)), int(random(340, 590)), "Right"));
    }

}

// If the user clicks, an attack (magic blast) is created
void mageAttack() {
  attacks.add(new Attack(userMage.x + userMage.frame1.width/2, userMage.y + userMage.frame1.height/2, 1));
  userMage.staffAttack = true;
}