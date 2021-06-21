Objeto obj1;
Objeto obj2;
Objeto eu;
Estrela est1;

float distancia;

void setup() {
  size(300, 300);
  //os parâmetros aqui são os que definimos no construtor
  obj1 = new Objeto (150, 150, #9E3D64, 10);
  obj2 = new Objeto (150, 150, #C468EE, 20);
  eu = new Objeto (150, 70, #FFD700, 30);
  est1 = new Estrela (random(300), random(300), 255, 10);
}

void draw() {
  background (51);

  text("distancia = " + int(distancia), 0, 10);
  //para manipular/usar as variáveis locais da classe, fazemos assim:
  distancia = dist(eu.x, eu.y, obj1.x, obj1.y);

  if (distancia < 28) {
    eu.c = #FFFFFF;
  } else { 
    eu.c = #FFD700;
  }

  //chama as funções que criamos dentro da classe
  obj1.display();

  //experimente adicionar as funções uma de cada vez
  //e testar o resultado

  obj2.display();
  obj2.andar();
  obj2.parede();

  eu.display();
  eu.parede();
  eu.mover(); 

  est1.display();
  //caso estivéssemos trabalhando com um número muito
  //grande de objetos, seria possível inicializá-los
  //e chamar suas funções de uma vez só através de arrays:
  //mais complexo, mas com uma economia enorme de linhas
  //e eficiência. Aula que vêm vamos implementar com as estrelas!
}
