String f = "f", F = "F", u = "u", U = "U", b = "b", B = "B",  d = "d", D = "D", l = "l", L = "L", r = "r", R = "R";



void rotate_cube(){
  String temp = f;
  f = r;
  r = b;
  b = l;
  l = temp;
  temp = F;
  F = R;
  R = B;
  B = L;
  L = temp;
  
  //Face[][] tf = dcube.front;
  //dcube.front = dcube.right;
  //dcube.right = dcube.back;
  //dcube.back = dcube.left;
  //dcube.left = tf;
  
  //println(dcube.front[1][1].c);
  //println(cube_faces.front[1][1].c);
}
