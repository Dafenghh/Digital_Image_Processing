
pkg load image
im = imread('river.jpg');
hist = zeros(256,1);

for i = 1 : size(im, 1)
    for j = 1 : size(im, 2)
        hist(uint16(im(i, j)) + 1)++;
    end
end

cdf = cumsum(hist) / numel(im);

T = zeros(1, 256);
for i = 1 : 256
    T(i) = uint8(cdf(i) * 255);
end

imEq = uint8(T(double(im) + 1));

imEq2 = histeq(im);
subplot(1,2,1),imshow(im,[]);
subplot(1,3,2),imshow(imEq,[]);
subplot(1,3,3),imshow(imEq2,[]);
figure;

subplot(1,3,1),imhist(im,64);
subplot(1,3,2),imhist(imEq,64);
subplot(1,3,3),imhist(imEq2,64);



