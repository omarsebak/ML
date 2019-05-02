function z = CostFunction(Theta,X,y)
r= 0 ;
for i=1:250
    Hyp = 1./(1+(exp(-X*Theta)));
 r = r + ((-y(i)*log(Hyp(i)))-(1-y(i))*(log(1-Hyp(i))));
end
z= (1/250)*r;
end