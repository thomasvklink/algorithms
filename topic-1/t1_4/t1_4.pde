//Multiples of 5 are all numbers that can be divided or is a product of 5
int multipleNumber = 1000/5;
float [] multiples = new float[multipleNumber];
float sum = 0;
for (int i = 0; i < multiples.length; i++){
  int multiple = 5;
  sum = sum + multiple*i;
}
print(sum);
