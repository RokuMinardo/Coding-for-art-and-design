//I made this turn based system when the unit started and was wondering "How should I incorporate this into a game?
//I then was thinking and then came up with the idea of using it for a card game
//This card game is actually on of the games I made in Marcelo's class with a self made board and cards
//In the original code with the turn based I only have the player 1, player 2 turn while having atk and fireball
//In this game I made cards that have their own affects
//Those affects would be atk, def, and reach.
//Reach is how far a card can attack and can be attacked.
//For reach I actually wanted the card to only reach you from there without getting hit from the ssame position but I didn't have enough time to work on that part
//Once the defense reaches 0 the card dies and returns to the coffin
//This is my card game called "Pharoah's Eye, a game I'm planning on making a turn based rpg about
//I also wanted have logic to where the player can only move one space but I'm interested in what this game brings when people plY it like this



int offsetX, offsetY; // Varriable hold while dragging
int startX; //X coordinates forthe strating grid
int startYTop; //y coordinates for the top
int startYBottom; //y coordintes for the bottom
int squareSize = 90; //square size
int spc = 20; // spaceing between the squares
int coffinX; //Coffin is the place where the cards go when they die
int coffinY; //same as above
PImage Eye;
boolean p1Turn = true; // Track the turns of the players
ArrayList<Card> p1Servants; // hold player 1's cards. p1 actually means Pharaoh1 haha
ArrayList<Card> p2Servants; //Hold player 2's cards. same goes for above
Card selectedCard = null; // Selected card

//This is where all of my cards are set with their stats and reach
//This is also where the squares are at
void setup() {
  size(1100, 1050);
//WinScreen WinScreen = new WinScreen();
//Wanted to add a winscreen but had to leave that out as I haven't figured that out.
  p1Servants = new ArrayList<Card>();
  p2Servants = new ArrayList<Card>();

  startX = (width - (3 * squareSize) - (2 * spc)) / 2;
  startYTop = (height / 2) - (3 * squareSize) - spc;
  startYBottom = (height / 2) + spc;

  // Servants
  //If Pharaoh = true or false
  //I wonder how I can add special abilities for different characters
  
  p1Servants.add(new Card("Pharaoh", 1000, 3000, 1, true));
  p1Servants.add(new Card("Asfet:The Fallen", 2000, 1700, 1, false));
  p1Servants.add(new Card("Mummy Gal", 1500, 3, 3, false));
  p1Servants.add(new Card("Currupted One", 200, 5000, 1, false));
  p1Servants.add(new Card("Successor of Ra", 1500, 3000, 1, false));
  p1Servants.add(new Card("Bladed One", 300, 500, 2, false));
  p1Servants.add(new Card("Phant:Prideful", 500, 4000, 1, false));
  p1Servants.add(new Card("Stone:Willed", 500, 3500, 5, false));

  p2Servants.add(new Card("Pharaoh", 1000, 3000, 1, true));
  p2Servants.add(new Card("Asfet:The Fallen", 2000, 1700, 1, false));
  p2Servants.add(new Card("Mummy Gal", 1500, 3, 3, false));
  p2Servants.add(new Card("Currupted One", 200, 5000, 1, false));
  p2Servants.add(new Card("Successor of Ra", 1500, 3000, 1, false));
  p2Servants.add(new Card("Bladed One", 300, 500, 2, false));
  p2Servants.add(new Card("Phant:Prideful", 500, 4000, 1, false));
  p2Servants.add(new Card("Stone:Willed", 500, 3500, 5, false));

  // Starting card placement
  for (int i = 0; i < p1Servants.size(); i++) {
    Card card = p1Servants.get(i);
    card.x = 10; // Place within the grid
    card.y = i * (squareSize + spc) + 150; //Stacked vertically
  }
//Starting placement for player 2
  for (int i = 0; i < p2Servants.size(); i++) {
    Card card = p2Servants.get(i);
    card.x = width - squareSize - 10;
    card.y = i * (squareSize + spc) + 150;
  }
  // Set text size for card names
  textSize(12);
  coffinX = width - squareSize - spc;
  coffinY = height - squareSize - spc;
//eye is the background image
  Eye = loadImage("Background.png");
  Eye.resize(1000, 0);
}


