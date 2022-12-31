
int[][] grid;
int[][] prev;
int rows;
int cols;
int res = 40;

void setup() {
  //frameRate(2);
  fullScreen();
  println(width + ", " + height);
  rows = height / res;
  cols = width / res;
  grid = make2dArray(rows, cols);
  prev = make2dArray(rows, cols);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j] = floor(random(2));
    }
  }
}
void mousePressed(){
 setup(); 
  
}
void draw() {
  background(0);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      int x = i * res;
      int y = j * res;
      if (grid[i][j] == 1) {
        fill(255);
        rect(x, y, res, res);
      } else {
        fill(0);
        rect(x, y, res, res);
      }
    }
  }
  int[][] next = make2dArray(rows, cols);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      int state = grid[i][j];
      int neighbors = checkNeighbors(grid, i, j);
      if (state == 1 && (neighbors > 3 || neighbors < 2)) {
        next[i][j] = 0;
      } else if (state == 0 && neighbors == 3) {
        next[i][j] = 1;
      } else {
        next[i][j] = state;
      }
    }
  }
  if(prev == next){
    setup();
  }
  prev = grid;
  grid = next;
}


int[][] make2dArray(int rows, int cols) {
  int[][] arr = new int[cols][rows];
  return arr;
}

int checkNeighbors(int[][] g, int x, int y) {
  int count = 0;
  for (int i = -1; i <= 1; i++) {
    for (int j = -1; j <= 1; j++) {
      int col = (x + i + cols) % cols;
      int row = (y + j + rows) % rows;
      
      
      count += g[col][row];
    }
  }
  count -= g[x][y];
  return count;
}
