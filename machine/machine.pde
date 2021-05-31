import processing.sound.*;
PImage aa, BATTERY_EMPTY, BATTERY_HALF, leverdownx2, leverupx2, SCREEN_ON;
int s;
boolean leverstate;

void setup () {
  s = second();
  size (800, 800);
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
  image (aa, 12, 0);
  
  if (leverstate == false) {
    image (leverdownx2, 0, 108);
    }
  else {
    image (leverupx2, 0, 98);
  }
  
  s = second();
  
  if (s % 2 == 0) {
    image (SCREEN_ON, 40+12, 48);
  }
    pushStyle();
    fill(0);
    text( "x: " + mouseX + " y: " + mouseY, mouseX, mouseY ); //debug
    popStyle();
  print(s);
  print("\n");

}

void keyReleased () {
  leverstate = !leverstate;
}
