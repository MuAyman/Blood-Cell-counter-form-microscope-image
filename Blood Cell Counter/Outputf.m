function Outputf(C1,density)
fprintf('Cells Count=%d \n',C1);
fprintf('Cells Density=%0.d cell/pixel \n',density);
Q1=input('Do you want to write the data into a .txt file?(y/n)','s');
if Q1=='y'
    File=fopen('Count.txt','w');
    fprintf(File,'Cells Count=%d \n',C1);
    fprintf(File,'Cells Density=%0.d cell/pixel \n',density);
end
end