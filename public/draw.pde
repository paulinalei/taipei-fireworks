Tier myTier;

void setup() {
  size(500,500);
  // Parameters go inside the parentheses when the object is constructed.
  myTier = new Tier(color(0), 250, 250, 100, 10, 80);
}

void draw() {
  background(230);
  myTier.display();

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
