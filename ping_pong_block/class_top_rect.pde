
class blocks {
  float blockX;                
  float blockY;                
  float blockH;    
  float blockW;       
  boolean G=true;

  //color
  float r=127;
  float g=147;
  float b=189;



  blocks(float temp_blockX, float temp_blockY, float temp_blockW, float temp_blockH) {
   
    blockX=temp_blockX;
    blockY=temp_blockY;
    blockW=temp_blockW;
    blockH=temp_blockH;
  }
  void display() { 
    colorMode(HSB);
    if (G==true) {
      //float Re=noise(r);
      //float Gr=noise(g);
      //float Bl=noise(b);
     
     fill(r,g,b);
      rect(blockX, blockY, blockW, blockH);

      //r+=Re/9;
      //g+=Gr/9;
      //b+=Bl/9;
    }
  }


  void hit() {
    hitBelow();
    hitSides();
  }


  void hitBelow() {
    if ((ball0.x  > blockX) && (ball0.x < blockX + blockW) && 
      (ball0.y - ball0.r/2 <= blockY + blockH)&&(ball0.y-ball0.r/2>blockY)&&(G==true)) {
      ball0.speedy=-ball0.speedy;
      G=false;
      score0.point+=1;
      ball0.speedy+=1;
      ball0.speedx+=1;
      effect.play();
    } else if ((ball0.x  > blockX) && (ball0.x < blockX + blockW) && 
      (ball0.y + ball0.r/2 < blockY + blockH)&&(ball0.y+ball0.r/2>=blockY)&&(G==true)) {
      ball0.speedy=-ball0.speedy;
      G=false; 
      score0.point+=1;
      ball0.speedy+=1;
      ball0.speedx+=1;
      effect.play();
    }
  }



  void hitSides() {
    if ((ball0.y  > blockY) && (ball0.y < blockY + blockH) && 
      (ball0.x - ball0.r/2 <= blockX + blockW)&&(ball0.x-ball0.r/2>blockX)&&(G==true)) {
      ball0.speedx=-ball0.speedx;
      G=false; 
      score0.point+=1;
    ball0.speedy+=1;
    ball0.speedx+=1;
    
    } else if ((ball0.y  > blockY) && (ball0.y < blockY + blockH) && 
      (ball0.x + ball0.r/2 < blockX + blockW)&&(ball0.x+ball0.r/2>=blockX)&&(G==true)) {
      ball0.speedx=-ball0.speedx;
      G=false;
      score0.point+=1;
    ball0.speedy+=1;
    ball0.speedx+=1;
    }
  }
  
  void GameOver(){
   if(score0.point==50 || ball0.y>height){
     textAlign(CENTER,CENTER);
    text("Game Over",width/2,height/2); 
    text("click to start over",width/2,height/2-40);
    ball0.speedx=0;
    ball0.speedy=0;
    score0.playing=false;
    ball0.valid=false;
    curser0.moving=false;
   }
   if(mousePressed){
     score0.playing=true;
     G=true;
     ball0.valid=true;
     curser0.moving=true;
     ball0.y=height/2;
     score0.point=0;
     ball0.speedx=ball0.startSpeedx;
     ball0.speedy=ball0.startSpeedy;
    
   }
  }
}
