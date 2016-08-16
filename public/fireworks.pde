int frame = 0;
void setup() {
  size(500, 500);
}

void draw() {
  if (frame > 20) {
    background(204); // to light gray and draw lines
  } else {
    if (mousePressed == true) {
      x = mouseX;
      y = mouseY;
      ellipse(x, y, 50, 50);
      frame++;
    }
  }
}

void mousePressed() {
}
