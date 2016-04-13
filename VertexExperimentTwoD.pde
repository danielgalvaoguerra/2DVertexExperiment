void setup()
{
  size(600,600);
  rectMode(CORNERS); // rect command will draw rectangle based on two opposing corners
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

String lockOnEdge = "";

void draw()
{
  background(140);
  noStroke();
  
  beginShape();
  
  // draw main rectangle
  fill(200);
  noStroke();
  vertex(vx1,vy1); // top left
  vertex(vx2,vy2); // bot left
  vertex(vx3,vy3); // bot right
  vertex(vx4,vy4); // top right
 
  endShape();
  
  // draw rect outlines showing clickable edge area
  stroke(0);
  noFill();
  rect(vx4-inSet, vy4, vx3+offSet, vy3); // right
  rect(vx1-offSet, vy1, vx2+inSet, vy2); // left
  
  noStroke();
  
  //manipulateEdge();
  
  if(mousePressed){
    
    // decide which edge im on 
    String currentEdge = "";
    if(mouseY > vy4 && mouseY < vy3 && mouseX > vx4-inSet && mouseX < vx4+offSet)
    {
      currentEdge = "right";
    }
    else if(mouseY > vy4 && mouseY < vy3 && mouseX > vx1-offSet && mouseX < vx1+inSet)
    {
      currentEdge = "left";
    }
    else if(lockOnEdge != "") //if edge can't keep up with mouse
    {
      currentEdge = lockOnEdge;
    }
    
    // do stuff to current edge im on
    updateEdge(currentEdge);
    if(firstClick == false)
    {
      lockOnEdge = currentEdge;
      
      firstClick = true;
      tempX = mouseX;
      tempY = mouseY;
    }
    
  }
}

void updateEdge(String edge)
{
  if(edge == "right")
  {
    vx4 = mouseX;
    vx3 = mouseX;
  }
  else if(edge == "left")
  {
    vx1 = mouseX;
    vx2 = mouseX;
  }
  
  edge = "";         // clears edge variable to solve problem with always having an edge selected
}

void mouseReleased()
{
  firstClick = false;
  mouseR = true;
  lockOnEdge = "";
}
