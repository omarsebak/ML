% Note I used import feature from Home tab to import the data set and Chose
% the type of data to be Numeric Matrix
Theta = [0.0001;0.004;0.011;0.0004;0.0004;0.0224;0.000193;0.0000694;0.00032;0.000654;0.000224;0.000126;0.000143];

%1st Hypothesis (IN USE)
X= heartDD(1:250,1:13);
R = 1;
k=1;
alpha = 0.001;
Y = heartDD(:,14);
n=length(X(1,:));
for w=2:n
    if max(abs(X(:,w)))~=0
    X(:,w)=(X(:,w)-mean((X(:,w))))./std(X(:,w));
    end
end
e=0;
 E(k) =CostFunction(Theta,X,Y);
while (R==1)
        Hyp = 1./(1+(2.71828.^(-X*Theta)));
    Theta = Theta - ((alpha/250)*X'*(Hyp-Y));
    k= k+1;
     E(k) =CostFunction(Theta,X,Y);
    e=(E(k-1)-E(k))./E(k-1);
    if (e<0.0001)
        R = 0;
    end
end
Theta
% % 2nd Hypothesis 
%   X1 = (heartDD(1:250,1:13)).^2
%    Hyp = 1./(1+(2.71828.^(-X1*Theta)));
%  % 3rd Hypothesis
%    X1 = (heartDD(1:250,1:13)).^2
%    Hyp = 1./(1+(2.71828.^(-((X*Theta)+(X1*Theta1)))));
% %4th Hypothesis
%   X1 = (heartDD(1:250,1:13)).^2
%   X2 = (heartDD(1:250,1:13)).^3
%    Hyp = 1./(1+(2.71828.^(-((X*Theta)+(X1*Theta1)+(X2*Theta2)))));
