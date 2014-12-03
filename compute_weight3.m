function [group,weight]=compute_weight3(I,group_p,value,number)

[index0]=mapImage3(I{number},group_p,[],value);

N = length(I);

Y0 = ones(size(index0));
W = 0;
for i = 1:N
    [index]=mapImage3(I{i},group_p,index0,value);
    Y0(index==1) = 1;
    Y0(index==0) = -1;
    W = W + Y0(:);
end

group(W>0)=1;
group(W<=0)=-1;
weight = abs(W)/max(abs(W));

end