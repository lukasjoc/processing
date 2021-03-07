
float[] arr;

//float[] mergesort(float[] arr) {
// int len = arr.length;
// if (len <= 1) return arr;
// if(len == 2) {
//   if (arr[0] > arr[1]) return new float[]{arr[1], arr[0]};
//   return arr;
// }
 
// int mid = len / 2;
 
// float[] left = mergesort)

// return arr; 
//}

void setup() {
 size(840, 600);
 arr = new float[width];
 for(int i = 0; i < arr.length; i++) {
   arr[i] = random(height);
 }
 
 //arr = mergesort(arr);
}

void draw() {
  background(0);
  for(int i = 0; i < arr.length; i++) {
    stroke(255);
    line(i, height, i, height - arr[i]);
  }
}
