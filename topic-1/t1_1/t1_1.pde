size(600, 600);
background(0, 0, 0);
int counter=0;
boolean isPalindrome = false;
char [] word = { 'H', 'E', 'L', 'L', 'O', ' ', 'H', 'O', 'M', 'E', '!'};
char [] inverseWord = new char [word.length];
for (int i=0; i<word.length; i++) {
  inverseWord[i] = word[word.length-1-i];
  text((inverseWord[i]), 10*i+200, 200);
  text((word[i]), 10*i+200, 400);
  if (word[i]=='E') {
    counter++;
    println(counter);
  }
}
  if (inverseWord == word) {
    isPalindrome = true;
  }
  println(isPalindrome);
