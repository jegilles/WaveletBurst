function fil=imgaussfilt(im,sigma)

ker=fspecial('gaussian',2*ceil(2*sigma)+1,sigma);
fil=imfilter(im,ker,'same');