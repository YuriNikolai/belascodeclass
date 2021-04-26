float x = 100;
float y = 100;
float velo = 2;

void setup() {
  
  size (1024, 768);
  
}

void draw() {
  
  background(130);
  
  x = x + velo;  
  
  if (x > width-30 || x < 0+30) {
  velo = velo * -1;
  }
  
  ellipse (x,y,60,60);
  
}
