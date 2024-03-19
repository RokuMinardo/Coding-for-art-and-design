PVector dot;

void setup() {
  size(555,555);
  dot = new PVector();
  
}

void draw() {
  background(255);
  
  // update position
  dot.set(mouseX, mouseY); //eqiuvalent to dot.x = mousX and dot.y =
  
  float leftWall, rightWall, topWall, bottomWall;
  leftWall = width * 0.34;
  rightWall = width * 0.66;
  dot.x = constrain(mouseX, width * 0.33, width * 0.66);
  line(leftWall, 0, leftWall, height);
  line(rightWall, 0, rightWall, height);
  
 topWall = height * 0.20;
 bottomWall = height * 0.50;
 dot.y = constrain(mouseY, topWall, bottomWall);
  

  
  // draw object
  circle(dot.x, dot.y, 50);
}

void mouseClicked() {
  println("\nmouse: (" + mouseX + ", " + mouseY + ")");
  println("dot: (" + dot.x + ", " + dot.y + ")");
}
