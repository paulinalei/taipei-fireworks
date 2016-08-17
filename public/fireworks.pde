void setup(){
  size(500, 500);
  strokeWeight(1);
}

void draw() {

}

void mousePressed() {
line(mouseX - 15, mouseY, mouseX - 50, mouseY);
line(mouseX, mouseY - 15, mouseX, mouseY - 50);
line(mouseX + 15, mouseY, mouseX + 50, mouseY);
line(mouseX, mouseY + 15, mouseX, mouseY + 50);

pushMatrix();
translate(mouseX, mouseY);
rotate(PI/4);
line(0, 0 + 10, 0, 50);
line(0 + 10, 0, 50, 0);
line(0 - 10, 0, -50, 0);
line(0, 0 - 10, 0, -50);
popMatrix();

pushMatrix()
translate(mouseX, mouseY);
rotate(PI/8);
line(0, 0 + 30, 0, 50);
line(0 + 30, 0, 50, 0);
line(0 - 30, 0, -50, 0);
line(0, 0 - 30, 0, -50);
popMatrix();

pushMatrix()
translate(mouseX, mouseY);
rotate(-PI/8);
line(0, 0 + 30, 0, 50);
line(0 + 30, 0, 50, 0);
line(0 - 30, 0, -50, 0);
line(0, 0 - 30, 0, -50);
popMatrix();
}
