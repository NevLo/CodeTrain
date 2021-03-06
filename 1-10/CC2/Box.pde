class Box {
  PVector pos;
  float radius;

    Box(float x, float y, float z, float r) {
    pos = new PVector(x, y, z);
    radius = r;
  }

  ArrayList<Box> generate() {
    ArrayList<Box> boxes = new ArrayList<Box>();
    for (int x = -1; x < 2; x++) {
      for (int y = -1; y < 2; y++) {
        for (int z = -1; z < 2; z++) {
          int sum = abs(x) + abs(y) + abs(z);
          float newR = radius/3;
          if (sum > 1) {
            Box b = new Box(pos.x+x*newR, pos.y+ y*newR, pos.z+z*newR, newR);
            boxes.add(b);
          }
        }
      }
    }
    return boxes;
  }

  void show() {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    if(!doStroke) noStroke();
    else stroke(0);
    fill(219, 223, 22);
    box(radius);
    popMatrix();
  }
}
