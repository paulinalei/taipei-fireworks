
Building myTaipei101;
Base myBase;

void setup() {
  size(500,500);
  // Parameters go inside the parentheses when the object is constructed.
    myTaipei101 = new Building(color(0), 30, 10);
    myBase = new Base(color(0), 35, 240, 40, 10, 80);
}

void draw() {
  background(230);
  myTaipei101.drawBuilding();
  myBase.display();


}

// Building class to draw the full Taipei101
class Building {
  Tier[] tiers = new Tier[8];
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
      tiers[i].display();
      difference += 30; // must always match last parameter of Tier
    }
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

  void display() {
    noStroke();
    fill(c);
    quad(xpos, ypos, xpos + topwidth, ypos, xpos + (topwidth - bottomdiff), ypos + height, xpos + bottomdiff, ypos + height);
  }
}

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

  void display() {
    noStroke();
    fill(c);
    quad(xpos, ypos, xpos + topwidth, ypos, xpos + topwidth + bottomdiff, ypos + height, xpos - bottomdiff, ypos + height);
  }

}
