// Q2
int SCREENX = 500;
int SCREENY = 500;
Alien aliens[];
PImage spacer;
void settings(){
  size(SCREENX, SCREENY);
}
void setup(){
  aliens = new Alien[10];
  spacer = loadImage("spacer.gif");
  initArray(aliens);
}
void draw(){
  background(255);
  moveArray(aliens);
  drawArray(aliens);
}
void initArray(Alien alienArr[]){
  for(int i=0; i<alienArr.length; i++){
      alienArr[i] = new Alien(0+i*spacer.width,0, spacer);
  }
}
void drawArray(Alien alienArr[]){
  for (int i = 0; i < alienArr.length; ++i) {
    if(int(random(0,250))==i){
      alienArr[i].explode();
    }
    alienArr[i].draw();
  }
}
void moveArray(Alien alienArr[]){
  for (int i = 0; i < alienArr.length; ++i) {
    if(alienArr[i].special){
      alienArr[i].moveSpecial();
    } else {
      alienArr[i].move();
    }
  }
}
