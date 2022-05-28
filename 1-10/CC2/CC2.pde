
ArrayList<Box> sponge;
int level;
boolean doStroke;

void setup() {
  size(1000, 1000, P3D);
  sponge = new ArrayList<Box>();
  sponge.add(new Box(0, 0, 0, 600));
  level = 0;
}


void mousePressed() {
  ArrayList<Box> MuNext = new ArrayList<Box>();
  for (Box b : sponge) {
    ArrayList<Box> newBoxes = b.generate();
    MuNext.addAll(newBoxes);
  }
  sponge = MuNext;
  level++;
}

void keyPressed() {
  if (key == 'r') {
    setup();
    return;
  }
  if(key == 's') {
    doStroke = !doStroke;
    return;
  }
  if (key == ' ') {
    mousePressed();
    return;
  }
  
  setup();
  switch(key) {
  case '3':
    mousePressed();
  case '2':
    mousePressed();
  case '1':
    mousePressed();
  case '0':
    //mousePressed();
    break;
  default:
    return;
  }
  
}



float a = 0;
void draw() {
  background(51);
  text("Menger Sponge M" + level, 0, 10);
  stroke(255);
  noFill();
  lights();
  translate(width/2, height/2);
  rotateX(1);
  rotateZ(a * 0.5);
  for (Box b : sponge) {
    b.show();
  }

  a+= 0.01;
}
