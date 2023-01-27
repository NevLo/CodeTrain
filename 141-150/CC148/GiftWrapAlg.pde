ArrayList<PVector> points;
ArrayList<PVector> hull;


void setup() {
  size(800, 600);
  points = new ArrayList<>();
  hull = new ArrayList<>();
  /*
  for (int i = 0; i < 30; i++) {
    float x = random(width/2) + width/4;
    float y = random(height/2) + height/4;
    points.add(new PVector(x, y));
  }
  */
  //hull = wrap(points);
}
void keyPressed(){
 if(keyCode == ENTER){
  hull = wrap(points); 
 }
}
void mousePressed(){
 points.add(new PVector(mouseX, mouseY)); 
}

void draw() {
  background(51);
  noFill(); 
  stroke(255, 0, 0);
  strokeWeight(2);
  beginShape();
  for (PVector h : hull) {
    vertex(h.x, h.y);
  }
  
  endShape(CLOSE);
  stroke(255);
  strokeWeight(4);
  for (PVector p : points) {
    point(p.x, p.y);
  }
}


ArrayList<PVector> wrap(ArrayList<PVector> points) {
  ArrayList<PVector> hul = new ArrayList<>();
  //Add left most point to hull (guaranteed to be in hull)
  int leftMostInd = 0;
  for (int i = 1; i < points.size(); i++) {
    if (points.get(i).x < points.get(leftMostInd).x) {
      leftMostInd = i;
    }
  }
  PVector pointOnHull = points.get(leftMostInd);
  PVector endpoint;
  int iterator = 0;
  do {
    hul.add(pointOnHull);
    endpoint = points.get(0);
    for (int j = 0; j < points.size(); j++) {
      if ((endpoint == pointOnHull) || (leftOfLine(points.get(j), hul.get(iterator), endpoint))) endpoint = points.get(j);
    }
    iterator++;
    pointOnHull = endpoint;
  } while (hul.get(0) != endpoint);
  return hul;
}
boolean leftOfLine(PVector c, PVector a, PVector b) {
  return ((b.x - a.x) * (c.y - a.y) - (b.y - a.y) * (c.x - a.x)) > 0;
}
