/* 
ICS3U - Assigment #2
Title: Quadratic Lines
Author: Vansh Sethi
*/

void setup() {
    size(600, 600);

}

void draw() {
    for (int c = 1; c <= 4; c++) {
        int xFactor = 0;
        int yFactor = 0;
        switch (c) {
            case 1:
                xFactor = 0;
                yFactor = 0;
            case 2:
                xFactor = 300;
                yFactor = 0;
            case 3:
                xFactor = 0;
                yFactor = 300;
            case 4:
                xFactor = 300;
                yFactor = 300;
        }
        for (int i = 1; i <= (300/20); i++) {
                int x1 = i*20;
                int y1 = 0;
                int x2 = 0;
                int y2 = 300 - (i*20);
                stroke(153);
                line(x1 + xFactor, y1 + yFactor, x2+ xFactor , y2 + yFactor);

                x1 = 300 - i*20;
                y1 = 0;
                x2 = 300;
                y2 = 300 - i*20;
                stroke(153);
                line(x1 + xFactor, y1 + yFactor, x2+ xFactor , y2 + yFactor);

                x1 = i*20;
                y1 = 300;
                x2 = 0;
                y2 = i*20;
                stroke(153);
                line(x1 + xFactor, y1 + yFactor, x2+ xFactor , y2 + yFactor);

                x1 = 300 - i*20;
                y1 = 300;
                x2 = 300;
                y2 = i*20;
                stroke(0);
                line(x1 + xFactor, y1 + yFactor, x2+ xFactor , y2 + yFactor);
        }
    }
  

 

}