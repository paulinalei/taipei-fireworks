FerrisWheel myFerrisWheel;
void setup() {
  size(500, 500);
  frameRate(3);
  myFerrisWheel = new FerrisWheel(250, 250);
}

float angle = 0;
void draw() {
  background(240);
  myFerrisWheel.display();
}

class FerrisWheel {
  color c;
  float xpos;
  float ypos;

  FerrisWheel(float m_x, float m_y){
    xpos = m_x;
    ypos = m_y;
  }

  void display() {
  strokeWeight(3);
  noFill(); //so you would just draw a circle
  ellipse(xpos, ypos, 100, 100);
  angle += PI/12;
  pushMatrix();
  translate(250, 250);
  rotate(PI/2 + angle);
  line(0, 0, 0, 50);
  rectMode(CENTER);
  rect(0, 57, 14, 14);
  line(0, 0, 0, -50);
  rect(0, -57, 14, 14);
  line(0, 0, 50, 0);
  rect(57, 0, 14, 14);
  line(0, 0, -50, 0);
  rect(-57, 0, 14, 14);
  rotate(PI/4)
  line(0, 0, 0, 50);
  rect(0, 57, 14, 14);
  line(0, 0, 0, -50);
  rect(0, -57, 14, 14);
  line(0, 0, 50, 0);
  rect(57, 0, 14, 14);
  line(0, 0, -50, 0);
  rect(-57, 0, 14, 14);
  popMatrix();
  }
}
