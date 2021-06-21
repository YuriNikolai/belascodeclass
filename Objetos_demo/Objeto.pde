class Objeto {

  //data (lembrete: variáveis aqui são locais)

  float x;
  float y;
  color c;
  int tam;

  //construtor: variáveis temporárias chamam as propriedades
  //que desejamos ver em cada instância do objeto

  Objeto(float tempX, float tempY, color tempC, int tempTam) {

    x= tempX;
    y= tempY;
    c= tempC;
    tam = tempTam;
  }

  //funcionalidades

  //função void significa que ela não retorna nenhum valor para nós

  //função p/desenhar elipses
  void display() {

    fill(c);
    ellipse(x, y, tam, tam);
  }

  //função p/dar velocidade a elipses
  void andar() {
    x = x + random (-5, 5);
    y = y + random (-5, 5);
  }

  //função p/ impedir fuga das elipses
  void parede() {
    if (x >= width) {
      x = width;
    }

    if (x <= 0) {
      x = 0;
    }

    if (y >= height) {
      y = height;
    }

    if (y <= 0) {
      y = 0;
    }
  }//parede

  //função controle WASD
  void mover() {
    if (keyPressed) {
      if (key == 'w' || key == 'W') {
        y = y - 1;
      }
    } 

    if (keyPressed) {
      if (key == 's' || key == 'S') {
        y = y + 1;
      }
    }

    if (keyPressed) {
      if (key == 'd' || key == 'D') {
        x = x+ 1;
      }
    }

    if (keyPressed) {
      if (key == 'a' || key == 'A') {
        x = x - 1;
      }
    }
  }//mover
}//classe
