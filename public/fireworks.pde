void setup(){
  size(500, 500);
  strokeWeight(1);
}

void draw() {

}

void mousePressed() {
line(250 - 15, 250, 200, 250);
line(250, 250 - 15, 250, 200);
line(250 + 15, 250, 300, 250);
line(250, 250 + 15, 250, 300);

pushMatrix();
translate(250, 250);
rotate(PI/4);
line(0, 0 + 10, 0, 50);
line(0 + 10, 0, 50, 0);
line(0 - 10, 0, -50, 0);
line(0, 0 - 10, 0, -50);
popMatrix();

pushMatrix()
translate(250, 250);
rotate(PI/8);
line(0, 0 + 30, 0, 50);
line(0 + 30, 0, 50, 0);
line(0 - 30, 0, -50, 0);
line(0, 0 - 30, 0, -50);
popMatrix();

pushMatrix()
translate(250, 250);
rotate(-PI/8);
line(0, 0 + 30, 0, 50);
line(0 + 30, 0, 50, 0);
line(0 - 30, 0, -50, 0);
line(0, 0 - 30, 0, -50);
popMatrix();
}
