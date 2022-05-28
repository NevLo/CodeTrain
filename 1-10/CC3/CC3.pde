int score;
void setup() {
  size(800, 900);
}
void keyPressed() {
  if (keyCode == UP) {
  }
  if (keyCode == DOWN) {
  }
  if (keyCode == LEFT) {
  }
  if (keyCode == RIGHT) {
  }
}

void draw() {
  textSize(20);
  text("Score: " + score, 0, 30);
  translate(0, 100);
  for (int i = 0; i < width; i+=20) {
    line(i, 0, i, height);
    line(0, i, width, i);
  }
}
