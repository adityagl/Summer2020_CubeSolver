class Face{
  PVector normal;
  color c;
  
  Face(PVector normal, color c){
    this.normal = normal;
    this.c = c;
  }
  
  void turn(float angle, int x, int y, int z){
    PVector v2 = new PVector();
    if(z == 1){
      v2.x = round(normal.x*cos(angle)-normal.y*sin(angle));
      v2.y = round(normal.x*sin(angle)+normal.y*cos(angle));
      v2.z = round(normal.z);
    }
    if(y == 1){
      v2.x = round(normal.x*cos(angle)-normal.z*sin(angle));
      v2.z = round(normal.x*sin(angle)+normal.z*cos(angle));
      v2.y = round(normal.y);
    }
    if(x == 1){
      v2.y = round(normal.y*cos(angle)-normal.z*sin(angle));
      v2.z = round(normal.y*sin(angle)+normal.z*cos(angle));
      v2.x = round(normal.x);
    }
    normal = v2;
    
  }
  
  void show(){
    pushMatrix();
    fill(c);
    noStroke();
    rectMode(CENTER);
    translate(normal.x/2, normal.y/2, normal.z/2);
    //rotate(HALF_PI, normal.x, normal.y, normal.z);
    if(abs(normal.y) > 0) {
      rotateX(HALF_PI);
    }
    else if(abs(normal.x)>0){
      rotateY(HALF_PI);
    }
    square(0, 0, 1);
    popMatrix();
  }
}
