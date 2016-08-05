Building myTaipei101;
Base smallBase;
Top mytop;
void setup() {
  size(500,500);
  myTaipei101 = new Building(color(0), 150, 150);
}

void draw() {
  background(230);
  myTaipei101.drawBuilding();
  //mytop.drawTop();
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

  void drawBuilding(){
    float difference = 0;
    for (int i = 0; i < 8; i++) {
      tiers[i] = new Tier(c, xpos, ypos + difference, 50, 5, 30);
      tiers[i].drawTier();
      difference += 30; // must always match last parameter of Tier
    }

    topPoint = new Top(c, xpos + 25, ypos - 87.5, 3, 50);
    topPoint.drawTop();
    // xpos + #, # must always match second to last parameter in Tier
    bottomBase = new Base(c, xpos + 5, ypos + difference, 40, 10, 80);
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
