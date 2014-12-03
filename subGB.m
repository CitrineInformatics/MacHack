function [arr1,I1,SVMStruct1]=subGB(SVMStruct,arr,value,I,number,C,sigma)

group_p = svmclassify(SVMStruct,arr);
ind = group_p==value;
arr1 = arr(ind,:);
[group1,weight1]=compute_weight3(I,group_p,value,number);
SVMStruct1 = svmtrain(arr1,group1,'autoscale','True','boxconstraint',C*weight1,'kernel_function','rbf','rbf_sigma',sigma,'showplot','True');
for i = 1:23
    I1{i} = I{i}(ind);
end

end