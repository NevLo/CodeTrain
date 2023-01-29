PVector point;

void setup() {
  fullScreen();
  background(51);
  point = new PVector(width/2, height/2);
}

void draw() {
  loadPixels();
  for (int i = 0; i < 1000; i++) {
    pixels[(int)point.y * width + (int)point.x] = color(255);
    int direction = floor(random(4));
    switch(direction) {
    case 0://UP
      point.y = abs((point.y - 1 + height) % height);
      break;
    case 1://RIGHT
      point.x = abs((point.x + 1 + width) % width);
      break;
    case 2://DOWN
      point.y = abs((point.y + 1 + height) % height);
      break;
    case 3://LEFT
      point.x = abs((point.x - 1+width) % width);
      break;
    }
  }
  updatePixels();
}
