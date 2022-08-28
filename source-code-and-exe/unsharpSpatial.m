function [outim] = unsharpSpatial(im)
outim = zeros(size(im), "uint8");

[M,N] = size(im);

extendim = zeros([M+4,N+4], "uint32");

blurim = zeros([M,N], "uint8");
mask = zeros([M,N], "uint8");

for i=1:M
    for j=1:N
        extendim(i+1,j+1) = uint32(im(i,j));
    end
end

for i=1:M
    for j=1:N
        blurim(i,j) = uint8( (extendim(i,j) + extendim(i,j+1) + extendim(i,j+2) + extendim(i,j+3) + extendim(i,j+4)...
                              + extendim(i+1,j) + extendim(i+1,j+1) + extendim(i+1,j+2) + extendim(i+1,j+3) + extendim(i+1,j+4)...
                              + extendim(i+2,j) + extendim(i+2,j+1) + extendim(i+2,j+2) + extendim(i+2,j+3) + extendim(i+2,j+4)...
                              + extendim(i+3,j) + extendim(i+3,j+1) + extendim(i+3,j+2) + extendim(i+3,j+3) + extendim(i+3,j+4)...
                              + extendim(i+4,j) + extendim(i+4,j+1) + extendim(i+4,j+2) + extendim(i+4,j+3) + extendim(i+4,j+4)) / 25 );
    end
end

for i=1:M
    for j=1:N
        mask(i,j) = im(i,j) - blurim(i,j);
    end
end

for i=1:M
    for j=1:N
        outim(i,j) = im(i,j) + mask(i,j);
    end
end

end
