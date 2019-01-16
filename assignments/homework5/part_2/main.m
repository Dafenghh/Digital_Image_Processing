pkg load image;

A = imread('blobz1.png');

imhist(A, 64);

T = 150;



while (1)
  u1 = mean(A(A > T));
  u2 = mean(A(A <= T));
  nT = (u1 + u2) / 2;
  if abs(T-nT) < 0.05
    break;
  end
  T = nT;
end

T

B = A > T;

imwrite(B, 'blobz1_seg.png');

  
  

