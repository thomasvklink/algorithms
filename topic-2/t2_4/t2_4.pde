/* topic: random function, array of objects exercise 2.4
Made by: Thomas van Klink & Tristan van Marle
For Algorithms in Creative Technology
4-5-2021*/

ArrayList<FloatDict> circles ;
void setup() {
  size(640, 360);
  background(255);

  circles = new ArrayList<FloatDict>();
  while (circles.size()<45) {

    FloatDict circle = new FloatDict();
    circle.set("xPos", random(width));
    circle.set("yPos", random(height));
    circle.set("r", 32);

    boolean overlapping = false;
    for (int j=0; j < circles.size(); j++) {
      FloatDict other = circles.get(j);
      float distance = dist(circle.get("xPos"), circle.get("yPos"), other.get("xPos"), other.get("yPos"));
      if (distance < circle.get("r") + other.get("r")) {
        overlapping = true;
      }
    }

    if (!overlapping) {
      circles.add(circle);
    }
  }

  for (FloatDict c : circles) {
    fill(255, 0, 0);
    noStroke();
    ellipse(c.get("xPos"), c.get("yPos"), c.get("r")*2, c.get("r")*2);
  }
}
