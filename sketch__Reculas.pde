void setup() {
 size(1024,1024); 
}

void draw(){
   background(255);
   translate(width * 0.5, height * 0.5);
   rotate(TAU * 0.063);
   text("Reculas", 375,350);
   
   if (frameCount == 1){
     save("output.png");
   }
   
}
