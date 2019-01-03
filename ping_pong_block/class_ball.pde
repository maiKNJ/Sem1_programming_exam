class ball {
  float r;
  float x;
  float y;
  float startSpeedy=3;
  float startSpeedx=3;
  float speedx=startSpeedx;
  float speedy=startSpeedy;

//color
float R=250;
float G=260;
float B=230;

boolean valid=true;



  ball(float temp_r, float temp_x, float temp_y) {
    r=temp_r;
    x=temp_x;
    y=temp_y;
  }


  void display() {
    if(valid==true){
    //float Re=noise(R);
    //float Gr=noise(G);
    //float Bl=noise(B);
    
    fill(R,G,B);
    ellipse(x, y, r, r);
    
  //R+=Re/9;
  //G+=Gr/9;
  //B+=Bl/9;
    }
  }

  void move() {

    x+=speedx;
    y+=speedy;
  }


  void bounce() {


    //bounce of sides
    if ((x>=width-r/2)||(x<=0+r/2)) {
      speedx=-speedx;
    }
    //bounce of top
    if (y<=0+r/2) {
      speedy=-speedy;
    }
    //bounce of rect

    //hit of sides(left and right) of the curser
    if ((x  > curser0.rectX) && (x < curser0.rectX + curser0.rectW) && 
      (y - r/2 <= curser0.rectY + curser0.rectH)&&(y-r/2>curser0.rectY)) {
      speedy=-speedy;
    } else if ((x  > curser0.rectX) && (x < curser0.rectX + curser0.rectW) && 
      (y + r/2 < curser0.rectY + curser0.rectH)&&(y+r/2>=curser0.rectY)) {
      speedy=-speedy;
    }

    //hit the top and bottom of curser
    if ((y  > curser0.rectY) && (y < curser0.rectY + curser0.rectH) && 
      (x - r/2 <= curser0.rectX + curser0.rectW)&&(x-r/2>curser0.rectX)) {
      ball0.speedx=-ball0.speedx;
    } else if ((y  > curser0.rectY) && (y < curser0.rectY + curser0.rectH) && 
      (x + r/2 < curser0.rectX + curser0.rectW)&&(x+r/2>=curser0.rectX)) {
      ball0.speedx=-ball0.speedx;
    }
  }
}
