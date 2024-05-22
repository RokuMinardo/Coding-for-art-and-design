class Card {
  int attack, defense, reach; //Stats
  int coffinX; //Coffin x position
  int coffinY; //Ciffin y position
  String name; //Name of servants
  int x, y; // Card position
  boolean isPharaoh; //Main character
  boolean isDragging = false; // Card dragging state
  boolean isFelled; //defeated
  float tX, tY; //Target x and y coordinates
  float speed = 35;//speed of animation

//Where card properties will be
//stats, name is name, display card
  Card(String name, int attack, int defense, int reach, boolean isPharaoh) {
    this.name = name;
    this.attack = attack;
    this.defense = defense;
    this.reach = reach;
    this.isPharaoh = isPharaoh;
  }

  void display() {
    if (!isDragging) {
      fill(#f9cf00);
      rect(x, y, 90, 70);
      fill(0);
      text(name, x + 5, y + 15);
      text("ATK :" + attack, x + 5, y + 30);
      text("DEF :" + defense, x + 5, y + 45);
      text("RCH :" + reach, x + 5, y + 60);
    }
  }

  // If card is being clicked
  //mousex, mousey
  boolean isClicked(int mx, int my) {
    return mx > x && mx < x + squareSize && my > y && my < y + squareSize; // Use squareSize for card size
  }
  void attackIfAdjacent(ArrayList<Card> allCards) {
    for (Card otherCard : allCards) {
      // If other cards are horizontal or vertical
      
         int disX = abs(this.x - otherCard.x) / (squareSize + spc);
         int disY = abs(this.y - otherCard.y) / (squareSize + spc);  
         
         if (this != otherCard && 
         (disX <= this.reach && this.y == otherCard.y) ||
         (disY <= this.reach && this.x == otherCard.x)) {
        // Perform attack: reduce the defense of the other card by this card's attack value
        otherCard.defense -= this.attack;
        println(this.name + " attacked " + otherCard.name + "!");
        
        //Defense is 0
        if (otherCard.defense <= 0) {
        otherCard.defense = 0; // Defense doesn't go to 0
        otherCard.isFelled = true;
        if (p1Turn) {
          otherCard.startDefeatedAnimation(p1Servants, p2Servants);
        } else {
        otherCard.startDefeatedAnimation(p2Servants, p1Servants);
       }
      }
    }
  }
  }
      // Set the target position to the top left corner  
  void startDefeatedAnimation(ArrayList<Card> playerCards, ArrayList<Card> opponentCards) {
    isFelled = true;
    tX = coffinX; 
    
    //list of cards that belongs and calculate
    int index = playerCards.indexOf(this);
    if (index != -1) {
      //This card is in the other player's list
      index = opponentCards.indexOf(this);
      tY = coffinY - (opponentCards.size() - index) * (squareSize + spc); //Vertically stacked
    }
  }

  // Method to animate the card moving to the graveyard (coffin)
  void animateToCoffin() {
    if (isFelled) {
      // Direction towards the top left
      float dirX = tX - x;
      float dirY = tY - y;
      // Distance towards top right
      float distance = dist(x, y, tX, tY);
      if (distance > 1) {
        dirX /= distance;
        dirY /= distance;
      }
      // Move the card towards the target
      x += (int) (dirX * speed);
      y += (int) (dirY * speed);
      // Stop the animation when the card reaches the target
      if (dist(x, y, tX, tY) < speed) {
        x = (int)tX; //targetX
        y = (int)tY;//targetY
        isFelled = false; // Reset the flag
      }
    }
  }
}
    
