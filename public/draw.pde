/*
* GLOBAL CONSTANTS
* Change these variables to change size of Taipei 101
*/
float TOP_BOTTOMDIFF = 3; // determines the length of half of the triangle on the top
float TOP_HEIGHT = 50;
float TOP_TOTAL_HEIGHT = TOP_HEIGHT + (TOP_HEIGHT / 4) + (1.5*(TOP_HEIGHT/4)) + ((TOP_HEIGHT/4)/2); // total height of the top part of the building
float TIER_TOPWIDTH = 50;
float TIER_BOTTOMDIFF = 5; // difference on each side of the bottom width from top width
float TIER_HEIGHT = 30;
float BASE_TOPWIDTH = 40; // must equal to TIER_TOPWIDTH - (2*BOTTOMDIFF)
float BASE_BOTTOMDIFF = 10;
float BASE_HEIGHT = 80;

Building myTaipei101;

void setup() {
  size(500,500);
  myTaipei101 = new Building(color(0), 150, 150);
}

void draw() {
  background(230);
  myTaipei101.drawBuilding();
}

// Building class to draw the full Taipei 101
class Building {
  Tier[] tiers = new Tier[8];
  Top topPoint;
  Base bottomBase;
  color c;
  float xpos;
  float ypos;

  Building (color m_c, float m_x, float m_y) {
    c = m_c;
    xpos = m_x;
    ypos = m_y;
  }

  //all the numbers are hardcoded in, maybe turn them into global variables so you don't have to do the math
  void drawBuilding(){
    float difference = 0;
    for (int i = 0; i < 8; i++) {
      tiers[i] = new Tier(c, xpos, ypos + difference, TIER_TOPWIDTH, TIER_BOTTOMDIFF, TIER_HEIGHT);
      tiers[i].drawTier();
      difference += TIER_HEIGHT; // difference is the same as each tier's height
    }

    topPoint = new Top(c, xpos + (TIER_TOPWIDTH/2), ypos - TOP_TOTAL_HEIGHT, TOP_BOTTOMDIFF, TOP_HEIGHT);
    topPoint.drawTop();
    // xpos + #, # must always match second to last parameter in Tier
    bottomBase = new Base(c, xpos + TIER_BOTTOMDIFF, ypos + difference, BASE_TOPWIDTH, BASE_BOTTOMDIFF, BASE_HEIGHT);
    bottomBase.drawBase();
  }
}

// Top class to create the top part of Taipei 101
class Top {
  Tier smallTier;
  Tier bigTier;
  Base smallBase;
  color c;
  float xpos;
  float ypos;
  float bottomdiff;
  float height;
  float tier_topwidth;
  float tier_height;

  Top (color m_c, float m_x, float m_y, float m_bottomdiff, float m_height) {
    xpos = m_x;
    ypos = m_y;
    bottomdiff = m_bottomdiff;
    height = m_height;
    tier_topwidth = 4*bottomdiff;
    tier_height = height / 4;
  }

  void drawTop() {
    noStroke();
    triangle(xpos, ypos, xpos + bottomdiff, ypos + height, xpos - bottomdiff, ypos + height);
    smallTier = new Tier(c, xpos - (2*bottomdiff), ypos + height, tier_topwidth, bottomdiff, tier_height);
    smallTier.drawTier();
    bigTier = new Tier(c, xpos - (2*bottomdiff), ypos + height + tier_height, tier_topwidth, bottomdiff, 1.5*tier_height);
    bigTier.drawTier();
    smallBase = new Base(color(0), xpos - bottomdiff, ypos + height + tier_height + (1.5*tier_height), 2*bottomdiff, 2*bottomdiff, (tier_height/2));
    smallBase.drawBase();
  }
}

// Tier class to create the seven tiers of Taipei 101
class Tier {
  color c;
  float xpos;
  float ypos;
  float topwidth; // width of the top part of the tier
  float bottomdiff; // how much to add or subtract from x position to make bottom
  float height;

  // The Constructor is defined with arguments.
  Tier (color m_color, float m_x, float m_y, float m_topwidth, float m_bottomdiff, float m_height) {
    c = m_color;
    xpos = m_x;
    ypos = m_y;
    topwidth = m_topwidth;
    bottomdiff = m_bottomdiff;
    height = m_height;
  }

  void drawTier() {
    noStroke();
    fill(c);
    quad(xpos, ypos, xpos + topwidth, ypos, xpos + (topwidth - bottomdiff), ypos + height, xpos + bottomdiff, ypos + height);
  }
}

// Base class to create base of Taipei 101
class Base {
  color c;
  float xpos;
  float ypos;
  float topwidth;
  float bottomdiff;
  float height;

  Base(color m_c, float m_x, float m_y, float m_topwidth, float m_bottomdiff, float m_height) {
    c = m_c;
    xpos = m_x;
    ypos = m_y;
    topwidth = m_topwidth;
    bottomdiff = m_bottomdiff;
    height = m_height;
  }

  void drawBase() {
    noStroke();
    fill(c);
    quad(xpos, ypos, xpos + topwidth, ypos, xpos + topwidth + bottomdiff, ypos + height, xpos - bottomdiff, ypos + height);
  }
}
