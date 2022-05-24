class Star {
  PVector pos;
  float pz;
  Star() {
    float x = random(-width/2, width/2);
    float y = random(-height/2, height/2);
    float z = random(0, width);
    pos = new PVector(x, y, z);
  }

  void update() {
    pos.z = pos.z - speed;
    if ( pos.z < 1) {
      pos.z = width;
      pos.x = random(-width/2, width/2);
      pos.y = random(-height/2, height/2);
      pz = pos.z;
    }
  }

  void show() {
    float sx = map(pos.x/pos.z, -0.5, 0.5, 0, width);
    float sy = map(pos.y/pos.z, -0.5, 0.5, 0, height);
    if (drawEllipse) {
      float r = map(pos.z, 0, width, 16, 0);
      ellipse(sx, sy, r, r);
    }
    float px = map(pos.x/pz,-0.5, 0.5, 0, width);
    float py = map(pos.y/pz,-0.5, 0.5, 0, height);
    pz = pos.z;
    stroke(255);
    line(px, py, sx, sy);
  }
}
