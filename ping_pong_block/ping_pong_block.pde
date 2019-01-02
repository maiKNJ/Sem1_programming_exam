import processing.sound.*;

score score0;
ball ball0;
curser curser0;
blocks[][] block=new blocks[10][5];
  SoundFile effect;

float ballX=width*4;
float ballY=height*4;
float ballR=30;

int rectY=700;
int rectW=100;
int rectH=50;

float blockX=25;
float blockY=50;
float blockW=70;
float blockH=40;



void setup() {
  size(800, 800);
  score0=new score();
  ball0=new ball(ballR, ballX, ballY);
  curser0=new curser(rectY, rectW, rectH);
   effect=new SoundFile(this,"effect0.mp3");


  for (int i=0; i<block.length; i++) {
    for (int i0=0; i0<block[i].length; i0++) {
      block[i][i0]= new blocks(blockX+i*(blockW+5), blockY+i0*blockH, blockW, blockH);
    }
  }
}

void draw() {
  background(#000000);

  ball0.display();
  ball0.move();
  ball0.bounce();

  curser0.display();
  score0.display();


  for (int i=0; i<block.length; i++) {
    for (int i0=0; i0<block[i].length; i0++) {
      block[i][i0].display();
      block[i][i0].hit();
      block[i][i0].GameOver();
    }
  }
}
