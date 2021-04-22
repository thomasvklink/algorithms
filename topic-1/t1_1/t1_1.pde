int counter=0;
char [] word = { 'H', 'E', 'L', 'L', 'O', ' ', 'H', 'O', 'M', 'E', '!'};
char [] inverseWord = new char [word.length];
boolean hasRun = false;
boolean isPalindrome = false;

void setup() {
  size(600, 600);
  background(0, 0, 0);
}

void draw() {
  writeWord();
  writeInverseWord();
  counter(word);
  isPalindrome(word, inverseWord);
}
void writeWord() {
  for (int i=0; i<word.length; i++) {
    text((word[i]), 10*i+200, 400);
  }
}
void writeInverseWord() {
  for (int i=0; i<word.length; i++) {
    inverseWord[i] = word[word.length-1-i];
    text((inverseWord[i]), 10*i+200, 200);
  }
}
int counter(char[] word) {
  if (!hasRun) {
    for (int i=0; i<word.length; i++) {
      if (word[i]=='E') {
        counter++;
      }
    }
    hasRun = true;
  }
  println(counter);
  return(counter);
}
boolean isPalindrome(char[] word, char [] inverseWord) {
  if (inverseWord == word) {
    isPalindrome = true;
  }
  println(isPalindrome);
  return(isPalindrome);
}
