
class blocks {
  float blockX; // the x-posiont of the block               
  float blockY; // the y-posiont of the block               
  float blockH; // the height of the block
  float blockW; // the width of the block       
  boolean G=true; // if the block is true it will be visible

  //color
  float h=random(30, 150); //the hue of the color
  float s=360; //the saturation of the color
  float b=360; //the brightness of the color
  
  boolean GO;



  blocks(float temp_blockX, float temp_blockY, float temp_blockW, float temp_blockH) {

    blockX=temp_blockX;
    blockY=temp_blockY;
    blockW=temp_blockW;
    blockH=temp_blockH;
  }

  void display() { 
    colorMode(HSB); //makes the colors to be in HSB in stead of RGB
    fill(h, s, b);
    if (G==true) {  
      rect(blockX, blockY, blockW, blockH); //if G is true it will show a block
    }
  }


  void hit() { //function containing the functions for hitting the top and bottom, and left and right of the block
    hitBelow();
    hitSides();
  }


  void hitBelow() {
    //hitting the bottom of the block
    if ((ball0.x  > blockX) && (ball0.x < blockX + blockW) && 
      (ball0.y - ball0.r/2 <= blockY + blockH)&&(ball0.y-ball0.r/2>blockY)&&(G==true)) {
      ball0.speedy=-ball0.speedy; //makes the ball go in the opposite direction when hitting the block
      G=false; //makes the block dissapear
      score0.point+=1; //adds one point
      ball0.speedy+=1; //makes the ball go faster on the y-axes
      ball0.speedx+=1; // makes the ball go faster on the x-axes
      effect.play(); //makes an effect sound for when the ball hits a block
    }else if ((ball0.x  > blockX) && (ball0.x < blockX + blockW) && 
      (ball0.y + ball0.r/2 < blockY + blockH)&&(ball0.y+ball0.r/2>=blockY)&&(G==true)) {//hitting the top of the block
      ball0.speedy=-ball0.speedy; //makes the ball go in the opposite direction when hitting the block
      G=false; //makes the block dissapear
      score0.point+=1; //adds one point
      ball0.speedy-=1; //makes the ball go faster on the y-axes
      ball0.speedx-=1; // makes the ball go faster on the x-axes
      effect.play(); //makes an effect sound for when the ball hits a block
    }
  }



  void hitSides() {
    //hittting the right of the block
    if ((ball0.y  > blockY) && (ball0.y < blockY + blockH) && 
      (ball0.x - ball0.r/2 <= blockX + blockW)&&(ball0.x-ball0.r/2>blockX)&&(G==true)) {
      ball0.speedx=-ball0.speedx; //makes the ball go in the opposite direction when hitting the block
      G=false; //makes the block dissapear
      score0.point+=1; //adds one point
      ball0.speedy+=1; //makes the ball go faster on the y-axes
      ball0.speedx+=1; // makes the ball go faster on the x-axes
    }else if ((ball0.y  > blockY) && (ball0.y < blockY + blockH) && 
      (ball0.x + ball0.r/2 < blockX + blockW)&&(ball0.x+ball0.r/2>=blockX)&&(G==true)) { //hitting the left of the block
      ball0.speedx=-ball0.speedx; //makes the ball go in the opposite direction when hitting the block
      G=false; //makes the block dissapear
      score0.point+=1; //adds one point
      ball0.speedy-=1; //makes the ball go faster on the y-axes
      ball0.speedx-=1; // makes the ball go faster on the x-axes
    }
  }

  void GameOver() {
    if (score0.point==50 || ball0.y>height) {
      textAlign(CENTER, CENTER); // makes the text aligne in the center of the text
      text("Game Over", width/2, height/2); 
      text("click to start over", width/2, height/2+40);
      text(score0.point, width/2, height/2-40);
      score0.playing=false; //sets the score to false so it won't show when Game Over
      ball0.valid=false; //sets the ball to false so it won't show when Game Over
      curser0.moving=false; //sets the curser to false so it won't show when Game Over
      GO=true;
    } 
    if (GO==true && mousePressed) { // if the mouse is pressed while Game Over the following will happen
      score0.playing=true; //the score will be shown again
      G=true; //all the blocks will be shown again
      ball0.valid=true; //the ball will be shown again
      curser0.moving=true; //the curser will be shown again
      ball0.y=height/2; //the ball will be set to start in the middle 
      score0.point=0; //the point will reset to zero
      ball0.speedx=ball0.startSpeedx; // the speed of the ball will be set back to the start speed
      ball0.speedy=ball0.startSpeedy; // the speed of the ball will be set back to the start speed
      GO=false;
    }
  }
}
