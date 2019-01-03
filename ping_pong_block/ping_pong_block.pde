import processing.sound.*; // importing the sound libary

score score0; //calls the class for the score
ball ball0; //calls the class for the ball
curser curser0; //calls the class for the score
blocks[][] block=new blocks[10][5]; //calls the class for the blocks as an 2D array
SoundFile effect; // class a soundfile called effect. is used in the class_top_rect

//the ball's coordinates
float ballX=width*4; //the balls x-position starting point
float ballY=height*4; //the balls y-position starting point
float ballR=30; //the diameter of the ball

//the curser's coordinates
int rectY=700; //the y-position of the curser
int rectW=100; //the width of the curser
int rectH=50; //the height of the curser

//the block's starting position
float blockX=25; //the x-position of the first block
float blockY=50; //the y-position of the first block
float blockW=70; //the width of the blocks
float blockH=40; //the height of the blocks



void setup() {
  size(800, 800); 
  score0=new score(); //calls a new score called score0
  ball0=new ball(ballR, ballX, ballY); //calls a new ball called ball0
  curser0=new curser(rectY, rectW, rectH); //calls a new curser called curser0
  effect=new SoundFile(this, "effect0.mp3"); //calls a new soundfile called effect


  for (int i=0; i<block.length; i++) { // for loop to make the row of the block
    for (int i0=0; i0<block[i].length; i0++) { //for loop to make the column of the block
      block[i][i0]= new blocks(blockX+i*(blockW+5), blockY+i0*blockH, blockW, blockH); //calls the new block array with the positions of it
    }
  }
}

void draw() {
  background(60, 210, 256); //uses HSB color

  ball0.display(); //makes the ball display
  ball0.move(); //makes the ball move
  ball0.bounce(); //makes the ball bounce of the sides, top and the curser

  curser0.display(); //makes the curser display

  score0.display(); //makes the score display


  for (int i=0; i<block.length; i++) { //for loop to make the row of the block
    for (int i0=0; i0<block[i].length; i0++) { //for loop to make the column of the block
      block[i][i0].display(); //makes the blocks display
      block[i][i0].hit(); //make the ball hit the block
      block[i][i0].GameOver(); //Game Over screen for when either the score hits 50 or when the ball falls down below the height of the screen
    }
  }
}
