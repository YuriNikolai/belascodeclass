let f = 0.3; //  framerate
let game_over = 500; // numero de loops máximo
let fase = 0; // contador de loops
let r = 210;
let g = 250;
let b = 209;
let color1 = 'pink'
let color2 = 'white';
let fail;
let biiip;
let bip;
let tarefas = [];
let torta;
let unha;
let trabalho;
let email;
let abacate;




function preload(){ 
  bip = loadSound('assets/bip.mp3');
  biiip = loadSound('assets/biiip.mp3');
  failsound = loadSound('assets/fail.mp3');
  fail = loadImage('assets/fail.gif');
  
  tarefas[0] = loadImage('assets/torta.png');
  tarefas[1] = loadImage('assets/abacate.png');
 tarefas[2] = loadImage('assets/envelope.png');
  tarefas[3] = loadImage('assets/trabalho.png');
 tarefas[4] = loadImage('assets/esmalte.png');
  tarefas [5] = loadImage('assets/salada.png');
  tarefas [6] = loadImage('assets/acordar.png');
tarefas [7] = loadImage('assets/banho.png');
tarefas [8] = loadImage('assets/dormir.png');
tarefas [9] = loadImage('assets/louca.png');
tarefas [10] = loadImage('assets/maca.png');
tarefas [11] = loadImage('assets/poop.png');
tarefas [12] = loadImage('assets/remedio.png');
tarefas [13] = loadImage('assets/telefone.png');
tarefas [14] = loadImage('assets/paper.png');




 
 }


function setup(){
  createCanvas(400,400);
  background(color1);
  frameRate(f);
  fill (color2);
  noStroke();
  rect(50, 50, 300, 300, 20);
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
  
  /* fase 1 não está em looping é acionada pelo mouseCliked
  */
  if (fase == 1){
    noLoop();
  background(color1);
  frameRate(f);
  fill (color2);
  noStroke();
  rect(50, 50, 300, 300, 20);
  fill(color1);
  textAlign(CENTER);
  textSize(width/35);
  text ('Olá 😇 seja um adulto funcional 🌟 ', width/2, height/2.5);
  text ('clique em cima das tarefas, não deixe acumular!', width/2, height/2);
  text ('clique para começar 😜', width/2, height/1.5);
    
}

  /* play */
   else if (2 < fase && fase < game_over){
 
     //   // definir variaveis aleatorias
  let a = random(5,width - 10);
  let b = random(5,height - 10);
  let i = random (tarefas); //uma imagm aleatoria do array

     //desenhar os quadrados (img)
  noStroke();
  fill(color2);
  image(i, a, b, 10, 10);
  frameRate(f);
  bip.play();
  }
  
   /* tela de game over */
  else if (fase == game_over){
    noLoop();
    image(fail, 0, 0, 400, 400);
    failsound.play();
    
    
 //     background(color1);
 //  fill(color2);
 // rect(5, 5, width-10, height-10);
 //    fill(color1);
 //    textSize(width/20);
 //    textAlign(CENTER);
 //    textSize(width/35);
 //    textAlign(CENTER);
 //     text('NO MATTER HOW MUCH WE TRY', width/2, height/6);
 //    text('SOMETIMES WE CANNOT WIN', width/2, height/3 );
 //    text('PESSIMIST GAME #01', width/2, height/2);
 //    textSize(width/35);
 //    textAlign(CENTER);
 //    textFont();
 //    text ('PRESS ANY KEY TO FAIL AGAIN', width/2, height/1.2);
 //    text (':(', width/2, height/1.6);
  }
  
 //console.log(frameCount);
  console.log(fase);
  console.log(f);
}
 
function mousePressed(){
  if (fase == 1){
    background(color1);
    fill (color1);
    circle(mouseX, mouseY, 20);
    loop();
    biiip.play();
  }
  if (2 < fase  && fase < game_over){
    fill (color1);
    circle(mouseX, mouseY, 20);
    biiip.play();
  }
  
 else if (fase == game_over){
  //   let sad = random(10, width-10);
  //   background(color1);
  // fill(color2);
  // rect(5, 5, width-10, height-10);
    
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
 
function keyPressed(){  
   fase = 0;
    f = 0.3;
  background(color1);
  loop();
}

