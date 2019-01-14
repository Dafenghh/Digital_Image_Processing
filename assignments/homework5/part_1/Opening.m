function [ res ] = Opening( A, B, origin_x, origin_y )
    res = Dilation(Erosion(A, B, origin_x, origin_y), B, origin_x, origin_y);
end

