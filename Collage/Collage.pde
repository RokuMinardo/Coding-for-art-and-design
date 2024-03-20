PImage min1;
PImage min2;
PImage min3;
PImage min4;
PImage mem;



void setup() {
  
  size(555,555);
  
mem = loadImage ("mementos.WEBP");
min1 = loadImage ("min.png");
min2 = loadImage ("min 2.png");
min3 = loadImage ("min 3.png");
min4 = loadImage ("min 4.png");
}



void draw() {
  
  background(0); 
  
scale(0.24);
image(min1, -73,-62);
resetMatrix();
  
 scale(0.32);
image(min2, 1,-28);
resetMatrix();

scale(0.38);
image(min4, 280,30);
resetMatrix();

scale(0.42);
image(min3, 472,146);
resetMatrix();
}
