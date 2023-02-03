PVector point;
int mode = 0;
void setup() {
  //size(500,500);
  fullScreen();
  
  //
  point = new PVector(width/2, height/2);
  if (mode == 0) {
    background(51);
  }
  if (mode == 1) {
    background(255);
  }
}
void mousePressed() {
  mode = (mode + 1) % 2;
  setup();
}

void draw() {
  loadPixels();
  if (mode == 0) {
    binaryWalker();
  } else if (mode == 1) {
    darkWalker();
  }
  updatePixels();
}

void binaryWalker() {
  for (int i = 0; i < 1000; i++) {
    pixels[(int)point.y * width + (int)point.x] = color(255);
    updatePoint();
  }
}

void darkWalker() {
  for (int i = 0; i < 1000; i++) {
    int ind = (int)point.y * width + (int)point.x;
    //pixels[ind] = max(0, pixels[ind] - color(10));
    color col = pixels[ind];
    println(col);
    col = max(color(0), col-color(10));
    pixels[ind] = col;
    updatePoint();
  }
}

void updatePoint() {
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
