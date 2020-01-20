int s1;
int s2;
int s3;
void setup(){
  size(400,400);
  background(0);
  s1=0;
  s2=0;
  s3=0;
}

void draw(){
  background(255);
  fill(255);
  rect(100-s1++, 100, 100,100);
  fill(255,0,0);
  rect(200, 200+s3++, 100,100);
  fill(0,0,255);
  rect(150+s2++, 150, 100,100);
}
