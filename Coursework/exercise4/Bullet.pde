class Bullet{
    float xpos;
    float ypos;
    int bulletHeight;
    int bulletWidth;
    boolean collided;
    Bullet(int x){
        bulletHeight = 25;
        bulletWidth = 5;
        xpos = x-(bulletWidth/2);
        ypos = SCREENY - (MARGIN+(1.5*PADDLEHEIGHT));
        collided = false;
    }
    void move(){
        ypos-=3;
    }
    void draw(){
        noStroke();
        fill(255);
        if(!collided){
            fill(255,0,0);
            rect(xpos, ypos, bulletWidth, bulletHeight);
        }
        
    }
    void checkCollide(Alien alien){
        if(alien.explodedStatus == ALIEN_ALIVE){
            boolean alignX = xpos>=alien.x && xpos<=alien.x+alien.sprite.width;
            boolean alignY = ypos>=alien.y && ypos<=alien.y+alien.sprite.height;
            if(alignX&&alignY){
                alien.explode();
                collided = true;
            }
        }
    }
}
