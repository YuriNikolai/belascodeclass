class Estrela {

  //data (lembrete: variáveis aqui são locais)

  float x;
  float y;
  int c;
  int t;

  //construtor: variáveis temporárias chamam as propriedades
  //que desejamos ver em cada instância do objeto

  Estrela (float tempY, float tempX, int tempC, int tempT) {
    x = tempX;
    y = tempY;
    c = tempC;
    t = tempT;
  }

  //funcionalidades

  void display() {
    pushStyle();
    noStroke();
    fill(c);
    rect(x, y, t, t);
    popStyle(); //push e pop para o styling não "vazar" para fora do objeto
  }

}//classe
