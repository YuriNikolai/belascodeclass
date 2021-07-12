//exemplos de array com elementos definidos manualmente:
String [] txt = {"oi", "mundo", "tchau"};
int[] cores = {255, 0, 120};
//exemplo de array criado com 8 espaços vazios, para serem preenchidos
//automáticamente com código em um loop for:
int [] numeros = new int [8];

void setup() {
  size (512, 512);
  background(cores[2]);

  for (int i = 0; i < 8; i++) {
    numeros [i] = int(random(10, 400));

    //impede que o println rode antes que o array esteja pronto
    if (i == 7) {
      println(numeros);
    }
  }//for
}//setup

void draw() {
  fill (cores[0]);

  text(txt[0] + " " + txt[1] + " " + txt[2], 250, 250);

  for (int i=0; i < numeros.length; i++) {
    ellipse(numeros[i], numeros[i], numeros[i], numeros[i]);
  }

  //método acima demonstra a compatibilidade de inicializar elementos com
  //arrays e for loops, ao contrário de usar apenas arrays com inicialização
  //automática como no exemplo abaixo
  
  //ellipse(numeros[7], numeros[6], numeros[5], numeros[4]);
  //ellipse(numeros[3], numeros[2], numeros[1], numeros[0]);
}
