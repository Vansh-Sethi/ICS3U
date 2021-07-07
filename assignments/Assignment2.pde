/* 
ICS3U - Assigment #2
Title: Quadratic Lines
Author: Vansh Sethi
*/

/*
The major idea being implemented: Basically, the entire screen can be broken up into 4 quadrants of the same pattern.
To achieve the pattern, we must draw lines that create a right angle to the corner of the quadrant. This can
be achieved with the use of a for loop, that draws lines from one corner of the quadrant to the adjacent side
until it reaches the other corner of the quadrant. Then, we simplyrepeat the final pattern to another quadrant. In the code, this is acheived with the xFactor and yFactor respectively.

The alternative solution is hardcoding each case, however this would make the code messy and unmaintable. Therefore, this 
approach wask taken.
*/

void setup() {
    // Defining Canvas Size
      size(600, 600);

    // Defining White Background
      background(256, 256, 256, 1);
      for (int c = 1; c <= 4; c++) {

        // Defining 2 variables that recreate the pattern and replicates it in the other 3 quadrants
        int xFactor = 0;
        int yFactor = 0;

        // Quadrant 1 case (0's because no change needed)
        if (c == 1) {
          xFactor = 0;
          yFactor = 0;
        }

        // Quadrant 2 case (300 such that it moves to the top right)
        if (c == 2) {
          xFactor = 300;
          yFactor = 0;
        }

        // Quadrant 3 case (300 such that it moves to the bottom left)
        if (c == 3) {
          xFactor = 0;
          yFactor = 300;
        }

        // Quadrant 4 case (Both 300 such that it moves to the bottom right)
        if (c == 4) {
          xFactor = 300;
          yFactor = 300;
        }
       
        for (int i = 1; i <= (300/20); i++) {
                // Defining top lines (top to left)
                int x1 = i*20;
                int y1 = 0;
                int x2 = 0;
                int y2 = 300 - (i*20);
                stroke(c == 4 ? 0 : 153);
                line(x1 + xFactor, y1 + yFactor, x2+ xFactor , y2 + yFactor);

                // Defining  lines (bottom to left)
                x1 = 300 - i*20;
                y1 = 0;
                x2 = 300;
                y2 = 300 - i*20;
                stroke(c == 3 ? 0 : 153);
                line(x1 + xFactor, y1 + yFactor, x2+ xFactor , y2 + yFactor);

                // Defining  lines (top to right)
                x1 = i*20;
                y1 = 300;
                x2 = 0;
                y2 = i*20;
                stroke(c == 2 ? 0 : 153);
                line(x1 + xFactor, y1 + yFactor, x2+ xFactor , y2 + yFactor);

                // Defining  lines (bottom to right)
                x1 = 300 - i*20;
                y1 = 300;
                x2 = 300;
                y2 = i*20;
                stroke(c == 1 ? 0 : 153);
                line(x1 + xFactor, y1 + yFactor, x2+ xFactor , y2 + yFactor);

                // *Ternary operators in the strokes are used to dynamically make the center lines more dark 
        }
    }
}
