void setup() {
  size(555, 555);
  
}

void draw() {
  background(90);
  fill(150);
  stroke(255);
  rectMode(CENTER);
  rect(mouseX, mouseY, 170, 20);
  circle(mouseX, mouseY, 102);
  circle(mouseX, mouseY, 46);
  rect(mouseX, height-mouseY, 100, 50);
  rect(mouseX, height-mouseY, 231, -13);

}
