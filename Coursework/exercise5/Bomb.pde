class Bomb{
    float xpos;
    float ypos;
    int width, height;
    Bomb(float xloc, float yloc ){
        xpos = xloc;
        ypos = yloc;
        width =5; height = 5;
    }

    void move(){
        ypos++;
    }
    void draw(){
        stroke(0);
        fill(255,255,0);
        rect(xpos, ypos, width, height);
    }
    boolean offScreen(){
        if(ypos>SCREENY){
            return true;
        } else return false;
    }
    boolean collide(Player player){
        boolean alignX = xpos>=player.xpos && xpos<=player.xpos+PADDLEWIDTH;
        boolean alignY = ypos>player.ypos-PADDLEHEIGHT*0.5 && ypos<=player.ypos+PADDLEHEIGHT;
        if(alignX&&alignY&&!offScreen()){
            //collided
            return true;
        } else return false;
    }
}
