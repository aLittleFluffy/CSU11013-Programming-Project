int sx;
int sy;
void setup(){
  size(400,400);
  sx=0;
  sy = 0;
}

void draw(){
  background(255);
  fill(255);
  sx+=1;
  sy+=1;
  print("\n("+sx + "," + sx +")\n");
  rect(sx, sy, 100,100);
  
  // Logic for 
  if(sx>=300&&sx<400){
    rect(0,sy,sx%100,100);
  } else if(sx>=400)sx=0;
  if(sy>=300&&sy<400){
    rect(sx,0,100,sy%100);
  } else if(sy>=400)sy=0;
  if(sx>300&&sy>300){
    rect(0,0,sx%100, sy%100);
  }
}
