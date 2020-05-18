class Cubie{
  PMatrix3D matrix;
  int x;
  int y;
  int z;
  float len;
  color c;
  boolean highlight = false;
  Face[] faces = new Face[6];
  
  Cubie(PMatrix3D m, int x, int y, int z){
    matrix = m;
    this.x = x;
    this.y = y;
    this.z = z;
    //len = len_;
    c = color(255);
    
    faces[0] = new Face(new PVector(0, 0, -1), color(0, 0, 255));
    faces[1] = new Face(new PVector(0, 0, 1), color(0, 255, 0));
    faces[2] = new Face(new PVector(0, 1, 0), color(255, 255, 255));
    faces[3] = new Face(new PVector(0, -1, 0), color(255, 255, 0));
    faces[4] = new Face(new PVector(1, 0, 0), color(255, 150, 0));
    faces[5] = new Face(new PVector(-1, 0, 0), color(255, 0, 0));
    
    
  }
  
  void turnFaces(int x, int y, int z, int dir){
    for(Face f : faces){
      f.turn(dir*HALF_PI, x, y, z);
    }
  }
  
  void update(int x, int y, int z){
    matrix.reset();
    matrix.translate(x, y, z);
    this.x = x;
    this.y = y;
    this.z = z;
  }
  
  void show(){
    noFill();
    stroke(0);
    strokeWeight(0.1);
    pushMatrix();
    
    applyMatrix(matrix);
    box(1);
    for(Face f : faces){
      f.show();
    }
    popMatrix();
  }
  
}
