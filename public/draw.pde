/*
* GLOBAL CONSTANTS
* Change these variables to change size of Taipei 101 because I didn't want to make my Building class have too many parameters.
*/
float TOP_BOTTOMDIFF = 3; // determines the length of half of the triangle on the top
float TOP_HEIGHT = 50;
float TOP_TOTAL_HEIGHT = TOP_HEIGHT + (TOP_HEIGHT / 4) + (1.5*(TOP_HEIGHT/4)) + ((TOP_HEIGHT/4)/2); // total height of the top part of the building
float TIER_TOPWIDTH = 50;
float TIER_BOTTOMDIFF = 5; // difference on each side of the bottom width from top width
float TIER_HEIGHT = 30;
float BASE_TOPWIDTH = 40; // must equal to TIER_TOPWIDTH - (2*TIER_BOTTOMDIFF)
float BASE_BOTTOMDIFF = 10;
float BASE_HEIGHT = 80;

Building myTaipei101;
float angle = 0; // global used to make the ferris wheel spin
Firework myFirework;
float colordegrees = 0;

// Processing says this function is called once
void setup() {
  size(500,500);
  background(240);
  myTaipei101 = new Building(color(0), 440, 180);
  myTaipei101.drawBuilding();
  myFerrisWheel = new FerrisWheel(color(0), 250, 400, 50, 14);
  myFirework = new Firework(mouseX, mouseY);
  frameRate(3); // displays frames and animates ferris wheel
}

// Processing says this function is called repeatedly and used for animation
void draw() {
  setup(); // because don't want the building to be covered by the frames
  myFerrisWheel.drawFerrisWheel();
  myFerrisWheel.spinFerrisWheel();
  angle += PI/12;
  colordegrees += 1;
}

/* Building class to draw the full Taipei 101
* @param tiers is an array of Tiers to draw the tiers in Taipei 101
* @param topPoint is the point at where the top part of Taipei 101 will be drawn
* @param bottomBase is the point at where the base of Taipei 101 will be drawn
* @param c is the color of the Building
* @param xpos is the position of the x-coordinate of the top left corner of the top most tier
* @param ypos is the position of the y-coordinate of the top left corner of the top most tier
*/
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
    noStroke();
    fill(c);
    float difference = 0;
    for (int i = 0; i < 8; i++) {
      tiers[i] = new Tier(xpos, ypos + difference, TIER_TOPWIDTH, TIER_BOTTOMDIFF, TIER_HEIGHT);
      tiers[i].drawTier();
      difference += TIER_HEIGHT; // difference is the same as each tier's height
    }

    topPoint = new Top(xpos + (TIER_TOPWIDTH/2), ypos - TOP_TOTAL_HEIGHT, TOP_BOTTOMDIFF, TOP_HEIGHT);
    topPoint.drawTop();
    // xpos + #, # must always match second to last parameter in Tier
    bottomBase = new Base(xpos + TIER_BOTTOMDIFF, ypos + difference, BASE_TOPWIDTH, BASE_BOTTOMDIFF, BASE_HEIGHT);
    bottomBase.drawBase();
  }
}

/* Top class to create the top part of Taipei 101
* @param smallTier is for the Tier directly under the triangle for the top part of Taipei 101
* @param big Tier is for the Tier directly under the smallTier
* @param smallBase is for the Base directly under the bigTier
* @param xpos is the position of the x-coordinate of the top of the triangle
* @param ypos is the position of the y-coordinate of the top of the triangle
* @param bottomdiff is the difference on each side of the triangle from the middle of the base of the triangle
* @param height is the height of the triangle
* @param tier_topwidth is the width of the top of the Tier for the first tier directly under the triangle
* @param tier_height is the height of the Tier for the first tier directly under the triangle
*/
class Top {
  Tier smallTier;
  Tier bigTier;
  Base smallBase;
  float xpos;
  float ypos;
  float bottomdiff;
  float height;
  float tier_topwidth;
  float tier_height;

  Top (float m_x, float m_y, float m_bottomdiff, float m_height) {
    xpos = m_x;
    ypos = m_y;
    bottomdiff = m_bottomdiff;
    height = m_height;
    tier_topwidth = 4*bottomdiff;
    tier_height = height / 4;
  }

  void drawTop() {
    triangle(xpos, ypos, xpos + bottomdiff, ypos + height, xpos - bottomdiff, ypos + height);
    smallTier = new Tier(xpos - (2*bottomdiff), ypos + height, tier_topwidth, bottomdiff, tier_height);
    smallTier.drawTier();
    bigTier = new Tier(xpos - (2*bottomdiff), ypos + height + tier_height, tier_topwidth, bottomdiff, 1.5*tier_height);
    bigTier.drawTier();
    smallBase = new Base(xpos - bottomdiff, ypos + height + tier_height + (1.5*tier_height), 2*bottomdiff, 2*bottomdiff, (tier_height/2));
    smallBase.drawBase();
  }
}

/* Tier class to create the seven tiers of Taipei 101
* @param xpos is the position of the x-coordinate of the top left corner of the Tier
* @param ypos is the position of the y-coordinate of the top left corner of the Tier
* @param topwidth is the width of the top of the Tier
* @param bottomdiff is the difference from the topwidth on both sides for the bottom of the Tier
* @param heigh is the height of the Tier
*/
class Tier {
  float xpos;
  float ypos;
  float topwidth;
  float bottomdiff;
  float height;

  // The Constructor is defined with arguments.
  Tier (float m_x, float m_y, float m_topwidth, float m_bottomdiff, float m_height) {
    xpos = m_x;
    ypos = m_y;
    topwidth = m_topwidth;
    bottomdiff = m_bottomdiff;
    height = m_height;
  }

