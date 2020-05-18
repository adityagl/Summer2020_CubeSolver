import peasy.*;

PeasyCam cam;

int  dim = 3;
int ran_mov = 30;
Cubie[] cube = new Cubie[dim*dim*dim];
Move move;
float rot_speed = 0.2;

String[] allMoves = {"f", "b", "u", "d", "l", "r"};
String sequence = "";

void setup() {
  size(600, 600, P3D);
  cam = new PeasyCam(this, 400);
  int index = 0;
  for (int x = -1; x <= 1; x++) {
    for (int y = -1; y <= 1; y++) {
      for (int z = -1; z <= 1; z++) {
        PMatrix3D matrix = new PMatrix3D();
        matrix.translate(x, y, z);
        cube[index] = new Cubie(matrix, x, y, z);
        index++;
      }
    }
  }
  move = new Move(-2, -2, -2, 0);
  for(int i = 0; i < ran_mov; i++){
    int r = int(random(allMoves.length));
    sequence += allMoves[r];
  }
  println(sequence);
  for(int i = sequence.length()-1; i >= 0; i--){
    sequence += (""+sequence.charAt(i)).toUpperCase();
  }
}

int index = 0;

void turn(int x, int y, int z, int dir) { //-2 represents not along that axis
  for (int i = 0; i < cube.length; i++) {
    Cubie qb = cube[i];
    if (qb.z == z) {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir*HALF_PI);
      matrix.translate(qb.x, qb.y); 
      qb.turnFaces(0, 0, 1, dir);
      qb.update(round(matrix.m02), round(matrix.m12), round(qb.z));
    }
    if (qb.x == x) {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir*HALF_PI);
      matrix.translate(qb.y, qb.z); 
      qb.turnFaces(1, 0, 0, dir);
      qb.update(round(qb.x), round(matrix.m02), round(matrix.m12));
    }
    if (qb.y == y) {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir*HALF_PI);
      matrix.translate(qb.x, qb.z); 
      qb.turnFaces(0, 1, 0, dir);
      qb.update(round(matrix.m02), round(qb.y), round(matrix.m12));
    }
  }
}

void keyPressed() {
  applyMove(key);
}
void applyMove(char mov){
  //switch(key)
  switch(mov)
  {
    case 'B':
      move = new Move(-2, -2, -1, 1);
      //turn(-2, -2, -1, 1);
      break;
    case 'f':
      move = new Move(-2, -2, 1, 1);
      //turn(-2, -2, 1, 1);
      break;
    case 'd':
      move = new Move(-2, -1, -2, 1);
      //turn(-2, -1, -2, 1);
      break;
      
    case 'U':
      move = new Move(-2, 1, -2, 1);
      //turn(-2, 1, -2, 1);
      break;
    case 'R':
      move = new Move(-1, -2, -2, 1);
      //turn(-1, -2, -2, 1);
      break;
    case 'l':
      move = new Move(1, -2, -2, 1);
      //turn(1, -2, -2, 1);
      break;
      
    case 'b':
      move = new Move(-2, -2, -1, -1);
      //turn(-2, -2, -1, -1);
      break;
    case 'F':
      move = new Move(-2, -2, 1, -1);
      //turn(-2, -2, 1, -1);
      break;
    case 'D':
      move = new Move(-2, -1, -2, -1);
      //turn(-2, -1, -2, -1);
      break;
      
    case 'u':
      move = new Move(-2, 1, -2, -1);
      //turn(-2, 1, -2, -1);
      break;
    case 'r':
      move = new Move(-1, -2, -2, -1);
      //turn(-1, -2, -2, -1);
      break;
    case 'L':
      move = new Move(1, -2, -2, -1);
      //turn(1, -2, -2, -1);
      break;
  }
}
Cube_face cube_faces = new Cube_face();
int counter = 0;
Cube_face dcube = cube_faces;
void draw() {
  background(51);
  rotateX(-0.5);
  rotateY(0.4);
  rotateZ(0.1);
  
  move.update();
  
  if(frameCount %15 == 0){
    if(counter < sequence.length()){
      char mov = sequence.charAt(counter);
      applyMove(mov);
      counter++;
      //rotate_cube();
    }
  }
  scale(50);
  cube_faces.update(cube);
  
  for (int i = 0; i < cube.length; i++) {
    push();
    if(abs(cube[i].z) > 0 && cube[i].z == move.z){
      rotateZ(move.angle);
    } 
    else if(abs(cube[i].x) > 0 && cube[i].x == move.x){
      rotateX(move.angle);
    } 
    else if(abs(cube[i].y) > 0 && cube[i].y == move.y){
      rotateY(-move.angle);
    }
    cube[i].show();
    pop();
  }
}
