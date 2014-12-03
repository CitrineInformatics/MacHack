index = 1:23;
xlow = 370;
xhigh = 400;
ylow = 770;
yhigh = 800;

I=readImage(index,xlow,xhigh,ylow,yhigh);

number = 6;
[group,weight] = compute_weight(I,number);

x = xlow:xhigh;
y = ylow:yhigh;
[X,Y] = meshgrid(x,y);
arr = [X(:) Y(:)];

C = 10;

beta = 0.5;

sigma = sqrt(1/2/beta); 


SVMStruct = svmtrain(arr,group,'autoscale','True','boxconstraint',C*weight,'kernel_function','rbf','rbf_sigma',sigma,'showplot','True');

hold on;

score = calContourZ(SVMStruct,arr,beta);
Z=reshape(score,size(X));
% value = 1;
% 
% [arr1,I1,SVMStruct1] = subGB(SVMStruct,arr,value,I,number,C,sigma);
% 
% value = -1;
%  
% [arr2,I2,SVMStruct2] = subGB(SVMStruct,arr,value,I,number,C,0.5);
% 
% score2 = calContourZ(SVMStruct2,arr,beta);
% Z2=reshape(score2,size(X));


