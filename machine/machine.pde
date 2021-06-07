PImage aa, BATTERY_EMPTY, BATTERY_HALF, leverdownx2, leverupx2, SCREEN_ON;
int s;
int levercount = 0;
Ball[] balls = new Ball[0];
boolean leverstate = false;

class Ball {
  float x, y;
  float velox = 1, veloy = 0;
  int w, h;
  
  Ball (float a, float b, int wball, int hball) {
    x = a;
    y = b;
    w = wball;
    h = hball;
    
  }

  void update() {
    x = lerp(x + velox, x, 0.05);
    if (x > width-20 || x < 0+20) {
      velox = velox * -1;
      }
    y = lerp(y + veloy, y, 0.05);
    if (y > height - 20 || y < 0+20) {
      veloy = veloy * -1;
      }
      
    veloy = veloy + 0.01; //gravity
    
    ellipse(x, y, w, h);
  }
}

void setup() {
  s = second();
  size (800, 800, P2D);
  noSmooth();
  strokeWeight(2);
  aa = loadImage("aa.png");
  BATTERY_EMPTY = loadImage("BATTERY_EMPTY.png");
  BATTERY_HALF = loadImage("BATTERY_HALF.png");
  leverdownx2 = loadImage("leverdownx2.png");
  leverupx2 = loadImage("leverupx2.png");
  SCREEN_ON = loadImage("SCREEN_ON.png");
  
}

void draw() {
  
  background (255);
  fill (101,41,19);
  rect (100, 1, 100, 100);
  beginShape(); // ball emitter mouthpiece start
  vertex (380,205);
  vertex (390,205);
  vertex (400,250);
  vertex (380,250);
  endShape();   // ball emitter mouthpiece start
  image (aa, 12, 0);
  
  if (leverstate == false) {
    image (leverupx2, 0, 98);
    }
  else {
    image (leverdownx2, 0, 108);
  }
  
  s = second(); //blink screen light
  if (s % 2 == 0) {
    image (SCREEN_ON, 40+12, 48);
  }
  
  pushStyle();
  fill(0);
  text( "x: " + mouseX + " y: " + mouseY, mouseX, mouseY ); //debug
  popStyle();
  println(leverstate);
 
  for (int i = 0; i < balls.length; i++) {
    balls[i].update();
  }
}
  
void keyReleased() {
  leverstate = !leverstate;
    if (leverstate == true) {
      levercount = levercount + 1;
      spawnBall();
    }
  
}

void spawnBall() {
  Ball ball = new Ball(416,226,40,40);
  balls = (Ball[]) append(balls, ball);
}
