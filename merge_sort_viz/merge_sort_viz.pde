import java.util.Arrays;

float[] mergesort(float[] arr, int depth) {
  int arrLen = arr.length;
  if (arrLen <= 1) return arr;
  depth--;
  if(depth < 1) return arr;
  int mid = arrLen / 2;
  float[] left = Arrays.copyOfRange(arr, 0, mid);
  float[] right = Arrays.copyOfRange(arr, mid, arr.length);
  left = mergesort(left, depth);
  right = mergesort(right, depth);
  int j = 0, k = 0;
  for (int i = 0; i < arr.length; i++) {
    if (j >= left.length) {
      arr[i] = right[k];
      k++;
      continue;
    } else if (k >= right.length) {
      arr[i] = left[j];
      j++;
      continue;
    } else if (left[j] > right[k]) {
      arr[i] = right[k];
      k++;
    } else {
      arr[i] = left[j];
      j++ ;
    }
  }
  return arr;
}

float[] arr;
int depth = 1;
void setup() {
  size(840, 600);
  arr = new float[width];
  for(int i = 0; i < arr.length; i++) {
    arr[i] = random(height);
  }
  frameRate(5);
}

void draw() {
  background(0);
  arr = mergesort(arr, depth++);
  if (depth >= arr.length) {
    noLoop();
  }
  for(int i = 0; i < arr.length; i++) {
    int lineColor = color(arr[i], height, height);
    stroke(lineColor);
    fill(lineColor);
    float location = map(i, 0, arr.length, 0, width);
    rect(location, height - arr[i], width/500, height);
  }
}
