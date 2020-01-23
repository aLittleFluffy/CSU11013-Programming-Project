float posx;
float posy;

int dirx;
int diry;
int colourCount;
int colourDirection;

void setup(){
  size(600, 450);
  posx=0;
  posy = 0;
  
  dirx = 1;
  diry = 1;
  
  colourCount = 1;
  colourDirection = 1;
}

void draw(){
  background(255);
  noStroke();
  colourCount += colourDirection *5;
  if(colourCount>=255) {  
    colourDirection *= -1;
  } else if(colourCount<=0) colourDirection *=-1;
  fill(255,0,colourCount);
  posx+=dirx*1.75;
  posy+=diry*2;
  rect(posx, posy, 100,100);
  if(posy>=(height-100)||posy<=0) {
    diry=diry*-1;
  };
  if(posx>=(width-100) && posx<=width){
    rect(0, posy, posx%100, 100);
  } else if(posx>=width) posx = 0; 
}
