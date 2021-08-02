//sauces:
//https://freesound.org/people/SmartWentCody/sounds/179008/
//https://freesound.org/people/Kiyoshiakira/sounds/436774/

import processing.sound.*;

SoundFile[] sfxVars = new SoundFile[2];
String [] paixoes = {"felicidade", "tristeza", "competência", "saudade", "desejo", "dor", "querer", "medo"};
String [] tempos = {"hoje", "amanhã", "ontem", "nunca", "jamais", "sempre"};
String select = "txt";
int i = 0;
int x = 0;
int y = 0;
int s = 0;
boolean started = false;
String side1 = "THE MOMENT I FOUND IT I LOST IT AGAIN";


void setup () {
  size (768, 768);
  background (50);
  s = second();
  //setup sfx
  String[] sfxStrings = {"spraycan1", "spraycan2"};
  for (int i = 0; i < sfxStrings.length; i++) { 
    sfxVars[i] = new SoundFile(this, sfxStrings[i].concat(".wav"));
  }
}

void draw () {
  println(s);
  if (started == true) {
    i = int(random(paixoes.length));
    x = int(random(128, 640));
    y = int(random(128, 640));
    fill(random(255));
    text (paixoes[i], x, y);

    //pressione qualquer tecla para limpar a tela
    if (keyPressed) {
      background (50);
      //code abaixo seleciona 1 de dois efeitos sonoros aleatorios em um array para tocar
      if (sfxVars[int(random(sfxVars.length))].isPlaying() == false) {
        sfxVars[int(random(sfxVars.length))].rate(random(0.9, 1.1));
        sfxVars[int(random(sfxVars.length))].play();
      } else {
        sfxVars[int(random(sfxVars.length))].stop(); 
        sfxVars[int(random(sfxVars.length))].rate(random(0.9, 1.1));
        sfxVars[int(random(sfxVars.length))].play();
      }
    }
  } else {
    pushStyle();
    textSize(25);
    text ("SPACE", width/2-25, height/2);
    popStyle();
    if (keyPressed) {
      started = true;
    }
  }
  int s = millis();
  if (s > 10000) {
    for (int i = 0; i < 80; i = i + 5) {
      text (side1, 10, s + 20);
    }
  }
} //draw

void mouseMoved() {
  if (started == true) {
    //de trás pra frente: seleciona uma casa aleatoria em tempos (que estará em formato float, converte pra int, e aplica essa casa como o valor da variável select
    select = tempos[int(random(tempos.length))];
    fill(255, 0, 0);
    textSize(12);
    text (select, mouseX, mouseY);
  }
}
