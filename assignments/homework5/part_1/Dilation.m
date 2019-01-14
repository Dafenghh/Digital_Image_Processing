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

