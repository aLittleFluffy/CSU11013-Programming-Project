float posx1;
float posy1;

float posx2;
float posy2;

float offset1;
float angle1;

float offset2;
float angle2;

int colourCount1;
int colourDirection1;

int colourCount2;
int colourDirection2;

void setup(){
  size(800,500);
  posx1 = 0;
  posy1 = 1;
  offset1 = 150;
  
  offset2 = 300;
  colourCount1 = 1;
  colourDirection1=1;
  
  colourCount2 = 1;
  colourDirection2=1;
}

void draw(){
  background(255);
  noStroke();
  // Colour Change Logic
  colourCount1 += colourDirection1 *5;
  if(colourCount1>=255) {  
    colourDirection1 *= -1;
  } else if(colourCount1<=0) colourDirection1 *=-1;
  fill(255,0,colourCount1);
  
  
  
  // Movement Logic
  posx1 += 2;
  angle1+= TWO_PI/400;
  posy1 += (sin(angle1));
  
  rect(posx1%width, posy1+offset1, 50,50);

  // Wrap-around Logic
  if(posx1%width>=(width-50) && posx1%width<width){
    rect(0, posy1+offset1, abs(posx1)%50,50);
  } else if(posx1>=width) {
    posx1 = 0;
    posy1 = 0;
  }
  if(angle1>=TWO_PI){
    angle1=0;
  }
  
  
  // Rectangle 2
  // Colour Change Logic
  colourCount2 += colourDirection2 *5;
  if(colourCount2>=255) {  
    colourDirection2 *= -1;
  } else if(colourCount2<=0) colourDirection2 *=-1;
  fill(colourCount2,0,255);
  
  
  posx2 += 1;
  angle2+= TWO_PI/5000;
  posy2 += (sin(angle1));
  
  rect(posx2%width, posy2+offset2, 50,50);

  // Wrap-around Logic
  if(posx2%width>=(width-50) && posx2%width<width){
    rect(0, posy2+offset2, abs(posx2)%50,50);
  } else if(posx2>=width) {
    posx2 = 0;
    posy2 = 0;
  }
  if(angle2>=TWO_PI){
    angle2=0;
  }
  
 
}
