function [im_recv] = Enhance(im, D0)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
[m,n]=size(im);

im=double(im);
for i=1:m
    for j=1:n
        im(i,j) = im(i,j) * (-1)^(i+j);
    end
end

fim = fft2(im);

im_recv = real(ifft2(fim .* BH(m,n,D0)));

for i=1:m
    for j=1:n
        im_recv(i,j) = im_recv(i,j) * (-1)^(i+j);
    end
end

im_recv = uint8(im_recv);

end

