class Ball{
    float x;
    float y;
    float dx;
    float dy;
    int radius;
    color ballColour = color(255);
    
    float ballAngle;
    float ballSpeed;
    float intersectAtY;

    Ball(){
        x = random(SCREENX/4, SCREENX/2);
        y = random(SCREENY/4, SCREENY/4);
        dx = random(1,2);
        dy = random(1,2);
        radius = 10;
        ballAngle = MAX_ANGLE;
        ballSpeed = 1.1;
    }

    void move(){
        x += dx;
        y += dy;
    }

    void draw(){
        noStroke();
        fill(ballColour);
        ellipse(int(x), int(y), radius, radius);
    }

    void collide(Player tp){
        // Wall Collision
        if(y-radius<=0){
            dy=-dy;
        } else if(y+radius>=SCREENY){
            dy=-dy;
        }

        // Player Collision
        if(x+radius >= tp.xpos && x<=tp.xpos+PADDLEWIDTH+MARGIN && y>tp.ypos && y<tp.ypos+PADDLEHEIGHT){
            dx=-dx;
            dy*=SPEED_MUL; dx*=SPEED_MUL;
            println(ballAngle);
            dy=constrain(dy, -5, 5);dx=constrain(dx,-7,7);
            println("Speed: ", ballSpeed, " Ball Angle: ", ballAngle, " dy: ", dy, "dx:",dx," Intersect: ", intersectAtY);
            println("Calculated Speed: ", sqrt(pow(dy,2)+pow(dx,2)));
        }
    }
    
    int score(){
        if(x-radius>=SCREENX){
            return int(-1);
        } else if(x+radius<=0){
            return int(1);
        } else return int(0);
        
    }

    void gameReset(){
        x = random(SCREENX/4, SCREENX/2);
        y = random(SCREENY/4, SCREENY/2);
        
        ballSpeed+=1;
    }
}
