PVector pt1 = new PVector(1,-1,1);
PVector pt2 = new PVector(-1, -1, 1);
PVector pt3 = new PVector(-1, 1, 1);
PVector pt4 = new PVector(1,1,1);

PMatrix3D rMat = new PMatrix3D();
PMatrix3D pMat = new PMatrix3D();

float angle = 0;

PVector set3Dto2D( PVector a ){
  
  PVector b = new PVector();
    b.x = a.x * 100 + 200.f;
    b.y = a.y * 100 + 200.f;
    return b;
}

void transformPoints(){
    rMat.reset();
  rMat.rotateY( angle  );
  rMat.mult( pt1, pt1 );
  rMat.mult( pt2, pt2 );
  rMat.mult( pt3, pt3 );
  rMat.mult( pt4, pt4 );
}

void setup() {
  size( 400,400, P3D);
  
  rMat.reset();
  rMat.rotateY( radians(angle)  );
  rMat.mult( pt1, pt1 );
  rMat.mult( pt2, pt2 );
  rMat.mult( pt3, pt3 );
  rMat.mult( pt4, pt4 );
  
} 

void draw() { 
  background(255);
  stroke(128,0,0);
  int s = 10; //scale
  int t = 20; //translate
  line(pt1.x*s+t, pt1.y*s+t, pt2.x*s+t, pt2.y*s+t );
  line(pt2.x*s+t, pt2.y*s+t, pt3.x*s+t, pt3.y*s+t );
  line(pt3.x*s+t, pt3.y*s+t, pt4.x*s+t, pt4.y*s+t );
  line(pt4.x*s+t, pt4.y*s+t, pt1.x*s+t, pt1.y*s+t );
  line(set3Dto2D(pt1).x, set3Dto2D(pt1).y, set3Dto2D(pt2).x, set3Dto2D(pt2).y);
  line(set3Dto2D(pt2).x, set3Dto2D(pt2).y, set3Dto2D(pt3).x, set3Dto2D(pt3).y);
  line(set3Dto2D(pt3).x, set3Dto2D(pt3).y, set3Dto2D(pt4).x, set3Dto2D(pt4).y);
  line(set3Dto2D(pt4).x, set3Dto2D(pt4).y, set3Dto2D(pt1).x, set3Dto2D(pt1).y);
 
}

void keyPressed(){
  if(key == 'a') {
    angle = 0.1;
    transformPoints();
  }
  if(key == 's') {
    angle = -0.1;
    transformPoints();
  }
  if(angle > 360) angle -= 360;
  if(angle < -360) angle = 360;
}
