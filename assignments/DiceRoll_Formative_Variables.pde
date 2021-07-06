/* 
ICS3U - Formative Variables and Math Exercises
Title: Dice Roll Simulation
Author: Vansh Sethi
*/

void setup() {
    size(1000, 500);
    int x1 = int(random(1, 7));
    int x2 = int(random(1, 7));

    textSize(75);
    fill(106, 64, 189);
    text("Simulating Dice Roll", 140, 175);

    fill(106, 64, 189);
    textSize(75);
    text("You got the number: " + str(x1), 100, 325);

}

void draw() {



}