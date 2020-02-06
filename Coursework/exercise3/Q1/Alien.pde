class Alien {
  float x; float y;
  int dir = 1;
  PImage explode = loadImage("exploding.gif");
  int count;
  int heightDiff;
  int exploded;
  boolean special;
  float dy; float dx;
  float angle;
  PImage sprite;
  Alien(int xpos, int ypos, PImage image){
    x = xpos; y = ypos;
    exploded = 0;
    count = 0;
    sprite = image;
    heightDiff = sprite.height;
  }
  void move(){
    if(exploded<1){
      if(x<0 || (x+sprite.width >= width)){
        if(count<heightDiff){
          y++;
          count++;
        } else {
          dir*=-1;
          x+=dir;
          count = 0;
        };
      } else {
        x += dir;
      }
    }
  }
  void draw(){
    if(exploded>=1 && exploded<25){
      image(explode, x, y);
      exploded++;
    } else if(exploded==0){        
      image(sprite, x, y);
    }
  }
  void explode(){
    if(exploded==0){
      int toExplode = int(random(0,5));
      if(toExplode<1){
        exploded = 1;
      } else {
        exploded = 0;
      }
    }
  }
}
