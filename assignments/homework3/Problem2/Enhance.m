function [im_recv] = Enhance(fim, H)
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

im_recv = ifft2(fim .* H);

[m,n]=size(im_recv);

im_recv = real(exp(im_recv));

Max = max(max(im_recv));
Min = min(min(im_recv));
range = Max - Min;

for i=1:m
    for j=1:n
        im_recv(i,j) = 255*(im_recv(i,j)-Min)/range;
    end
end

im_recv = uint8(im_recv);

end

