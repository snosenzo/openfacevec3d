import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
import peasy.test.*;



Person[] ppl;
int ipl = 20;
float[] avVec = new float[3];
int sz = width/ipl;
PeasyCam cam;


void setup(){
  
  fullScreen(P3D);
  cam = new PeasyCam(this, 220);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
  cam.setSuppressRollRotationMode();
  //cam.setYawRotationMode();
  //cam.setPitchRotationMode();
  cam.setWheelScale(.2);
  background(0);
  stroke(255);
  String[] labelsRaw = loadStrings("labels.csv"); 
  String[][] labels = new String[labelsRaw.length][];
  for(int i = 0; i < labelsRaw.length; i++){
    String[] s = split(labelsRaw[i], ',');
    labels[i] = s;
  }
  Table dat;
  dat = loadTable("reps.csv","csv");
  ppl = new Person[dat.getRowCount()];
 
  float[] sums = new float[dat.getRowCount()];
  for(int i = 0; i < dat.getRowCount();i++){
    float[] rowarr = new float[dat.getColumnCount()];
    for(int j = 0; j < dat.getColumnCount(); j++){
      //print(dat.getFloat(i, j)+", ");
      rowarr[j] = dat.getFloat(i,j);
    }
    Person p = new Person(labels[i][1], rowarr, int(labels[i][0]));
    ppl[i] = p;
    
  }
  println("people loaded");
 
  println("average Vector: ");
  for(int i = 0; i < avVec.length; i++){
    print(avVec[i]+", ");
  }
  for(Person p:ppl){
    p.diff(avVec);
  }
  //sortPeople(ppl, 0, ppl.length-1);
  println("Sorting done");
  
  
}  
int r = 130;
int counter = 0;
void draw(){  
  background(0);
  
  sphere(10);
  
  
  strokeWeight(5);
  for(int i = 0; i < 1000; i++){
    Person p = ppl[(i+counter)%ppl.length];
    float x = map(p.vec[0], -1, 1, -r, r);
    float y = map(p.vec[1], -1, 1, -r, r);
    float z = map(p.vec[2], -1, 1, -r, r);
    p.display(x, y, z, 5);
  }
  counter+=3;
  
  
  
  
    
}
//peasycam test/example
/*
void draw(){
  rotateX(-.5);
  rotateY(-.5);
  background(0);
  fill(255,0,0);
  box(20);
  //sphere(20);
  pushMatrix();
  translate(0,0,20);
  fill(0,0,255);
  box(5);
  popMatrix();

}
*/