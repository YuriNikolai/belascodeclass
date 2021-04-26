float x = 100;
float y = 100;
float velo = 2;

void setup() {
  
  background(130);
  size (512, 384); //Dimensões escolhidas pra serem 4:3
  
}

void draw() {
  
  background(130); //Remova essa linha se quiser que a bola deixe um rastro
  
  x = x + velo;  //Incrementa a posição x pelo valor na variável "velo"
  
  if (x > width-30 || x < 0+30) { // O "+30" faz a bola quicar no canto e não no centro
  velo = velo * -1;
  }
  
  ellipse (x,y,60,60);
  
}
