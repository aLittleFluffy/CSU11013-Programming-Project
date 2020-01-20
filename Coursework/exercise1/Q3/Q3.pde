int s;
void setup(){
  size(400,400);
  s=0;
}

void draw(){
  print(s +"\n");
  background(255);
  fill(0);
  rect(s++, 100, 100,100);
  if(s>=300 && s<400){
    rect(0,100,s%300,100);
  } else if(s>=400) s=0;
}
