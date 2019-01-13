im=imread('office.jpg');

im = im(:,:,1);

[m,n]=size(im);

im=double(im);

im=log(im+1);

for i=1:m
    for j=1:n
        im(i,j) = im(i,j) * (-1)^(i+j);
    end
end

fim = fft2(im);

gammaL = 0.25;
gammaH = 2;
c = 1;

imwrite(Enhance(fim,Filter(gammaL, gammaH, c, m,n,20)),'D0=20.png');
