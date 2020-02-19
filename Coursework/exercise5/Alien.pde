class Alien {
  float x; float y;
  int dir = 1;
  PImage explode;
  PImage sprite;
  int count;
  int heightDiff;
  int explodedStatus;

  Alien(int xpos, int ypos, PImage image, PImage explode){
    x = xpos; y = ypos;
    explodedStatus = 0;
    count = 0;
    sprite = image;
    this.explode = explode;
    heightDiff = sprite.height;
  }
  
  void move(){
    // Normal
    if(explodedStatus == ALIEN_ALIVE){
      if(x<0 || (x+sprite.width >= width)){
        if(count<heightDiff){
          y++;
          count++;
        } else {
          dir*=-1;
          x+=dir;
          count = 0;
        }
      } else {
        x += dir;
      }
    }
  }
  void draw(){
    if(explodedStatus>=1 && explodedStatus<25){
      image(explode, x, y, 30, 25);
      explodedStatus++;
    } else if(explodedStatus==0){        
      image(sprite, x, y, 30, 25);
    }
  }
  void explode(){
    explodedStatus = 1;
  }
}
