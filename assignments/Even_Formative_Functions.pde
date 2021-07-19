/* 
ICS3U - Formative Functions
Title: Even or Odd?
Author: Vansh Sethi
*/

void setup() {
  // Set up the screen
 size(512, 512);
//  Run function
 println(is_even(5)); 
}

// Returns Boolean and since num can only be even or odd, all we have to do is check for even and if not even, it will return false
boolean is_even(int num) {
  // Returns true if num is even and false if not
    return num % 2 == 0;
}