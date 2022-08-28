function [outImg] = laplacianFreq(img)

% convert to 0~1 double type value
imgDouble = im2double(img);

% m x n: the size of the image
[m,n] = size(imgDouble);

%%% padding image to 2x of max(m,n) => prevent undersampling

% preparing padded image variable
paddedImg = zeros(2*max(m,n),2*max(m,n));

% p x q: the size of the padding image
[p,q] = size(paddedImg);

% appdending the original image to paddingImg
for i = 1:p
    for j = 1:q
        if i <= m && j<= n
            paddedImg(i,j) = imgDouble(i,j);
        else
            paddedImg(i,j) = 0;
        end
    end
end

% preparing pre-process image variable
preProcessImg = zeros(p,q);

% Multiplying the padded image with (-1)^(x+y)
for i = 1:p
    for j = 1:q
        preProcessImg(i,j) = paddedImg(i,j).*(-1).^(i + j);
    end
end

% perform DFT to transform image to frequency domain
imgInFD = fft2(preProcessImg);

% generate 
[x,y] = freqspace(p,'meshgrid');

% constructing Laplacian enhancing filter function
H = zeros(p,q);
for i = 1:p
    for j = 1:q
        H(i,j) = ( 1 + 4.*(pi.^2).*(x(i,j).^2 + y(i,j).^2) );
    end
end

% perform filtering!
filteredImgInFD = imgInFD.*H;

% inverse DFT
ifftImg = ifft2(filteredImgInFD);

% Multiplying the inversed image with (-1)^(x+y)
postProcessImg = zeros(p,q);
for i = 1:p
    for j = 1:q
        postProcessImg(i,j) = ifftImg(i,j).*((-1).^(i+j));
    end
end

% remove padding
out = zeros(m,n);
for i = 1:m
    for j = 1:n
        out(i,j) = postProcessImg(i,j);
    end
end

% convert to 0~255 gray level
outImg = uint8(out.*255);

end
