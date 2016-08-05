void setup() {
  size(500, 500);
  background(240);

}

void draw() {
  //put a fill for the background color for the circle
  strokeWeight(5);
  ellipse(250, 250, 100, 100);
  line(250, 200, 250, 300);
  line(0, 0, 0, 100);
  pushMatrix();
  translate(200, 250);
  rotate(-PI/2);
  line(0, 0, 0, 100);
  popMatrix();
}
