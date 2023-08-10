clear
clc
I=Inputf(':');
I2=Imageprocessf(I);
[C0,C1,X]=Countf(I2);
C1=Overlapf(X,C1);
density=Densityf(I,C1);
Outputf(C1,density);
