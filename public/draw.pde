
Taipei101 myTaipei101;

void setup() {
  size(500,500);
  // Parameters go inside the parentheses when the object is constructed.
  myTaipei101 = new Taipei101(250, 250);
}

void draw() {
  background(230);
  myTaipei101.display();
}

class Taipei101 {
  Tier[] tiers = new Tier[8];
  float xpos;
  float ypos;

  Taipei101 (float m_x, float m_y) {
    xpos = m_x;
    ypos = m_y;
  }

  void display(){
    float difference = 0;
    for (int i = 0; i < 8; i++) {
      tiers[i] = new Tier(color(0), xpos, ypos + difference, 50, 5, 30);
      tiers[i].display();
      difference += 30;
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
