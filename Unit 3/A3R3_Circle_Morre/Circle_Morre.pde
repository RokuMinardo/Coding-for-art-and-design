//Eye bleeding circle
//A simple piece
//Learned lots about loops and love making them now
void setup() {
  size(500,500);
    background(255);
}

void draw() {
  noFill();
  strokeWeight(0);
  
  //Bottom set of circles
 for (int i = 200; i <= 420; i += 10) {
  circle(250, 300, i);
}

//Top set of circles
for (int i = 0; i <= 340; i += 10) {
  circle(250, 200, i);
}

}
