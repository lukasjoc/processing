
// counting sort
int[] countingSort(int[] arr, int n) {
  int[] out = new int[n + 1];
  int max = arr[0];
  for (int i = 1; i < n; i++) {
    if (arr[i] > max) max = arr[i];
  }

  int[] count = new int[max + 1];
  for (int i = 0; i < max; ++i) count[i] = 0;
  for (int i = 0; i < n; i++) count[arr[i]]++;
  for (int i = 1; i <= max; i++) count[i] += count[i - 1];
  for (int i = n - 1; i >= 0; i--) { out[count[arr[i]] - 1] = arr[i]; count[arr[i]]--; }
  for (int i = 0; i < n; i++) arr[i] = out[i];
  return arr;
}

int[] arr;
//int[] out;
//int[] count;
//int n;
//int max;
void setup() {
  size(840, 600);
  arr = new int[width];
  for(int i = 0; i < arr.length; i++) {
    arr[i] = (int) random(height);
  }

  //n = arr.length;

  // find max value of arr
  //max = arr[0];
  //for (int i = 1; i < arr.length; i++) {
  //  if (arr[i] > max) max = arr[i];
  //}

  // setup count
  //count = new int[n + 1];
  //for (int i = 0; i < n; ++i) count[i] = 0;
  //frameRate(1);

  arr = countingSort(arr, arr.length);
}

void draw() {
  background(0);
  //count = new int[n + 1];
  //for (int i = 0; i < n; ++i) count[i] = 0;
  //for (int i = 0; i < n; i++) count[arr[i]]++;
  //for (int i = 1; i <= max; i++) count[i] += count[i - 1];
  //for (int i = n - 1; i >= 0; i--) { out[count[arr[i]] - 1] = arr[i]; count[arr[i]]--; }
  //for (int i = 0; i < n; i++) arr[i] = out[i];

  for(int i = 0; i < arr.length; i++) {
    int lineColor = color(arr[i], height, height);
    stroke(lineColor);
    fill(lineColor);
    float location = map(i, 0, arr.length, 0, width);
    rect(location, height - arr[i], width/500, height);
  }
}
