import com.hamoid.*; //<>//
import processing.sound.*;

// BEGIN config 

int fps = 30;
String soundFile = "data/song.wav";
String videoFile = "data/export.mp4";

int margin = 4;
int antiAlias = 2;
boolean doMask = true;
int colorMask = 0xFF4444FF;

boolean doBlur = true;
int blurStrength = 2;

boolean drawCursor = true;
color cursorColor = color(255, 128, 64);
color lineColor = color(255, 255, 255);
color backgroundColor = color(0, 0, 0);

// END config

Waveform wf;
SoundFile sf;
VideoExport vx;

int aframes, dframes;
int hh, hhm, hq, pc;
float x, y, oy, sy;

void setup() {

  // Set video size
  size(1280, 64, P2D);
  
  // Set frame rate
  frameRate(fps);
  
  smooth(antiAlias);

  hh = height / 2;
  hhm = hh - margin;
  hq = hh / 2;
  pc = width * height - 1;
  
  sf = new SoundFile(this, soundFile);
  sf.play();

  wf = new Waveform(this, 1);
  wf.input(sf);
  
  background(backgroundColor);

  vx = new VideoExport(this, videoFile);
  vx.startMovie();

}      

void update() {

  wf.analyze();
  y = map(wf.data[0], -1, 1, -hhm, hhm);
  
  if (y == oy) sy++;
  else sy = 0;
    
}

void draw() {

  update();

  stroke(backgroundColor);
  line(x, 0, x, height);

  stroke(lineColor);
  line(x-1, hh, x, y + hh);
  oy = y;
  x++;
  
  if(x > width) {
    x = 0;
    if(doMask) {
      loadPixels();
      for(int i = 0; i < pc; i++) pixels[i] &= colorMask;
      updatePixels();
    }
    if(doBlur) filter(BLUR, blurStrength);
  }
  
  if(drawCursor) {
    stroke(cursorColor);
    line(x + 1, 0, x + 1, height);
  }
  
  vx.saveFrame();

 if((keyPressed && key == ESC) || sy == width) {
    noLoop();
    vx.endMovie();
  }

}
