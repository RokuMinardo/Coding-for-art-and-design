  void setup() {
  size(555, 555);
}


void draw() {
  background(71);
  translate(width * 0.5, height * 0.5);
  rotate(frameCount * 0.02);
  
 PVector textAnchor = new PVector(0,0);
 line(textAnchor.x, -9999, textAnchor.x,9999);
 line(-9999, textAnchor.y, 999, textAnchor.y);
  
  textSize(128);
  textAlign(RIGHT, CENTER);
  fill(#000000);
  text("RECLUSES", 270,-187);
  
  text("GET WEAK", 270, 136);


textSize(128);
textAlign(RIGHT, CENTER);
fill(#fcf9f9);
text("ALWAYS", 215,-35);



  if (frameCount == 1);
  {
    save("output.png");
  }
}
