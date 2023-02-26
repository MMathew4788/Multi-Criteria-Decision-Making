RI=[0,0,0.58,0.9,1.12,1.24,1.32,1.41,1.45,1.49,1.51,1.54,1.56,1.57,1.58];
for j=1:length(X)
    for i=1:length(X)
    Xn(i,j)=X(i,j)/sum(X(:,j));
    end
end
for i=1:length(X)
W(1,i)=(sum(Xn(i,:)))/length(X);
end
%% calculating the consistency
for j=1:length(X)
    for i=1:length(X)
    Xc(i,j)=(X(i,j).*W(j));
    end
end
for i=1:length(X)
WSV(i)=sum(Xc(i,:));
Lamda(i)=WSV(i)/W(i);
end
Lamdamax=mean(Lamda);
CI=(Lamdamax-i)/(i-1);
CR=CI/RI(i);
 
Weights =num2str([W])
consistency_index =  num2str([CI])
consistency_ratio =  num2str([CR])
