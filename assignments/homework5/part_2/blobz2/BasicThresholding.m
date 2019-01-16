function B = BasicThresholding (A)

size(A)

T = (min(min(A)) + max(max(A))) / 2;


while (1)
  T
  u1 = mean(A(A > T));
  u2 = mean(A(A <= T));
  nT = (u1 + u2) / 2;
  if abs(T-nT) < 0.05
    break;
  end
  T = nT;
end


B = A > T;

end
