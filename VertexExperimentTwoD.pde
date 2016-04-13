void setup()
{
  size(600,600);
  rectMode(CORNERS); // rect command will draw rectangle based on two opposing corners
}

// assign int values to sides for using throughout program
int UP = 0;
int RIGHT = 1;
int DOWN = 2;
int LEFT = 3;
int NONE = -1;

// initial vertex values for rectangle
float vx1 = 30;
float vy1 = 30;
float vx2 = 30;
float vy2 = 130;
float vx3 = 130;
float vy3 = 130;
float vx4 = 130;
float vy4 = 30;

float inSet = 5;
float offSet = 10;

boolean mouseR = false;
boolean firstClick = false;
float tempX = 0;
float tempY = 0;

float increment;
float startPos;
float endPos;

int currentEdge = NONE;
int lockOnEdge = NONE;

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
  //rect(vx4-inSet, vy4, vx3+offSet, vy3); // right
  //rect(vx1-offSet, vy1, vx2+inSet, vy2); // left
  
  noStroke();
  
  // decide which edge im on 
  currentEdge = NONE; // reset it so it doesn't stay on edges i'm not on
  if(mouseY > vy4 && mouseY < vy3 && mouseX > vx4-inSet && mouseX < vx4+offSet)
  {
    currentEdge = RIGHT;
  }
  else if(mouseY > vy4 && mouseY < vy3 && mouseX > vx1-offSet && mouseX < vx1+inSet)
  {
    currentEdge = LEFT;
  }
  else if(lockOnEdge != NONE) //if there is an edge locked on but it can't keep up w/ mouse
  {
    currentEdge = lockOnEdge; //stays as current edge to catch up to mouse position
  }
  
  if(currentEdge != NONE){ highlightEdge(currentEdge); }
  
  if(mousePressed){
    
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

void updateEdge(int edge)
{
  if(edge == RIGHT)
  {
    vx4 = mouseX;
    vx3 = mouseX;
  }
  else if(edge == LEFT)
  {
    vx1 = mouseX;
    vx2 = mouseX;
  }
  highlightEdge(edge);
  
  edge = NONE; // clears edge to solve problem with always having an edge selected
}

void highlightEdge(int edge)
{
  if(edge == RIGHT)
  {
    fill(255);
    rect(vx4-inSet, vy4, vx3, vy3);
  }
  else if(edge == LEFT)
  {
    fill(255);
    rect(vx1, vy1, vx2+inSet, vy2);
  }
}

void mouseReleased()
{
  firstClick = false;
  mouseR = true;
  lockOnEdge = NONE;
}
