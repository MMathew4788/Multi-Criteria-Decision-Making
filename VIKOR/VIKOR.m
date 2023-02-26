N=0.5
Xval=length(X(:,1));
 
for j= 1:length(W)
    if Wcriteria(1,j)== 0
        Xiplus(1,j)=min(X(:,j));
        Ximinus(1,j)= max(X(:,j));
    else
        Xiplus(1,j)=max(X(:,j));
        Ximinus(1,j)= min(X(:,j));
    end
end
 
for i=1:Xval
    for j= 1:length(W)
        Xnew(i,j)=(Xiplus(1,j)-X(i,j))./(Xiplus(1,j)-Ximinus(1,j));
    end
end
 
for i=1:Xval
    for j= 1:length(W)
        WXnew(i,j)=(Xnew(i,j).*W(j));
    end
end
 
for i=1:Xval
    for j= 1:length(W)
        Si(i,1)= sum(WXnew(i,:));
        Ri(i,1)= max(WXnew(i,:));
        Qi(i,1)=N*((Si(i,1)-min(Si))/(max(Si)-min(Si)))+(1-N)*((Ri(i,1)-min(Ri))/(max(Ri)-min(Ri)));
    end
end
 
Si
Ri
Qi

