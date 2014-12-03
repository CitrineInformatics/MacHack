function [I]=readImage(index,xlow,xhigh,ylow,yhigh)
% the data file in the folder 'data/' is name with 1.tif, 2.tif, ...

% total number of training image
N = length(index);

I = cell(N,1);

% the folder that contains the image
prefix = 'data/';

for i = 1:N
    
    filename = strcat(prefix,num2str(index(i)),'.tif');
    
    I0 = imread(filename);
    
    % convert the RGB image to gray
    I{i} = rgb2gray(I0(xlow:xhigh,ylow:yhigh,:));
end

end