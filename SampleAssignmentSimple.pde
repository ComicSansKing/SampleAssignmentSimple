//GOAL: make a 'traffic light' simulator. For now, just have the light 
// changing according to time. You may want to investigate the millis()
// function at processing.org/reference.

//global variables
int colour;
int state;
int timeToWaitG, timeToWaitY, timeToWaitR;
int lastTimeLightChanged;

void setup() {
  size(600, 600);
  colour = 255;
  state = 1;
  timeToWaitG = 3000;
  timeToWaitY = 500;
  timeToWaitR = 3000;
  lastTimeLightChanged = millis();
}

void draw() {
  background(255);
  drawOutlineOfLights();
  checkIfLightSwitched();
  displayCorrectLight();
}


void checkIfLightSwitched() {
  if (state == 1) { //green
    if (millis() > lastTimeLightChanged + timeToWaitG) {
      state = 2;
    }
  } 
  else  if (state == 2) { //yellow
    if (millis() > lastTimeLightChanged + timeToWaitY) {
      state = 3;
    }
  }
  else if (state == 3) { //red
    if (millis() > lastTimeLightChanged + timeToWaitR) {
      state = 1;
    }
  }
}


void displayCorrectLight() {
  if (state == 1) {
    drawGreenLight();
  } else if (state == 2) {
    drawYellowLight();
  } else if (state == 3) {
    drawRedLight();
  }
}

void drawRedLight() {
  fill(colour, 0, 0);
  ellipse(width/2, height/2 - 65, 50, 50); //top
}

void drawYellowLight() {
  fill(colour, colour, 0);
  ellipse(width/2, height/2, 50, 50); //middle
}

void drawGreenLight() {
  fill(0, colour, 0);
  ellipse(width/2, height/2 + 65, 50, 50); //bottom
}

void drawOutlineOfLights() {
  //box
  rectMode(CENTER);
  fill(0);
  rect(width/2, height/2, 75, 200, 10);
}