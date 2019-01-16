im = imread('EightAM.png');
hist = zeros(256,1);
for i = 1 : size(im, 1)
    for j = 1 : size(im, 2)
        hist(uint16(im(i, j)) + 1)++;
    end
end

imRef = imread('LENA.png');
histRef = zeros(256,1);
for i = 1 : size(imRef, 1)
    for j = 1 : size(imRef, 2)
        histRef(uint16(imRef(i, j)) + 1)++;
    end
end

cdf = cumsum(hist) / numel(im);
cdfRef = cumsum(histRef) / numel(imRef);

T = zeros(1, 256);
for i = 1 : 256
    [tmp, ind] = min(abs(cdf(i) - cdfRef));
    T(i) = ind - 1;
end

imMatch = T(double(im) + 1);

subplot(1,3,1),imshow(im,[]);
subplot(1,3,2),imshow(imRef,[]);
subplot(1,3,3),imshow(imMatch,[]);
figure;
subplot(1,3,1),imhist(im,64);
subplot(1,3,2),imhist(imRef,64);
subplot(1,3,3),imhist(uint8(imMatch),64);


