function x = MeanSquare(Hyp,Y);
x=0;
for i=1:3
    x = x + (Hyp(i)-Y(i))^2;
end
x = x*(1/(3*2));
end