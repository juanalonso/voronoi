color[] colors;

final int NUM_REGIONS = 64;

ParticleSystem ps;

void setup() {

  size(512, 512);
  colorMode(HSB);
  fill(255);
  noStroke();

  colors = new color[NUM_REGIONS];

  for (int f=0; f<NUM_REGIONS; f++) {
    //    colors[f] = color(int(f*255.0/NUM_REGIONS), 255 * ((f+1) % 2), 255 * (f % 2));
    //    colors[f] = color(int(f*255.0/NUM_REGIONS), 130 * (f % 2), 225 * (f % 2));
    colors[f] = color(147, int(f*255.0/NUM_REGIONS), 225 * (f % 2));
  }

  ps = new ParticleSystem(NUM_REGIONS, false);
}



void draw() {

  ps.update();

  loadPixels();

  for (int y=0; y<height; y++) {
    for (int x=0; x<width; x++) {
      int colOffset = ps.getClosestRegion(x, y);
      pixels[y*width+x] = colors[colOffset];
    }
  }

  /*
   * Still unsure about the fastest way to do it.
  for (int i = 0; i < pixels.length; i++) { 
    int colOffset = ps.getClosestRegion(i%width, i/width);
    pixels[i] = colors[colOffset];
  }
  */

    updatePixels();

  ps.display();

  text("FPS: " + frameRate, 10, 17);
}