int x;
int y;
int dir;
int[][] grid;

void setup() {

  size(500, 500);
    grid = new int[width][height];
  background(255);
  x = width/2;
  y = height/2;
  dir = 0;
}

void draw() {
  loadPixels();

  //alg: turn :=> flip color :=> move forward.
  for (int i = 0; i < 100; i++) {
    int state = grid[x][y];
    if (state == 255) {
      dir = (dir+5) % 4;
      pixels[y * width + x] = color(0);
      grid[x][y] = 0;
    } else if (state == 0) {
      dir = (dir+3) % 4;
      pixels[y * width + x] = color(255);
      grid[x][y] = 255;
    }
    print(dir);
    switch(dir) {
    case 0:
      y -= 1;
      break;
    case 1:
      x += 1;
      break;
    case 2:
      y = y +1;
      break;
    case 3:
      x += -1;
      break;
    default:
      println("  ERROR: Direction out of range");
    }
    if (y < 0) y = height - 1;
    if (x == width) x = 0;
    if (y == height) y = 0;
    if (x < 0) x = width - 1;
  }
  updatePixels();
}
