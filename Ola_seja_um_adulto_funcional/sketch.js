/*

O JOGO MAIS CRINGE QUE VC JA VIU 

OlΓ‘ π seja um adulto funcional π

REALIZE TODAS AS SUAS TAREFAS
π°βπ΄π©πππ§ππ₯π¨β°ππβοΈπβοΈπ§Ύπππ₯ππ€³πΈπ§Ίπ½π

e nΓ£o se esqueΓ§a, use emojis! π₯°π₯΅π£
πππ
π
seja cringe π€«

πππ€ͺππππππππβΉοΈπ’π₯π­

tome vacina ππππππ

julia brasil, 2021


*/

let game_over = 100; // numero de loops mΓ‘ximo
let fase = 0; // contador de loops
let color1 = 'pink';
let color2 = 'white';
let fail; // imagem 
let failsound;
let biip; // som quando tarefa aparece
let bip; // som quando clica em cima da tarefa
let tarefas = []; // array do obj tarefa
let emojis = []; //aray com string de emojis
let adulto = ['π₯°','π','π','π','π','π€ͺ','π­','π₯΅','π­'];
let star; // string com emoji es estrela
let vel = 3000;
let pressΓ£o;
let pr;



//preload carrega os sons e defino os strings de emojis
function preload(){ 
  bip = loadSound('assets/bip.mp3');
  biip = loadSound('assets/biiip.mp3');
  failsound = loadSound('assets/fail.mp3');
  fail = loadImage('assets/fail.gif');
  fundo = loadImage('fundo.gif');
}


function setup(){
  createCanvas(600,600);
  pr = new pressure(540, 5, 55, 25);
  for(let i = 0; i < 1; i++){
    tarefas[i] = new tarefa();   
  }
  setTimeout(novaTarefa,1000);
}


function draw(){
 pressΓ£o = tarefas.length;
  if (pressΓ£o >= game_over){
    gameOver();
  } else {
  vel--;
  background(color1);
  image (fundo, 0, 0, width, height);
  for(let i = 0; i < tarefas.length; i++){
    tarefas[i].aparecer();
    tarefas[i].mexer();
  }
}
botarPressao();
}
 
function mousePressed(){
  for (let i = tarefas.length-1; i >= 0; i--){
    if (tarefas[i].noAlvo(true)){
      tarefas.splice(i,1);
      biip.play();
    }
  }
}
  

function novaTarefa(){
  if ( tarefas.length <= game_over){
  let t = new tarefa();
  tarefas.push(t);
  bip.play();
  setTimeout(novaTarefa, vel);
  }
  console.log(vel);
}


function gameOver(){
  failsound.play();
  image(fail, 0, 0, width, height);
  noLoop();
  }

function botarPressao(){
  pr.show();
  pr.mudar();
}

// recomeΓ§a o jogo
function keyPressed() {
  setup();
}


// objetos tarefa 
class tarefa {
   constructor(){
     let emojis = ['π°', 'β', 'π΄', 'π©', 'π', 'π', 'π§', 'π', 'π₯', 'π¨', 'β°', 'π', 'π', 'βοΈ', 'π', 'βοΈ', 'π§Ύ', 'π', 'π', 'π₯', 'π', 'π€³', 'πΈ', 'π§Ί', 'π½', 'π' ];
    this.s = random(emojis);
     this.x = random(width-30);
     this.y = random (height-30);
     this.r = width/70;
   }
  
  aparecer(){
    textSize(width/35);
    textAlign(CENTER);
    text(this.s, this.x, this.y + this.r);
    // stroke(1);
    // noFill();
    // circle(this.x, this.y , 2*this.r);
  }
  
  mexer() {
    this.x = this.x + random(-1, 1);
    this.y = this.y + random(-1, 1);
    if (this.x > width-30 || this.x < 10){
      this.x = random(width-30);}
      if (this.y > width-30 || this.y < 10){
      this.y = random(height-30);
    }
  }
  
  noAlvo(){
    let d = dist(mouseX, mouseY, this.x, this.y);
    if (d < this.r){
      return true;
    } else {
      return false;
    }    
  }
}

class pressure {
  constructor(x, y, a, b){
    this.x = x;
    this.y = y;
    this.a = a;
    this.b = b;
    this.text = adulto[0];
  }
  
  show(){
  fill('white');
  noStroke();
  rect(this.x, this.y, this.a, this.b, 10);
  text (this.text, this.x+20, this.y+5, 20);
  }
  
  mudar(){
    if (pressΓ£o < 100){
      this.text = adulto[8]
    }if(pressΓ£o <= 45) {
    this.text = adulto[7]
    } if(pressΓ£o < 40) {
     this.text = adulto[6]
    } if(pressΓ£o < 35) {
     this.text = adulto[5]
    } if(pressΓ£o < 30) {
     this.text = adulto[4]
    } if(pressΓ£o < 20) {
    this.text = adulto[3]
    } if(pressΓ£o < 15) {
     this.text = adulto[2]
    } if(pressΓ£o < 10) {
     this.text = adulto[1]
    } if (pressΓ£o < 5){
    this.text = adulto[0]  
}

  }
}


 