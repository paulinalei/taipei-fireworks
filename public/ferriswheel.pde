FerrisWheel myFerrisWheel;
float angle = 0;

void setup() {
  size(500, 500);
  frameRate(3);
  myFerrisWheel = new FerrisWheel(color(0), 250, 250, 50, 14);
}

void draw() {
  background(240);
  myFerrisWheel.display();
}

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

  void display() {
    noFill(); // this is so that the inside of the circle will match the background
    ellipse(xpos, ypos, 2*radius, 2*radius);
    angle += PI/12; // makes the wheel spin
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
