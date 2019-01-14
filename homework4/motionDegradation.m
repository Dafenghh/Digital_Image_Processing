function H = motionDegradation(m, n, a, b, T)

    [u, v] = meshgrid((1:m)-m/2, (1:n)-n/2);

    H = T  .* sinc(u*a+v*b) .* exp(-1i*pi*(u*a+v*b));
    H(isinf(H)) = 1;
    H(isnan(H)) = 1;

end