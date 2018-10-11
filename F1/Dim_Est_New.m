function [LNew,Labels,NewData] = Dim_Est_New(Data,Radius)

    Neighbors = rangesearch(Data,Data,Radius);
    Labels = zeros(length(Data),1);
    L_Matrix = zeros(size(Data));

    for i=1:length(Data)
        if(length(Neighbors{i})<=15)
            continue;
        else
            [~,~,Lambda] = pca(Data(Neighbors{i},:));
            Lambda = sort(Lambda,'descend');
            Lambda = Lambda./norm(Lambda,1);
            L_Matrix(i,1:end) = Lambda;
            Labels(i) = 1;
        end
    end
    LNew=L_Matrix(Labels(:)~=0,:);   
    NewData = Data(Labels(:)~=0,:);