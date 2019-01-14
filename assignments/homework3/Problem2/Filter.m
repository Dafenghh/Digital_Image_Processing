function [H] = Filter(gammaL, gammaH, c, m,n,D0)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明

H = zeros(m,n);
for u=1:m
    for v=1:n
        D=sqrt((u-m/2)^2+(v-n/2)^2);
        H(u,v)= (gammaH-gammaL) * (1- exp(-c*D*D/(D0*D0))) + gammaL;
    end
end

end

