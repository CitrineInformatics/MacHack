function [index]=mapImage3(I,group_p,index0,value)

ind = (group_p == value);

I1 = I(ind);

I2 = imadjust(I1);

level = graythresh(I2);
index = im2bw(I2,level);

if ~isempty(index0)
    
    err1 = norm(double(index(:))-double(index0(:)));
    err2 = norm(double(index(:))-double(~index0(:)));
    
    if err2<err1
        index =~index;
    end
end

end