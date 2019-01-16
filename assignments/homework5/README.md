# DIP Homework 5
徐达烽
16340260

# Part 1

## 1. 算法描述

膨胀：将模板原点依次平移到原图像的每个值为1的像素点上，然后将模板上值为1的位置，在原图像中全部设为1.

腐蚀：将模板原点依次平移到原图像的每个像素点上，如果模板上值为1的位置在原图像也全部为1，则将原图像的这个像素点设为1，否则为0.

开操作：先做腐蚀，再做膨胀运算。

闭操作：先做膨胀，再做腐蚀运算。

## 2. 源代码

```matlab
function [ res ] = GetVal( A, x, y )
% 返回A(x,y),如果超出范围则返回0
    if IsValidRange(A, x, y)
        res = A(x,y);
    else 
        res = 0;
    end 
end

function [ res ] = IsValidRange( A, x, y )
% 判断(x,y)是否是矩阵A的有效下标
    res = x >= 1 && x <= size(A, 1) && y >= 1 && y <= size(A, 2);
end

function [ res ] = Erosion( A, B, origin_x, origin_y )  
    res = zeros(size(A));
    for x=1:size(A,1)
        for y=1:size(A,2)
            ok = 1;
            for i=1:size(B,1)
                for j=1:size(B,2)
                    if B(i,j) == 1 &&  GetVal(A, x + i - origin_x, y + j - origin_y) == 0
                        ok = 0;
                        break;
                    end
                end
                if ok == 0 
                    break;
                end
            end
            res(x,y) = ok;
        end
    end
end

function [ res ] = Dilation( A, B, origin_x, origin_y )
    res = zeros(size(A));
    for x=1:size(A,1)
        for y=1:size(A,2)
            if A(x,y) == 0
                continue;
            end
            for i=1:size(B,1)
                for j=1:size(B,2)
                    if B(i,j) == 0 
                        continue;
                    end
                    tx = x + i - origin_x;
                    ty = y + j - origin_y;
                    if IsValidRange(res, tx, ty)
                        res(tx,ty) = 1;
                    end
                end
            end
        end
    end 
end

function [ res ] = Opening( A, B, origin_x, origin_y )
    res = Dilation(Erosion(A, B, origin_x, origin_y), B, origin_x, origin_y);
end

function [ res ] = Closing( A, B, origin_x, origin_y )
    res = Erosion(Dilation(A, B, origin_x, origin_y), B, origin_x, origin_y);
end

// main.m
A=[0 0 0 0 0 0 0
   0 0 1 1 0 0 0
   0 0 0 1 0 0 0
   0 0 0 1 1 0 0
   0 0 1 1 1 1 0
   0 0 1 1 1 0 0
   0 1 0 1 0 1 0
   0 0 0 0 0 0 0];
result_of_a = Dilation(A, [1 1 1], 1, 1)

result_of_b = Erosion(A, [1 1 1], 1, 1)

result_of_c = Dilation(A, [1 1; 0 1], 1, 2)

result_of_d = Erosion(A, [1 1; 0 1], 1, 2)

result_of_e_1 = Opening(A, [1 1 1], 1, 1)

result_of_e_2 = Opening(A, [1 1; 0 1], 1, 2)

result_of_f_1 = Closing(A, [1 1 1], 1, 1)

result_of_f_2 = Closing(A, [1 1; 0 1], 1, 2)
```

## 3. 实验结果

result_of_a =

     0     0     0     0     0     0     0
     0     0     1     1     1     1     0
     0     0     0     1     1     1     0
     0     0     0     1     1     1     1
     0     0     1     1     1     1     1
     0     0     1     1     1     1     1
     0     1     1     1     1     1     1
     0     0     0     0     0     0     0


result_of_b =

     0     0     0     0     0     0     0
     0     0     0     0     0     0     0
     0     0     0     0     0     0     0
     0     0     0     0     0     0     0
     0     0     1     1     0     0     0
     0     0     1     0     0     0     0
     0     0     0     0     0     0     0
     0     0     0     0     0     0     0


result_of_c =

     0     0     0     0     0     0     0
     0     1     1     1     0     0     0
     0     0     1     1     0     0     0
     0     0     1     1     1     0     0
     0     1     1     1     1     1     0
     0     1     1     1     1     1     0
     1     1     1     1     1     1     0
     0     1     0     1     0     1     0


result_of_d =

     0     0     0     0     0     0     0
     0     0     0     1     0     0     0
     0     0     0     0     0     0     0
     0     0     0     0     1     0     0
     0     0     0     1     1     0     0
     0     0     0     1     0     0     0
     0     0     0     0     0     0     0
     0     0     0     0     0     0     0


result_of_e_1 =

     0     0     0     0     0     0     0
     0     0     0     0     0     0     0
     0     0     0     0     0     0     0
     0     0     0     0     0     0     0
     0     0     1     1     1     1     0
     0     0     1     1     1     0     0
     0     0     0     0     0     0     0
     0     0     0     0     0     0     0


result_of_e_2 =

     0     0     0     0     0     0     0
     0     0     1     1     0     0     0
     0     0     0     1     0     0     0
     0     0     0     1     1     0     0
     0     0     1     1     1     0     0
     0     0     1     1     1     0     0
     0     0     0     1     0     0     0
     0     0     0     0     0     0     0


result_of_f_1 =

     0     0     0     0     0     0     0
     0     0     1     1     0     0     0
     0     0     0     1     0     0     0
     0     0     0     1     1     0     0
     0     0     1     1     1     0     0
     0     0     1     1     1     0     0
     0     1     1     1     1     0     0
     0     0     0     0     0     0     0


result_of_f_2 =

     0     0     0     0     0     0     0
     0     0     1     1     0     0     0
     0     0     0     1     0     0     0
     0     0     0     1     1     0     0
     0     0     1     1     1     1     0
     0     0     1     1     1     1     0
     0     1     0     1     0     1     0
     0     0     0     0     0     0     0


