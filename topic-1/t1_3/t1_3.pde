int [] numbers = new int[500];
int aboveFifty = 0;
for (int i = 0; i < numbers.length; i++) {
  numbers[i] = int(random(0,101));
  if (numbers[i] > 50){
    aboveFifty++;
  }
}
print("Total numbers above fifty in array: ");
print(aboveFifty);