  void drawTier() {
    quad(xpos, ypos, xpos + topwidth, ypos, xpos + (topwidth - bottomdiff), ypos + height, xpos + bottomdiff, ypos + height);
  }
}

/* Base class to create base of Taipei 101
* @param xpos is the position of the x-coordinate of the top left corner of the Base
* @param ypos is the position of the y-coordinate of the top left corner of the Base
* @param topwidth is the width of the top of the Base
* @param bottomdiff is the difference on both sides of topwidth used for the bottom part of the Base
* @param height is the height of the Base
*/
class Base {
  float xpos;
  float ypos;
  float topwidth;
  float bottomdiff;
  float height;

  Base(float m_x, float m_y, float m_topwidth, float m_bottomdiff, float m_height) {
    xpos = m_x;
    ypos = m_y;
    topwidth = m_topwidth;
    bottomdiff = m_bottomdiff;
    height = m_height;
  }

  void drawBase() {
    quad(xpos, ypos, xpos + topwidth, ypos, xpos + topwidth + bottomdiff, ypos + height, xpos - bottomdiff, ypos + height);
  }
}

/* FerrisWheel class to draw an animated ferris wheel
* @param c is for the color of the FerrisWheel
* @param xpos is the position of the x-coordinate of the center of the FerrisWheel
* @param ypos is the position of the y-coordinate of the center of the FerrisWheel
* @param radius is the radius of the FerrisWheel
* @param boxheight is the height of the squares for the FerrisWheel
*/
class FerrisWheel {
  color c;
  float xpos;
  float ypos;
  float radius;
  float boxheight;

  FerrisWheel(color m_c, float m_x, float m_y, float m_r, float m_boxheight){
    c = m_c;
    xpos = m_x;
    ypos = m_y;
    radius = m_r;
    boxheight = m_boxheight;
    stroke(c);
    strokeWeight(3);
  }

  void drawFerrisWheel() {
    noFill(); // this is so that the inside of the circle will match the background
    ellipse(xpos, ypos, 2*radius, 2*radius);
    strokeWeight(5);
    line(xpos, ypos, xpos - 30, ypos + (7*boxheight));
    line(xpos, ypos, xpos + 30, ypos + (7*boxheight));
    strokeWeight(3);
  }

  void spinFerrisWheel() {
    pushMatrix();
    translate(xpos, ypos);
    rotate(PI/2 + angle);
    line(0, 0, 0, radius);
    rectMode(CENTER);
    rect(0, radius + (boxheight/2), boxheight, boxheight);
    line(0, 0, 0, -radius);
    rect(0, -(radius + (boxheight/2)), boxheight, boxheight);
    line(0, 0, radius, 0);
    rect(radius + (boxheight/2), 0, boxheight, boxheight);
    line(0, 0, -radius, 0);
    rect(-(radius + (boxheight/2)), 0, boxheight, boxheight);
    rotate(PI/4)
    line(0, 0, 0, radius);
    rect(0, radius + (boxheight/2), boxheight, boxheight);
    line(0, 0, 0, -radius);
    rect(0, -(radius + (boxheight/2)), boxheight, boxheight);
    line(0, 0, radius, 0);
    rect(radius + (boxheight/2), 0, boxheight, boxheight);
    line(0, 0, -radius, 0);
    rect(-(radius + (boxheight/2)), 0, boxheight, boxheight);
    popMatrix();
  }
}

void mousePressed() {
  colordegrees += 1;
  myFirework.drawFirework();
}

class Firework {
  float xpos;
  float ypos;

  Firework(float m_x, float m_y) {
    xpos = m_x;
    ypos = m_y;
  }

  // TODO: make it so that it changes size randomly?
  void drawFirework() {
    strokeWeight(2); // do i want this as a parameter?
    if (colordegrees % 6 == 0) {
      stroke(255, 0, 0); // red
    }
    else if (colordegrees % 6 == 1) {
      stroke(255, 191, 0); // orange
    }
    else if (colordegrees % 6 == 2) {
      stroke(255, 255, 0); // yellow
    }
    else if (colordegrees % 6 == 3) {
      stroke(0, 255, 0); // green
    }
    else if (colordegrees % 6 == 4) {
      stroke(0, 255, 255); // cyan
    }
    else if (colordegrees % 6 == 5) {
      stroke(128, 0, 255); // purple
    }

    line(xpos - 15, ypos, xpos - 50, ypos);
    line(xpos, ypos - 15, xpos, ypos - 50);
    line(xpos + 15, ypos, xpos + 50, ypos);
    line(xpos, ypos + 15, xpos, ypos + 50);

    pushMatrix();
    translate(xpos, ypos);
    rotate(PI/4);
    line(0, 0 + 10, 0, 50);
    line(0 + 10, 0, 50, 0);
    line(0 - 10, 0, -50, 0);
    line(0, 0 - 10, 0, -50);
    popMatrix();

    pushMatrix()
    translate(xpos, ypos);
    rotate(PI/8);
    line(0, 0 + 30, 0, 50);
    line(0 + 30, 0, 50, 0);
    line(0 - 30, 0, -50, 0);
    line(0, 0 - 30, 0, -50);
    popMatrix();

    pushMatrix()
    translate(xpos, ypos);
    rotate(-PI/8);
    line(0, 0 + 30, 0, 50);
    line(0 + 30, 0, 50, 0);
    line(0 - 30, 0, -50, 0);
    line(0, 0 - 30, 0, -50);
    popMatrix();
  }
}
