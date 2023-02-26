Xval=length(X(:,1));
 
for i=1:Xval
    for j=1:length(W)
        Xnew(i,j)=X(i,j)/sqrt(sum((X(:,j)).^2));
    end
end
 
for i=1:Xval
    for j=1:length(W)
        WXnew(i,j)=Xnew(i,j).*W(j);
    end
end
 
for i=1:Xval
    for j= 1:length(W)
        if Wcriteria(1,j)== 0
        A(i,j)=WXnew(i,j);    
        else
        B(i,j)=WXnew(i,j); 
        end
    end
end
            
for i=1:Xval   
    Yi(i,1)=sum(B(i,:))-sum(A(i,:));
end
 
normalized_assessment_value =  num2str([Yi])

