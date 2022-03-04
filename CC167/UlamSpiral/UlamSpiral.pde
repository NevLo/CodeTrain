int counter;
int phase;
int numSteps;
int stepSize;
int x, y, px, py;
int stepNum = 0;

void setup(){
  size(1000,1000); 
  stepSize = width/5;
  x = y = px = py = width/2;
  phase = 0;
  numSteps = 1;
  counter = 1;
}
void draw(){
  

  if(phase % 2 == 0){
    numSteps++; 
  }
  switch(phase % 4){
    case 0:
      x += stepSize;
      break;
    case 1:
      y -= stepSize;
      break;
    case 2:
      x -= stepSize;
      break;
    case 3:
      y += stepSize;
      break;
  }
  if(stepNum == numSteps){
    stepNum = 0;
    phase++;
  }
  stroke(51);
  line(x,y,px,py);
  if(isPrime(counter)){
    rectMode(CENTER); 
    text(counter, x, y);
  }
  
  counter++;
  px = x;
  py = y;
  if(counter > 25) frameRate(0);
  stepNum++;
}


boolean isPrime(int numToCheck){
  //print(numToCheck);
  for(int i = 2; i <= numToCheck /2; i++) if(numToCheck % i == 0) return false;
  return true;
}
