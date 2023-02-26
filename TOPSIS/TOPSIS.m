
Xval=length(X(:,1));
Y = zeros([Xval,length(W)]);
%% calculating the normalized matrix
for j=1:length(W)
    for i=1:Xval
    Y(i,j)=X(i,j)/sqrt(sum((X(:,j).^2)));
    end
end
Normalized_Matrix = num2str([Y])
%% calculating the weighted mormalized matrix
for j=1:length(W)
    for i=1:Xval
        Yw(i,j)=Y(i,j).*W(j);
    end
end
Weighted_Normalized_Matrix = num2str([Yw])
%% calculating the positive and negative best

for j=1:length(W)
    if Wcriteria(1,j)== 0
        Vp(1,j)= min(Yw(:,j));
        Vn(1,j)= max(Yw(:,j));
    else
        Vp(1,j)= max(Yw(:,j));
        Vn(1,j)= min(Yw(:,j));
    end
end
 Positive_best = num2str([Vp])
 Negative_best = num2str([Vn])

%% Euclidean distance from Ideal Best and Worst
for j=1:length(W)
    for i=1:Xval
        Sp(i,j)=((Yw(i,j)-Vp(j)).^2);
        Sn(i,j)=((Yw(i,j)-Vn(j)).^2);
    end
end

for i=1:Xval
    Splus(i)=sqrt(sum(Sp(i,:)));
    Snegative(i)=sqrt(sum(Sn(i,:)));
end
%% calculating the performance score
P=zeros(Xval,1);
for i=1:Xval
    P(i)=Snegative(i)/(Splus(i)+Snegative(i));
end
Performance_Score =  num2str([P])
