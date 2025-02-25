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

