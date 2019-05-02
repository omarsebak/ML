% Note: I used regularization , modified the alpha , error decreased less
%than 0.1 with less number of iterations


clear all
ds = tabularTextDatastore('house_prices_data_training_data.csv','TreatAsMissing','NA',.....
    'MissingValue',0,'ReadSize',25000);
T = read(ds);
size(T);
Alpha=.0001;
m=length(T{:,1});
U0=T{:,2}
U=T{:,4:19};
lambda = 0.5;
%U1=T{:,20:21};
%U2=U.^2;
X=[ones(m,1) U];
   % U1 U.^2 U.^3];

n=length(X(1,:));
for w=2:n
    if max(abs(X(:,w)))~=0
    X(:,w)=(X(:,w)-mean((X(:,w))))./std(X(:,w));
    end
end

Y=T{:,3}/mean(T{:,3});
Theta=zeros(n,1);
k=1;

E(k)=(1/(2*m))*sum((X*Theta-Y).^2)+ ((lambda/(2*m))*sum(Theta.^2));;
R=1;
while R==1
Alpha=Alpha*1;
Theta=Theta-(Alpha/m)*X'*(X*Theta-Y);
k=k+1
E(k)=(1/(2*m))*sum((X*Theta-Y).^2)+ ((lambda/(2*m))*sum(Theta.^2))
if E(k-1)-E(k)<0
    break
end 
q=(E(k-1)-E(k))./E(k-1);
if q <.0001;
    R=0;
end

end
