final int SCREENX = 800;
final int SCREENY = 500;
final int PADDLEHEIGHT = 15;
final int PADDLEWIDTH = 100;
final int MARGIN = 10;

class Player {   
    float xpos; float ypos;
    int score;
    float velocity;
    color paddlecolor = color(255);
    boolean player;
    float dx = 1.1;
    Player(int screen_y){
        xpos=SCREENX/2;
        ypos=screen_y;
    }
    void move(float x){
        if(x>SCREENX-PADDLEWIDTH) xpos = SCREENX-PADDLEWIDTH;
        else xpos=x;
    }
    void computerMove(){
      if(theBall.y < SCREENY && theBall.y >0){
        if(theBall.x > (xpos + PADDLEWIDTH)) xpos+=dx;
        else if(theBall.x < xpos) xpos-=dx;
      }
      if((ypos + PADDLEHEIGHT) >= SCREENY) ypos = (SCREENY-PADDLEHEIGHT);
    }
    void draw(){
        fill(paddlecolor);
        rect(xpos, ypos, PADDLEWIDTH, PADDLEHEIGHT);
        if(player){
          velocity = (pmouseX-mouseX)/2;
          if(velocity==0){
            velocity=1;
          } else if(velocity>5) velocity=5; 
          else if(velocity<-5) velocity=-5;
        } else {
          velocity=1;
        }
    }
    void score(){
        score++;
    }
    void reset(){
      score=0;
    }
}
