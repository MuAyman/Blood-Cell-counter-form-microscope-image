function [I2]=Imageprocessf(I)
I2=im2bw(I,graythresh(I));

I2=~I2;
I2= imfill(I2,'holes');

end