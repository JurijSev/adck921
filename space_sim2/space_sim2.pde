star[] stars;
float count, shakeCount, angle, speed, metre;
//cockpit
boolean shake,showCockpit;
PImage img, metal;
PVector shaking;
color indicator,indicator2;


//package com.tutorialspoint;
import java.lang.*;

void setup() {
  size(1000, 1000, P3D);
  stars = new star[1000];
  img = loadImage("cockpit.png");
  metal = loadImage("metal.jpg");
  shake = false;
  shaking = new PVector(0, 0);
  angle = 45;
  speed = 30;
  showCockpit=true;
  indicator = color(0, 0, 255);
  for (int i=0; i<stars.length; i++) {
    stars[i] = new star(speed);
    if (count%2==0) {
      stars[i].lineLight = true;
    }
  }
}

void draw() {
  //noCursor();
  background(0);
  translate(width/2, height/2);

  for (int i=0; i<stars.length; i++) {
    noStroke();
    metre = stars[i].getT();
    stars[i].display();
    stars[i].move();
    stars[i].returnPos();
  }

  if(mousePressed){
    if(showCockpit){
      showCockpit = false;
    }else{
      showCockpit = true;
    }
  }
  if(showCockpit){
  
  if (metre<=3 && count>=random(10)) {
    shake=true;
  } else if (metre<7 && count>=random(200)) {
    shake=true;
  } else if (count>=random(200, 400)) {
    shake=true;
  }
  if (shake==false) {
    image(img, -width/2, -height/2, width, height);
    count++;
    shaking.x = 0;
    shaking.y = 0;
  } else {
    shaking.x = random(-10, 10);
    shaking.y = random(-10, 10);
    image(img, -width/2+random(-10, 10), -height/2+random(-10, 10), width, height);
    shakeCount++;
    if (shakeCount>=10) {
      shake = false;
      count=0;
      shakeCount = 0;
    }
  }

  cockpit(shaking.x, shaking.y);
  leaver(shaking.x, shaking.y);
  }
}

void cockpit(float x, float y) {
  
  fill(indicator2);
  rectMode(CENTER);
  rect(0+x, height/14+y, 75, 25);
  if (shake) {
    indicator2 = color(255, 0, 0);
    fill(255);
    textAlign(CENTER);
    textSize(17.5);
    text("DANGER",0+x,height*1.1/14+y);
  } else {
    indicator2 = color(0);
  }

  beginShape();
  beginShape();
  fill(0, 0, 255, 100);
  vertex(width/16+x, height*1.2/5+y);
  vertex(width/16+x, height/8+y);
  vertex(width*1.05/12+x, height/8+y);
  vertex(width*1.05/12+x, height*1.1/7+y);
  endShape();

  if (shake) {
    indicator = color(255, 0, 0);
  } else {
    indicator = color(0);
  }
  beginShape();
  fill(indicator);
  vertex(width/16+2+x, height*1.2/5-10+y);
  vertex(width/16+2+x, height/8+2+y);
  vertex(width*1.05/12-1+x, height/8+2+y);
  vertex(width*1.05/12-1+x, height*1.1/7-1+y);
  endShape();
  endShape();

  speedometre(x,y);
  if((frameCount/60)%2==0){
    fill(255);
    circle(width/7+x, height*0.975/5+y,5);
  }
  
}


void leaver(float x, float y) {
  pushMatrix();
  translate(width*1.05/4+x, height*1.3/4+y, 20);
  fill(50);
  stroke(0);
  strokeWeight(1);
  pushMatrix();
  pushMatrix();
  rotateX(40);
  box(50, 10, 50);
  popMatrix();
  rotateX(radians(-angle));
  translate(0, -50);
  fill(100);
  box(10, 100, 10);
  pushMatrix();
  translate(0, -60);
  noStroke();
  fill(75);
  sphere(20);
  stroke(0);
  if (keyPressed) {
    if (key == 's' || key =='S' ||keyCode == DOWN ) {
      if (angle<=75) {
        angle+=1;
      }
    }
    if (key == 'w'|| key == 'W'||keyCode ==UP) {
      if (angle>=25) {
        angle--;
      }
    }
  }

  popMatrix();
  popMatrix();
  popMatrix();
}


void speedometre(float x, float y) {

  pushMatrix();
  translate(width/8, 0);
  rectMode(CORNER);
  fill(0, 0, 255);
  rect(-width/4+x, height*1.1/8+y, width/22, height/5);
  
  fill(0);

  pushMatrix();
  //rotate(radians(180));
  fill(#F5A207);
  //translate(width*0.91/2,-height*1.351/2);
  noStroke();
  rect(-width/4+x, height*1.01/3+y, width/22, -((height/5)/(metre)));
  text(nf((101)-(metre)), -width*1.1/4+x, height*1.01/3+y-((height/5)/(metre)));
  fill(0);
  triangle(-width/4+x, height*1.02/3+y, -width*1.1/5+x, height*1.02/3+y, -width/4+x, height*1.01/3+y-((height/5)));
  popMatrix();
  popMatrix();
}


//void axis(){
//  stroke(255,0,0);
//  line(0,-height/2,0,height);
//  line(-width/2,0,width/2,0);
//  stroke(0);
//  fill(0,255,0);
//  circle(0,0,5);
//}
