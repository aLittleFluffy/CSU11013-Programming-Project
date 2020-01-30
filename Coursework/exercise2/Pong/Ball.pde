class Ball {
    float x; float y;
    float dx; float dy;
    int radius;
    color ballColour = color(255);
    int multiplier = 2;
    boolean hit;
    float pvelocity=1;
    float ballAngle;
    float ballSpeed;
    float intersectAtY;
    Ball(){
        x = random(SCREENX/4, SCREENX/2);
        y = random(SCREENY/4, SCREENY/2);
        dx = multiplier*random(1, 2); dy = multiplier*random(1, 2);
        radius=15;
        ballAngle = 75;
        ballSpeed = 1;
    }
    void move(){
        
        x = x+dx; y=y+dy;
        
    }
    void draw(){
        fill(ballColour);
        ellipse(int(x), int(y), radius, radius);
        println(dx, " " , dy, " ", sqrt(sq(dx)+sq(dy)));
        text(sqrt(sq(dx)+sq(dy)),10,SCREENY/2);

    }
    void collide(Player tp){
        // Wall Collision
        if(x-radius<=0) {
            dx= -dx;
        }
        else if(x+radius>=SCREENX){
            dx= -dx;
        }
        // Player collision
        if(y+radius >= tp.ypos && y-radius<tp.ypos+PADDLEHEIGHT && x>=tp.xpos && x<= tp.xpos+PADDLEWIDTH){
            intersectAtY = map(y - tp.ypos, -PADDLEHEIGHT/2, PADDLEHEIGHT/2,-1,1);
            ballAngle = 75*intersectAtY;
            dy=-dy;
            dx=ballSpeed*sin(ballAngle);   
        }
    }
    int score(){
        if(y-radius >= SCREENY){
            return int(-1);
        } else if(y+radius <= 0) {
            return int(1);
        } else return int(0);
    }
    void gameReset(){
      x = random(SCREENX/4, SCREENX/2);
      y = random(SCREENY/4, SCREENY/2);
      dx = multiplier*random(1, 2); dy = multiplier*random(1, 2);
      ballSpeed++;
    }
}
