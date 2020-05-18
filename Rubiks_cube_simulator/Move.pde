class Move{
  float angle = 0;
  int x = 0;
  int y = 0;
  int z = 0;
  int dir;
  boolean animating = true;
  //boolean finished = false;
  Move(int x, int y, int z, int dir){
    this.x = x;
    this.y = y;
    this.z = z;
    this.dir = dir;
  }
  
  void start(){
    animating = true;
  }
  
  void update(){
    if(animating){
      angle += dir*rot_speed;
      if(abs(angle) > HALF_PI){
        angle = 0;//HALF_PI;
        animating = false;
        turn(x, y, z, dir);
        //finished = true;
      }
    }
  }
  
}
