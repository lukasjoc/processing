import java.util.Arrays;

// counter just like the counting sort
void countByLSE(int[] arr, int n, int expr ) {
  int output[] = new int[n];
  int i;
  int count[] = new int[10];
  Arrays.fill(count, 0);
  for (i = 0; i < n; i++) count[(arr[i] / expr) % 10]++;
  for (i = 1; i < 10; i++) count[i] += count[i - 1];
  for (i = n - 1; i >= 0; i--) {
    output[count[(arr[i] / expr) % 10] - 1] = arr[i];
    count[(arr[i] / expr) % 10]--;
  }
  for (i = 0; i < n; i++)  arr[i] = output[i];
}

// the radix sort
void radixSort(int[] arr) {
  int m = arr[0];
  for (int i = 1; i < arr.length; i++)
    if (arr[i] > m) m = arr[i];
  for (int exp = 1; m / exp > 0; exp *= 10) countByLSE(arr, arr.length, exp);
}

int[] arr;
void setup() {
  size(840, 600);
  arr = new int[width];
  for(int i = 0; i < arr.length; i++) {
    arr[i] = (int) random(height);
  }
  radixSort(arr);
}

void draw() {
  background(0);

  for(int i = 0; i < arr.length; i++) {
    int lineColor = color(arr[i], height, height);
    stroke(lineColor);
    fill(lineColor);
    float location = map(i, 0, arr.length, 0, width);
    rect(location, height - arr[i], width/500, height);
  }
}
