Bacteria[] myBacteria;
void setup() {
  size(700, 700);
  myBacteria = new Bacteria[2000];
  for (int i = 0; i < myBacteria.length; i++) {
    myBacteria[i] = new Bacteria((int)(Math.random() * width), (int)(Math.random() * height));
  }
}
class Bacteria {
  int myX, myY;
  color myColor;
  Bacteria() {
    myX = width/2;
    myY = height/2;
    myColor = color(150);
  }
  Bacteria(int x, int y){
    myX = x;
    myY = y;
    myColor = color(150);
  }
  void walk(){
    float distance = dist(myX, myY, mouseX, mouseY);
    if (distance <= 100){
      if (mouseX > myX){
        myX=(myX+(int)(Math.random()*5)+1);
      } else {
        myX=(myX-(int)(Math.random()*5)+1);
      }
      if (mouseY > myY){
        myY=(myY+(int)(Math.random()*5)+1);
      }
      else{
        myY=(myY-(int)(Math.random()*5)+1);
      }
    }
    else{
      myX=(myX+(int)(Math.random()*3)-1);
      myY=(myY+(int)(Math.random()*3)-1);
    }
  }
  void show() {
    if (dist(myX, myY, mouseX, mouseY) <= 60) {
      myColor = color((int)(Math.random() * 255), (int)(Math.random() * 255), (int)(Math.random() * 255));
    } 
    else{
      myColor = color(150);
    }
    fill(myColor);
    ellipse(myX, myY, 10, 10);
  }
}
void draw() {
  background(0);
  fill(255, 255, 150);
  ellipse(mouseX, mouseY, 60, 60);
  for (int i = 0; i < myBacteria.length; i++) {
    myBacteria[i].walk();
    myBacteria[i].show();
  }
}
