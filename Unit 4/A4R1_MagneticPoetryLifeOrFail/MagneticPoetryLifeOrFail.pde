//The word/ letter "A" to the right is where the poem starts regularly but...
//You can start this poem either way honestly so you choose the way you read it.
//As this is magnetic poetry you can create new wordings with this and may be ablt to create a whole new poem
//This is a self made poem
//The words can stick to eachother as a message to show that life is about challlenges and overcoming them
String[] words = {"A", "reason", "to", "fail", "is", "another", 
"reason", "to", "sprout", "A", "reason", "to", "Stop", "is", 
"another", "reason", "to", "go", "A", "reason", "to", "fall", 
"is", "another", "reason", "to", "get", "up", "But", "there's", 
"no", "reason", "to" , "give", "up", "because", "the", "only", "way",
"is", "to", "keep", "on", "going"};
Word[] Objects;
float angle;

void setup(){
  size(800, 900);
  background(150);
  textAlign(CENTER, CENTER);
  //Word length
  angle = TWO_PI /words.length;
  Objects = new Word[words.length];
  
  for (int i = 0; i < words.length; i++) {
    float x = width/2 + cos(angle * i) * width/3;
    float y = height/2 + sin(angle * i) * height/3;
    Objects[i] = new Word(words[i], x, y);
  }
}

void draw(){
  
  translate(width/2, height/2);
  
  // Flower shape
  fill(172, 172, 172);
  for (int i = 0; i < 8; i++){
    pushMatrix();
    rotate(PI/3 * i); //
    ellipse(0, -height/8, 37, 206);
    popMatrix();
  }
  fill(13, 13, 11);
  ellipse(0, 2, 50, 59);
  
  // Words
  for (Word word : Objects){
    word.display();
  }
}
//Mouse moving words
void mouseDragged(){
  for (Word word : Objects) {
    word.drag();
  }
}
//Calling the class
class Word{
  String text;
  float x, y; //Coordinates 
  boolean dragged = false; //Word not being dragged
  
  //Constructor
  Word(String text, float x, float y){
    this.text = text;
    this.x = x;
    this.y = y;
  }
  //Discplay text at location
  void display(){
    fill(0);
    text(text, x - width/2, y - height/2);
  }
  //Words being able to be dragged
  void drag(){
    //The && was interesting as I learned it's used to combine 2 conditions
    //Both conditions are not true meaning it to be false
    if (mousePressed && dist(mouseX, mouseY, x, y) < 20){
      x = mouseX;
      y = mouseY;
      dragged = true;
    } else {
      dragged = false;
    }
  }
}
