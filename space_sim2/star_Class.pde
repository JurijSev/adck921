
class star {
  boolean light = false,lineLight = false;
  PVector pos, speed, ratio, origin;
  float x, y, ratioX, ratioY, size, origSize, t,alpha, r,g,b;
  color colour, colour2;

  star(float u) {
    x = random(-width/2-100, width/2+100);
    y = random(-height/2-100, height/2+100);
    t = u;
    alpha = 100;

    origin = new PVector(0, 0);
    pos = new PVector(x, y);
    ratio = new PVector(x-origin.x, y-origin.y);
    
    size =2;
    origSize = 2;
    
    r = random(255);
    g = random(255);
    b = random(255);
    colour = color(r-100,g-100,b-100);
    colour2 = color(r,g,b);
  }

  void display() {
    
    fill(colour,alpha*0.95);
    noStroke();
    circle(pos.x, pos.y, size);
    fill(255,alpha*0.99);
    circle(pos.x, pos.y, size/2);
    lightSpeed();
    if(light==true && lineLight){
      fill(colour,alpha/t*2);
      circle(pos.x, pos.y, size/4);
      strokeWeight(size/2);
      stroke(255,alpha/2/(t*2));
      line(pos.x,pos.y,-10,0,0,-1);
    }
    
    if(size<15){
      size+=0.5;
    }
    if(dist(pos.x,pos.y,0,0)<200){
      alpha++;
    }
    text(t,width/2-20,height/2-20);
  }

  void move() {
    if (keyPressed) {
      if (keyCode==UP || key=='W' || key=='w') {
        if(t>1){
          t--;
        }if(t>50){
          t-=10;
        }
        if(size<=0.2){
          size+=0.2;
        }
        
        
        //if(t>1){
        //  t-=pow(t,0.001);
        //}
        
        
      }
      if (keyCode==DOWN || key =='S' || key == 's') {
        if(t<500 && t>10){
          t+=5;
        }else if(t<=10){
          t++;
        }
      }
    }
    if(ratio.x>30 && ratio.x<-30 ||ratio.y>30 && ratio.y<-30){
      pos.x+=ratio.y;
      pos.y+=ratio.y;
    }else{
      pos.x+=ratio.x/(t);
      pos.y+=ratio.y/(t);
    }
  }

  void returnPos() {
    if (pos.x<-width/2 || pos.x>width/2 || pos.y<-height/2 || pos.y>height/2) {
      pos.x = x;
      pos.y = y;
      size = origSize;
    }
  }
  
  void lightSpeed(){
    if(t<=7){
      light = true;
    }else{
      light = false;
      //lineLight = false;
    }
  }
  
  float getT(){
    return t;
  }
}
