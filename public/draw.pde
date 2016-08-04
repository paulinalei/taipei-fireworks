Tier myTier;

void setup() {
  size(500,500);
  // Parameters go inside the parentheses when the object is constructed.
  myTier = new Tier(color(0), 250, 250, 50);
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
  float size;

  // The Constructor is defined with arguments.
  Tier (color m_color, float m_x, float m_y, float m_size) {
    c = m_color;
    xpos = m_x;
    ypos = m_y;
    size = m_size;
  }

  void display() {
    noStroke();
    fill(c);
    quad(xpos, ypos, xpos + 50, ypos, xpos + 45, ypos + 50, xpos + 5, ypos + 50);
  }
}
