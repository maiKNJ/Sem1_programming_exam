class ball {
  float r; //the diameter of the ball
  float x; // the x-posiont of the ball
  float y; // the y-posiont of the ball
  float startSpeedy=3; // the start speed on the y-positon of the ball
  float startSpeedx=3; // the start speed on the x-posiont of the ball
  float speedx=startSpeedx; // the speed on the x-posiont of the ball 
  float speedy=startSpeedy; // the speed on the y-posiont of the ball

  //color
  float H=250; //the hue of the color
  float S=260; //the saturation of the color
  float B=230; //the brightness of the color

  boolean valid=true; //to show the ball while playing



  ball(float temp_r, float temp_x, float temp_y) {
    r=temp_r;
    x=temp_x;
    y=temp_y;
  }


  void display() {
    if (valid==true) {

      fill(H, S, B);
      ellipse(x, y, r, r);

      //R+=Re/9;
      //G+=Gr/9;
      //B+=Bl/9;
    }
  }

  void move() {
    //makes the ball move in the x and y direction
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
    //---------------------------------------------------------bounce of curser--------------------------------------------------------------------//

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
