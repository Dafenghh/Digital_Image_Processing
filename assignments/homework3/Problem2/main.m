im=imread('office.jpg');

im = im(:,:,1);

[m,n]=size(im);

im=double(im);

im=log(im+1);

fim = fft2(im);

gammaL = 0.25;
gammaH = 2;
c = 1;
imwrite(Enhance(fim,Filter(gammaL, gammaH, c, m,n,10)),'D0=10.png');
imwrite(Enhance(fim,Filter(gammaL, gammaH, c, m,n,20)),'D0=20.png');
imwrite(Enhance(fim,Filter(gammaL, gammaH, c, m,n,800)),'D0=800.png');

% BHFT
imwrite(Enhance(fim,BFilter(m,n,800)),'B_D0=800.png');
