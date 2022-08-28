function [outim] = hbSpatial(im)
outim = zeros(size(im), "uint8");

A = 2;

[M,N] = size(im);

extendim = zeros([M+2,N+2], "uint32");

for i=1:M
    for j=1:N
        extendim(i+1,j+1) = uint32(im(i,j));
    end
end

for i=1:M
    for j=1:N
        outim(i,j) = uint8( (A+8)*extendim(i+1,j+1) - extendim(i,j) - extendim(i,j+1) - extendim(i,j+2) - extendim(i+1,j) - extendim(i+1,j+2) - extendim(i+2,j) - extendim(i+2,j+1) - extendim(i+2,j+2) );
    end
end

end
