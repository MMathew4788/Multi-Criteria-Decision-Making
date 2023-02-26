Xval=length(X(:,1));
%% calculating the normalized matrix
for i=1:Xval
    for j= 1:length(W)
        if Wcriteria(1,j)== 0
            Y(i,j)=min(X(:,j))/X(i,j);
        else
            Y(i,j)=X(i,j)/max(X(:,j));
        end
    end
end
%% calculating the weighted mormalized matrix
for j=1:length(W)
    for i=1:Xval
        Yw(i,j)=Y(i,j).*W(j);
    end
end
%% calculating the negative idle solution
for j=1:length(W)
ns(1,j)=min(Yw(:,j));
end
 
%% calculating the Eucladian distance from the negative solution
for j=1:length(W)
    for i=1:Xval
        E1(i,j)=(Yw(i,j)-ns(1,j));
    end
end
E2= E1.*E1;
for i=1:Xval
E(i,1)=(sum(E2(i,:))).^0.5;
end
 
%% calculating the Taxicab distance from the negative solution
for j=1:length(W)
    for i=1:Xval
        T1(i,j)=abs((Yw(i,j)-ns(1,j)));
    end
end
for i=1:Xval
T(i,1)=sum(T1(i,:));
end
 
%% calculating Relative assesment matrix for tau=0.01
for j=1:Xval
    for i=1:Xval
       if abs(E(i)-E(j))<0.01
           Tau(i,j)=0;
       else
           Tau(i,j)=1;
       end
    end
end
 
for k=1:Xval
    for i=1:Xval
        R(i,k)=(E(i)-E(k))+(Tau(i,k).*(E(i)-E(k)).*(T(i)-T(k)));
    end
end
 
%% Calculating the assesment score
 
    for i=1:Xval
        H(i,1)=sum(R(i,:));
    end
 
Eucladian_distance_from_the_negative_solution= num2str([E])
Taxicab_distance_from_the_negative_solution = num2str([T])
Relative_Assesment_Matrix= num2str([R])
assesment_score= num2str([H])

