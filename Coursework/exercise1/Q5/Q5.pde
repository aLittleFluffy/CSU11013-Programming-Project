float posx;
float posy;

int dirx;
int diry;
float randomMultiplier;


void setup(){
  size(1280, 720);
  posx=0;
  posy = 0;
  
  dirx = 1;
  diry = 1;
  //randomMultiplier = random(0,height*width);
}

void draw(){
  background(255);
  noStroke();
  fill(invertColourMap(posx, posy), colourMapX(posx), colourMapY(posy));
  posx+=dirx*1;
  posy+=diry*1.25;
  print("\n("+posx + "," + posy +") "+ null +"\n");
  rect(posx, posy, 100,100);
  if(posy>=(height-100)||posy<=0) diry=diry*-1;
  if(posx>=(width-100)||posx<=0) dirx=dirx*-1;
}

float colourMapX(float input){
  return map(input, 0, width, 0, 255);
}

float colourMapY(float input){
  return map(input, 0, height, 0, 255);
}

float invertColourMap(float x, float y){
  return map((colourMapX(x)+colourMapY(y))/2, 0, 255, 255, 0);
}
