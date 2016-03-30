void setup()
{
  size(600,600);
}

// initial vertex values for rectangle
float vx1 = 30;
float vy1 = 30;
float vx2 = 30;
float vy2 = 130;
float vx3 = 130;
float vy3 = 130;
float vx4 = 130;
float vy4 = 30;

String edge;
float edge2;

float inSet = 5;
float offSet = 10;

boolean mouseR = false;
boolean firstClick = false;
float tempX = 0;
float tempY = 0;

float increment;
float startPos;
float endPos;

void draw()
{
  background(140);
  noStroke();
  
  beginShape();
  
  fill(255);
  vertex(vx1,vy1); // top left
  vertex(vx2,vy2); // bot left
  vertex(vx3,vy3); // bot right
  vertex(vx4,vy4); // top right
  
  endShape();
  
  getEdge();
  
  if(mousePressed){
    if(firstClick == false)
    {
      firstClick = true;
      tempX = mouseX;
      tempY = mouseY;
    }
    fill(50);
    quad( tempX,tempY,
          tempX,tempY+10,
          mouseX,tempY+10,
          mouseX,tempY); 
  }
}

void getEdge(){
  if(mouseY > vy4 && mouseY < vy3 && mouseX > vx4-inSet && mouseX < vx4+offSet)
  {
     if(mousePressed)
     {
       edge = "right";
     }
  } 
  else if(mouseY > vy4 && mouseY < vy3 && mouseX > vx1-inSet && mouseX < vx1+offSet)
  {
     if(mousePressed)
     {
       edge = "left";
     }
  } 
  
  if(mouseR == true){
      if(edge == "right"){
        increment = mouseX-vx4;
        vx4 += increment;
        vx3 += increment;
        edge = "";         // clears edge variable to solve problem with always having an edge selected
      }
      if(edge == "left"){
        increment = mouseX-vx1;
        vx1 += increment;
        vx2 += increment;
        edge = "";
      }
      
      mouseR = false;
  } 
}

void mouseReleased(){
  firstClick = false;
  mouseR = true;
}