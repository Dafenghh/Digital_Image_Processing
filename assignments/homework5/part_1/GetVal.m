function [ res ] = GetVal( A, x, y )
% 返回A(x,y),如果超出范围则返回0
    if IsValidRange(A, x, y)
        res = A(x,y);
    else 
        res = 0;
    end 
end

