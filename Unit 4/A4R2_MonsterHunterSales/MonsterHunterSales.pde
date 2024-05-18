//I'm going to have lots of comments only because this as fun to do and I'm trying to get a good grade pftfft
//Most of the comments was to organize my code
//I wanted a bar graph that shows the sales of Monster Hunter Games. 
//I also added a legend to show which is which for an easier look
//I'm actually proud of this as i took a while and adding the links with figuring out how to incorporate them was fun.
//Creating the Legend was also fun
//L will equal legend for the sake of writing time
//BG will mean bar graph
//mh = Monster Hunter
BG bar; //At first I didn't call this globally but I was having problems
PImage mhI;

void setup(){
   size(800,600);
   String[] mh = {"MH", "MH2", "MH3", "MH4", "Gen", "World", "Rise"};
   
   mhI = loadImage("MonsterHunter.png");
   mhI.resize(800,0);
   
   int[] sales = {1, 1, 3, 3, 9, 25, 14}; //Sales by million MH1 sales at 1 as there where no records
   int[] colors = {color(#f3d02b), color(#2bdbf3), 
   color(#2b6bf3), color(#a59834), color(#ea420d),
   color(#6ad268), color(#8868d2)};
   
   
//Was having soo much trouble implementing the bar graph on click opening the link to the MH wiki
//At first I had only 1 draw function having everything in draw.
//But I realized that anything in the class won't work if it's not in the code globally
//So I created anothee draw function for the legend and bar graph THEN I added mouse Clicked globally so that the links can work on click.
//MH urls
  String[] url = {"https://monsterhunter.fandom.com/wiki/MH1:_Monsters", 
"https://monsterhunter.fandom.com/wiki/Monster_Hunter_2",
"https://monsterhunter.fandom.com/wiki/Monster_Hunter_3",
"https://monsterhunter.fandom.com/wiki/Monster_Hunter_4",
"https://monsterhunter.fandom.com/wiki/Monster_Hunter_Generations",
"https://monsterhunterworld.wiki.fextralife.com/Monsters",
"https://monsterhunterrise.wiki.fextralife.com/monster+hunter+rise+wiki"
  };
//Graph properties
 bar = new BG(mh, sales, colors, url); //Creating bg
}
void draw(){
  background(150);
  
  image(mhI, -8,38);
   
  //draw out graph globally
  bar.draw();
  
  //draw out legensd
  drawL();
   
String clickBar = "Click Bars to get sent to a wiki";
  textSize(30);
  fill(255);
  text (clickBar, 224, 26, 384, 360);
  stroke(253);

  
}
//The mouseClicked was another thing, I had to add this globally and within the class as the assignment was to have a class.
void mouseClicked(){
  
  bar.mouseClicked();
}

//I have learned that when I have my bar graph in class I cannot tweak unless I'm changing what's inside of the class
//Since adding at least one class is in the assignment I'll keep his and tweak it old fashion
class BG{ //class for the bar 
  
  int[] sales;
  int[] colors;
  int bWidth = 79; //Size of the bar
  
  String[] mh;
  String[] url; //For URLs
  
  BG(String[] mh2, int[] sales2, int[] colors2, String[]url2){
    //For these codes I can also use the "this" keyword as I learned from my friend
    //but I for some reason like this way better as I feel more organized this way
    mh = mh2;
    sales = sales2;
    colors = colors2;
    url = url2;
  }
  
//Mouse clicks for the bars
void mouseClicked(){
  for (int i = 0; i < mh.length; i++){
    int x = 50 + i * (bWidth + 10);
    int y = height - sales[i] * 12;
    int bHeight = sales[i] * 15;
    
  //Mouse clicks directly to the bars  
    if (mouseX >= x){
      if (mouseX <= x + bWidth){
        if (mouseY >= y) { //I had this code to be mouseY > = y and was wondering why it wasn't working and well the problem was the space PFFFT
          if (mouseY <= y + bHeight){
            link(url[i]); 
          }
        }
      }
    }
  }
}

  
 void draw(){
   textSize(15);
    //Doing this whole line of code was weird as I had to learn more about well height and length in a litmited amount of time.
    //Didn't perfect it but this give me what I want. Hoping to get better with loops
    for (int i = 0; i < mh.length; i++){
      int x = 50 + i * (bWidth + 7); // horizontal position (This one was weird)
      int y = height - sales[i] * 12; // Vertical position of the bar
      int bHeight = sales[i] * 15; //Height of the bar
      
      fill(colors[i]); //colors for each game
      rect(x, y, bWidth, bHeight);
      fill(0);
      text(mh[i], x + bWidth /3, height - 3); // Monster Hunter Label  
    }
     
  }
}
  
  
 //Size of the legend and location 
 //l = legend
void drawL(){
  int lX = 709; 
  int lY = 146; 
  int lWidth = 81;
  int lHeight = 167; 
  int lMargin = 23; 

  // Legend for Monster Hunter
  textSize(10);
  fill(214);
  stroke(0);
  rect(lX, lY, lWidth, lHeight);

  //Legend Labels and colored boxes
  //Legend to the right
  String[] mh = {"MH", "MH2", "MH3", "MH4", 
  "Gen", "World", "Rise"};
  int[] colors = {color(#f3d02b), color(#2bdbf3), 
    color(#2b6bf3), color(#a59834), color(#ea420d),
    color(#6ad268), color(#8868d2)};
  for (int i = 0; i < mh.length; i++){
    
    int labelX = lX + lMargin; //Legend x
    int labelY = lY + lMargin + i * 20; //Legend y
    int box = 10;

    fill(colors[i]);
    rect(labelX, labelY, box, box);

    fill(0);
    text(mh[i], labelX + box + 5, labelY + box);
  }
} 
