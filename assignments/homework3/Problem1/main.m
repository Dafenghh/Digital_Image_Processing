im=imread('barb.png');


imwrite(BLPF(im,10),'D0=10.png');
imwrite(BLPF(im,20),'D0=20.png');
imwrite(BLPF(im,40),'D0=40.png');
imwrite(BLPF(im,80),'D0=80.png');