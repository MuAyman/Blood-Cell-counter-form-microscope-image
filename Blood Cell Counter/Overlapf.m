function[C1]=Overlapf(X,C1)
M=median(X);
for i=1:length(X)
n=(X(i)/M);
C1=C1+(round(n))-1;
end
end