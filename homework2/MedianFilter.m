clear;
f0=imread('sport car.pgm');
m=size(f0,1);
n=size(f0,2);
t1=uint8(unidrnd(256,m,n)-1);
t2=uint8(unidrnd(256,m,n)-1);

f=uint8(zeros(m,n));
for x=1:m
    for y=1:n
        
        if f0(x,y)>max(t1(x,y),t2(x,y))
            f(x,y)=255;
        elseif f0(x,y)<min(t1(x,y),t2(x,y))
            f(x,y)=0;
        else
            f(x,y)=f0(x,y);
        end
    end
end

figure(1),imshow(f0);
figure(2),imshow(f);

f2=f;
for x=2:m-1
    for y=2:n-1
       buf=[];
       for i=-1:1
           for j=-1:1
               buf=[buf f(x+i,y+j)];
           end
       end
       buf=sort(buf);
       
       f2(x,y)=buf(5);
    end
end

figure(3), imshow(f2,[]);

f3=medfilt2(f,[3,3]);
figure(4), imshow(f2,[]);
 

        
               