class Person{
  PVector xbase = new PVector(1, 0, 0);
  PVector ybase = new PVector(0, 1, 0);
  PVector zbase = new PVector(0, 0, 1);

  float[] vec = new float[3];
  float dotted;
  PImage img;
  float[] dif = new float[3];
  int Id;
  String filename;
  boolean imageloaded = false;
  
  Person(String fname, float[] v, int id){
    filename = fname;
   
    vec = v;
    dotted = 0;
    Id = id;
    
  }
  
  float dotVec(float[] a){
    float sum = 0;
    for(int i = 0; i < a.length; i++){
      sum+=a[i]*a[i];
    }
    return sum;
  }
  
  void display(float x, float y, float z, float size){
    //image(img, x, y, size, size);
    if(imageloaded==false){
      imageloaded = true;
      img = loadImage(filename);
      //println("imageloaded");
    }
    strokeWeight(2);
    
    float s = size/2.0;
    
    
    pushMatrix();
    int rxmult = -1;
    if(z < 0) rxmult = rxmult * -1;
    float rx = PI/2-rxmult*PVector.angleBetween(ybase, new PVector(0, y, z));
    
    float ry = PVector.angleBetween(zbase, new PVector(x, 0, z));
    if(x < 0) ry = ry * -1;
    //float rz = map(z, -100, 100, PI/2, -PI/2);
    
    translate(x, y, z);
    //rotateX(rx);
    rotateY(ry);
    noStroke();
    beginShape();
    texture(img);
    vertex(-s, -s, 0, 0, 0);
    vertex(s, -s, 0, 96, 0);
    vertex(s, s, 0, 96, 96);
    vertex(-s, s, 0, 0, 96);
    endShape();
    
    /*
    strokeWeight(3);
    stroke(255);
    point(0, 0, 0);
    */
    //String[] s = split(filename,"/");
    //fill(255);
    popMatrix();
   
  }
  
  float sum(float[] a){
    float sum = 0;
    for(int i = 0; i < a.length; i++){
      sum+=a[i];
    }
    return sum;
  }
  void diff(float[] avVec){
    for(int i = 0; i < avVec.length; i++){
      dif[i] = avVec[i]-vec[i];
    }
    dotted = this.dotVec(dif);
  }
      
    
}
