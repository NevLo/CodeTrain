/*
 * Coding Train Coding Challenge 1. Starfield
 * "star field" or "warp speed" visualization in Processing.
 * https://youtu.be/17WoOqgXsRM
 *
 *
 */

float speed;
Star[] stars = new Star[400];
boolean drawEllipse = false;

void setup() {
  size(600, 600);
  for (int i = 0; i < stars.length; i++) stars[i] = new Star();
}


void draw() {
  background(0);
  speed = map(mouseX, 0, width, 0, 50);
  
  for (int i = 0; i < stars.length; i++) {
    stars[i].update();
    stars[i].show();
  }
}
