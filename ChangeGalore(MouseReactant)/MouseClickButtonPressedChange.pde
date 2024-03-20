//Did another to test out how the mouse can react to the screen in different ways like clicks or scroll wheel.

void setup(){
  
  size(555, 555);
  background(0,50,0);
}

void draw() {
  stroke(255);
  line(pmouseX, pmouseY, mouseX, mouseY);
  
}

void mousePressed() {
  background(0,0,50);
}

void keyPressed() {
  background(50,0,0);
}

void mouseWheel() {
  
  background(0,50,0);
}