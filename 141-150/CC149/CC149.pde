int[] board;
int[][] boardCoords ={
  {100, 100}, {100, 300}, {100, 500}, {300, 100}, {300, 300}, {300, 500}, {500, 100}, {500, 300}, {500, 500}
};
int player = 1;
void setup() {
  //0-600 board; 601-800 score/whos turn
  size(800, 600);
  board = new int[]{-1, -1, -1, -1, -1, -1, -1, -1, -1};
  //board = new int[]{0, 1, 0, -1, -1, 0, 1, 1, -1};
}
void mousePressed() {
  int getPlayer = player % 2; //odd = X, even = O
  player++;
  if (mouseX > 600) {
    return;
  }
  float[] boardDists = new float[9];
  int minInd = 0;
  for (int i = 0; i < 9; i++) {
    boardDists[i] = dist(mouseX, mouseY, boardCoords[i][0], boardCoords[i][1]);
    if (boardDists[i] < boardDists[minInd]) minInd = i;
  }
  board[minInd] = getPlayer;
  if (checkForWinner()) {
    draw();
    checkForWinner();
    noLoop();
  }
}

void draw() {
  background(200, 0, 255);
  stroke(255);
  strokeWeight(4);
  line(0, 200, 600, 200);
  line(0, 400, 600, 400);
  line(200, 0, 200, height);
  line(400, 0, 400, height);
  stroke(0);
  line(0, 0, 0, height);
  line(600, 0, 600, height);
  line(0, 0, 600, 0);
  line(0, height, 600, height);
  fill(200);
  rect(600, 0, 200, height);
  for (int i = 0; i < 9; i++) {
    int x = boardCoords[i][0];
    int y = boardCoords[i][1];
    switch(board[i]) {
    case -1:
      continue;
    case 0:
      noFill();
      ellipse(x, y, 80, 80);
      break;
    case 1:
      line(x-40, y-40, x+40, y+40);
      line(x-40, y+40, x+40, y-40);
      break;
    }
  }
}

boolean checkForWinner() {
  boolean winner = false;
  if (board[0] == board[1] && board[0] == board[2] && board[0] != -1) {
    print("WINNA WINNA");
    int x1 = boardCoords[0][0];
    int y1 = boardCoords[0][1];
    int x2 = boardCoords[2][0];
    int y2 = boardCoords[2][1];
    stroke(255,0,0);
    print(x1);
    line(x1,y1,x2,y2);
    winner = true;
  } else if (board[0] == board[3] && board[0] == board[6] && board[0] != -1) {
    winner = true;
  } else if (board[1] == board[4] && board[1] == board[7] && board[1] != -1) {
    winner = true;
  } else if (board[3] == board[4] && board[3] == board[5] && board[3] != -1) {
    winner = true;
  } else if (board[2] == board[5] && board[2] == board[8] && board[2] != -1) {
    winner = true;
  } else if (board[6] == board[7] && board[6] == board[8] && board[6] != -1) {
    winner = true;
  } else if (board[0] == board[4] && board[0] == board[8] && board[0] != -1) {
    winner = true;
  } else if (board[2] == board[4] && board[2] == board[6] && board[2] != -1) {
    winner = true;
  }
  return winner;
}
