clear;
H=imread('wheel.png');
F=imread('car.png');

H1 = H(:);
s1=sum(H1.*H1);



k=(size(H,1)-1)/2;
l=(size(H,2)-1)/2;

m=size(F,1);
n=size(F,2);

R=zeros(m-k*2, n-l*2);

for i=k+1:m-k
    for j=l+1:n-l
        F_sub=F(i-k:i+k,j-l:j+l);
        F_sub=F_sub(:);
        s2=sum(F_sub.*F_sub);
        cor=sum(H1.*F_sub);
        R(i-k,j-l)=cor*cor/(s1*s2);
    end
end

Max = max(R(:));

for i=k+1:m-k
    for j=l+1:n-l
        if (R(i-k,j-l)==Max)
            fprintf('position: %d %d\n', i, j);
        end
    end
end


figure(1), imshow(R, []);