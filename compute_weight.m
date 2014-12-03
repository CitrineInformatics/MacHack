function [group,weight]=compute_weight(I,number)
% compute the weight for wSVM
% I contains all the train images
% group is averaged class value for each pixel
% number is the image used for calibration

% N is the total number of training images
N = length(I);

% estimate the calibration 
[index0]=mapImage2(I{number},[]);

Y0 = ones(size(index0));
W = 0;
for i = 1:N
    [index]=mapImage2(I{i},index0);
    Y0(index==1) = 1;
    Y0(index==0) = -1;
    W = W + Y0(:);
end

TotNum = length(index);

group(W>0)=1;
group(W<=0)=-1;
weight = abs(W)/max(abs(W));

end