int max, multipleThree, multipleFive, multipleCommon, sumThree, sumFive, sumCommon, total;
max = 999;
multipleThree = max/3;
multipleFive = max/5;
multipleCommon = max/15;

sumThree = (3*multipleThree*(1+multipleThree))/2;
sumFive = (5*multipleFive*(1+multipleFive))/2;
sumCommon = (15*multipleCommon*(1+multipleCommon))/2;

total = (sumThree + sumFive) - sumCommon;

//println(sumThree);
//println(sumFive);
//println(sumCommon);
println(total);
