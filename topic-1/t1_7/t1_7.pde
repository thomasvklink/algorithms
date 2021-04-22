//Possible combinations with three bits
float possible = pow(2,3);
println("Possible combinations: " + possible);
//Display combinations
print("Binary combinations: ");
String binary = "";
for (int i = 0; i < 2; i++){
  String digitOne = str(i);
   for (int o = 0; o < 2; o++){
     String digitTwo = str(o);
     for (int p = 0; p < 2; p++){
       String digitThree = str(p);
       binary = digitOne + digitTwo + digitThree;
      print(binary+" ");
     }
   }
}
