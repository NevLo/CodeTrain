float angle;
//float col;
void setup(){
  size(900,900);
  angle = radians(15);
  
}
void mouseDragged(){
  angle = map(mouseX, 0, width, 0, PI); 
  //col = map(mouseY, 0, height, 0, 255);
}
void draw(){
  background(0);
  translate(width/2, height);
  //stroke(255);
  //line(0,0,0,-400);
  branch(400);
}



void branch(float len){
  //stroke(col, col, col);
  stroke(17,59,8);
  line(0,0,0,-len);
  if(len > 4){
    push();
    translate(0, -len);
    rotate(angle);
    branch(len * 0.6);
    pop();
    push();
    translate(0, -len);
    //print(noise(-angle));
    rotate(-angle);
    branch(len * 0.6);
    pop();
    
  }
  
}
