int s1Loc;
int s2Loc;
int s1Start;
int s2Start;

int s1Y;
int s2Y;
void setup(){
  size(400,400);
  s1Loc=0;
  s2Loc=0;
  s1Start=100;
  s2Start=200;
  
  s1Y=75;
  s2Y=250;
}

void draw(){
  background(255);
  
  // Rectangle 1
  fill(0);
  int pos1 = s1Start+s1Loc++;
  rect(pos1, s1Y, 100,100);
  if(pos1>=300 && pos1<400){
    rect(0,s1Y,s1Loc%100,100);
  } else if(pos1>=400) s1Loc=(-100);
  
  // Rectangle 2
  
  fill(255,0,0);
  int pos2 = s2Start-s1Loc++;
  rect(pos2, s2Y, 100,100);
  if(pos2<=0&&pos2>-100){
    rect(400+pos2,s2Y,100,100);
  } else if(pos2<=-100) s2Loc=(-200);
  
}
