 //Hold image
 PImage img;
 int currentMinardo;
 //Minardo Images. Every month the image changes with the corresponding month number
String[] images = {
  "MinardoClock1.png", "MinardoClock2.png", "MinardoClock3.png",
  "MinardoClock4.png", "MinardoClock5.png", "MinardoClock6.png",
  "MinardoClock7.png", "MinardoClock8.png", "MinardoClock9.png",
  "MinardoClock10.png", "MinardoClock11.png", "MinardoClock12.png"
};

void setup() {
  size(777,777);
  //Current Minardo
  currentMinardo = month() - 1;
  //Loading the image with corresponding month
  img = loadImage(images[currentMinardo]);
  if (img == null) {
    //Added these because I couldn't see my image for some rason and then realized that my images are REALLY BIG
    println("Minardo did not like that." + images[currentMinardo]);
    
  } else {
    println("Minardo liked that.");
  }
}

void draw() {
  background(255);
  //The absence of the variable is not
  if (img != null) {
    image(img, -385, -360);
  }
}
