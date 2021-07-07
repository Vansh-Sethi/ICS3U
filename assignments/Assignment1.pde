/* 
ICS3U - Assigment #1
Title: Coincentric Circles
Author: Vansh Sethi
*/

/*
The major idea being implemented: Check if the distance to the center of the circle is smaller than the radius, meaning
that it is inside the circle. We do this 3 times for all the radii.

The alternative 'solution' is treating the circle as a rectangle, however this would discount many cases.
*/

void setup() {
    // Define canvas size
    size(600, 600);
}

void draw() {
    // Define background color
    background(214, 214, 214);

    // Small cirlce (check if radius is below 100)
    if (dist(mouseX, mouseY, 300,300) <= 100) {
        clear(); 
        background(214, 214, 214);

        fill(255,255,255);
        circle(300, 300, 600);
        circle(300, 300, 400);

        // Change the color of the small circle 
        fill(242, 255, 3);
        circle(300, 300, 200);

        // Define cross and make it follow the mouse
        line(mouseX, mouseY, mouseX, mouseY+10);
        line(mouseX, mouseY, mouseX, mouseY-10);
        line(mouseX, mouseY, mouseX+10, mouseY);
        line(mouseX, mouseY, mouseX-10, mouseY);
    }

    // Medium Circle (check if radius is below 200)
    else if (dist(mouseX, mouseY, 300,300) <= 200) {
        clear();
        background(214, 214, 214);

        fill(255,255,255);
        circle(300, 300, 600);

        // Change the color of the medium circle 
        fill(34, 255, 5);
        circle(300, 300, 400);

        fill(255,255,255);
        circle(300, 300, 200);

        // Define rectangle and make it follow the mouse
        fill(255,255,255);
        rect(mouseX, mouseY, 20, 20);
    }

    // Large Circle (check if radius is below 300)
    else if (dist(mouseX, mouseY, 300,300) <= 300) {
        clear();
        background(214, 214, 214);

        // Change the color of the large circle 
        fill(255,0,0);
        circle(300, 300, 600);

        fill(255,255,255);
        circle(300, 300, 400);

        fill(255,255,255);
        circle(300, 300, 200);

        // Define circle and make it follow the mouse
        fill(255,255,255);
        circle(mouseX, mouseY, 20);
    }

    // Last Case (Cursor not in any of the circles)
    else {
        clear();
        background(214, 214, 214);
      
        fill(255,255,255);
        circle(300, 300, 600);
        circle(300, 300, 400);
        circle(300, 300, 200);
    }

}