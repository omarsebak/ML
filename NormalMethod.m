function  Theta = NormalMethod(HousesData);
y = HousesData(:,1);
X =[ones(17999,1) HousesData(:,2:19)];
Theta = (inv(X'*X)*X')*y




    