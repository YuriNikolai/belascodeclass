/**
 * Esfera
 * by David Pena.  
 * 
 * Distribucion aleatoria uniforme sobre la superficie de una esfera. 
 */

int cuantos = 10000; //aumentei o numero de pelos
Pelo[] lista ;
float radio = 150; //diminui 
float rx = 0;
float ry =0;

void setup() {
  size(1024, 768, P3D);

  radio = height/5; //diminui o raio

  lista = new Pelo[cuantos];
  for (int i = 0; i < lista.length; i++) {
    lista[i] = new Pelo();
  }
  noiseDetail(3);
}

void draw() {
  background(255);
  
  float rxp = (mouseX-(width/2)) * 0.005;
  float ryp = (mouseY-(height/2)) * 0.005;
  rx = rx*0.3 + rxp*0.4;
  ry = ry*0.5 + ryp*0.7;

  translate(width/2, height/2);
  rotateY(rx);
  rotateX(ry);
  fill(255);
  noStroke();
  sphere(radio);

  for (int i = 0; i < lista.length; i++) {
    lista[i].dibujar();
  }

}


class Pelo
{
  float z = random(-radio, radio);
  float phi = random(TWO_PI);
  float largo = random(1.15, 1.2);
  float theta = asin(z/radio);

  Pelo() { // what's wrong with a constructor here
    z = random(-radio, radio);
    phi = random(TWO_PI);
    largo = random(1.15, 1.5);
    theta = asin(z/radio);
  }

  void dibujar() {

    float off = (noise(millis() * 0.0005, sin(phi))-0.5) * 2; //aumentei o quanto movem os pelos
    float offb = (noise(millis() * 0.0007, sin(z) * 0.01)-0.5) * 2; //aumentei o quanto movem os pelos

    float thetaff = theta+off;
    float phff = phi+offb;
    float x = radio * cos(theta) * cos(phi);
    float y = radio * cos(theta) * sin(phi);
    float z = radio * sin(theta);

    float xo = radio * cos(thetaff) * cos(phff);
    float yo = radio * cos(thetaff) * sin(phff);
    float zo = radio * sin(thetaff);

    float xb = xo * largo;
    float yb = yo * largo;
    float zb = zo * largo;

    strokeWeight(10); //aumentei o srtroke inicial
    beginShape(LINES);
    stroke(204, 245, 245, 20);
    vertex(x, y, z);
    strokeWeight(1); //diminui o sroke final
    stroke(249, 180, 231, 50);
    vertex(xb, yb, zb);
    endShape();
  }
}
