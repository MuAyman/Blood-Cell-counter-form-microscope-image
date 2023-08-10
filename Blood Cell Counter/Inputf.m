function[I]=Inputf(msg)
    %this function takes the image of the user as an input for the program

fprintf('Enter the image full extension\n')
fprintf('Or enter the image URL')

image=input(msg, 's');
I=imread(image);

end