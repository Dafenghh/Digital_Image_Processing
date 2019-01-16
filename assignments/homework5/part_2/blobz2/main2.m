pkg load image;

A = imread('blobz2.png');

imhist(A, 64);



[m, n] = size(A);

index_x = int32((0:4) * (m/4) + 1);
index_y = int32((0:4) * (n/4) + 1);

B = zeros(size(A));

for i=1:4
  for j=1:4
    range_x = index_x(i):index_x(i+1)-1;
    range_y = index_y(j):index_y(j+1)-1;
    B(range_x, range_y) = BasicThresholding(A(range_x, range_y));
  end
end
 


imwrite(B, 'blobz2_adaptive_thresholding.png');