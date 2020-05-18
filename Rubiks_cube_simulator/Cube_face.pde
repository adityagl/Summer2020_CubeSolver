//int num = 0;

class Cube_face{
  Face[][] up = new Face[dim][dim], down = new Face[dim][dim], left = new Face[dim][dim], right = new Face[dim][dim], front = new Face[dim][dim], back = new Face[dim][dim];
  
  void update(Cubie[] cube){
    for(int i = 0; i < cube.length; i++){
      Cubie qb = cube[i];
      if(qb.z == 1){
        for(Face f: cube[i].faces){
          if(f.normal.z == 1){
            front[qb.x+1][qb.y+1] = f;
          }
        }
      }
      if(qb.z == -1){
        for(Face f: cube[i].faces){
          if(f.normal.z == -1){
            back[qb.x+1][qb.y+1] = f;
          }
        }
      }
      if(qb.x == 1){
        for(Face f: cube[i].faces){
          if(f.normal.x == 1){
            left[qb.y+1][qb.z+1] = f;
          }
        }
      }
      if(qb.x == -1){
        for(Face f: cube[i].faces){
          if(f.normal.x == -1){
            right[qb.y+1][qb.z+1] = f;
          }
        }
      }
      if(qb.y == 1){
        for(Face f: cube[i].faces){
          if(f.normal.y == 1){
            up[qb.x+1][qb.z+1] = f;
          }
        }
      }
      if(qb.y == -1){
        for(Face f: cube[i].faces){
          if(f.normal.y == -1){
            down[qb.x+1][qb.z+1] = f;
          }
        }
      }
    }
    //for(int i = 0; i < dim; i++){
    //  for(int j = 0; j < dim; j++){
    //    println(up[i][j].c);
    //  }
    //}
    //color c = up[1][1].c;
    //if(up[1][0].c == c && up[1][2].c == c && up[0][1].c == c && up[2][1].c == c){
    //  println(num);
    //  num++;
    //}
  }
  boolean white_cross = false;
  void check_white_cross(){
    color c = up[1][1].c;
    if(up[1][0].c == c && up[1][2].c == c && up[0][1].c == c && up[2][1].c == c){
      white_cross = true;
    }
  }

  void solve(){
    if(white_cross){
      
    }
    else{
      
      check_white_cross();
    }
  
}
  
}
