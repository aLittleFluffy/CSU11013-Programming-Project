int s;
void setup(){
  size(400,400);
  s=0;
}

void draw(){
  background(255);
  fill(255, 0, 255);
  rect(s++, 100, 100,100);
  if(s>=400)s=0;
}
