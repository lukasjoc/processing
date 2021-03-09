import java.util.Arrays;

float[] arr;

float[] mergesort(float[] arr) {
  int arrLen = arr.length;
  if (arrLen <= 1) return arr;
  int mid = arrLen / 2;
  float[] left = Arrays.copyOfRange(arr, 0, mid);
  float[] right = Arrays.copyOfRange(arr, mid, arr.length);
  left = mergesort(left);
  right = mergesort(right);
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

void setup() {
  size(840, 600);
  arr = new float[width];
  for(int i = 0; i < arr.length; i++) {
    arr[i] = random(height);
  }
  arr = mergesort(arr);
}

void draw() {
  background(0);
  for(int i = 0; i < arr.length; i++) {
    stroke(255);
    line(i, height, i, height - arr[i]);
  }
}
