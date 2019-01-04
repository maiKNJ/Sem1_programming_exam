class score {
  boolean playing=true; //boolean to show the score while playing
  int point=0; //variable for the point's
  score() {
  }

  void display() {
    //display the point via text function
    if (playing==true) {
      textSize(50);
      text(point, width/2, height/2);
    }
  }
}
