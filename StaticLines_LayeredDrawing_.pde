// TITLE: Static line

void setup() {
  size(555,555);
  background(255);
  frameRate(10);

}

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
