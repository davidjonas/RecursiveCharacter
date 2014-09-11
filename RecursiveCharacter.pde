class RecursiveCharacter extends Creature {
  float t;
  float speed;
  
  RecursiveCharacter(float x, float y)
  {
    super(x,y);
  }
  
  void setup() {
    super.setup();
    this.t = 0;
    this.speed = 1.0;
  }
  
  void draw(float x, float y) {
    t += speed;
    noStroke();
    pushMatrix();
    translate(x, y);
    
    for(int i = 0; i < 8; i++) {
      rotate(map(i, 0, 8, 0, TWO_PI));
      drawRows(200, 20, 8);
    }    
    popMatrix();
  }
  
  void drawRows(float alpha, float size, int n) {
    pushMatrix();
    float h = size * 1.5;
    translate(0, -h);
    for(int i = 1; i < n; i++) {
      drawRow(alpha, size, i, (t / 100.0));
      
      size *= 0.75;
      h *= map(sin(t / 100.0), -1, 1, 0.7, 0.8);
      alpha *= 0.6;
      
      translate(0, -h);
      
      
    }
    popMatrix();
  }
  
  void drawRow(float alpha, float size, int n, float t) {
    pushMatrix();
    float w = size * 1.7;
    translate(-w * (n-1)/2.0, 0.0);
    for(int i = 0; i < n; i++) {
      drawSingle(alpha, size, t);
      translate(w, 0);
    }
    popMatrix();
  }
  
  void drawSingle(float alpha, float size, float t) {
    pushMatrix();
    rotate(PI + t);
    fill(255, alpha);
    
    drawShape(0, 0, 0, size);

//    translate(-size/2, -size/2);
//    rect(0, 0, size, size);


    popMatrix();
  }
  
  void drawShape(float x, float y, int b, float d){
    float angle=2*PI/3;
    float angle_rect=PI/2;
    beginShape();
    for(int i=0;i<3;i++){
      vertex(x+d*sin(angle*i+b*angle_rect),y+d*cos(angle*i+b*angle_rect));
    }
    endShape();
  } 
};
