clc;
im=im2double(imread('book_cover.jpg'));
im = im(:,:,1);

[m,n]=size(im);



%% degradation
fm = fftshift(fft2(im));
H = motionDegradation(m, n, 0.1, 0.1, 1);
g = real(ifft2(ifftshift(H .* fm)));


%% gausian noise
sigma = sqrt(500/(255^2));
noise = sigma*randn(m,n);

g_gau = g + noise;

g_gau(g_gau>1) = 1;
g_gau(g_gau<0) = 0;



%% restoration with inverse filter

f_gau = fftshift(fft2(g_gau));
rst = H;
rst(abs(rst) < 1) = 1;
rst = rst .^ (-1);

im_res = real(ifft2(ifftshift(f_gau .* rst)));


figure(2);
subplot(221); imshow(im); title('Original image');
subplot(222); imshow(g); title('Blurred image');
subplot(223); imshow(g_gau); title('Blurred image with gaussian noise');
subplot(224); imshow(im_res); title('Inverse filter');


%% restoration with wiener filter

wiener_parameters = [0.008, 0.02, 0.04, 0.08];
i=1;
figure(3);
for para = wiener_parameters
        rst = wienerFilter(H, para);
        im_res = real(ifft2(ifftshift(f_gau .* rst)));
        subplot(2,2,i); imshow(im_res); 
        title(['wiener parameter: ', num2str(para)]);
        i = i+1;
end