void draw() {
  background(#0c4fb1);

  image(Eye, 0, 50);

  // Top of the 3x3 squares
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      rect(startX + i * (squareSize + spc), startYTop + j * (squareSize + spc), squareSize, squareSize);
    }
  }

  // Bottom of 3x3 squares
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      rect(startX + i * (squareSize + spc), startYBottom + j * (squareSize + spc), squareSize, squareSize);
    }
  }

  // Display cards and send to the coffin when defeated
  for (Card card : p1Servants) {
    card.display();
    if (card.isFelled) {
      card.animateToCoffin();
    }
  }

  for (Card card : p2Servants) {
    card.display();
    if (card.isFelled) {
      card.animateToCoffin();
    }
    // If a card is being dragged, display it at the mouse position
    if (selectedCard != null) {
      selectedCard.x = mouseX - offsetX;
      selectedCard.y = mouseY - offsetY;
      selectedCard.display();
    }

    // Show turn order
    if (p1Turn) {
      fill(0);
      text("Player 1's Turn", width - 100, height - 20);
    } else {
      fill(0);
      text("Player 2's Turn", width - 100, height - 20);
    }
  }

  //void displayGameOver(String winner) {
  //fill(0);
  //textSize(32);
  //text(winner + " wins!", width / 2, height / 2);
  //}
}


void mousePressed() {
  // If player turn is selected, they select their side
  ArrayList<Card> activePlayerCards = p1Turn ? p1Servants : p2Servants;

  for (Card card : activePlayerCards) {
    if (card.isClicked(mouseX, mouseY)) {
      selectedCard = card;
      offsetX = mouseX - card.x;
      offsetY = mouseY - card.y;
      card.isDragging = true;
      break; // Select the first card that is clicked
    }
  }
}
 // void resetGame() {
    //gameOverCondition = false;
 // }


void mouseDragged() {
  // If a card is selected and it's the correct player's turn, update its position
  if (selectedCard != null && selectedCard.isDragging) {
    selectedCard.x = mouseX - offsetX;
    selectedCard.y = mouseY - offsetY;
  }
}

void mouseReleased() {
  // Only proceed if there is a selected card and it's the correct player's turn
  if (selectedCard != null) {
    // Calculate the nearest square position and snap the card to it
    int gridY = selectedCard.y < height / 2 ? startYTop : startYBottom; // Determine which grid to snap to
    int nearestX = (int)(round((selectedCard.x - startX) / (float)(squareSize + spc))) * (squareSize + spc) + startX;
    int nearestY = (int)(round((selectedCard.y - gridY) / (float)(squareSize + spc))) * (squareSize + spc) + gridY;
    selectedCard.x = nearestX;
    selectedCard.y = nearestY;

    // Attack on adjacent cards
    ArrayList<Card> opponentCards = p1Turn ? p2Servants : p1Servants;
    selectedCard.attackIfAdjacent(opponentCards);

    // Stop dragging the card
    selectedCard.isDragging = false;
    selectedCard = null;
//Card defense reaching 0, player wins
    for (Card card : p1Servants) {
      if (card.isPharaoh && card.defense <= 0) {
        println("Player 2 have become the Pharaoh! Player 1 have been felled.");
        noLoop();
      }
    }

    for (Card card : p2Servants) {
      if (card.isPharaoh && card.defense <= 0) {
        println("Player 1 have become the Pharaoh! Player 2 have been felled.");
        noLoop();
      }
    }


    // Toggle the turn at the end of the action
    p1Turn = !p1Turn;
  }
}
