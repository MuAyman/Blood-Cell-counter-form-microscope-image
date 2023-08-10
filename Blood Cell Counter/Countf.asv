function [C0,C1,X]=Countf(I2)
B = bwboundaries(I2);
imshow(I2)
C0=length(B);
C1=C0;
for i=1:C0
X(i)=size(B{i},1);
end
end