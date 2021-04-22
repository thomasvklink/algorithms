String binary = "110101";
println("Binary input: " + binary);
char [] binarySeperate = binary.toCharArray();
float sum = 0;
for (int i = 0; i < binarySeperate.length; i++){
  float number = float(binarySeperate[i]-48)*pow(2,(binarySeperate.length-i)-1);
  sum = sum + number;
}
println("Decimal output: " + int(sum));
