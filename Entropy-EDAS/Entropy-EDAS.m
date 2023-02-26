clc
%% Find entropy weights
Xval=length(X(:,1));
%calculating normalised matrix
for j=1:length(Wcriteria)
    for i=1:Xval
    R(i,j)=X(i,j)/sum(X(:,j));
    end
end
%compute entropy
for j=1:length(Wcriteria)
    for i=1:Xval
    Re(i,j)=R(i,j).*log(R(i,j));
    end
end
h=1/log(Xval);
for j=1:length(Wcriteria)
    for i=1:Xval
    e(j)=-h.*sum(Re(:,j));
    end
    d(j)=1-e(j);
end
%computing weights
for j=1:length(Wcriteria)
W(j)=d(j)/sum(d);
end
Entropy_Weights= num2str([W])
%% solve using EDAS
Y = zeros([Xval,length(W)]);
% Determining the average solution
for j=1:length(W)
    for i=1:Xval
    Xavg(1,j)= mean(X(:,j));
    end
end
Average = num2str([Xavg])
% calculating the positive Distance from Average (PDA)and negative Distance from Average (NDA)
for j=1:length(W)
    for i=1:Xval
        if Wcriteria(1,j)== 0
            NDA(i,j)= max(0,(X(i,j)-Xavg(j)))/Xavg(j);
            PDA(i,j)= max(0,(Xavg(j)-X(i,j)))/Xavg(j);
        else
            NDA(i,j)= max(0,(Xavg(j)-X(i,j)))/Xavg(j);
            PDA(i,j)= max(0,(X(i,j)-Xavg(j)))/Xavg(j);
        end
    end
end
 Positive_Distance_from_Average  = num2str([PDA])
 Negative_Distance_from_Average  = num2str([NDA])
% calculating SP(weighted Sum of PDA), SN((weighted Sum of NDA), NSP, NSN and AS
 for j=1:length(W)
     for i=1:Xval
         SP(i,1)= sum(W(j)*PDA(i,:));
         SN(i,1)= sum(W(j)*NDA(i,:));
     end
 end
 weighted_Sum_of_PDA =num2str([SP])
 weighted_Sum_of_NDA =num2str([SN])
 for i=1:Xval
     NSP(i,1)= SP(i)/max(SP);
     NSN(i,1)= 1-(SN(i)/max(SN));
 end
 NSP
 NSN
 for i=1:Xval
     AS(i,1)= 0.5*(NSP(i)+NSN(i)) ;
 end
AS = num2str([AS])
