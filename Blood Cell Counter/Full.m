clear
clc

fprintf('enter youtfile name\n')
fprintf('If the file is not in the current folder\n')
fprintf('or in a folder on the MATLAB path \n')
fprintf('then specify the full or relative path name')
image=input(':', 's');
I=imread(image);
imshow(I);

I2=im2bw(I,graythresh(I));
imshow(I2)
I2=~I2;
I2= imfill(I2,'holes');
imshow(I2)

B = bwboundaries(I2);
imshow(I2)
C0=length(B);
C1=C0;
for i=1:C0
X(i)=size(B{i},1);
end

M=median(X);
for i=1:length(X)
n=(X(i)/M);
C1=C1+(round(n))-1;
end

totalPixels= size(I,1)*size(I,2);
density=C1/totalPixels;

fprintf('Count of cells before correction=%d \n',C0);
fprintf('Count of cells After overlapping detection=%d \n',C1);
fprintf('density=%0.d cells/pixel \n',density);
Q1=input('Do you want to write the data into a .txt file?(y/n)','s');
if Q1=='y'
    File=fopen('Count.txt','w');
    fprintf(File,'Count of cells before correction=%d \n',C0)
    fprintf(File,'Count of cells After overlapping detection=%d \n',C1)
    fprintf(File,'density=%0.d cells/pixel \n',density)
end
Q2=input('Do you want to enter another sample? (y/n)','s')


