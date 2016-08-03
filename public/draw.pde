void setup() {
  size(500, 500);
  background(100);
  stroke(0);
}

void draw() {
  float angle = 0;
  if (keyPressed == true) {
    if ((key >= 32) && (key <= 126)) {
      angle = (key - 32) * 3;
    }
  }

  arc(50, 50, 66, 66, 0, radians(angle));
}
