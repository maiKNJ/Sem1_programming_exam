class curser {
  int rectY;
  int rectW;
  int rectH;
  int rectX=0;
  boolean moving=true;
  
  //color
int r=150;
int g=147;
int b=120;

  curser(int temp_rectY, int temp_rectW, int temp_rectH) {
    rectY=temp_rectY;
    rectW=temp_rectW;
    rectH=temp_rectH;
  }

  void display() {
    fill(r,g,b);
    if(moving==true){
    rectX=mouseX-rectW/2;
    rect(rectX, rectY, rectW, rectH);
    }
  }
}
