//The word/ letter "A" to the right is where the poem starts regularly but...
//You can start this poem either way honestly so you choose the way you read it.
//As this is magnetic poetry you can create new wordings with this and may be ablt to create a whole new poem
//This is a self made poem
//The words can stick to eachother as a message to show that life is about challlenges and overcoming them
//I also got help from a friend who knows java who goes to Binghinton I believe? He's cool.
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
  textAlign(CENTER, CENTER);
  textSize(15);
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
  background(150);
  
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
  
  // Word word pffft
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
  Word(String text2, float x2, float y2){
    //I learned from my friend that I can use the this keyword which is used when variables and parameters have the same name
    //Would it be better if I used this?
    text = text2;
    x = x2;
    y = y2;
  }
  
  //Discplay text at location
  void display(){
    fill(0);
    text(text, x - width/2, y - height/2);
  }
  
  //Words being able to be dragged
  void drag(){
    //The && was interesting as I learned it's used to combine 2 conditions/ if statements
    //Both conditions are not true meaning it to be false
     //if(mousePressed) { if (dist(mouseX, mouseY, x, y) < 20) { 
       //}
       //}
       float MouseX2 = mouseX - width/2;
       float MouseY2 = mouseY - height/2;
       
    if (mousePressed && dist(MouseX2, MouseY2, x - width/2, y - height/2) < 20) {
      //x = mouseY;
     // y = mouseY;
     x = MouseX2 + width/2;
     y = MouseY2 + height/2;
      dragged = true;
    } else {
      dragged = false;
    }
    
  }
}
