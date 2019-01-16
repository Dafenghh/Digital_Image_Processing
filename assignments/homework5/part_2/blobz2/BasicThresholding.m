function B = BasicThresholding (A)


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


B = A > T;

endfunction
