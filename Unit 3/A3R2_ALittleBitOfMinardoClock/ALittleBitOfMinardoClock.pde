//In this clock there are 3 components that tell when a second, minute, and hour have passed.
//I went a little on the creative side more than the practical side of things as it's what I wanted
//Images switching over every second.
//Music going faster and faster and resets once a minute passes by.
//Dot changes color by the hour.
//The clock may not be usable by telling the minute or even the seconds but the hour can be desiphered. 
//Music: https://music.youtube.com/watch?v=RUBvqz3ozv8&si=ke2BT4vFgnh8vYDH

import processing.sound.*; 
SoundFile file;
float baseSpeed = 1.0;

// Holds images
PImage[] images; 
int imageIndex = 0;
int lastTime = 0;

//HourReset
float lastResetHour;

// Dot position
float dotX, dotY; 
int currentHour; // Current hour (0 to 23)

// Storecolors for each hour. 
color[] hourColors; 

void setup() {
    size(555, 555);
    //Music, A little bit of...
    file = new SoundFile(this, "ALittleBitOf.mp3");
    file.play();
    file.rate(baseSpeed);
   
   
    
    // Image
    images = new PImage[2];
    images[0] = loadImage("MinardoTrumpet.png");
    images[1] = loadImage("MinardoTrumpet2.png");
    
    //Reset hour
    lastResetHour = hour();

    // Define colors for each hour (Costomize to you liking! Go I know you want to)
    hourColors = new color[24];
    hourColors[0] = color(#000000); // Midnight 
    hourColors[1] = color(#FF8000); // 1 AM 
    hourColors[2] = color(#FFDE00); // 2 AM 
    hourColors[3] = color(#CDFF00); // 3 AM
    hourColors[4] = color(#80FF00); // 4 Am
    hourColors[5] = color(#44FF00); // 5 AM
    hourColors[6] = color(#00FF77); // 6 AM
    hourColors[7] = color(#00FFAB); // 7 AM
    hourColors[8] = color(#00FFD5); // 8 AM
    hourColors[9] = color(#00FFFF); // 9 AM
    hourColors[10] = color(#00C4FF); // 10 AM
    hourColors[11] = color(#0089FF); // 11 AM
    hourColors[12] = color(#0066FF); // 12 PM
    hourColors[13] = color(#004DFF); // 1 PM
    hourColors[14] = color(#003CFF); // 2 PM
    hourColors[15] = color(#001AFF); // 3 PM
    hourColors[16] = color(#2B00FF); // 4 PM
    hourColors[17] = color(#6F00FF); // 5 PM
    hourColors[18] = color(#FFB300); // 6 PM
    hourColors[19] = color(#CE15AF); // 7 PM
    hourColors[20] = color(#BA12AF); // 8 PM
    hourColors[21] = color(#A4129A); // 9 PM
    hourColors[22] = color(#6F1969); // 10 PM
    hourColors[23] = color(#50164C); // 11 PM
        
}

void draw() {
    background(164);

    dotX = width / 1.5;
    dotY = height / 1.5;
    //Minute Started
    int s = second();
    float timeLeft = 60 - s;
    
    //Speed of music by the minute
    float speed = map(timeLeft, 60, 0, baseSpeed, baseSpeed * 2);
    file.rate(speed);
    
    //reset Speed
    if (s == 0) {
      file.rate(baseSpeed);
    }
    
    if (!file.isPlaying()) {
      file.play();
    }
    
    // My two images alternating
    int currentTime = millis();
    int currentHour = hour();
    
    //ImageVarrying through seconds
    if(currentTime - lastTime > 1000) {
      imageIndex = (imageIndex + 1) % images. length;
      lastTime = currentTime;
    }
    image(images[imageIndex], 0, 0);
    if (currentHour != lastResetHour) {
    }

    // Set dot color based on the current hour
    color dotColor = hourColors[currentHour];
    fill(dotColor);

    // Dot
    ellipse(dotX, dotY, 98, 98);

    // Show current time
    fill(0);
    textSize(16);
    textAlign(CENTER, CENTER);
    //I inputed this code to show that the time correlates with the unique clock
    text(nf(currentHour, 2) + ":" + nf(minute(),2), width / 2, height - 20);

    // New hour varification
    if (hour() != currentHour) {
        currentHour = hour(); // Update the current hour
       
    }

}
