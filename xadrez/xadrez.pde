float x = random(width); // coordenada eixo x da elipse (x, y, r1, r2)
float y = random(height); // coordenada eixo y da elipse (x, y, r1, r2)
float vx = 10; // velocidade eixo x
float vy = 5; // velocidade eixo y
int a; // R
int b; // G
int c; // B
float r1; // widht da elipse (x, y, r1, r2)
float r2; // height da elipse (x, y, r1, r2)

void setup(){
  size(400, 800);
  background(200, 0, 255);
  r1 = random(10,60); // define um valor aleatorio a cada vez ue recomeça o programa
  r2 = random(10,60); // define um valor aleatorio a cada vez ue recomeça o programa
}

void draw(){
  /* Se quiser alterar as dimensões da esfera de acordo com a posição do mouse, pensei em usar map para ficar mais suave mas não segiui em frente
  float r1 = mouseX;
  if (r1 >= 90) {r1 = 90;}
  float r2 = mouseY;
  if (r2 >= 90) {r2 = 90;}
  */
  
  x= x + vx; // movimento euxo x
  if ( x > width || x < 0 ) {vx = vx * -1;} // bounce x
  y = y + vy; // movimento eixo y
  if (y > height || y < 0) {vy = vy * -1;} // bounce y
  if (vx > 0){ a = 0; b = 0; c=0;} //muda a cor de acordo com a direção x
  if (vy < 0){ a = 255; b = 255; c=255;} // muda a cor de acordo com a direção do y
  fill(a, b, c); //cor da elipse
  noStroke(); // tira o stroke
  ellipse (x, y, r1, r2);
}

void mouseClicked(){
  setup(); //recomeça o desenho
}
