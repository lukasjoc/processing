// visualizing bubble sort

float[] arr;
int i = 0;
int j = 0;

void setup() {
  // fullScreen();
  size(840, 600);
  arr = new float[width];
  for(int i = 0; i < arr.length; i++) {
    arr[i] = random(height);
  }
}

void draw() {
  background(0);

  if(i > arr.length) {
    noLoop();
  }

  for(int j = 0; j < arr.length - i - 1; j++) {
    float current = arr[j];
    float next = arr[j+1];
    if (current > next) {
      float temp = arr[j];
      arr[j] = arr[j+1];
      arr[j+1] = temp;
    }
  }

  for(int i = 0; i < arr.length; i++) {
    stroke(255);
    line(i, height, i, height - arr[i]);
  }
}