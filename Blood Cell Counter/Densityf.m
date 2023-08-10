function density=Densityf(I,C1)
totalPixels= size(I,1)*size(I,2);
density=C1/totalPixels;
end