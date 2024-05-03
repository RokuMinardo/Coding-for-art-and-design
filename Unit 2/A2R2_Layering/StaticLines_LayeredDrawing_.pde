// TITLE: Static line
//This is a test to see if I can get a static like effect using lines which created a more sketchbook like effect.

void setup() {
  size(555,555);
  background(255);
  frameRate(10);

}

//Lines going in different directions canceling out eachother creating this cool sketchy effect
void draw() {
  PVector start = new PVector(random(width), random(height));
  PVector end = new PVector(random(width), random(height));
  
  drawLine(start, end);
  
}

void drawLine(PVector A, PVector B) {
  line(A.x, A.y, B.x, B.y);
  
  
for(int i = 0; i < width; i++) {
      stroke(random(255), 100);
      line(i, 0, random(0, width), height);
}


}
