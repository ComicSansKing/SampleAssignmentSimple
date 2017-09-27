//GOAL: make a 'traffic light' simulator. For now, just have the light 
// changing according to time. You may want to investigate the millis()
// function at processing.org/reference.

//global variables
int colour;
int timeToWaitG, timeToWaitY, timeToWaitR;

void setup() {
  size(600, 600);
  colour = 255;
  timeToWaitG = 2000;
  timeToWaitY = 4000;
  timeToWaitR = 6000;
}

void draw() {
  background(255);
  drawOutlineOfLights();
}

void drawOutlineOfLights() {
  //box
  rectMode(CENTER);
  fill(0);
  rect(width/2, height/2, 75, 200, 10);

  //lights
  if (millis() >= timeToWaitR) {
    fill(colour, 0, 0);
    ellipse(width/2, height/2 - 65, 50, 50); //top
  } 
  else if (millis() >= timeToWaitY) {
    fill(colour, colour, 0);
    ellipse(width/2, height/2, 50, 50); //middle
  } 
  else if (millis() >= timeToWaitG) {
    fill(0, colour, 0);
    ellipse(width/2, height/2 + 65, 50, 50); //bottom
  }
  else if (millis() > timeToWaitR) {

    timeToWaitG += 2000;
    timeToWaitY += 2000;
    timeToWaitR += 2000;
    return; 
  }
}
