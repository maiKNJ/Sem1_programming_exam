class score {
  boolean playing=true;
  int point=0;
  score() {
  }

  void display() {
    if(playing==true){
    textSize(50);
    text(point, width/2, height/2);
    }
  }
  
   
}
