/*

O JOGO MAIS CRINGE QUE VC JA VIU 

Olá 😇 seja um adulto funcional 🌟

REALIZE TODAS AS SUAS TAREFAS
🚰☕😴💩💅👖💧🍎🥗🎨⏰🛁🛒☎️💊✉️🧾📙📝🥑🍝🤳💸🧺🍽🍌

e não se esqueça, use emojis! 🥰🥵🗣
👁👄👁
👀
seja cringe 🤫

😂😜🤪😝😛😋😌🙂😐😕🙁☹️😢😥😭

tome vacina 💉💉💉💉💉💉

julia brasil, 2021


*/

let f = 0.3; //  framerate
let game_over = 500; // numero de loops máximo
let fase = 0; // contador de loops
let color1 = 'pink';
let color2 = 'white';
let fail; // som de ame over
let biiip; // som quando tarefa aparece
let bip; // som quando clica em cima da tarefa
let tarefas = []; // array com strings de emojis
let star; // string com emoji es estrela



//preload carrega os sons e defino os strings de emojis
function preload(){ 
  bip = loadSound('assets/bip.mp3');
  biiip = loadSound('assets/biiip.mp3');
  failsound = loadSound('assets/fail.mp3');
  fail = loadImage('assets/fail.gif');
  
  tarefas = ['🚰', '☕', '😴', '💩', '💅', '👖', '💧', '🍎', '🥗', '🎨', '⏰', '🛁', '🛒', '☎️', '💊', '✉️', '🧾', '📙', '📝', '🥑', '🍝', '🤳', '💸', '🧺', '🍽', '🍌' ];
  star = '🌟';
}

// o bg é desenhado no setup e depois no frame 1 do draw

function setup(){
  createCanvas(600,600);
  background(color1);
  frameRate(f);
  fill (color2);
  noStroke();
   rect(50, 50, width-100, height-100, 20);
  fill(color1);
  textAlign(CENTER);
  textSize(width/35);
  text ('Olá 😇 seja um adulto funcional 🌟 ', width/2, height/2.5);
  text ('clique em cima das tarefas, não deixe acumular!', width/2, height/2);
  text ('clique para começar 😜', width/2, height/1.5);
  
  if (fase = 0){fase = 1;}
}


function draw(){
  
  cursor(CROSS);
  fase ++; 
  f = f + 0.00025*fase; // para aumenta a velocidade a medida que aumenta a fase
  
  
  if (fase == 1){
    noLoop();// fase 1 não está em looping é acionada pelo evento mousePressed()
  background(color1);
  frameRate(f);
  fill (color2);
  noStroke();
  rect(50, 50, width-100, height-100, 20);
  fill(color1);
  textAlign(CENTER);
  textSize(width/35);
  text ('Olá 😇 seja um adulto funcional 🌟 ', width/2, height/2.5);
  text ('clique em cima das tarefas, não deixe acumular!', width/2, height/2);
  text ('clique para começar 😜', width/2, height/1.5);
    
}

  /* play, o loop roda até fase = 500, variavel definida no começo */
   else if (2 < fase && fase < game_over){
  // definir variaveis aleatorias para x e y da imagem 
  let a = random(5,width - 10);
  let b = random(5,height - 10);
  text(random (tarefas), a, b); //uma string aleatória do array tarefas
  frameRate(f); //define o framerate (que aumenta a cada fase pq f = f + 0.00025*fase; // para aumenta a velocidade a medida que aumenta a fase 
  bip.play();
  }
  
   /* tela de game over */
  else if (fase == game_over){
    noLoop();//para de desenhar emojis
    image(fail, 0, 0, 400, 400);
    failsound.play();
  }
  
 //verificando se fase e framerate estão funcionando, se o keyPressed() zera a variável fase e se o framerate(f) etá aumentando de acordo com a fase
  console.log(fase);
  console.log(f);
}
 
function mousePressed(){
  if (fase == 1){ //aciona o loop do draw
    background(color1);
    fill (color1);
    circle(mouseX, mouseY, 35);
    loop();
    biiip.play();
  }
  if (2 < fase  && fase < game_over){ //
    fill (color1);
    circle(mouseX, mouseY, 35);
    biiip.play();
  }
  
 else if (fase == game_over){ //instruções para falhar novamente
   fill(color2)
   rect(30, 180, 340, 40, 20);
   fill(color1);
    textSize(width/35);
    textAlign(CENTER);
    text('Aperte qualquer botão para falhar novamente 😂✨', width/2, height/2);
   // image(fish, 110, 110, 180, 180);
   failsound.play();
  }
}
 
function keyPressed(){  // zerar fase e reiniciar framerate pra velocidade inicial, inicia loop novamente
   fase = 0;
    f = 0.3;
  background(color1);
  loop();
}

