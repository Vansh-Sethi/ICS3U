/* 
ICS3U - Formative Variables and Math Exercises
Title: Dynamic Rectangles
Author: Vansh Sethi
*/

void setup() {
    size(700, 300);
    int x = int(random(100, 201));
    fill(255,0,0);
    rect(250,100,x, x/2);

    fill(50, 60, 168);
    rect(255 + x,100,x, x/2);

    fill(3, 255, 3);
    rect(245 - x,100,x, x/2);

}

void draw() {



}