function [index]=mapImage2(I,index0)
% I is the gray image data 

% boosting the color
I1 = imadjust(I);

% estimate the level to map the gray image to 2-class value
level = graythresh(I1);

% index is the class value
index = im2bw(I1,level);

% calibrate the class value such that every image has consistent value
if ~isempty(index0)
    
    err1 = norm(double(index(:))-double(index0(:)));
    err2 = norm(double(index(:))-double(~index0(:)));
    
    if err2<err1
        index =~index;
    end
end

end