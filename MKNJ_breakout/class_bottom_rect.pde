class curser {
  int rectY; // the y-posiont of the curser
  int rectW; // the width of the cuser
  int rectH; // the height of the cuser
  int rectX=0; // the startinf x-position of the cuser
  boolean moving=true; //makes the curser show while playing

  //color
  int h=150; //the hue of the color
  int s=147; //the saturation of the color
  int b=120; //the brightness of the color

  curser(int temp_rectY, int temp_rectW, int temp_rectH) {
    rectY=temp_rectY;
    rectW=temp_rectW;
    rectH=temp_rectH;
  }

  void display() {
    fill(h, s, b);
    if (moving==true) {
      rectX=mouseX-rectW/2; //makes the curser move when moving the mouse on the x-axes
      rect(rectX, rectY, rectW, rectH); //makes the curser
    }
  }
}
