PImage imgCasa,gatoW,gatoA,gatoS,gatoD;
float yGato;
float xGato;
int direcao;

void setup () {
  size (1019,774); 

yGato = 128;
xGato = 128;
direcao = 1;


imgCasa = loadImage ("casa.png");
gatoW = loadImage ("gato10.png");
gatoA = loadImage ("gato4.png");
gatoD = loadImage ("gato7.png");
gatoS = loadImage ("gato1.png");
}

void draw() {  
  
  image(imgCasa, 0,0);
  
  
  if ( direcao == 1 ){
    image (gatoW, xGato, yGato);
  }
  
  if ( direcao == 2 ){
    image (gatoS, xGato, yGato);
  }
  
  if ( direcao == 3 ){
    image (gatoA, xGato, yGato);
  }
  
  if ( direcao == 4 ){
    image (gatoD, xGato, yGato);
  }
  
  if (keyPressed) {
        if (key == 'w') {
        yGato = yGato -5;
        direcao = 1;
        
        }
       if (key == 's') {  
       yGato = yGato +5;
       direcao = 2;
        
       }
       if (key == 'a') {  
       xGato = xGato -5;
       direcao = 3;
        
       }
       if (key == 'd') {
       xGato = xGato +5;
       direcao = 4;
       }
 }
}
