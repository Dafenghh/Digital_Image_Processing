function [ res ] = GetVal( A, x, y )
%����A(x,y),���������Χ�򷵻�0
    if IsValidRange(A, x, y)
        res = A(x,y);
    else 
        res = 0;
    end 

end

